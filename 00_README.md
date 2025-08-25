🧺 **ArepasDB\_Aparicio**

Este proyecto tiene como finalidad diseñar una base de datos relacional en MySQL para una tienda de arepas artesanal, un negocio familiar que opera en Colombia. La base de datos busca digitalizar y organizar los procesos básicos del negocio: ventas, registro de clientes, movimientos de caja, manejo de proveedores, ingredientes y control de producción.

---

## 📌 Índice

* Introducción
* Objetivo
* Situación problemática
* Modelo de negocio
* Listado de Tablas
* Diagrama Entidad-Relación (E-R)
* Vistas
* Funciones
* Stored Procedures
* Triggers

---

## 📖 Introducción

La implementación de este sistema permitirá automatizar la recolección de datos, facilitar el análisis de ventas y márgenes, mejorar la trazabilidad de productos, y generar reportes que apoyen la toma de decisiones del negocio.

---

## 🎯 Objetivo

Desarrollar una base de datos funcional en MySQL que:

* Registre productos y sus ingredientes.
* Controle proveedores y costos de materia prima.
* Registre cada transacción de venta junto con sus movimientos de caja.
* Permita asociar cada venta a un **método de pago**.
* Vincule la información comercial y contable.
* Sirva como base para reportes futuros de ventas, costos y ganancias.

---

## ⚠️ Situación problemática

Actualmente, el negocio lleva sus registros manualmente, lo cual limita el control financiero y operativo. Es difícil conocer:

* Qué productos se venden más.
* Cuánto dinero entra por día.
* Cuánto cuesta producir cada arepa.
* Cuál es el margen de ganancia por unidad.
* Qué métodos de pago utilizan más los clientes.

Una base de datos relacional soluciona estos problemas mediante la centralización de la información y permite mejorar la gestión del negocio.

---

## 🏪 Modelo de negocio

La tienda vende arepas artesanales directamente al público, con distintos tipos de productos. Utiliza ingredientes comprados a proveedores y cada venta genera un ingreso en caja.
Las áreas cubiertas por la base de datos son:

* Ventas
* Caja (contabilidad)
* Clientes
* Productos y sus ingredientes
* Proveedores
* Recetas y costos
* Métodos de pago

---

## 📋 Listado de Tablas

### 1. Cliente

| Campo       | Descripción        | Tipo de dato | Clave |
| ----------- | ------------------ | ------------ | ----- |
| id\_cliente | ID del cliente     | INT          | PK    |
| nombre      | Nombre del cliente | VARCHAR(100) |       |
| telefono    | Teléfono           | VARCHAR(20)  |       |
| direccion   | Dirección          | VARCHAR(255) |       |
| correo      | Correo electrónico | VARCHAR(100) |       |

### 2. Producto

| Campo            | Descripción           | Tipo de dato  | Clave |
| ---------------- | --------------------- | ------------- | ----- |
| id\_producto     | ID del producto       | INT           | PK    |
| nombre           | Nombre del producto   | VARCHAR(100)  |       |
| descripcion      | Descripción del prod. | TEXT          |       |
| precio\_unitario | Precio de venta       | DECIMAL(10,2) |       |

### 3. Venta

| Campo        | Descripción              | Tipo de dato  | Clave |
| ------------ | ------------------------ | ------------- | ----- |
| id\_venta    | ID de la venta           | INT           | PK    |
| fecha        | Fecha de la venta        | DATE          |       |
| id\_cliente  | Cliente que compró       | INT (FK)      | FK    |
| id\_metodo   | Método de pago utilizado | INT (FK)      | FK    |
| total\_venta | Total de la venta        | DECIMAL(10,2) |       |

### 4. Metodo\_Pago

| Campo      | Descripción                                 | Tipo de dato | Clave |
| ---------- | ------------------------------------------- | ------------ | ----- |
| id\_metodo | ID del método de pago                       | INT          | PK    |
| nombre     | Nombre del método (efectivo, tarjeta, etc.) | VARCHAR(100) |       |

### 5. Detalle\_Venta

| Campo        | Descripción        | Tipo de dato  | Clave |
| ------------ | ------------------ | ------------- | ----- |
| id\_detalle  | ID del detalle     | INT           | PK    |
| id\_venta    | ID de la venta     | INT (FK)      | FK    |
| id\_producto | ID del producto    | INT (FK)      | FK    |
| cantidad     | Cantidad comprada  | INT           |       |
| subtotal     | Total por producto | DECIMAL(10,2) |       |

### 6. Caja

| Campo            | Descripción          | Tipo de dato  | Clave |
| ---------------- | -------------------- | ------------- | ----- |
| id\_movimiento   | ID del movimiento    | INT           | PK    |
| fecha            | Fecha del movimiento | DATE          |       |
| tipo\_movimiento | Ingreso o Egreso     | ENUM          |       |
| descripcion      | Descripción          | TEXT          |       |
| monto            | Valor del movimiento | DECIMAL(10,2) |       |

