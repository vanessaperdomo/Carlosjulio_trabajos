CREATE DATABASE Veterinaria;
USE Veterinaria;

CREATE TABLE CLIENTE (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    correo VARCHAR(100)
);

CREATE TABLE MASCOTA (
    idMascota INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raza VARCHAR(50),
    edad TINYINT,
    peso DECIMAL(5,2),
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente)
);

CREATE TABLE VETERINARIO (
    idVeterinario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE CITA (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    idMascota INT NOT NULL,
    idVeterinario INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME,
    motivo VARCHAR(200),
    FOREIGN KEY (idMascota) REFERENCES MASCOTA(idMascota),
    FOREIGN KEY (idVeterinario) REFERENCES VETERINARIO(idVeterinario)
);

CREATE TABLE FACTURA (
    idFactura INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente)
);

CREATE TABLE PRODUCTO (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE SERVICIO (
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE DETALLEFACTURA (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idFactura INT NOT NULL,
    idProducto INT DEFAULT NULL,
    idServicio INT DEFAULT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idFactura) REFERENCES FACTURA(idFactura),
    FOREIGN KEY (idProducto) REFERENCES PRODUCTO(idProducto),
    FOREIGN KEY (idServicio) REFERENCES SERVICIO(idServicio)
);

CREATE TABLE HISTORIALMEDICO (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idMascota INT NOT NULL,
    fecha DATE NOT NULL,
    diagnostico VARCHAR(255),
    observaciones TEXT,
    FOREIGN KEY (idMascota) REFERENCES MASCOTA(idMascota)
);

CREATE TABLE TRATAMIENTO (
    idTratamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    dosis VARCHAR(50)
);

CREATE TABLE HISTORIALTRATAMIENTO (
    idHistorial INT NOT NULL,
    idTratamiento INT NOT NULL,
    PRIMARY KEY (idHistorial, idTratamiento),
    FOREIGN KEY (idHistorial) REFERENCES HISTORIALMEDICO(idHistorial),
    FOREIGN KEY (idTratamiento) REFERENCES TRATAMIENTO(idTratamiento)
);
