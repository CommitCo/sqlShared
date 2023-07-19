-- Creando la base de datos
CREATE DATABASE sena;

-- Hacemos focus unicamente a la base de datos seleccionada.
USE sena;

-- Creamos tabla aprendices
CREATE TABLE aprendices(
id INT (20) UNIQUE PRIMARY KEY,
nombre_apellido VARCHAR (50) UNIQUE NOT NULL,
correo VARCHAR(50) UNIQUE NOT NULL,
edad INT UNSIGNED NOT NULL,
direccion VARCHAR(20) NOT NULL,
ciudad VARCHAR(20) NOT NULL,
estado ENUM('Activo', 'Inactivo') DEFAULT 'Inactivo',
creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertamos registros a la tabla creada.
INSERT INTO aprendices (id, nombre_apellido, correo, edad, direccion, ciudad, estado)
VALUES
( 1075678987, 'Juan Pérez', 'juan@example.com', 25, 'Calle 123', 'Bogotá', 'Activo'),
( 1075324987, 'María Gómez', 'maria@example.com', 28, 'Avenida 456', 'Medellín', 'Activo'),
( 1075122987, 'Carlos Rodríguez', 'carlos@example.se', 30, 'Carrera 789', 'Cali', 'Inactivo'),
( 1077234387, 'Laura López', 'laura@example.com', 22, 'Calle 321', 'Barranquilla', 'Activo'),
( 1012355287, 'Andrés Torres', 'andres@example.com', 27, 'Avenida 654', 'Cartagena', 'Inactivo'),
( 1051342987, 'Sofía Ramírez', 'sofia@example.pa', 24, 'Carrera 987', 'Cúcuta', 'Activo'),
( 1075523423, 'Diego Vargas', 'diego@example.com', 26, 'Calle 789', 'Bucaramanga', 'Activo'),
( 1075652312, 'Valentina Castro', 'valentina@example.eu', 23, 'Avenida 456', 'Santa Marta', 'Inactivo'),
( 1075623421, 'Eliana Lozano', 'eylozano@sena.edu.co', 29, 'Carrera 123', 'Garzon', 'Activo'),
( 1076967842, 'Camila Sánchez', 'camila@example.com', 31, 'Calle 654', 'Pereira', 'Inactivo'),
( 1077435123, 'Manuel González', 'manuel@example.log', 27, 'Avenida 789', 'Pasto', 'Activo'),
( 1077345123, 'Isabella Navarro', 'isabella@example.com', 26, 'Carrera 321', 'Manizales', 'Activo'),
( 1076324123, 'Daniel Jiménez', 'daniel@example.com', 24, 'Calle 987', 'Armenia', 'Inactivo'),
( 1076431232, 'Valeria Ríos', 'valeria@example.com', 25, 'Avenida 654', 'Sincelejo', 'Activo'),
( 5678345, 'Gabriel Mesa', 'gabriel@example.com', 23, 'Carrera 123', 'Ibagué', 'Inactivo');

-- Se observa la tabla aprendices llamando unicamente la columba id
SELECT id FROM aprendices;

-- Obtenemos unicamente las columnas nombre_apellido y edad en la tabla aprendices.
SELECT nombre_apellido, edad FROM aprendices;

-- Se trae los datos nombre_apellido, edad y estado para la tabla aprendices.
SELECT nombre_apellido, edad, estado FROM aprendices;

-- Se hace la consulta de la tabla aprendices pero unicamente para la columna id, mostrandola diferente
SELECT id FROM aprendices\G;

-- Consulta que trae la data pintada diferente para las columnas nombre_apellido, edad y estado.
SELECT nombre_apellido, edad, estado FROM aprendices\G;

-- Buscamos todos los datos en la tabla aprendice mostrandolo mas especifico.
SELECT * FROM aprendices\G;

-- Hacemos la consulta de la tabla aprendices donde solo se trae los datos donde el id sea 1075678987
SELECT * FROM aprendices WHERE id = 1075678987;

-- Consulta para traer todos los registros que tengan este correo eylozano@sena.edu.co en la tabla aprendices
SELECT * FROM aprendices WHERE correo = 'eylozano@sena.edu.co';

-- Trae unicamente los registros que tengan mas de 24 años
SELECT * FROM aprendices WHERE edad >= 24;

-- Buscamos los registros que solo se hayan creado en esta fecha 2023-06-05 00:00:01
SELECT * FROM aprendices WHERE creado > '2023-06-05 00:00:01';

-- Consulta donde retorna los id en un rango
SELECT * FROM aprendices WHERE id IN (1075678987, 5678345);

-- Ordenamiento de la columna edad de menor a mayor.
SELECT * FROM aprendices ORDER BY edad;

-- Ordenamiento de la columna edad de mayor a menor.
SELECT * FROM aprendices ORDER BY edad DESC;

-- Buscamos las columnas nombre_apellido y ordenamos de mayor a menor, retornando un solo registro
SELECT nombre_apellido, correo FROM aprendices ORDER BY edad DESC LIMIT 1;

-- buscando correos que solo tenga de dominio el .com
SELECT * FROM aprendices WHERE correo LIKE '%.com';