### 7. Ingrediente

| Campo           | Descripción            | Tipo de dato | Clave |
| --------------- | ---------------------- | ------------ | ----- |
| id\_ingrediente | ID del ingrediente     | INT          | PK    |
| nombre          | Nombre del ingrediente | VARCHAR(100) |       |
| unidad\_medida  | Unidad de medida       | VARCHAR(20)  |       |

### 8. Proveedor

| Campo         | Descripción          | Tipo de dato | Clave |
| ------------- | -------------------- | ------------ | ----- |
| id\_proveedor | ID del proveedor     | INT          | PK    |
| nombre        | Nombre del proveedor | VARCHAR(100) |       |
| telefono      | Teléfono             | VARCHAR(20)  |       |
| correo        | Correo electrónico   | VARCHAR(100) |       |

### 9. Ingrediente\_Proveedor

| Campo            | Descripción       | Tipo de dato  | Clave |
| ---------------- | ----------------- | ------------- | ----- |
| id\_ing\_prov    | ID de la relación | INT           | PK    |
| id\_ingrediente  | Ingrediente       | INT (FK)      | FK    |
| id\_proveedor    | Proveedor         | INT (FK)      | FK    |
| precio\_unitario | Precio unitario   | DECIMAL(10,2) |       |

### 10. Producto\_Ingrediente

| Campo                     | Descripción       | Tipo de dato  | Clave |
| ------------------------- | ----------------- | ------------- | ----- |
| id\_producto\_ingrediente | ID de la relación | INT           | PK    |
| id\_producto              | Producto          | INT (FK)      | FK    |
| id\_ingrediente           | Ingrediente       | INT (FK)      | FK    |
| cantidad\_usada           | Cantidad usada    | DECIMAL(10,2) |       |

### 11. Transaccion

| Campo            | Descripción                    | Tipo de dato  | Clave |
| ---------------- | ------------------------------ | ------------- | ----- |
| id\_transaccion  | ID de la transacción           | INT           | PK    |
| fecha            | Fecha de la transacción        | DATE          |       |
| id\_movimiento   | Movimiento de caja relacionado | INT (FK)      | FK    |
| id\_producto     | Producto vendido               | INT (FK)      | FK    |
| cantidad         | Cantidad vendida               | INT           |       |
| precio\_unitario | Precio aplicado                | DECIMAL(10,2) |       |
| subtotal         | Total de la venta parcial      | DECIMAL(10,2) |       |

---

## 🧠 Diagrama Entidad-Relación (E-R)

Puedes visualizar el diagrama completo aquí:

🔗 [Ver Diagrama en dbdiagram.io](https://dbdiagram.io/)

---

## 👀 Vistas

Se crearon **5 vistas** que permiten simplificar consultas frecuentes:

1. **ventas\_diarias** – Resume las ventas agrupadas por fecha.
2. **ventas\_por\_cliente** – Total de compras realizadas por cada cliente.
3. **productos\_mas\_vendidos** – Muestra los productos con mayor cantidad vendida.
4. **ventas\_por\_metodo\_pago** – Distribución de ventas según método de pago.
5. **ingredientes\_bajo\_stock** – Detecta ingredientes que están por debajo de un nivel mínimo.

---

## ⚙️ Funciones

Se incluyeron **2 funciones personalizadas**:

1. **calcular\_margen\_ganancia(id\_producto)** – Calcula el margen de ganancia de un producto considerando sus ingredientes.
2. **aplicar\_descuento(total, porcentaje)** – Retorna el total con descuento aplicado, útil para promociones.

---

## 🛠️ Stored Procedures

Se desarrollaron **2 procedimientos almacenados**:

1. **registrar\_venta** – Inserta una nueva venta junto con su detalle y actualiza caja.
2. **reporte\_ventas\_rango(fecha\_inicio, fecha\_fin)** – Genera un reporte de ventas en un rango de fechas.

---

## 🔔 Triggers

Se configuraron **2 triggers** automáticos:

1. **trg\_actualizar\_caja** – Cada vez que se registra una venta, se crea un movimiento en caja automáticamente.
2. **trg\_validar\_stock** – Evita que se inserten ventas si no hay stock suficiente de ingredientes.

---

## 👩‍💻 Script SQL

Consulta el archivo **script.sql** incluido en este repositorio para ver la creación completa de la base de datos en MySQL, incluyendo tablas, vistas, funciones, procedimientos y triggers.

---

## ✍ Autora

**Angelica Aparicio** – Proyecto Final SQL
Tienda de Arepas | Agosto 2025
