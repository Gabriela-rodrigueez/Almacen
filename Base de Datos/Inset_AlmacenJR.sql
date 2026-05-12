INSERT INTO Roles (Nombre_Rol, Descripcion) VALUES
('Administrador', 'Acceso a la mayoría de las funcionalidades de gestión (productos, inventario, proveedores, ventas, reportes). Puede registrar Gerentes y Empleados.'),
('Vendedor', 'Acceso principalmente al registro de ventas, consulta de productos y stock actual.'),
('Encargado de Compras', 'Acceso a gestión de proveedores, registro de compras y consulta de inventario/alertas de stock.'),
('Encargado de Inventario', 'Controla stock, vencimientos, alertas de productos y realiza ajustes de inventario.'),
('Propietario', 'Acceso total al sistema, incluyendo gestión de usuarios y roles, configuración y reportes financieros.'),
('Gerente', 'Acceso a la gestión de productos, inventario, ventas y reportes específicos. Puede registrar Empleados.');

-- UPDATE Roles  SET Estado = 0  WHERE id_Roles = 2;



INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Aceites y Vinagres', 'Aceites comunes, Aceites Especiales, Acetos, Jugos de Limón y Vinagres'),
('Aderezos', 'Mayonesa, Ketchup, Mostaza, Salsas Golf, Salsas Frías y queso'),
('Arroz y Legumbres', 'Lentejas, Porotos y garbanzos'),
('Desayunos y Meriendas', 'Azúcar y Edulcorantes, Bizcochuelos, Budines y Magdalenas, Cacao y Savorizantes, Cereales, Galletas Dulces y Saladas, Mermeladas y Jaleas, Té, Café, Yerbas, Pionono'),
('Golosinas y Chocolates', 'Alfajores, Bocaditos y Postres, Bombones, Caramelos y Chicles, Chocolates, Turrones y Grageas'),
('Harinas', 'Harina Común y Leudante, Avena y Semolas'),
('Panificados', 'Lacteados, Pan de Hamburguesa y Panchos, Pan Frances, Tortitas, Facturas, Grisines y Tostadas, Pan rallado y rebozador, Integrales y Salvado'),
('Postres', 'Flanes, Gelatinas, Helados, Mousse, Bizcochuelos, Brownies y Tortas '),
('Pastas', 'Fideos guiseros, Tallarin, Spaghetti, Tirabuzon, Coditos, Mostachol, Misiles, Cabello de Angel, Fettuccini, '),
('Snacks', 'Frutos secos y Disecados, Maní, Nachos, Palitos de Maíz, Palitos salaados, Papas fritas, Pochoclos'),
('Bebidas', 'Aguas con gas, Aguas sin gas y saborizadas, Cervezas, Champagnes, Energezantes, Bebidas blancas, Gaseosa de Cola, Lima-Limon, Naranja, Pomelo, Tónica, Refrescos, jugos y agua'),
('Congelados', 'Helados, Hielos y dulces'),
('Limpieza', 'Deodorante de ambiente, Aromatizante, Desinfectante, Lavandina, Limpieza de Baño y Cocina, Esponjas, Guantes, Paños multiuso, Secadores y cepillo, Trapo de piso y aseo personas, Jabón de pan, Quitamanchas, Suavizantes, Desodorantes'),
('Papeles', 'Higuienico, Pañuelos, Servilletas, Rollo de Cocina, '),
('Lácteos y Fiambres', 'Leche, Yogurt, Quesos, Mortadela, Jamón cocido y crudo, Paleta, Salchichas'),
('Conservas', 'Arvejas, Choclo, Pickles, Durazno en Mitades, Atún, Picadillo, Champiñones, Palmitos'),
('Libreria y Regaleria', 'Lapiceras, Colores, Cartulinas, Cuadernos A4, Reglas, Pulseras, Aritos, Collares, Colines, Agujas, fotocopias e impresiones, '),
('Hogar y Textil', 'Cotillón, Velas, Aromatizantes'),
('Cargas', 'Sube y Celulares, Venta de chips');


