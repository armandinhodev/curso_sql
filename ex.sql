
CREATE TABLE categorias ( 
   categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
   nombre VARCHAR(50) NOT NULL UNIQUE 
);


CREATE TABLE clientes (
    cliente_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    identificacion_fiscal VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE
); 


CREATE TABLE empleados (
    empleado_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2) CHECK (salario > 0)
); 


CREATE TABLE productos (
    producto_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INTEGER DEFAULT 0,
    en_stock BOOLEAN DEFAULT TRUE,
    fecha_alta DATE DEFAULT CURRENT_DATE,
    categoria_id INTEGER NOT NULL REFERENCES categorias(categoria_id)
); 


CREATE TABLE pedidos (
    pedido_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha_pedido DATE DEFAULT CURRENT_DATE,
    monto_total DECIMAL(10,2) DEFAULT 0,
    pagado BOOLEAN DEFAULT FALSE,
    cliente_id INTEGER NOT NULL REFERENCES clientes(cliente_id),
    empleado_id INTEGER NOT NULL REFERENCES empleados(empleado_id)
); 

CREATE TABLE detalles_pedido (
    detalle_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pedido_id INTEGER NOT NULL REFERENCES pedidos(pedido_id),
    producto_id INTEGER NOT NULL REFERENCES productos(producto_id),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL
); 

INSERT INTO categorias (nombre) VALUES 
('Laptops'),            -- ID 1
('Smartphones'),        -- ID 2
('Monitores'),          -- ID 3
('Componentes'),        -- ID 4
('Periféricos'),        -- ID 5
('Servidores'),         -- ID 6
('Software'),           -- ID 7
('Redes'),              -- ID 8
('Accesorios'),         -- ID 9
('Almacenamiento');     -- ID 10


INSERT INTO empleados (nombre, apellido, cargo, salario) VALUES
('Ana', 'García', 'Gerente Regional', 150000.00),
('Carlos', 'López', 'Soporte Técnico Senior', 95000.00),
('Marta', 'Sánchez', 'Ejecutivo de Cuentas', 110000.00),
('Roberto', 'Gómez', 'Vendedor Junior', 75000.00),
('Lucía', 'Torres', 'Vendedora Senior', 98000.00),
('Diego', 'Ramírez', 'Especialista en Redes', 105000.00);

INSERT INTO clientes (identificacion_fiscal, nombre, email) VALUES
('30-71458962-9', 'Global Tech Corp', 'compras@globaltech.com'),
('20-35841267-1', 'Javier Fernández', 'javier.f@gmail.com'),
('33-66554433-2', 'Sistemas Digitales SRL', 'adm@sisdigital.net'),
('27-40123456-8', 'Mariana Paz', 'mariana_paz88@outlook.com'),
('30-88997766-4', 'Eco Energía S.A.', 'proveedores@ecoenergia.com'),
('23-22114455-0', 'Ricardo Sosa', 'sosa.ricardo@empresa.com');


INSERT INTO productos (nombre, precio, stock, en_stock, categoria_id) VALUES
-- Categoría 1: Laptops
('MacBook Air M2', 1250000.00, 10, TRUE, 1),
('Dell XPS 13', 950000.00, 0, FALSE, 1),
('Lenovo ThinkPad X1', 880000.00, 12, TRUE, 1),
('ASUS ROG Zephyrus', 1500000.00, 5, TRUE, 1),
('HP Pavilion 15', 620000.00, 20, TRUE, 1),

-- Categoría 2: Smartphones
('iPhone 15 Pro', 1400000.00, 15, TRUE, 2),
('Samsung Galaxy S23', 890000.00, 25, TRUE, 2),
('Google Pixel 8', 750000.00, 10, TRUE, 2),
('Xiaomi 13 Ultra', 680000.00, 18, TRUE, 2),

-- Categoría 3: Monitores
('Monitor LG 27" 4K', 350000.00, 8, TRUE, 3),
('Monitor Gamer 144Hz', 280000.00, 12, TRUE, 3),
('Samsung Odyssey G9', 980000.00, 3, TRUE, 3),
('Monitor Oficina 24"', 120000.00, 30, TRUE, 3),

-- Categoría 4: Componentes
('Placa Video RTX 4070', 750000.00, 5, TRUE, 4),
('Procesador Intel i9', 580000.00, 8, TRUE, 4),
('Memoria RAM 32GB', 85000.00, 40, TRUE, 4),
('Fuente Modular 850W', 110000.00, 15, TRUE, 4),
('Motherboard Z790', 250000.00, 10, TRUE, 4),

