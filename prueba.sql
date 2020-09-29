-- Crear base de datos prueba
CREATE DATABASE prueba;
-- Ingresar a la base de datos prueba
\c prueba;
-- Crear tablas
CREATE TABLE categoria(
    id SERIAL PRIMARY KEY,
    nombre_cat VARCHAR(30) NOT NULL,
    descripcion TEXT
);
CREATE TABLE producto(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT,
    valor_unitario INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY(id_categoria) REFERENCES categoria(id) 
);
CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    rut VARCHAR(10) NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL
);
CREATE TABLE factura(
    id SERIAL PRIMARY KEY,
    numero_factura INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    subtotal INT NOT NULL,
    iva INT NOT NULL,
    valor_total INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES cliente(id) 
);
CREATE TABLE producto_factura(
    cantidad INT NOT NULL,
    total_productos INT NOT NULL,
    id_producto INT NOT NULL,
    id_factura INT NOT NULL,
    FOREIGN KEY(id_producto) REFERENCES producto(id), 
    FOREIGN KEY(id_factura) REFERENCES factura(id) 
);
-- Ingresa registros
INSERT INTO categoria (nombre_cat, descripcion) VALUES 
    ('videojuegos', 'Lo último en videojuegos.'),
    ('musica', 'Tecnología musical de vanguardia.'),
	('deporte', 'Aumenta tu rendimiento físico.');
INSERT INTO producto (nombre, descripcion, valor_unitario, id_categoria) VALUES 
    ('God of War', 'God of War 4 PS4', 20990, 1),
    ('Joystick', 'PS Remote', 40990, 1),
	('Guitarra', 'Acústica', 25000, 2),
    ('Flauta', 'Dulce', 7000, 2),
    ('Uñeta', 'Extra duración', 3000, 2),
    ('Pelota', 'Fútbol', 24900, 3),
    ('Caminadora', 'Plegable', 125000, 3),
    ('Guantes', 'Boxeo, Kickboxing', 12000, 3);
INSERT INTO cliente (nombre, rut, direccion) VALUES 
    ('Claudia', '17118258-1', 'Mujica 55'),
    ('María', '18170684-8', 'Salvador 15'),
	('Fresia', '17345987-0', 'Errázuriz 2456'),
    ('Soledad', '21332543-8', 'Alameda 000'),
    ('Carla', '19324543-2', 'Playa Ancha 33');
INSERT INTO factura (numero_factura, fecha_creacion, subtotal, iva, valor_total, id_cliente) VALUES 
    (1, '2020/09/15', 41980, 7976, 49956, 1),
    (2, '2020/09/16', 122970, 23346, 146334, 1),
	(1, '2020/09/17', 75000, 14250, 89250, 2),
    (2, '2020/09/18', 14000, 2660, 16660, 2),
    (3, '2020/09/17', 15000, 2850, 17850, 2),
    (1, '2020/09/18', 24900, 4731, 29631, 3),
    (1, '2020/09/19', 250000, 47500, 297500, 4),
    (2, '2020/09/20', 36000, 6840, 42840, 4),
    (3, '2020/09/21', 83960, 15952, 99912, 4),
    (4, '2020/09/22', 24900, 4731, 29631, 4);
INSERT INTO producto_factura (cantidad, total_productos, id_producto, id_factura) VALUES 
    (2, 41980, 1, 1),
    (3, 122970, 2, 2),
	(3, 75000, 3, 3),
    (2, 14000, 4, 4),
    (3, 15000, 5, 5),
    (1, 24900, 6, 6),
    (2, 250000, 7, 7),
    (3, 36000, 8, 8),
    (4, 83960, 1, 9),
    (1, 24900, 6, 10);
-- Consulta ¿Qué cliente realizó la compra más cara?
SELECT nombre, rut FROM cliente INNER JOIN factura ON cliente.id = factura.id_cliente WHERE valor_total = (SELECT MAX(valor_total) FROM factura);
-- Consulta ¿Cuántos clientes han comprado el producto 6? 
SELECT count(*) AS producto_6 FROM producto_factura WHERE id_producto=6;


