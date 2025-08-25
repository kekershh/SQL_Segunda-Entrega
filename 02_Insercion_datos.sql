-- ============================================
-- SCRIPT DE INSERCIÓN DE DATOS - tienda_arepas
-- ============================================

-- Insertar Clientes
INSERT INTO cliente (nombre, telefono, direccion, correo) VALUES
('Juan Pérez', '3001234567', 'Calle 10 #15-20', 'juanperez@gmail.com'),
('María López', '3109876543', 'Carrera 7 #45-32', 'marialopez@yahoo.com'),
('Carlos Rodríguez', '3114567890', 'Calle 72 #50-12', 'carlosr@hotmail.com'),
('Ana Torres', '3026549871', 'Avenida Caracas #12-34', 'ana.torres@gmail.com'),
('Luis Martínez', '3151112233', 'Carrera 15 #120-45', 'luismtz@gmail.com'),
('Sofía Ramírez', '3175556677', 'Calle 100 #45-67', 'sofia.ramirez@gmail.com'),
('Andrés Gómez', '3209998877', 'Transversal 45 #22-33', 'andres.gomez@hotmail.com'),
('Camila Fernández', '3214445566', 'Carrera 9 #80-11', 'camila.fernandez@yahoo.com'),
('Pedro Jiménez', '3128887766', 'Calle 20 #30-25', 'pedro.jimenez@gmail.com'),
('Valentina Ruiz', '3013334445', 'Carrera 11 #95-20', 'valentina.ruiz@gmail.com');

-- Insertar Productos
INSERT INTO producto (nombre, descripcion, precio_unitario) VALUES
('Arepa de Queso', 'Arepa rellena de queso costeño', 2500),
('Arepa de Huevo', 'Arepa frita con huevo entero en su interior', 3500),
('Arepa de Carne', 'Arepa rellena de carne desmechada', 5000),
('Arepa Mixta', 'Arepa rellena de carne y pollo', 6000),
('Arepa de Pollo', 'Arepa rellena de pollo desmechado', 4800),
('Arepa de Choclo', 'Arepa dulce de maíz tierno con queso', 3000),
('Arepa Vegana', 'Arepa rellena con vegetales y aguacate', 4500),
('Arepa de Jamón y Queso', 'Arepa rellena con jamón y queso', 5200),
('Arepa con Chorizo', 'Arepa acompañada de chorizo', 5500),
('Arepa de Queso Doble', 'Arepa extra rellena de queso', 4000);

-- Insertar Ingredientes
INSERT INTO ingrediente (nombre, unidad_medida) VALUES
('Harina de maíz', 'kg'),
('Queso costeño', 'kg'),
('Pollo desmechado', 'kg'),
('Carne desmechada', 'kg'),
('Choclo desgranado', 'kg'),
('Chorizo', 'kg'),
('Jamón', 'kg'),
('Aguacate', 'kg'),
('Aceite vegetal', 'lt'),
('Huevo', 'unidad');

-- Insertar Proveedores
INSERT INTO proveedor (nombre, telefono, correo) VALUES
('Proveedor Harina S.A.', '3101112233', 'ventas@harinas.com'),
('Lácteos Bogotá', '3114445566', 'contacto@lacteosbogota.com'),
('Carnes Premium', '3127778899', 'info@carnespremium.com'),
('Distribuidora Choclos', '3132223344', 'ventas@choclos.com'),
('Huevos del Campo', '3145556677', 'contacto@huevosdelcampo.com');

-- Relación Ingredientes-Proveedores
INSERT INTO ingrediente_proveedor (id_ingrediente, id_proveedor, precio_unitario) VALUES
(1, 1, 2000),
(2, 2, 8000),
(3, 3, 12000),
(4, 3, 13000),
(5, 4, 7000),
(6, 3, 15000),
(7, 3, 10000),
(8, 4, 5000),
(9, 1, 4000),
(10, 5, 600);

-- Relación Producto-Ingrediente
INSERT INTO producto_ingrediente (id_producto, id_ingrediente, cantidad_usada) VALUES
(1, 1, 0.2), (1, 2, 0.1),
(2, 1, 0.2), (2, 10, 1),
(3, 1, 0.2), (3, 4, 0.15),
(4, 1, 0.25), (4, 3, 0.1), (4, 4, 0.1),
(5, 1, 0.2), (5, 3, 0.15),
(6, 1, 0.2), (6, 5, 0.2), (6, 2, 0.1),
(7, 1, 0.2), (7, 8, 0.15),
(8, 1, 0.2), (8, 7, 0.1), (8, 2, 0.1),
(9, 1, 0.2), (9, 6, 0.15),
(10, 1, 0.25), (10, 2, 0.2);

