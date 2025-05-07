-- Elimina la base de datos si ya existe
DROP DATABASE IF EXISTS libreria;

-- Crea la base de datos
CREATE DATABASE libreria;
USE libreria;

-- Tabla de los clientes (singular)
CREATE TABLE Cliente(
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
); 

-- Tabla de los autores
CREATE TABLE Autores(
    AutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE NOT NULL
);

-- Tabla de libros
CREATE TABLE Libros(
    LibroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    FechaPublicacion DATE,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Tabla de ventas
CREATE TABLE Ventas(
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    LibroID INT,
    Cantidad INT NOT NULL,
    FechaVenta DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
); 

-- Inserciones de datos
INSERT INTO Cliente (Nombre, Apellido, FechaNacimiento, Email, Direccion, Telefono)
VALUES 
    ('Juan', 'Pérez', '1990-05-15', 'juan.perez@email.com', 'Carapungo', '0123456789'),
    ('María', 'Gómez', '1985-08-22', 'maria.gomez@email.com', 'Calderon', '0987654321'),
    ('Carlos', 'López', '1978-11-30', 'carlos.lopez@email.com', 'Llano Grande', '0543216789'),
    ('Jose', 'Ramos', '1980-12-30', 'jose.ramos@email.com', 'Llano Grande', '0565421689'),
    ('Dennes', 'Molina', '1999-07-06', 'dennes.molina@email.com', 'Recreo', '0986546789');
    
INSERT INTO Autores (Nombre, Apellido, Nacionalidad, FechaNacimiento)
VALUES 
    ('Gabriel', 'García Márquez', 'Colombiano', '1927-03-06'),
    ('Jorge', 'Luis Borges', 'Argentino', '1899-08-24'),
    ('Pablo', 'Neruda', 'Chileno', '1904-07-12'),
    ('Edgar Alan', 'Poe', 'EEUU', '1914-08-10'),
    ('Alfedro', 'Veintimilla', 'Colombiano', '1909-03-01');
    
INSERT INTO Libros (Titulo, Precio, FechaPublicacion, AutorID)
VALUES 
    ('Cien años de soledad', 25.99, '1967-05-30', 1),
    ('El Aleph', 19.50, '1949-06-01', 2),
    ('Veinte poemas de amor y una canción desesperada', 15.75, '1924-08-14', 3),
    ('Narraciones Extraordinarias', 29.50, '1950-03-10', 4),
    ('La Baldomera', 20.50, '1999-07-17', 5);
    
INSERT INTO Ventas (ClienteID, LibroID, Cantidad, FechaVenta)
VALUES 
    (1, 1, 2, '2023-10-01'),
    (2, 2, 1, '2023-10-02'),
    (3, 3, 3, '2023-10-03'),
    (4, 4, 4, '2023-10-03'),
    (5, 5, 5, '2023-10-03');
    
-- Consultas para verificar (CORREGIDO: Cliente en singular)
SELECT * FROM Cliente;
SELECT * FROM Autores;
SELECT * FROM Libros;
SELECT * FROM Ventas;