CREATE DATABASE IF NOT EXISTS Coffe_CataDelVergel;

USE Coffe_CataDelVergel;

CREATE TABLE IF NOT EXISTS Propietario(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Cedula INT UNIQUE,
    Telefono INT UNIQUE
);

CREATE TABLE IF NOT EXISTS Destinatario(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Tipo_Negocio VARCHAR(100),
    Propietario_ID INT,
    FOREIGN KEY (Propietario_ID) REFERENCES Propietarios(ID)
);

CREATE TABLE IF NOT EXISTS Residual(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS TipoProducto(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
); 

CREATE TABLE IF NOT EXISTS TipoGrano(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Sabor(
    ID INT PRIMARY KEY,
    Descripcion VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Medida(
    ID INT PRIMARY KEY,
    Cantidad INT NOT NULL,
    Medida VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Aroma(
    ID INT PRIMARY KEY,
    Descripcion VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Cuerpo(
    ID INT PRIMARY KEY,
    Descripcion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Acidez(
    ID INT PRIMARY KEY,
    Medida VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS paisExportador(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS PaisDestinado(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Provedor(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Productos(
    ID INT PRIMARY KEY,
    Nombre VARCHAR(55) UNIQUE,
    Provedor_ID INT,
    Medida_ID INT,
    TipoProducto_ID INT,
    TipoGrano_ID INT,
    Aroma_ID INT,
    Sabor_ID INT,
    Cuerpo_ID INT,
    Acidez_ID INT, 
    Residual_ID INT,
    PaisExportador_ID INT,
    PaisDestinado_ID INT,
    Destinatario_ID INT,
    FOREIGN KEY (Provedor_ID) REFERENCES Provedor(ID),
    FOREIGN KEY (Medida_ID) REFERENCES Medida(ID),
    FOREIGN KEY (TipoProducto_ID) REFERENCES TipoProducto(ID),
    FOREIGN KEY (TipoGrano_ID) REFERENCES TipoGrano(ID),
    FOREIGN KEY (Aroma_ID) REFERENCES Aroma(ID),
    FOREIGN KEY (Sabor_ID) REFERENCES Sabor(ID),
    FOREIGN KEY (Cuerpo_ID) REFERENCES Cuerpo(ID),
    FOREIGN KEY (Acidez_ID) REFERENCES Acidez(ID),
    FOREIGN KEY (Residual_ID) REFERENCES Residual(ID),
    FOREIGN KEY (PaisExportador_ID) REFERENCES PaisExportador(ID),
    FOREIGN KEY (PaisDestinado) REFERENCES PaisDestinado(ID),
    FOREIGN KEY (Destinatario_ID) REFERENCES Destinatario(ID),
);

CREATE TABLE IF NOT EXISTS Provedor_Producto(
    Provedor_ID INT,
    Productos_ID INT,
    FOREIGN KEY (Provedor_ID) REFERENCES Provedor(ID),
    FOREIGN KEY (Productos_ID) REFERENCES Productos(ID)
);

CREATE TABLE IF NOT EXISTS PaisExportador_Productos(
    PaisExportador_ID INT,
    Productos_ID INT,
    FOREIGN KEY (PaisExportador_ID) REFERENCES PaisExportador(ID),
    FOREIGN KEY (Productos_ID) REFERENCES Productos(ID)
);

CREATE TABLE IF NOT EXISTS PaisDestinado_Productos(
    PaisDestinado_ID INT,
    Productos_ID INT,
    FOREIGN KEY (PaisDestinado_ID) REFERENCES PaisDestinado(ID),
    FOREIGN KEY (Productos_ID) REFERENCES Productos(ID)
);
