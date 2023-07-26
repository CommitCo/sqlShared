--------- UTILIZAMOS LA BASE DE DATOS DE LA ACTIVIDAD ANTERIOR ---------

------------------- EJERCICIO 1 -------------------

-- Asignación de la base de datos que utilizaremos
USE FACTURACION;
-- Obtener todos los clientes que tangan por lo menos una factura.
SELECT * FROM clientes INNER JOIN factura ON clientes.id_clientes = factura .id_clientes;

------------------- EJERCICIO 2 -------------------

-- Obtener todos los clientes con sus facturas, mostrando también los clientes que no tienen factura. (teoría de conjuntos, lado izquierdo)
-- a) Obtener todos los clientes con sus facturas:
SELECT * FROM clientes LEFT JOIN factura ON clientes.id_clientes = factura.id_clientes;
-- b) Mostrando también los clientes que no tienen factura.
SELECT * FROM clientes LEFT JOIN factura ON clientes.id_clientes = factura.id_clientes WHERE factura.id_clientes IS NULL;

------------------- EJERCICIO 3 -------------------

-- Obtener todas las facturas de clientes, mostrando también las facturas que no tienen cliente asociado. (teoría de conjuntos, lado derecho)
-- a) Obtener todas las facturas de clientes.
SELECT * FROM clientes RIGHT JOIN factura ON clientes.id_clientes = factura.id_clientes;
-- b) Obtener las facturas que no tienen cliente asociado.
SELECT * FROM clientes RIGHT JOIN factura ON clientes.id_clientes = factura.id_clientes WHERE factura.id_clientes IS NULL;

-- La sintaxis de OUTER JOIN o FULL OUTER JOIN no existen en MySQL, pero se puede conseguir el mismo resultado de diferentes formas, esta es una: 
SELECT * FROM clientes LEFT JOIN factura ON clientes.id_clientes = factura.id_clientes
UNION
SELECT * FROM clientes RIGHT JOIN factura ON clientes.id_clientes = factura.id_clientes;


------------------- Taller practico -------------------
-- Esta empresa se encarga del servicio y venta de productos que
-- ofrecen en un centro de estetica y COD. En este modelo se
-- crearan varias tablas que son importantes para cumplir lo que se ofrece.

