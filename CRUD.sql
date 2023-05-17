-- Diego Fernando Cortes Rojas
-- ADSO 2502630

---------- Primeros pasos
-- Ver las bases de datos
SHOW DATABASES;
-- Ver las tablas
SHOW TABLES;
-- Creando tabla
CREATE TABLE aprendices(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario varchar(50) UNIQUE NOT NULL,
    correo varchar(50) UNIQUE NOT NULL,
    edad INT UNSIGNED NOT NULL,
    estado ENUM('ACTIVO','INACTIVO') DEFAULT 'INACTIVO',
    intereses TEXT,
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertando datos a la tabla
INSERT INTO aprendices( nombre_usuario, correo, edad, estado, intereses)
VALUES( 'Diego', 'diego.cortes14@misena.edu.co', 25, 'ACTIVO', 'Tenis de mesa'),( 'Juan', 'juan@misena.edu.co', 19, 'ACTIVO', 'video juego'),( 'Andres', 'andres@misena.edu.co', 31, 'ACTIVO', 'paint ball'),( 'Monica', 'monica@misena.edu.co', 17, 'ACTIVO', 'leer'),( 'Liz', 'liz@misena.edu.co', 20, 'ACTIVO',
'corre');

-- Hacer consultas
SELECT * FROM aprendices;
--Eliminando tabla
DROP TABLE aprendices;

--Eliminando Base de Datos
DROP DATABASE clasesql;
