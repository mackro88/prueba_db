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
    id INT NOT NULL UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT,
    valor_unitario INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id) 
);
CREATE TABLE factura(
    id SERIAL,
    numero_factura INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE producto_factura(
    id_producto INT NOT NULL,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY(id_producto) REFERENCES producto(id), 
    FOREIGN KEY(id_factura) REFERENCES factura(id) 
);
CREATE TABLE cliente(
    id SERIAL,
    nombre VARCHAR(30) NOT NULL,
    rut VARCHAR(10) NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL,
    id_factura INT,
    PRIMARY KEY (id),
    FOREIGN KEY(id_factura) REFERENCES factura(id) 
);