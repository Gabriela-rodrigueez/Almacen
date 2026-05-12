CREATE DATABASE Almacenjr_db;
USE Almacenjr_db;


CREATE TABLE Roles (
    id_Roles INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Rol VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    Estado BOOLEAN DEFAULT 1,
    Fecha_Creacion DATE DEFAULT (CURRENT_DATE)
);


CREATE TABLE Usuario (
    id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_Roles INT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Fecha_Registro DATE DEFAULT (CURRENT_DATE),
    Estado BOOLEAN DEFAULT 1,
    
    FOREIGN KEY (id_Roles) REFERENCES Roles(id_Roles)
);


CREATE TABLE Categoria (
    id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
);


CREATE TABLE Productos (
    id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    id_Categoria INT NOT NULL,
    id_Proveedor INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Estado BOOLEAN DEFAULT 1,
    Precio_Compra DECIMAL(10, 3) NOT NULL,
    Precio_Venta DECIMAL(10, 3) NOT NULL,
    Stock_Actual INT DEFAULT 0,
    Stock_Minimo INT DEFAULT 0,
    Vencimiento DATE,
    Ultima_Modificacion DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_Categoria) REFERENCES Categoria(id_Categoria),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

ALTER TABLE Productos
ADD COLUMN Tipo_Venta ENUM('unidad', 'peso') NOT NULL DEFAULT 'unidad' AFTER Descripcion;


CREATE TABLE Historial_precios (
    id_Historial INT AUTO_INCREMENT PRIMARY KEY,
    id_Producto INT,
    Precio_Antiguo DECIMAL(10, 3) NOT NULL,
    Precio_Nuevo DECIMAL(10, 3) NOT NULL,
    Motivo VARCHAR(255),
    Fecha_Cambio DATETIME DEFAULT (CURRENT_TIMESTAMP),
    
    FOREIGN KEY (id_Producto) REFERENCES Productos(id_Producto)
);


CREATE TABLE Ajustes_Inventario (
    id_AjusteInventario INT AUTO_INCREMENT PRIMARY KEY,
    id_Producto INT,
    Cantidad_Ajustada INT,
    Motivo VARCHAR(255),
    Fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_Producto) REFERENCES Productos(id_Producto)
);



CREATE TABLE Venta (
    id_Venta INT AUTO_INCREMENT PRIMARY KEY,
    id_Usuario INT,
    Fecha DATE DEFAULT (CURRENT_DATE),
    Hora TIME DEFAULT (CURRENT_TIME),
    Total DECIMAL(10, 3) NOT NULL,
    Metodo_Pago VARCHAR(50),
    Anulada BOOLEAN DEFAULT 0,
    
    FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);


CREATE TABLE ProdVenta (
	id_ProdVenta INT AUTO_INCREMENT PRIMARY KEY,
    id_Venta INT,
    id_Producto INT,
    Cantidad INT NOT NULL,
    Precio_Unitario DOUBLE NOT NULL,
    Subtotal DECIMAL(10, 3) NOT NULL,
    
    
    FOREIGN KEY (id_Venta) REFERENCES Venta(id_Venta),
    FOREIGN KEY (id_Producto) REFERENCES Productos(id_Producto)
);






CREATE TABLE Proveedor (
    id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Contacto VARCHAR(100),
    Productos_Suministrados VARCHAR(255),
    Estado BOOLEAN DEFAULT 1
);


CREATE TABLE Pedido_Stock (
    id_PedidoStock INT AUTO_INCREMENT PRIMARY KEY,
	id_Proveedor INT,
    Fecha DATE DEFAULT (CURRENT_DATE),
    Hora TIME DEFAULT (CURRENT_TIME),
    Cantidad DECIMAL(10, 2),

    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);


CREATE TABLE Prod_Pedido (
    id_PedidoStock INT,
    id_Producto INT,
    Cantidad INT NOT NULL,
    Precio_Compra DOUBLE NOT NULL,
    
    PRIMARY KEY (id_PedidoStock, id_Producto),
    FOREIGN KEY (id_PedidoStock) REFERENCES Pedido_Stock(id_PedidoStock),
    FOREIGN KEY (id_Producto) REFERENCES Productos(id_Producto)
);

ALTER TABLE Prod_Pedido
MODIFY COLUMN Cantidad DECIMAL(10, 3) NOT NULL;



-- PASO 1: Borrar las llaves foráneas (Foreign Keys).
-- (MySQL probablemente las llamó 'prod_pedido_ibfk_1' y 'prod_pedido_ibfk_2' por defecto)
ALTER TABLE Prod_Pedido DROP FOREIGN KEY prod_pedido_ibfk_1;
ALTER TABLE Prod_Pedido DROP FOREIGN KEY prod_pedido_ibfk_2;

-- PASO 2: Ahora sí, borrar la llave primaria (Primary Key) que da error
ALTER TABLE Prod_Pedido DROP PRIMARY KEY;

-- PASO 3: Añadir la nueva columna de ID única (¡Esta es la solución!)
ALTER TABLE Prod_Pedido 
ADD COLUMN id_ProdPedido INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- PASO 4: Volver a crear las llaves foráneas (ahora con nombres claros)
ALTER TABLE Prod_Pedido 
ADD CONSTRAINT fk_prodpedido_pedido
    FOREIGN KEY (id_PedidoStock) REFERENCES Pedido_Stock(id_PedidoStock);

ALTER TABLE Prod_Pedido 
ADD CONSTRAINT fk_prodpedido_producto
    FOREIGN KEY (id_Producto) REFERENCES Productos(id_Producto);
