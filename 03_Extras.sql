-- ===========================================
-- VISTAS (5)
-- ===========================================

-- Vista 1: Ventas con detalle de cliente
CREATE OR REPLACE VIEW vista_ventas_clientes AS
SELECT v.id_venta, v.fecha, c.nombre AS cliente, v.total_venta
FROM venta v
JOIN cliente c ON v.id_cliente = c.id_cliente;

-- Vista 2: Detalle de ventas (productos vendidos en cada venta)
CREATE OR REPLACE VIEW vista_detalle_ventas AS
SELECT dv.id_detalle, v.id_venta, p.nombre AS producto, dv.cantidad, dv.subtotal
FROM detalle_venta dv
JOIN venta v ON dv.id_venta = v.id_venta
JOIN producto p ON dv.id_producto = p.id_producto;

-- Vista 3: Movimientos de caja con su transacción
CREATE OR REPLACE VIEW vista_movimientos_caja AS
SELECT c.id_movimiento, c.fecha, c.tipo_movimiento, c.descripcion, c.monto,
       t.id_transaccion, t.cantidad, t.subtotal
FROM caja c
LEFT JOIN transaccion t ON c.id_movimiento = t.id_movimiento;

-- Vista 4: Proveedores y los ingredientes que suministran
CREATE OR REPLACE VIEW vista_proveedores_ingredientes AS
SELECT pr.nombre AS proveedor, i.nombre AS ingrediente, ip.precio_unitario
FROM ingrediente_proveedor ip
JOIN ingrediente i ON ip.id_ingrediente = i.id_ingrediente
JOIN proveedor pr ON ip.id_proveedor = pr.id_proveedor;

-- Vista 5: Transacciones con método de pago
CREATE OR REPLACE VIEW vista_transacciones_pagos AS
SELECT t.id_transaccion, t.cantidad, t.subtotal, mp.nombre AS metodo_pago, c.fecha
FROM transaccion t
JOIN metodo_pago mp ON t.id_metodo = mp.id_metodo
JOIN caja c ON t.id_movimiento = c.id_movimiento;

-- ===========================================
-- FUNCIONES (2)
-- ===========================================

-- Función 1: Calcular total de una venta
DELIMITER //
CREATE FUNCTION calcular_total_venta(venta_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(subtotal) INTO total
    FROM detalle_venta
    WHERE id_venta = venta_id;
    RETURN IFNULL(total,0);
END //
DELIMITER ;

-- Función 2: Calcular stock restante de un producto
DELIMITER //
CREATE FUNCTION stock_restante(producto_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    SELECT cantidad INTO stock_actual
    FROM producto
    WHERE id_producto = producto_id;
    RETURN IFNULL(stock_actual,0);
END //
DELIMITER ;

-- ===========================================
-- STORED PROCEDURES (2)
-- ===========================================

-- SP 1: Registrar nueva venta con detalle
DELIMITER //
CREATE PROCEDURE registrar_venta (
    IN p_id_cliente INT,
    IN p_fecha DATE,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_precio DECIMAL(10,2);

    -- Obtener precio del producto
    SELECT precio_unitario INTO v_precio
    FROM producto
    WHERE id_producto = p_id_producto;

    -- Calcular total
    SET v_total = p_cantidad * v_precio;

    -- Insertar en venta
    INSERT INTO venta (fecha, id_cliente, total_venta)
    VALUES (p_fecha, p_id_cliente, v_total);

    -- Insertar detalle
    INSERT INTO detalle_venta (id_venta, id_producto, cantidad, subtotal)
    VALUES (LAST_INSERT_ID(), p_id_producto, p_cantidad, v_total);
END //
DELIMITER ;

-- SP 2: Registrar un movimiento de caja manual
DELIMITER //
CREATE PROCEDURE registrar_movimiento_caja (
    IN p_fecha DATE,
    IN p_tipo VARCHAR(20),
    IN p_descripcion VARCHAR(255),
    IN p_monto DECIMAL(10,2)
)
BEGIN
    INSERT INTO caja (fecha, tipo_movimiento, descripcion, monto)
    VALUES (p_fecha, p_tipo, p_descripcion, p_monto);
END //
DELIMITER ;

-- ===========================================
-- TRIGGERS (2)
-- ===========================================

-- Trigger 1: Actualizar caja automáticamente al registrar una venta
DELIMITER //
CREATE TRIGGER trg_insert_venta
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
    INSERT INTO caja (fecha, tipo_movimiento, descripcion, monto)
    VALUES (NEW.fecha, 'Ingreso', CONCAT('Venta ID: ', NEW.id_venta), NEW.total_venta);
END //
DELIMITER ;

-- Trigger 2: Actualizar total_venta automáticamente si cambian detalles
DELIMITER //
CREATE TRIGGER trg_update_detalle
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT SUM(subtotal) INTO v_total
    FROM detalle_venta
    WHERE id_venta = NEW.id_venta;

    UPDATE venta
    SET total_venta = v_total
    WHERE id_venta = NEW.id_venta;
END //
DELIMITER ;
