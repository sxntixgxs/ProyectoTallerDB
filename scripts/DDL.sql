-- PROYECTO MYSQL DB TALLER AUTOMOTRIZ
-- SCRIPT DDL
-- Dev by Santiago Sandoval Torres
DROP SCHEMA proyectoTaller;
CREATE SCHEMA proyectoTaller;
USE proyectoTaller;
CREATE TABLE Cliente(
    clienteID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido1 VARCHAR(45) NOT NULL,
    apellido2 VARCHAR(45),
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL 
);
CREATE TABLE Servicio(
    servicioID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT NOT NULL,
    costo INT NOT NULL
);
CREATE TABLE tipoVehiculo(
    tipoVehiculoID INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL
);
CREATE TABLE Vehiculo(
    vehiculoID INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(6) NOT NULL,
    anio VARCHAR(4) NOT NULL,
    clienteID INT NOT NULL,
    tipoVehiculoID INT NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID),
    FOREIGN KEY (tipoVehiculoID) REFERENCES tipoVehiculo(tipoVehiculoID)
);
CREATE TABLE Cita(
    citaID INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    clienteID INT NOT NULL,
    servicioID INT NOT NULL,
    vehiculoID INT NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID),
    FOREIGN KEY (servicioID) REFERENCES Servicio(servicioID),
    FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID)
);

CREATE TABLE cargo(
    cargoID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45)
);
CREATE TABLE empleado(
    empleadoID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido1 VARCHAR(45) NOT NULL,
    apellido2 VARCHAR(45),
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    cargoID INT NOT NULL,
    FOREIGN KEY (cargoID) REFERENCES cargo(cargoID)
);
CREATE TABLE reparaciones(
    reparacionID INT PRIMARY KEY AUTO_INCREMENT,
    costoTotal INT NOT NULL,
    fecha DATE NOT NULL,
    vehiculoID INT NOT NULL,
    empleadoID INT NOT NULL,
    servicioID INT NOT NULL,
    FOREIGN KEY (vehiculoID) REFERENCES Vehiculo(vehiculoID),
    FOREIGN KEY (empleadoID) REFERENCES empleado(empleadoID),
    FOREIGN KEY (servicioID) REFERENCES Servicio(servicioID)
);
CREATE TABLE factura(
    facturaID INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    total INT NOT NULL,
    clienteID INT NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID)
);
CREATE TABLE factura_detalles(
    facturaID INT NOT NULL,
    reparacionID INT NOT NULL,
    cantidad INT NOT NULL,
    precio INT NOT NULL,
    PRIMARY KEY (facturaID,reparacionID),
    FOREIGN KEY (facturaID) REFERENCES factura(facturaID),
    FOREIGN KEY (reparacionID) REFERENCES reparaciones(reparacionID)
);
CREATE TABLE contacto_proveedor(
    contactoID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido1 VARCHAR(45) NOT NULL,
    apellido2 VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL
);
CREATE TABLE proveedor(
    proveedorID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    contactoID INT NOT NULL,
    FOREIGN KEY (contactoID) REFERENCES contacto_proveedor(contactoID)
);
CREATE TABLE ordenes_compra(
    ordenID INT PRIMARY KEY AUTO_INCREMENT,
    empleadoID INT NOT NULL,
    proveedorID INT NOT NULL,
    total INT NOT NULL,
    FOREIGN KEY(empleadoID) REFERENCES empleado(empleadoID),
    FOREIGN KEY (proveedorID) REFERENCES proveedor(proveedorID)
);
CREATE TABLE pieza(
    piezaID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion TINYTEXT,
    precio INT NOT NULL,
    proveedorID INT NOT NULL,
    FOREIGN KEY (proveedorID) REFERENCES proveedor(proveedorID)
);
CREATE TABLE orden_detalle(
    ordenID INT NOT NULL,
    piezaID INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnit INT NOT NULL,
    FOREIGN KEY (ordenID) REFERENCES ordenes_compra(ordenID),
    FOREIGN KEY (piezaID) REFERENCES pieza(piezaID)
);
CREATE TABLE ubicaciones_taller(
    ubicacionID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45)
);

CREATE TABLE inventario(
    inventarioID INT PRIMARY KEY AUTO_INCREMENT,
    ubicacionID INT NOT NULL,
    piezaID INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (ubicacionID) REFERENCES ubicaciones_taller(ubicacionID),
    FOREIGN KEY (piezaID) REFERENCES pieza(piezaID)
);
CREATE TABLE reparacion_pieza(
    reparacionID INT NOT NULL,
    piezaID INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (reparacionID,piezaID),
    FOREIGN KEY (reparacionID) REFERENCES reparaciones(reparacionID),
    FOREIGN KEY (piezaID) REFERENCES pieza(piezaID)
);
