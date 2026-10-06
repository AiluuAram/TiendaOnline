CREATE DATABASE TiendaOnline;
GO
USE TiendaOnline;
GO

CREATE TABLE categorias (
    idCategoria INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    idProducto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria INT NOT NULL,
    CONSTRAINT FK_productos_categorias
        FOREIGN KEY (categoria) REFERENCES categorias(idCategoria)
);

INSERT INTO categorias (descripcion) VALUES
('Remeras'), ('Buzos'), ('Gorras');

INSERT INTO productos (nombre, precio, categoria) VALUES
('Remera Oversize Negra', 15000, 1),
('Remera Boxy Blanca', 14000, 1),
('Buzo Hoodie Gris', 35000, 2),
('Buzo Crew Neck Verde', 32000, 2),
('Gorra Trucker Negra', 12000, 3);