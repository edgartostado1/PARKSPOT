CREATE DATABASE Estacionamiento;
GO


USE Estacionamiento;
GO
/*
Proyecto: Gestor de Estacionamiento
Versión: 1.0
Fecha: 19/09/2025
Autor: Edgar Tostado
Descripción: Script inicial de la base de datos, incluye tablas Cliente, Vehiculo, Espacio y Ticket.
Cambios: - Creación de tablas
         - Inserción de datos de ejemplo
*/
-- Tabla de clientes
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);

-- Tabla de vehículos
CREATE TABLE Vehiculo (
    IdVehiculo INT PRIMARY KEY IDENTITY(1,1),
    Placa NVARCHAR(10) NOT NULL UNIQUE,
    Modelo NVARCHAR(50),
    Color NVARCHAR(30),
    IdCliente INT,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

-- Tabla de espacios
CREATE TABLE Espacio (
    IdEspacio INT PRIMARY KEY IDENTITY(1,1),
    NumeroEspacio INT NOT NULL UNIQUE,
    Estado NVARCHAR(20) NOT NULL DEFAULT 'Libre' -- Libre / Ocupado
);

-- Tabla de tickets
CREATE TABLE Ticket (
    IdTicket INT PRIMARY KEY IDENTITY(1,1),
    IdVehiculo INT NOT NULL,
    IdEspacio INT NOT NULL,
    HoraEntrada DATETIME NOT NULL DEFAULT GETDATE(),
    HoraSalida DATETIME,
    Costo DECIMAL(10,2),
    FOREIGN KEY (IdVehiculo) REFERENCES Vehiculo(IdVehiculo),
    FOREIGN KEY (IdEspacio) REFERENCES Espacio(IdEspacio)
);
-- Insertar cliente
INSERT INTO Cliente (Nombre, Telefono, Email)
VALUES ('Juan Pérez', '5551234567', 'juanperez@mail.com');

-- Insertar vehículo
INSERT INTO Vehiculo (Placa, Modelo, Color, IdCliente)
VALUES ('ABC123', 'Nissan Versa', 'Rojo', 1);

-- Insertar espacio
INSERT INTO Espacio (NumeroEspacio, Estado)
VALUES (1, 'Libre');

-- Crear ticket
INSERT INTO Ticket (IdVehiculo, IdEspacio)
VALUES (1, 1);

SELECT * FROM sys.tables;

