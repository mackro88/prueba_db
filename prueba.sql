-- Crear base de datos prueba
CREATE DATABASE prueba;
-- Ingresar a la base de datos prueba
\c prueba;
-- Crear tablas
CREATE TABLE categoria(
    id SERIAL,
    nombre_cat VARCHAR(30) NOT NULL,
    descripcion TEXT,
    PRIMARY KEY(id)
);
CREATE TABLE producto(
    id SERIAL,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT,
    valor_unitario INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id) 
);
CREATE TABLE cliente(
    id SERIAL,
    nombre VARCHAR(30) NOT NULL,
    rut VARCHAR(10) NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE factura(
    id SERIAL,
    numero_factura INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id) 
);
CREATE TABLE producto_factura(
    id_producto INT NOT NULL,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY(id_producto) REFERENCES producto(id), 
    FOREIGN KEY(id_factura) REFERENCES factura(id) 
);
-- Ingresa registros
INSERT INTO cliente (nombre, rut, direccion) 
	VALUES ('Claudia', '17118258-1', 'Mujica 55'),
    ('María', '18170684-8', 'Salvador 15'),
	('Fresia', '17345987-0', 'Errázuriz 2456'),
    ('Soledad', '21332543-8', 'Alameda 000'),
    ('Carla', '19324543-2', 'Playa Ancha 33');
INSERT INTO categoria (nombre_cat, descripcion) 
	VALUES ('videojuegos', 'Lo último en videojuegos.'),
    ('musica', 'Tecnología musical de vanguardia.'),
	('deporte', 'Aumenta tu rendimiento físico.');
INSERT INTO producto (nombre, descripcion, valor_unitario, id_categoria) 
	VALUES ('God of War', 'God of War 4 PS4', 20990, 1),
    ('Joystick', 'PS Remote', 40990, 1),
	('Guitarra', 'Acústica', 25000, 2),
    ('Flauta', 'Dulce', 7000, 2),
    ('Uñeta', 'Extra duración', 3000, 2),
    ('Pelota', 'Fútbol', 24900, 3),
    ('Caminadora', 'Plegable', 125000, 3),
    ('Guantes', 'Boxeo, Kickboxing', 12000, 3);
INSERT INTO factura (numero_factura, fecha_creacion, id_cliente) 
	VALUES (1, '2020/09/15', 1),
    (2, '2020/09/16', 1),
	(1, '2020/09/17', 2),
    (2, '2020/09/18', 2),
    (3, '2020/09/17', 2),
    (1, '2020/09/18', 3),
    (1, '2020/09/19', 4),
    (2, '2020/09/20', 4),
    (3, '2020/09/21', 4),
    (4, '2020/09/22', 4);
INSERT INTO producto_factura (id_producto, id_factura, cantidad) 
	VALUES (1, 1, 2),
    (2, 2, 3),
	(3, 3, 3),
    (4, 4, 2),
    (5, 5, 3),
    (6, 6, 1),
    (7, 7, 2),
    (8, 8, 3),
    (1, 9, 4),
    (6, 10, 1);
-- Consulta ¿Cuántos clientes han comprado el producto 6? 
SELECT count(*) AS producto_6 FROM producto_factura WHERE id_producto=6;


