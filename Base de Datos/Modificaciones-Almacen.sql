

-- 1. Arreglar la tabla Productos
ALTER TABLE Productos
  MODIFY COLUMN Precio_Compra DECIMAL(10, 2) NOT NULL,
  MODIFY COLUMN Precio_Venta DECIMAL(10, 2) NOT NULL;

-- 2. Arreglar la tabla Venta
ALTER TABLE Venta
  MODIFY COLUMN Total DECIMAL(10, 2) NOT NULL;

-- 3. Arreglar la tabla ProdVenta
ALTER TABLE ProdVenta
  MODIFY COLUMN Subtotal DECIMAL(10, 2) NOT NULL;

-- 4. Arreglar el Historial de Precios
ALTER TABLE Historial_precios
  MODIFY COLUMN Precio_Antiguo DECIMAL(10, 2) NOT NULL,
  MODIFY COLUMN Precio_Nuevo DECIMAL(10, 2) NOT NULL;



SET SQL_SAFE_UPDATES = 0;
-- Actualiza el precio del producto (DEBES CAMBIAR EL ID)
UPDATE Productos 
SET Precio_Venta = 1300.00 
WHERE Nombre = 'Manteca Primer Premio 100gr';

-- Actualiza el otro producto (DEBES CAMBIAR EL ID)
UPDATE Productos 
SET Precio_Venta = 2000.00 
WHERE Nombre = 'Crema de Leche 200ml';


-- Asegúrate de estar usando la base de datos correcta
USE Almacenjr_db;

-- 1. Actualiza TODOS los precios de compra y venta en Productos
UPDATE Productos
SET 
    Precio_Compra = Precio_Compra * 1000,
    Precio_Venta = Precio_Venta * 1000;

-- 2. Actualiza TODOS los precios en el historial
UPDATE Historial_precios
SET 
    Precio_Antiguo = Precio_Antiguo * 1000,
    Precio_Nuevo = Precio_Nuevo * 1000;

-- 3. (Opcional) Actualiza las ventas que YA habías registrado
-- Si ya tenías ventas con totales incorrectos, corre esto:
UPDATE ProdVenta
SET 
    Precio_Unitario = Precio_Unitario * 1000,
    Subtotal = Subtotal * 1000;

UPDATE Venta
SET 
    Total = Total * 1000;