-- Categoría 5: Periféricos
('Teclado Mecánico RGB', 75000.00, 25, TRUE, 5),
('Mouse Logitech G502', 45000.00, 50, TRUE, 5),
('Auriculares HyperX', 65000.00, 30, TRUE, 5),
('Webcam Logitech C920', 80000.00, 20, TRUE, 5),
('Pad Mouse XL', 15000.00, 100, TRUE, 5),

-- Categoría 6: Servidores
('HP ProLiant Gen10', 2500000.00, 3, TRUE, 6),
('Dell PowerEdge T150', 1800000.00, 4, TRUE, 6),
('NAS Synology 4-Bay', 450000.00, 6, TRUE, 6),

-- Categoría 7: Software
('Office 365 Business', 45000.00, 500, TRUE, 7),
('Antivirus Norton 1 año', 25000.00, 200, TRUE, 7),
('Adobe Creative Cloud', 180000.00, 50, TRUE, 7),
('Licencia Windows 11', 120000.00, 100, TRUE, 7),

-- Categoría 8: Redes
('Router Cisco ISR', 550000.00, 7, TRUE, 8),
('Switch 24 Puertos GbE', 180000.00, 15, TRUE, 8),
('Access Point Ubiquiti', 130000.00, 20, TRUE, 8),
('Modem Fibra Óptica', 95000.00, 25, TRUE, 8),

-- Categoría 9: Accesorios
('Cable HDMI 2.1', 12000.00, 150, TRUE, 9),
('Adaptador USB-C Hub', 35000.00, 60, TRUE, 9),
('Funda Laptop 15"', 20000.00, 45, TRUE, 9),
('Cargador Universal', 28000.00, 35, TRUE, 9),

-- Categoría 10: Almacenamiento
('SSD NVMe 1TB', 95000.00, 45, TRUE, 10),
('Disco Externo 2TB', 120000.00, 30, TRUE, 10),
('Pendrive 128GB USB 3.0', 15000.00, 200, TRUE, 10),
('Micro SD 256GB', 35000.00, 120, TRUE, 10);


INSERT INTO pedidos (fecha_pedido, monto_total, pagado, cliente_id, empleado_id) VALUES
-- Ventas de Enero
('2024-01-10', 1345000.00, TRUE, 1, 3),
('2024-01-12', 45000.00, TRUE, 2, 4),
('2024-01-15', 2500000.00, FALSE, 3, 1),
('2024-01-18', 215000.00, TRUE, 4, 5),
('2024-01-20', 1250000.00, TRUE, 6, 3),
('2024-01-22', 85000.00, TRUE, 5, 2),
('2024-01-25', 350000.00, FALSE, 1, 5),
('2024-01-28', 950000.00, TRUE, 3, 3),

-- Ventas de Febrero
('2024-02-02', 120000.00, TRUE, 2, 4),
('2024-02-05', 450000.00, TRUE, 4, 1),
('2024-02-08', 1400000.00, FALSE, 6, 5),
('2024-02-10', 75000.00, TRUE, 1, 3),
('2024-02-12', 1800000.00, TRUE, 3, 1),
('2024-02-15', 65000.00, TRUE, 5, 4),
('2024-02-18', 280000.00, TRUE, 2, 2),
('2024-02-20', 15000.00, TRUE, 4, 4),

-- Ventas de Marzo (Recientes)
('2024-03-01', 580000.00, TRUE, 6, 3),
('2024-03-03', 110000.00, FALSE, 1, 5),
('2024-03-05', 25000.00, TRUE, 2, 4),
('2024-03-07', 130000.00, TRUE, 3, 6);


INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
-- Detalles para Pedido 1 (Total: 1,345,000.00)
(1, 1, 1, 1250000.00), -- 1 MacBook Air M2
(1, 39, 1, 95000.00),  -- 1 SSD NVMe 1TB

-- Detalles para Pedido 2 (Total: 45,000.00)
(2, 27, 1, 45000.00),  -- 1 Office 365 Business

-- Detalles para Pedido 3 (Total: 2,500,000.00)
(3, 24, 1, 2500000.00), -- 1 Servidor HP ProLiant

-- Detalles para Pedido 4 (Total: 215,000.00)
(4, 40, 1, 120000.00), -- 1 Disco Externo 2TB
(4, 39, 1, 95000.00),  -- 1 SSD NVMe 1TB

-- Detalles para Pedido 5 (Total: 1,250,000.00)
(5, 1, 1, 1250000.00), -- 1 MacBook Air M2

-- Detalles para Pedido 6 (Total: 85,000.00)
(6, 16, 1, 85000.00),  -- 1 Memoria RAM 32GB

-- Detalles para Pedido 7 (Total: 350,000.00)
(7, 10, 1, 350000.00), -- 1 Monitor LG 27" 4K