-- Insertar Métodos de Pago
INSERT INTO metodo_pago (nombre_metodo) VALUES
('Efectivo'),
('Nequi'),
('Daviplata'),
('Transferencia Bancaria'),
('Tarjeta Débito'),
('Tarjeta Crédito');

-- Insertar Ventas
INSERT INTO venta (fecha, id_cliente, total_venta) VALUES
('2025-08-01', 1, 10000),
('2025-08-01', 2, 18500),
('2025-08-02', 3, 7000),
('2025-08-02', 4, 12000),
('2025-08-02', 5, 25000),
('2025-08-03', 6, 18000),
('2025-08-03', 7, 14500),
('2025-08-03', 8, 9000),
('2025-08-04', 9, 20000),
('2025-08-04', 10, 13000),
('2025-08-05', 1, 15000),
('2025-08-05', 2, 22000),
('2025-08-05', 3, 8000),
('2025-08-06', 4, 27000),
('2025-08-06', 5, 30000),
('2025-08-06', 6, 17500),
('2025-08-07', 7, 21000),
('2025-08-07', 8, 9500),
('2025-08-07', 9, 16000),
('2025-08-07', 10, 11000);

-- Insertar Detalle de Ventas
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, subtotal) VALUES
(1, 1, 4, 10000),
(2, 2, 2, 7000), (2, 3, 1, 5000), (2, 6, 1, 3000), (2, 8, 1, 5200),
(3, 6, 2, 6000), (3, 2, 1, 3500),
(4, 3, 2, 10000), (4, 1, 1, 2500),
(5, 4, 3, 18000), (5, 10, 3, 12000),
(6, 5, 2, 9600), (6, 6, 2, 6000), (6, 1, 2, 5000),
(7, 7, 2, 9000), (7, 2, 1, 3500), (7, 1, 1, 2500),
(8, 9, 2, 11000),
(9, 4, 2, 12000), (9, 3, 1, 5000), (9, 6, 1, 3000),
(10, 8, 2, 10400), (10, 2, 1, 3500),
(11, 3, 1, 5000), (11, 1, 2, 5000), (11, 10, 1, 4000),
(12, 4, 2, 12000), (12, 7, 2, 9000), (12, 6, 1, 3000),
(13, 2, 2, 7000), (13, 1, 1, 2500),
(14, 9, 3, 16500), (14, 5, 1, 4800), (14, 6, 1, 3000),
(15, 10, 2, 8000), (15, 8, 2, 10400), (15, 1, 2, 5000),
(16, 7, 3, 13500), (16, 5, 1, 4800), (16, 3, 1, 5000),
(17, 9, 2, 11000), (17, 6, 2, 6000), (17, 2, 1, 3500),
(18, 8, 1, 5200), (18, 10, 1, 4000),
(19, 4, 2, 12000), (19, 5, 1, 4800), (19, 7, 1, 4500),
(20, 2, 2, 7000), (20, 6, 1, 3000), (20, 1, 1, 2500);

-- Insertar Movimientos en Caja
INSERT INTO caja (fecha, tipo_movimiento, descripcion, monto) VALUES
('2025-08-01', 'Ingreso', 'Venta en efectivo', 10000),
('2025-08-01', 'Ingreso', 'Venta con Nequi', 18500),
('2025-08-02', 'Ingreso', 'Venta en efectivo', 7000),
('2025-08-02', 'Ingreso', 'Venta con tarjeta débito', 12000),
('2025-08-02', 'Ingreso', 'Venta con efectivo', 25000),
('2025-08-03', 'Ingreso', 'Venta con tarjeta crédito', 18000),
('2025-08-03', 'Ingreso', 'Venta en efectivo', 14500),
('2025-08-03', 'Ingreso', 'Venta con Daviplata', 9000),
('2025-08-04', 'Ingreso', 'Venta en efectivo', 20000),
('2025-08-04', 'Ingreso', 'Venta con transferencia bancaria', 13000),
('2025-08-05', 'Ingreso', 'Venta con Nequi', 15000),
('2025-08-05', 'Ingreso', 'Venta en efectivo', 22000),
('2025-08-05', 'Ingreso', 'Venta con tarjeta crédito', 8000),
('2025-08-06', 'Ingreso', 'Venta en efectivo', 27000),
('2025-08-06', 'Ingreso', 'Venta con débito', 30000),
('2025-08-06', 'Ingreso', 'Venta con Nequi', 17500),
('2025-08-07', 'Ingreso', 'Venta con efectivo', 21000),
('2025-08-07', 'Ingreso', 'Venta con Daviplata', 9500),
('2025-08-07', 'Ingreso', 'Venta con tarjeta crédito', 16000),
('2025-08-07', 'Ingreso', 'Venta en efectivo', 11000);

