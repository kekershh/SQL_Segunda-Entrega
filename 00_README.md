# 🧺 ArepasDB\_Aparicio – Proyecto SQL

Este proyecto tiene como finalidad diseñar una base de datos relacional en MySQL para una tienda de arepas artesanal en Colombia. La base de datos permite digitalizar y organizar los procesos básicos del negocio: ventas, registro de clientes, movimientos de caja, manejo de proveedores, ingredientes, control de producción y ahora también el registro de **métodos de pago**.

---

## 📌 Índice

1. Introducción
2. Objetivo
3. Situación problemática
4. Modelo de negocio
5. Listado de Tablas
6. Vistas
7. Funciones
8. Procedimientos Almacenados
9. Triggers
10. Diagrama Entidad-Relación (E-R)

---

## 📖 Introducción

La implementación de este sistema permite automatizar la recolección de datos, facilitar el análisis de ventas, mejorar la trazabilidad de productos y registrar transacciones con sus métodos de pago. Además, genera reportes que apoyan la toma de decisiones.

---

## 🎯 Objetivo

Desarrollar una base de datos funcional en MySQL que:

* Registre productos y sus ingredientes.
* Controle proveedores y costos de materia prima.
* Registre transacciones de venta con sus métodos de pago.
* Vincule movimientos de caja con las ventas.
* Automatice el cálculo de totales y actualizaciones mediante **funciones, procedimientos y triggers**.

---

## ⚠️ Situación problemática

Actualmente, el negocio lleva sus registros manualmente. Esto dificulta conocer:

* Qué productos se venden más.
* Qué clientes son los más frecuentes.
* Cuánto dinero entra por día y cómo se pagó (efectivo, tarjeta, etc.).
* Cuál es el margen de ganancia.

La base de datos soluciona estos problemas mediante la centralización de la información.

---

## 🏪 Modelo de negocio

La tienda vende arepas artesanales directamente al público. Utiliza ingredientes comprados a proveedores y cada venta genera un ingreso en caja. Las áreas cubiertas por la base de datos son:

* Ventas y métodos de pago
* Caja (contabilidad)
* Clientes
* Productos y sus ingredientes
* Proveedores
* Recetas y costos

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

| Campo            | Descripción         | Tipo de dato  | Clave |
| ---------------- | ------------------- | ------------- | ----- |
| id\_producto     | ID del producto     | INT           | PK    |
| nombre           | Nombre del producto | VARCHAR(100)  |       |
| descripcion      | Descripción         | TEXT          |       |
| precio\_unitario | Precio de venta     | DECIMAL(10,2) |       |

### 3. Venta

| Campo        | Descripción        | Tipo de dato  | Clave |
| ------------ | ------------------ | ------------- | ----- |
| id\_venta    | ID de la venta     | INT           | PK    |
| fecha        | Fecha de la venta  | DATE          |       |
| id\_cliente  | Cliente que compró | INT (FK)      | FK    |
| total\_venta | Total de la venta  | DECIMAL(10,2) |       |

### 4. Detalle\_Venta

| Campo        | Descripción           | Tipo de dato  | Clave |
| ------------ | --------------------- | ------------- | ----- |
| id\_detalle  | ID del detalle        | INT           | PK    |
| id\_venta    | Venta asociada        | INT (FK)      | FK    |
| id\_producto | Producto vendido      | INT (FK)      | FK    |
| cantidad     | Cantidad comprada     | INT           |       |
| subtotal     | Subtotal por producto | DECIMAL(10,2) |       |

### 5. Caja

| Campo            | Descripción            | Tipo de dato  | Clave |
| ---------------- | ---------------------- | ------------- | ----- |
| id\_movimiento   | ID del movimiento      | INT           | PK    |
| fecha            | Fecha                  | DATE          |       |
| tipo\_movimiento | Ingreso o Egreso       | ENUM          |       |
| descripcion      | Detalle del movimiento | TEXT          |       |
| monto            | Valor del movimiento   | DECIMAL(10,2) |       |

### 6. Ingrediente