-- Se crea la Base de datos
CREATE DATABASE oasis_spa;
-- Se asigna la base de datos a usar
USE oasis_spa;
-- Se crea la tabla cliente
CREATE TABLE clientes (
    clienId VARCHAR (30) PRIMARY KEY COMMENT 'Id cliente',
    clieNom VARCHAR (25) NOT NULL COMMENT 'Nombre',
    clieApe VARCHAR (25) NOT NULL COMMENT 'Apellido',
    cliDire VARCHAR (20) NOT NULL COMMENT 'Direccion',
    clietel VARCHAR (20) NOT NULL COMMENT 'telefono',
    cliEmai VARCHAR (50) UNIQUE NOT NULL COMMENT 'correo',
    climuni VARCHAR (20) COMMENT 'municipio',
    clidepa VARCHAR (20) COMMENT 'departamento',
    clipais VARCHAR (20) COMMENT 'pais',
    estado ENUM('A', 'I') COMMENT 'Estado',
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creación de la tabla producto
CREATE TABLE productos (
    producCod VARCHAR (30) PRIMARY KEY COMMENT 'Codigo Producto',
    producNom VARCHAR (25) NOT NULL COMMENT 'Nombre producto',
    producpre INT (25) NOT NULL COMMENT 'Precio Producto',
    stock INT (25) NOT NULL COMMENT 'Stock producto',
    estado ENUM('A', 'I') COMMENT 'Estado',
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creación de tabla servicio
CREATE TABLE servicios (
    servicioId INT PRIMARY KEY COMMENT 'Id servicio',
    serviNom VARCHAR(100) NOT NULL COMMENT 'Nombre',
    serviDesc TEXT NOT NULL COMMENT 'Descripcion',
    serviPrec DECIMAL(10, 2) NOT NULL COMMENT 'Precio',
    estado ENUM('A', 'I') COMMENT 'Estado', 
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Se crea la tabla agenda
CREATE TABLE agendas (
    agendaId INT PRIMARY KEY COMMENT 'Id Agenda',
    clienId VARCHAR (30) NOT NULL COMMENT 'Id Cliente',
    servicioId INT COMMENT 'Id Servicio',
    producCod VARCHAR (30) COMMENT 'Id Producto',
    producCant INT(10) COMMENT 'Cantidad',
    agenFecha DATE NOT NULL COMMENT 'Fecha',
    agenHora TIME NOT NULL COMMENT 'Hora',
    agenObser TEXT COMMENT 'Observacion',
    estado ENUM('A', 'I') COMMENT 'Estado',
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    -- Llave foránea que hace referencia a la tabla "clientes"
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    -- Llave foránea que hace referencia a la tabla "servicios"
    FOREIGN KEY (id_servicio) REFERENCES servicios (id_servicio),
    -- Llave foránea que hace referencia a la tabla "productos"
    FOREIGN KEY (producCod) REFERENCES productos (producCod)
);

INSERT INTO clientes (clienId, clieNom, clieApe, cliDire, clietel, cliEmai, climuni, clidepa, clipais, estado) VALUES
('1234567890', 'Juan', 'Gomez', 'Calle 123', '3123456789', 'juan.gomez@gmail.com', 'Medellin', 'Antioquia', 'Colombia', 'A'),
('9876543210', 'Maria', 'Lopez', 'Carrera 456', '3209876543', 'maria.lopez@hotmail.com', 'Bogota', 'Cundinamarca', 'Colombia', 'A'),
('5678901234', 'Pedro', 'Rodriguez', 'Avenida 789', '3012345678', 'pedro.rodriguez@yahoo.co', 'Cali', 'Valle del Cauca', 'Colombia', 'A'),
('8765432109', 'Ana', 'Ramirez', 'Plaza Mayor', '3187654321', 'ana.ramirez@gmail.com', 'Barranquilla', 'Atlantico', 'Colombia', 'A'),
('3456789012', 'Luis', 'Martinez', 'Calle 10', '3145678901', 'luis.martinez@hotmail.com', 'Cartagena', 'Bolivar', 'Colombia', 'A'),
('2345678901', 'Laura', 'Perez', 'Avenida 5', '3174567890', 'laura.perez@yahoo.co', 'Manizales', 'Caldas', 'Colombia', 'A'),
('7890124456', 'Carlos', 'Garcia', 'Carrera 20', '3156789012', 'carlos.garcia@gmail.com', 'Pereira', 'Risaralda', 'Colombia', 'A'),
('4567810123', 'Sofia', 'Hernandez', 'Calle 8', '3134567890', 'sofia.hernandez@hotmail.com', 'Bucaramanga', 'Santander', 'Colombia', 'A'),
('9012325678', 'Andres', 'Diaz', 'Avenida 15', '3190123456', 'andres.diaz@gmail.com', 'Villavicencio', 'Meta', 'Colombia', 'A'),
('5678931234', 'Camila', 'Jimenez', 'Carrera 30', '3105678901', 'camila.jimenez@yahoo.co', 'Cucuta', 'Norte de Santander', 'Colombia', 'A'),
('3456289012', 'Daniel', 'Silva', 'Plaza Bolivar', '3113456789', 'daniel.silva@gmail.com', 'Ibague', 'Tolima', 'Colombia', 'A'),
('2345578901', 'Valentina', 'Gutierrez', 'Calle 25', '3167890123', 'valentina.gutierrez@hotmail.com', 'Armenia', 'Quindio', 'Colombia', 'A'),
('7890123456', 'Diego', 'Ortiz', 'Carrera 18', '3137890123', 'diego.ortiz@gmail.com', 'Santa Marta', 'Magdalena', 'Colombia', 'A'),
('4567890123', 'Isabella', 'Ruiz', 'Avenida 12', '3190123456', 'isabella.ruiz@yahoo.co', 'Popayan', 'Cauca', 'Colombia', 'A'),
('9012345678', 'Martin', 'Lopez', 'Calle 7', '3101234567', 'martin.lopez@gmail.com', 'Tunja', 'Boyaca', 'Colombia', 'A');

INSERT INTO productos (producCod, producNom, producpre, stock, estado) VALUES
('COD001', 'Crema facial humectante', 50000, 100, 'A'),
('COD002', 'Suero facial antioxidante', 35000, 80, 'A'),
('COD003', 'Mascarilla facial revitalizante', 30000, 70, 'A'),
('COD004', 'Aceite facial nutritivo', 25000, 50, 'A'),
('COD005', 'Exfoliante facial suave', 45000, 30, 'A'),
('COD006', 'Crema reductora de abdomen', 20000, 50, 'A'),
('COD007', 'Gel reafirmante para brazos', 15000, 68, 'A'),
('COD008', 'Crema anticelulítica', 18000, 100, 'A'),
('COD009', 'Crema reafirmante de piernas', 70000, 90, 'A'),
('COD010', 'Gel reductor de cintura', 10000, 80, 'A'),
('COD011', 'Té verde antioxidante', 25000, 60, 'A'),
('COD012', 'Té de manzanilla relajante', 32000, 40, 'A'),
('COD013', 'Té de jengibre y limón', 18000, 50, 'A'),
('COD014', 'Té de hierbas para dormir', 40000, 20, 'A'),
('COD015', 'Crema para masajes relajantes', 8000, 30, 'A');

INSERT INTO servicios (servicioId, serviNom, serviDesc, serviPrec, estado)
VALUES
(1, 'Masaje relajante', 'Masaje que ayuda a reducir el estrés y relajar el cuerpo y la mente.', 60000.00, 'A'),
(2, 'Facial rejuvenecedor', 'Tratamiento facial para rejuvenecer y revitalizar la piel.', 80000.00, 'A'),
(3, 'Reducción de grasa', 'Tratamiento para ayudar a reducir la grasa localizada en el cuerpo.', 120000.00, 'A'),
(4, 'Terapia ortopédica', 'Terapia enfocada en aliviar dolores y mejorar la funcionalidad del sistema musculoesquelético.', 90000.00, 'A'),
(5, 'Sauna', 'Baño de calor seco que ayuda a relajar y desintoxicar el cuerpo.', 40000.00, 'A'),
(6, 'Jacuzzi', 'Baño de hidromasaje para relajar y aliviar tensiones musculares.', 50000.00, 'A'),
(7, 'Dermatología estética', 'Servicios dermatológicos para mejorar la apariencia de la piel.', 95000.00, 'A'),
(8, 'Exfoliación corporal', 'Tratamiento para eliminar células muertas y renovar la piel del cuerpo.', 70000.00, 'A'),
(9, 'Tratamiento capilar', 'Terapia para mejorar la salud y apariencia del cabello.', 75000.00, 'A'),
(10, 'Pedicure spa', 'Tratamiento completo para embellecer y cuidar los pies.', 55000.00, 'A'),
(11, 'Masaje descontracturante', 'Masaje profundo para aliviar tensiones y contracturas musculares.', 65000.00, 'A'),
(12, 'Tratamiento de acné', 'Terapia para tratar y prevenir el acné en la piel.', 85000.00, 'A'),
(13, 'Baño de vapor', 'Terapia de vapor para relajar y limpiar la piel.', 35000.00, 'A'),
(14, 'Reflexología', 'Masaje de pies que estimula puntos reflejos en el cuerpo para mejorar la salud.', 60000.00, 'A'),
(15, 'Limpieza facial profunda', 'Tratamiento para limpiar y purificar la piel del rostro.', 70000.00, 'A');


INSERT INTO agendas (agendaId, clienId, servicioId, producCod, producCant, agenFecha, agenHora, agenObser, estado)
VALUES
(1, '1234567890', 1, NULL, NULL, '2023-06-05', '10:00:00', 'Consulta facial', 'A'),
(2, '9876543210', 2, NULL, NULL, '2023-06-06', '15:30:00', 'Masaje relajante', 'A'),
(3, '5678901234', 12, 'COD001', 1, '2023-06-07', '11:00:00', 'Cuidado facial', 'A'),
(4, '8765432109', 3, NULL, NULL, '2023-06-08', '14:00:00', 'Tratamiento adelgazante', 'A'),
(5, '3456789012', 3, 'COD010', 1, '2023-06-09', '09:30:00', 'Cremas adelgazantes', 'A'),
(6, '2345678901', 4, NULL, NULL, '2023-06-10', '16:45:00', 'Masaje reductor', 'A'),
(7, '7890124456', 6, 'COD013', 2, '2023-06-11', '13:15:00', 'Venta de té', 'A'),
(8, '4567810123', 7, NULL, NULL, '2023-06-12', '12:30:00', 'Consulta facial', 'A'),
(9, '9012325678', 1, 'COD004', 1, '2023-06-13', '17:00:00', 'Masaje relajante', 'A'),
(10, '5678931234', 15, NULL, NULL, '2023-06-14', '10:45:00', 'Tratamiento facial', 'A'),
(11, '3456289012', 3, 'COD002', 1, '2023-06-15', '14:30:00', 'Crema reafirmante', 'A'),
(12, '2345578901', 3, NULL, NULL, '2023-06-16', '11:30:00', 'Tratamiento adelgazante', 'A'),
(13, '7890123456', 11, 'COD007', 3, '2023-06-17', '09:00:00', 'Venta de té', 'A'),
(14, '4567890123', 3, NULL, NULL, '2023-06-18', '16:00:00', 'Masaje reductor', 'A'),
(15, '9012345678', 7, 'COD015', 1, '2023-06-19', '15:00:00', 'Cuidado facial', 'A');