-- Insertar Transacciones
INSERT INTO transaccion (fecha, id_movimiento, id_producto, cantidad, precio_unitario, subtotal, id_metodo_pago) VALUES
('2025-08-01', 1, 1, 4, 2500, 10000, 1),
('2025-08-01', 2, 2, 2, 3500, 7000, 2),
('2025-08-01', 2, 3, 1, 5000, 5000, 2),
('2025-08-01', 2, 6, 1, 3000, 3000, 2),
('2025-08-01', 2, 8, 1, 5200, 5200, 2),
('2025-08-02', 3, 6, 2, 3000, 6000, 1),
('2025-08-02', 3, 2, 1, 3500, 3500, 1),
('2025-08-02', 4, 3, 2, 5000, 10000, 5),
('2025-08-02', 4, 1, 1, 2500, 2500, 5),
('2025-08-02', 5, 4, 3, 6000, 18000, 1),
('2025-08-02', 5, 10, 3, 4000, 12000, 1),
('2025-08-03', 6, 5, 2, 4800, 9600, 6),
('2025-08-03', 6, 6, 2, 3000, 6000, 6),
('2025-08-03', 6, 1, 2, 2500, 5000, 6),
('2025-08-03', 7, 7, 2, 4500, 9000, 1),
('2025-08-03', 7, 2, 1, 3500, 3500, 1),
('2025-08-03', 7, 1, 1, 2500, 2500, 1),
('2025-08-03', 8, 9, 2, 5500, 11000, 3),
('2025-08-04', 9, 4, 2, 6000, 12000, 1),
('2025-08-04', 9, 3, 1, 5000, 5000, 1),
('2025-08-04', 9, 6, 1, 3000, 3000, 1),
('2025-08-04', 10, 8, 2, 5200, 10400, 4),
('2025-08-04', 10, 2, 1, 3500, 3500, 4),
('2025-08-05', 11, 3, 1, 5000, 5000, 2),
('2025-08-05', 11, 1, 2, 2500, 5000, 2),
('2025-08-05', 11, 10, 1, 4000, 4000, 2),
('2025-08-05', 12, 4, 2, 6000, 12000, 1),
('2025-08-05', 12, 7, 2, 4500, 9000, 1),
('2025-08-05', 12, 6, 1, 3000, 3000, 1),
('2025-08-05', 13, 2, 2, 3500, 7000, 6),
('2025-08-05', 13, 1, 1, 2500, 2500, 6),
('2025-08-06', 14, 9, 3, 5500, 16500, 1),
('2025-08-06', 14, 5, 1, 4800, 4800, 1),
('2025-08-06', 14, 6, 1, 3000, 3000, 1),
('2025-08-06', 15, 10, 2, 4000, 8000, 5),
('2025-08-06', 15, 8, 2, 5200, 10400, 5),
('2025-08-06', 15, 1, 2, 2500, 5000, 5),
('2025-08-06', 16, 7, 3, 4500, 13500, 2),
('2025-08-06', 16, 5, 1, 4800, 4800, 2),
('2025-08-06', 16, 3, 1, 5000, 5000, 2),
('2025-08-07', 17, 9, 2, 5500, 11000, 1),
('2025-08-07', 17, 6, 2, 3000, 6000, 1),
('2025-08-07', 17, 2, 1, 3500, 3500, 1),
('2025-08-07', 18, 8, 1, 5200, 5200, 3),
('2025-08-07', 18, 10, 1, 4000, 4000, 3),
('2025-08-07', 19, 4, 2