-- Detalles para Pedido 8 (Total: 950,000.00)
(8, 2, 1, 950000.00),  -- 1 Dell XPS 13

-- Detalles para Pedido 9 (Total: 120,000.00)
(9, 30, 1, 120000.00), -- 1 Licencia Windows 11

-- Detalles para Pedido 10 (Total: 450,000.00)
(10, 26, 1, 450000.00), -- 1 NAS Synology

-- Detalles para Pedido 11 (Total: 1,400,000.00)
(11, 6, 1, 1400000.00), -- 1 iPhone 15 Pro

-- Detalles para Pedido 12 (Total: 1,800,000.00)
(12, 25, 1, 1800000.00), -- 1 Dell PowerEdge T150

-- Detalles para Pedido 13 (Total: 75,000.00)
(13, 19, 1, 75000.00),  -- 1 Teclado Mecánico RGB

-- Detalles para Pedido 14 (Total: 65,000.00)
(14, 21, 1, 65000.00),  -- 1 Auriculares HyperX

-- Detalles para Pedido 15 (Total: 280,000.00)
(15, 11, 1, 280000.00), -- 1 Monitor Gamer 144Hz

-- Detalles para Pedido 16 (Total: 15,000.00)
(16, 23, 1, 15000.00),  -- 1 Pad Mouse XL

-- Detalles para Pedido 17 (Total: 580,000.00)
(17, 15, 1, 580000.00), -- 1 Procesador Intel i9

-- Detalles para Pedido 18 (Total: 110,000.00)
(18, 17, 1, 110000.00), -- 1 Fuente Modular 850W

-- Detalles para Pedido 19 (Total: 25,000.00)
(19, 28, 1, 25000.00),  -- 1 Antivirus Norton

-- Detalles para Pedido 20 (Total: 130,000.00)
(20, 33, 1, 130000.00); -- 1 Access Point Ubiquiti

/*

Ejercicios:

Nivel I: Consultas Básicas y Filtrado (DQL)
Proyección: Obtener el nombre y el correo electrónico de todos los clientes registrados.

Filtrado Simple: Listar todos los productos que actualmente tienen un stock de 0.

Operadores Lógicos: Mostrar los nombres y cargos de los empleados que tienen el cargo de 'Vendedor Junior' o 'Vendedora Senior'.

Búsqueda de Patrones: Localizar todos los productos cuyo nombre contenga la palabra 'Monitor', sin importar si está en mayúsculas o minúsculas.

Rangos: Listar todos los pedidos realizados durante el mes de febrero de 2024 (del 2024-02-01 al 2024-02-29) utilizando el operador BETWEEN.

Ordenamiento y Límites: Mostrar los 5 productos más caros de la tienda, ordenados de mayor a menor precio.

Nivel II: Transformación y Agregación
Funciones de Texto: Generar un listado de empleados donde se muestre su nombre y apellido unidos en una sola columna llamada "Nombre Completo".

Funciones Numéricas: Mostrar el nombre de los productos y su precio redondeado a un solo decimal.

Contabilidad: ¿Cuántos pedidos han sido marcados como pagados (TRUE) hasta la fecha?

Estadística Descriptiva: Calcular el salario promedio de todos los empleados de la empresa.

Agrupamiento: Obtener el monto total de ventas acumulado por cada empleado (usando su empleado_id).

Filtrado de Grupos: Listar los IDs de los clientes que han realizado compras por un monto total acumulado superior a 1,000,000.

Nivel III: Relaciones (JOINS) y Subconsultas
Inner Join: Listar el nombre de cada producto junto con el nombre de su categoría correspondiente.

Triple Join: Mostrar un reporte de pedidos que incluya: el ID del pedido, el nombre del cliente y el nombre del empleado que realizó la venta.

Left Join: Identificar a los empleados que no han gestionado ningún pedido aún (buscando valores NULL en la relación).

Subconsulta Escalar: Encontrar todos los productos cuyo precio sea superior al precio promedio de todos los productos de la tienda.

Subconsulta IN: Mostrar los nombres de los clientes que han comprado productos de la categoría 'Laptops' (ID 1).

Nivel IV: Modificación de Datos y Estructuras (DML/DDL)
Actualización: Incrementar en un 10% el salario de todos los empleados que ocupan el cargo de 'Soporte Técnico Senior'.

Gestión de Stock y Descontinuación: Realizar una transacción (BEGIN/COMMIT) para el producto 'Dell XPS 13' (ID 2) donde se marque en_stock = FALSE y se deje el stock en 0.

Vistas: Crear una vista llamada vista_stock_critico que muestre el nombre y el stock de los productos que tienen menos de 5 unidades disponibles.

*/