| Campo           | Descripción            | Tipo de dato | Clave |
| --------------- | ---------------------- | ------------ | ----- |
| id\_ingrediente | ID del ingrediente     | INT          | PK    |
| nombre          | Nombre del ingrediente | VARCHAR(100) |       |
| unidad\_medida  | Unidad de medida       | VARCHAR(20)  |       |

### 7. Proveedor

| Campo         | Descripción          | Tipo de dato | Clave |
| ------------- | -------------------- | ------------ | ----- |
| id\_proveedor | ID del proveedor     | INT          | PK    |
| nombre        | Nombre del proveedor | VARCHAR(100) |       |
| telefono      | Teléfono             | VARCHAR(20)  |       |
| correo        | Correo electrónico   | VARCHAR(100) |       |

### 8. Ingrediente\_Proveedor

| Campo            | Descripción       | Tipo de dato  | Clave |
| ---------------- | ----------------- | ------------- | ----- |
| id\_ing\_prov    | ID de la relación | INT           | PK    |
| id\_ingrediente  | Ingrediente       | INT (FK)      | FK    |
| id\_proveedor    | Proveedor         | INT (FK)      | FK    |
| precio\_unitario | Precio unitario   | DECIMAL(10,2) |       |

### 9. Producto\_Ingrediente

| Campo                     | Descripción        | Tipo de dato  | Clave |
| ------------------------- | ------------------ | ------------- | ----- |
| id\_producto\_ingrediente | ID relación        | INT           | PK    |
| id\_producto              | Producto           | INT (FK)      | FK    |
| id\_ingrediente           | Ingrediente        | INT (FK)      | FK    |
| cantidad\_usada           | Cantidad utilizada | DECIMAL(10,2) |       |

### 10. Metodo\_Pago

| Campo      | Descripción       | Tipo de dato | Clave |
| ---------- | ----------------- | ------------ | ----- |
| id\_metodo | ID del método     | INT          | PK    |
| nombre     | Nombre del método | VARCHAR(50)  |       |

### 11. Transaccion

| Campo            | Descripción                | Tipo de dato  | Clave |
| ---------------- | -------------------------- | ------------- | ----- |
| id\_transaccion  | ID de la transacción       | INT           | PK    |
| fecha            | Fecha de la transacción    | DATE          |       |
| id\_movimiento   | Movimiento de caja         | INT (FK)      | FK    |
| id\_producto     | Producto vendido           | INT (FK)      | FK    |
| cantidad         | Cantidad vendida           | INT           |       |
| precio\_unitario | Precio aplicado            | DECIMAL(10,2) |       |
| subtotal         | Subtotal de la transacción | DECIMAL(10,2) |       |
| id\_metodo       | Método de pago utilizado   | INT (FK)      | FK    |

---

## 👁 Vistas (5)

1. **vista\_ventas\_clientes** → ventas con nombre del cliente.
2. **vista\_detalle\_ventas** → detalle de productos en cada venta.
3. **vista\_movimientos\_caja** → relaciona caja con transacciones.
4. **vista\_proveedores\_ingredientes** → proveedores con los ingredientes que suministran.
5. **vista\_transacciones\_pagos** → transacciones vinculadas a método de pago.

---

## 🧮 Funciones (2)

1. **calcular\_total\_venta(venta\_id)** → suma subtotales de los detalles de una venta.
2. **stock\_restante(producto\_id)** → devuelve la cantidad disponible del producto.

---

## ⚙️ Stored Procedures (2)

1. **registrar\_venta** → inserta una nueva venta y su detalle.
2. **registrar\_movimiento\_caja** → registra manualmente un movimiento en caja.

---

## ⏱ Triggers (2)

1. **trg\_insert\_venta** → agrega automáticamente un movimiento de caja al crear una venta.
2. **trg\_update\_detalle** → recalcula `total_venta` al insertar un nuevo detalle.

---

## 🧠 Diagrama Entidad-Relación (E-R)

Puedes visualizar el diagrama aquí:
🔗 [Ver Diagrama en dbdiagram.io](https://dbdiagram.io)

---

## ✍ Autora

**Angelica Aparicio** – Proyecto Final SQL
Tienda de Arepas | Agosto 2025
