------------------- EJERCICIO 1 ------------------
-- Creando base de datos
CREATE DATABASE CADPH;

-- Dando uso a la BD CADPH
USE CADPH;

-- Creando tabla titulada
CREATE TABLE Titulada(
    id INT (20) UNIQUE PRIMARY KEY,
    nombre_apellido VARCHAR (50) UNIQUE NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL,
    edad INT UNSIGNED NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Inactivo',
    formación ENUM('Técnico', 'Tecnólogo') DEFAULT 'Tecnólogo',
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertando registros en la tabla titulada
INSERT INTO Titulada (id, nombre_apellido, correo, edad, direccion, ciudad, estado, formación) VALUES
(123416789, 'María Rodríguez', 'maria.rodriguez@misena.com', 25, 'Calle 123', 'Bogotá', 'Activo', 'Tecnólogo'),
(987654321, 'Juan García', 'juan.garcia@misena.com', 30, 'Carrera 456', 'Medellín', 'Activo', 'Técnico'),
(456789123, 'Laura Gómez', 'laura.gomez@misena.com', 28, 'Avenida 789', 'Cali', 'Activo', 'Tecnólogo'),
(789123456, 'Carlos Martínez', 'carlos.martinez@misena.com', 24, 'Calle 456', 'Barranquilla', 'Activo', 'Técnico'),
(234527890, 'Ana López', 'ana.lopez@misena.com', 22, 'Carrera 123', 'Cartagena', 'Activo', 'Tecnólogo'),
(876543210, 'Pedro Ramírez', 'pedro.ramirez@misena.com', 26, 'Avenida 789', 'Santa Marta', 'Activo', 'Técnico'),
(543210987, 'Sofía Perea', 'sofia.perea@misena.com', 29, 'Calle 123', 'Bucaramanga', 'Activo', 'Tecnólogo'),
(901232567, 'Gabriel Torres', 'gabriel.torres@misena.com', 23, 'Carrera 456', 'Cúcuta', 'Activo', 'Técnico'),
(678101234, 'Valentina Cortés', 'valentina.cortes@misena.com', 27, 'Avenida 789', 'Soledad', 'Activo', 'Tecnólogo'),
(345618901, 'Andrés Giraldo', 'andres.giraldo@gmail.com', 31, 'Calle 456', 'Barrancabermeja', 'Activo', 'Técnico'),
(189012345, 'Isabella Castro', 'isabella.castro@gmail.com', 29, 'Avenida 789', 'Manizales', 'Activo', 'Tecnólogo'),
(456789012, 'Santiago López', 'santiago.lopez@gmail.com', 26, 'Carrera 123', 'Pereira', 'Activo', 'Técnico'),
(123789456, 'Emma Ramírez', 'emma.ramirez@gmail.com', 28, 'Calle 123', 'Bello', 'Activo', 'Tecnólogo'),
(987012145, 'Lucas Gómez', 'lucas.gomez@gmail.com', 25, 'Carrera 456', 'Itagüí', 'Activo', 'Técnico'),
(234567810, 'Valentina Torres', 'valentina.torres@gmail.com', 27, 'Avenida 789', 'Envigado', 'Activo', 'Tecnólogo'),
(176123456, 'Mariana Vargas', 'mariana.vargas@gmail.com', 30, 'Calle 123', 'Rionegro', 'Activo', 'Técnico'),
(543456189, 'Mateo González', 'mateo.gonzalez@gmail.com', 24, 'Carrera 456', 'Quibdó', 'Activo', 'Tecnólogo'),
(901214567, 'Emilia Perea', 'emilia.perea@hotmail.com.com', 26, 'Avenida 789', 'Florencia', 'Activo', 'Técnico'),
(678001234, 'Benjamín Cárdenas', 'benjamin.cardenas@hotmail.com.com', 29, 'Calle 123', 'Popayán', 'Activo', 'Tecnólogo'),
(345678941, 'Renata Castro', 'renata.castro@hotmail.com.com', 25, 'Carrera 123', 'Neiva', 'Activo', 'Técnico'),
(123789012, 'Valeria Pacheco', 'valeria.pacheco@hotmail.com.com', 28, 'Calle 123', 'Arauca', 'Activo', 'Técnico'),
(987012345, 'Lucía Valencia', 'lucia.valencia@hotmail.com.com', 25, 'Carrera 456', 'Yopal', 'Activo', 'Tecnólogo'),
(234567890, 'Maximiliano Gómez', 'maximiliano.gomez@hotmail.com.com', 27, 'Avenida 789', 'Puerto Carreño', 'Activo', 'Técnico'),
(876123456, 'Camila López', 'camila.lopez@hotmail.com.com', 30, 'Calle 123', 'Quiriguá', 'Activo', 'Tecnólogo'),
(543456789, 'Emilio Castro', 'emilio.castro@yahoo.com', 24, 'Carrera 456', 'Aracataca', 'Activo', 'Técnico'),
(901235567, 'Renata Cárdenas', 'renata.cardenas@yahoo.com', 26, 'Avenida 789', 'Magangué', 'Activo', 'Tecnólogo'),
(678901234, 'Santino Londoño', 'santino.londono@yahoo.com', 29, 'Calle 123', 'Quimbaya', 'Activo', 'Técnico'),
(345678901, 'Isabela Torres', 'isabela.torres@yahoo.com', 25, 'Carrera 123', 'Manzanares', 'Activo', 'Tecnólogo'),
(789012345, 'Santiago Ramírez', 'santiago.ramirez@yahoo.com', 27, 'Avenida 789', 'Anorí', 'Activo', 'Técnico'),
(123456789, 'Valentina Vargas', 'valentina.vargas@yahoo.com', 26, 'Calle 123', 'Peñol', 'Activo', 'Tecnólogo');

-- Actualizando el correo para el Id de gabriel.
UPDATE Titulada SET correo = "gabrielito101.torresP@gmail.com" WHERE id = 901234567;

-- Eliminando el registro de la forma tradicional el registro de camila.
DELETE FROM titulada WHERE id = 876123456;

-- Eleminar los registros de la tabla.
TRUNCATE TABLE Titulada;


------------------- EJERCICIO 2 ------------------
-- Creamos la base datos a utilizar
CREATE DATABASE FACTURACION;
-- Asignamos la base de datos que utilizaremos
USE FACTURACION;
-- Creamos la tabla que representara a los clientes
CREATE TABLE clientes(
    id_clientes VARCHAR (30) UNIQUE PRIMARY KEY,
    nombre VARCHAR (25) UNIQUE NOT NULL,
    apellido VARCHAR (25) UNIQUE NOT NULL,
    direccion  VARCHAR (20) NOT NULL,
    telefono VARCHAR (20) NOT NULL,
    correo VARCHAR (50) UNIQUE NOT NULL,
    municipio VARCHAR(20),
    departamento VARCHAR(20),
    pais VARCHAR (20) CHECK (pais='Colombia'),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creamos la tabla para las facturas.
CREATE TABLE factura(
    num_factura VARCHAR (20) UNIQUE PRIMARY KEY,
    id_clientes VARCHAR (30),
    id_producto VARCHAR (30),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creamos los productos del comercio.
CREATE TABLE productos(
    id_producto VARCHAR (30) UNIQUE PRIMARY KEY,
    nombre VARCHAR (25) NOT NULL,
    precio INT (25) NOT NULL,
    stock INT (25) NOT NULL,
    num_factura VARCHAR (20),
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creamos llave foranea desde factura nombrandola como fk_clientes y haciendo referencia de la columna id_clientes en las dos tablas
ALTER TABLE factura
ADD CONSTRAINT fk_clientes
FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes);
-- Creamos la segunda llave foranea donde hará referencia a la columna id_producto en la tabla productos hacia esta tabla factura.
ALTER TABLE factura
ADD CONSTRAINT fk_productos
FOREIGN KEY (id_producto) REFERENCES productos(id_producto);
-- Creamos llave foranea haciendo referencia a la factura
ALTER TABLE productos
ADD CONSTRAINT fk_factura
FOREIGN KEY (num_factura) REFERENCES factura(num_factura);
-- Inicialmente ingresamos los productos existentes
INSERT INTO productos (id_producto, nombre, precio, stock) VALUES
('PROD001', 'Televisor LED', 800000, 10),
('PROD002', 'Smartphone', 600000, 15),
('PROD003', 'Laptop', 1200000, 5),
('PROD004', 'Tablet', 400000, 8),
('PROD005', 'Refrigerador', 1500000, 6),
('PROD006', 'Microondas', 250000, 12),
('PROD007', 'Impresora', 300000, 9),
('PROD008', 'Cámara Digital', 500000, 7),
('PROD009', 'Aspiradora', 180000, 20),
('PROD010', 'Licuadora', 80000, 25);    
-- Agregamos los clientes que tiene el comercio
INSERT INTO clientes (id_clientes, nombre, apellido, direccion, telefono, correo, municipio, departamento, pais) VALUES
('123456789', 'Ana', 'García', 'Calle 123', '3101234567', 'ana.garcia@gmail.com', 'Medellín', 'Antioquia', 'Colombia'),
('987654321', 'Juan', 'Martínez', 'Carrera 456', '3159876543', 'juan.martinez@yahoo.com', 'Bogotá', 'Cundinamarca', 'Colombia'),
('456789123', 'Laura', 'Gómez', 'Avenida 789', '3204567890', 'laura.gomez@hotmail.com', 'Cali', 'Valle del Cauca', 'Colombia'),
('789123456', 'Carlos', 'López', 'Calle 456', '3177890123', 'carlos.lopez@gmail.com', 'Barranquilla', 'Atlántico', 'Colombia'),
('234567890', 'María', 'Ramírez', 'Carrera 123', '3142345678', 'maria.ramirez@yahoo.com', 'Cartagena', 'Bolívar', 'Colombia');
-- Al hacer una nueva compra se crea la factura con los datos del cliente y el producto a llevar
INSERT INTO factura (num_factura, id_clientes, id_producto) VALUES
('FAC001', '123456789', 'PROD001'),
('FAC002', '987654321', 'PROD002'),
('FAC003', '456789123', 'PROD003'),
('FAC004', '789123456', 'PROD004'),
('FAC005', '234567890', 'PROD005'),
('FAC006', '123456789', 'PROD006'),
('FAC007', '987654321', 'PROD007'),
('FAC008', '456789123', 'PROD008'),
('FAC009', '789123456', 'PROD009'),
('FAC010', '234567890', 'PROD010');
-- Por logica los datos deberian actualizarce en productos haciendo referencia a la factura que pertenece.
UPDATE productos SET num_factura ='FAC001' WHERE id_producto = 'PROD001';
UPDATE productos SET num_factura ='FAC002' WHERE id_producto = 'PROD002';
UPDATE productos SET num_factura ='FAC003' WHERE id_producto = 'PROD003';
UPDATE productos SET num_factura ='FAC004' WHERE id_producto = 'PROD004';
UPDATE productos SET num_factura ='FAC005' WHERE id_producto = 'PROD005';
UPDATE productos SET num_factura ='FAC006' WHERE id_producto = 'PROD006';
UPDATE productos SET num_factura ='FAC007' WHERE id_producto = 'PROD007';
UPDATE productos SET num_factura ='FAC008' WHERE id_producto = 'PROD008';
UPDATE productos SET num_factura ='FAC009' WHERE id_producto = 'PROD009';
UPDATE productos SET num_factura ='FAC0010' WHERE id_producto = 'PROD0010';


