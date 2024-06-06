-- Inserciones de datos
INSERT INTO Cliente(clienteID,nombre,apellido1,apellido2,direccion,telefono,email) VALUES
(1,'Pablo','Azcarate','Ramirez','Calle 128 76 50','+57 3242442868','pablo@azcarate.com'),
(12,'Pablo','Sandoval','Ramirez','Calle 8 76 50','+57 3244442868','pablo@sandoval.com'),
(2,'Juan','Torres','Ramirez','Calle 12 6 50','+57 3211442868','juan@torres.com'),
(3,'Charlotte','Perez','Ramirez','Calle 128 1 50','+57 3242441168','charlotte@rperez.com'),
(4,'Mozart','La','Para','Carrera 128 76 50','+52 2242442868','mozart@lapara.com'),
(NULL,'Samuel','Ramirez','Azcarate','Calle 88 76 50','+57 3242662868','samuel@ramirez.com'),
(NULL,'Pablo','Sambueza','Ramirez','Calle 128 76 76','+57 3242442666','pablo@sambueza.com'),
(NULL,'Pablo','Perez','Ramirez','Calle 128 50 50','+57 3242445068','pablo@perez.com'),
(NULL,'Karol','Graham','Ramirez','Carrera 14 76 50','+57 321654978','graham@karol.com'),
(NULL,'Julieta','Ramirez','Libreros','Calle 111 76 50','+57 3242444448','julieta@ramirez.com');

INSERT INTO Servicio(nombre,descripcion,costo) VALUES
('Cambio de Aceite','proceso de retirar el aceite usado y el filtro de aceite y de colocar aceite nuevo (y un nuevo filtro) en el auto.',300000),
('Alineación y Balanceo', 'ajuste de las ruedas para que estén paralelas entre sí y balancear el peso de cada rueda.', 150000),
('Cambio de Filtro de Aire', 'reemplazo del filtro de aire sucio por uno nuevo para asegurar la correcta entrada de aire al motor.', 80000),
('Revisión de Frenos', 'inspección y ajuste de los frenos del vehículo, incluyendo discos, pastillas y líquido de frenos.', 120000),
('Cambio de Batería', 'reemplazo de la batería agotada del vehículo por una nueva y su correcta instalación.', 250000),
('Revisión del Sistema de Enfriamiento', 'inspección del radiador, termostato y nivel de refrigerante para prevenir el sobrecalentamiento del motor.', 180000),
('Cambio de Correa de Distribución', 'reemplazo de la correa de distribución para asegurar el correcto funcionamiento del motor.', 350000),
('Revisión de Suspensión', 'inspección y ajuste de los componentes de la suspensión para un manejo seguro y confortable.', 200000),
('Cambio de Bujías', 'reemplazo de las bujías desgastadas para mejorar el rendimiento del motor y el consumo de combustible.', 90000),
('Diagnóstico Electrónico', 'uso de herramientas especializadas para identificar problemas en el sistema electrónico del vehículo.', 100000),
('Limpieza de Inyectores', 'proceso de limpieza de los inyectores de combustible para asegurar una correcta pulverización y combustión.', 130000);
INSERT INTO tipoVehiculo(marca,modelo) VALUES
('Mazda','CX-30'),
('Toyota', 'Corolla'),
('Honda', 'Civic'),
('Ford', 'Mustang'),
('Chevrolet', 'Camaro'),
('Nissan', 'Altima'),
('Kia', 'Sorento'),
('Hyundai', 'Tucson'),
('Volkswagen', 'Golf'),
('Audi', 'A4'),
('Mercedes-Benz', 'C-Class');
INSERT INTO Vehiculo(placa,anio,clienteID,tipoVehiculoID)VALUES
('XVW986','2014',2,1),
('ABC123', '2018', 1, 2),
('DEF456', '2019', 12, 3),
('GHI789', '2020', 3, 4),
('JKL012', '2015', 4, 5),
('MNO345', '2016', 2, 6),
('PQR678', '2017', 3, 7),
('STU901', '2018', 4, 8),
('VWX234', '2019', 12, 9),
('YZA567', '2020', 1, 10),
('BCD890', '2014', 3, 2);
INSERT INTO Cita(fecha,clienteID,servicioID,vehiculoID) VALUES
('2022-01-04 11:00:00',2,1,1),
('2022-05-04 11:00:00', 2, 1, 1),
('2022-02-10 09:00:00', 1, 2, 2),
('2022-03-15 14:30:00', 12, 3, 3),
('2022-04-20 11:45:00', 3, 4, 4),
('2022-05-25 08:00:00', 4, 5, 5),
('2022-06-30 16:00:00', 2, 6, 6),
('2022-07-10 10:15:00', 3, 7, 7),
('2022-08-15 12:00:00', 4, 8, 8),
('2022-09-20 15:30:00', 12, 9, 9),
('2022-10-25 13:00:00', 1, 10, 10);
INSERT INTO cargo(nombre) VALUES
('Mecánico General'),
('Especialista en Frenos'),
('Técnico en Diagnóstico Electrónico'),
('Especialista en Transmisiones'),
('Gerente de Taller'),
('Asesor de Servicio');
INSERT INTO empleado(nombre,apellido1,apellido2,direccion,telefono,cargoID) VALUES
('Silvestre', 'Diaz', 'Maestre', 'Calle 14 28 28', '+57 31424569', 1),
('Carlos', 'Rodríguez', 'López', 'Calle 23 45 67', '+57 3123456789', 2),
('Andrés', 'Gómez', 'Martínez', 'Carrera 56 78 90', '+57 3156789123', 3),
('Juan', 'Pérez', 'Hernández', 'Calle 10 20 30', '+57 3167891234', 4),
('Luis', 'Sánchez', 'García', 'Carrera 15 25 35', '+57 3178912345', 5),
('Miguel', 'Ramírez', 'Torres', 'Calle 40 50 60', '+57 3189123456', 6),
('Felipe', 'Castro', 'Mejía', 'Carrera 17 27 37', '+57 3191234567', 1),
('Jorge', 'Vargas', 'Ruiz', 'Calle 35 45 55', '+57 3202345678', 2),
('Oscar', 'Jiménez', 'Ortiz', 'Carrera 50 60 70', '+57 3213456789', 3),
('Fernando', 'López', 'Ramírez', 'Calle 67 78 89', '+57 3224567890', 4);
INSERT INTO reparaciones(costoTotal,fecha,vehiculoID,empleadoID,servicioID)VALUES
(300000, '2022-04-01', 1, 1, 1),
(150000, '2022-05-01', 2, 2, 2),
(80000, '2022-06-01', 3, 3, 3),
(120000, '2022-07-01', 4, 4, 4),
(250000, '2022-08-01', 5, 5, 5),
(180000, '2022-09-01', 6, 6, 6),
(350000, '2022-10-01', 7, 7, 7),
(200000, '2022-11-01', 8, 8, 8),
(90000, '2022-12-01', 9, 9, 9),
(100000, '2023-01-01', 10, 10, 10),
(300000,'2022-04-14',3,1,1),
(150000,'2022-04-14',3,1,2),
(250000,'2022-04-14',3,1,5),
(350000,'2022-04-14',3,1,7);
INSERT INTO factura(facturaID,fecha,total,clienteID)VALUES
(1,'2022-04-01',600000,1),
(2,'2022-05-01',150000,12),
(3,'2022-06-01',80000,4),
(4,'2022-07-01',120000,15),
(5,'2022-08-01',180000,16),
(6,'2022-09-01',350000,17),
(7,'2022-02-01',200000,2),
(8,'2022-04-11',90000,3),
(9,'2022-04-10',100000,13),
(10,'2022-04-10',100000,13),
(11,'2022-04-14',1050000,12);
INSERT INTO factura_detalles(facturaID,reparacionID,cantidad,precio)VALUES
(1, 1, 2, 300000),
(2, 2, 1, 150000), 
(3, 3, 1, 80000),  
(4, 4, 1, 120000), 
(5, 5, 1, 250000), 
(6, 6, 1, 180000), 
(7, 7, 1, 350000), 
(8, 8, 1, 200000), 
(9, 9, 1, 90000),  
(10, 10, 1, 100000),
(11, 11, 1, 300000), 
(11, 12, 1, 150000), 
(11, 13, 1, 250000), 
(11, 14, 1, 350000);
INSERT INTO contacto_proveedor(nombre,apellido1,apellido2,telefono,email)VALUES
('Juan', 'García', 'López', '+57 3112345678', 'juangarcia@example.com'),
('María', 'Martínez', 'Rodríguez', '+57 3223456789', 'mariamartinez@example.com'),
('Pedro', 'Díaz', 'Gómez', '+57 3334567890', 'pedrodiaz@example.com'),
('Luisa', 'Sánchez', 'Pérez', '+57 3445678901', 'luisasanchez@example.com'),
('Andrés', 'Gómez', 'Hernández', '+57 3556789012', 'andresgomez@example.com'),
('Ana', 'Ramírez', 'Martínez', '+57 3667890123', 'anaramirez@example.com'),
('Carlos', 'González', 'López', '+57 3778901234', 'carlosgonzalez@example.com'),
('Laura', 'Hernández', 'Gómez', '+57 3889012345', 'laurahernandez@example.com'),
('Jorge', 'López', 'Sánchez', '+57 3990123456', 'jorgelopez@example.com'),
('Diana', 'Pérez', 'Ramírez', '+57 3001234567', 'dianaperez@example.com');
INSERT INTO proveedor(nombre,telefono,email,contactoID)VALUES
('AutoPartes Express', '+57 3112345678', 'juangarcia@example.com', 1),
('Mecánica Total', '+57 3223456789', 'mariamartinez@example.com', 2),
('Repuestos Rápidos', '+57 3334567890', 'pedrodiaz@example.com', 3),
('Carrocerías y Pinturas', '+57 3445678901', 'luisasanchez@example.com', 4),
('Servicio de Suspensión', '+57 3556789012', 'andresgomez@example.com', 5),
('Frenos Seguros', '+57 3667890123', 'anaramirez@example.com', 6),
('Baterías y Motores', '+57 3778901234', 'carlosgonzalez@example.com', 7),
('Aceites y Lubricantes', '+57 3889012345', 'laurahernandez@example.com', 8),
('Herramientas Automotrices', '+57 3990123456', 'jorgelopez@example.com', 9),
('Electrónica Vehicular', '+57 3001234567', 'dianaperez@example.com', 10);
INSERT INTO ordenes_compra(empleadoID,proveedorID,total)VALUES
(6,1,3000000),
(6,2,1000000),
(6,3,1200000),
(6,4,110000),
(5,5,5000000),
(5,6,3200000),
(5,7,2200000),
(6,8,1100000),
(6,9,1200000),
(6,10,3200000);
INSERT INTO pieza(nombre,descripcion,precio,proveedorID)VALUES
('Suspensión delantera', 'Pieza para el sistema de suspensión delantera de vehículos.', 1000000, 5),
('Pastillas de freno', 'Pastillas de freno de alta calidad para sistemas de frenado.', 500000, 6),
('Pintura automotriz', 'Pintura de repuesto para carrocerías y reparaciones de vehículos.', 200000, 4),
('Batería de arranque', 'Batería de alto rendimiento para motores de vehículos.', 800000, 7),
('Aceite sintético', 'Aceite lubricante sintético para motores de automóviles.', 100000, 8),
('Juego de herramientas mecánicas', 'Juego completo de herramientas para mecánicos automotrices.', 1500000, 9),
('Sensor de temperatura', 'Sensor electrónico para medir la temperatura del motor.', 300000, 10),
('Filtro de aire', 'Filtro de aire de repuesto para sistemas de admisión de vehículos.', 150000, 1),
('Correa de transmisión', 'Correa de repuesto para sistemas de transmisión de potencia.', 400000, 3),
('Lámparas LED', 'Lámparas LED de repuesto para sistemas de iluminación de automóviles.', 50000, 2);
INSERT INTO orden_detalle(ordenID,piezaID,cantidad,precioUnit)VALUES
(1, 1, 1, 1000000), -- Suspensión delantera

(2, 2, 2, 250000),  -- Pastillas de freno

(3, 9, 3, 400000),  -- Correa de transmisión
(3, 3, 6, 200000),  -- Pintura automotriz

(4, 4, 1, 800000),  -- Batería de arranque
(4, 8, 2, 100000),  -- Aceite sintético

(5, 5, 5, 1000000), -- Juego de herramientas mecánicas

(6, 6, 2, 300000),  -- Sensor de temperatura
(6, 2, 1, 500000),  -- Pastillas de freno

(7, 7, 2, 50000),   -- Lámparas LED
(7, 8, 2, 100000),  -- Aceite sintético
(7, 9, 1, 1500000), -- Juego de herramientas mecánicas

(8, 10, 4, 300000), -- Electrónica Vehicular
(8, 1, 1, 1000000), -- Suspensión delantera

(9, 2, 4, 250000),  -- Pastillas de freno
(9, 6, 3, 400000),  -- Sensor de temperatura
(9, 10, 1, 300000), -- Electrónica Vehicular

(10, 3, 6, 200000), -- Pintura automotriz
(10, 7, 4, 50000),  -- Lámparas LED
(10, 10, 2, 300000);-- Electrónica Vehicular
INSERT INTO ubicaciones_taller(nombre)VALUES
('Estantería A, Nivel 1, Sección 3'),     
('Estantería B, Nivel 2, Sección 1'),    
('Estantería C, Nivel 1, Sección 2'),    
('Almacén de Pinturas, Estante Superior'),
('Estantería D, Nivel 1, Sección 4'),    
('Almacén de Lubricantes, Estante Central'),
('Área de Herramientas, Gaveta Grande'),
('Estantería E, Nivel 2, Sección 3'), 
('Área de Iluminación, Estante Medio'),
('Estantería F, Nivel 2, Sección 4'); 
INSERT INTO inventario(ubicacionID,piezaID,cantidad)VALUES
(1, 1, 20),   -- Suspensión delantera
(2, 2, 10),   -- Pastillas de freno
(3, 3, 25),   -- Correa de transmisión
(4, 4, 30),   -- Pintura automotriz
(5, 5, 18),   -- Batería de arranque
(6, 6, 35),   -- Aceite sintético
(7, 7, 40),   -- Juego de herramientas mecánicas
(8, 8, 12),   -- Sensor de temperatura
(9, 9, 8),    -- Lámparas LED (menos de 15 unidades)
(10, 10, 22); -- Electrónica Vehicular
INSERT INTO reparacion_pieza(piezaID,reparacionID,cantidad)VALUES
-- Para la reparación del 2022-04-01
(1, 1, 1),   -- Suspensión delantera
(8, 1, 2),   -- Filtro de aire
-- Para la reparación del 2022-05-01
(2, 2, 1),   -- Pastillas de freno
(9, 2, 1),   -- Correa de transmisión
-- Para la reparación del 2022-06-01
(3, 3, 2),   -- Pintura automotriz
-- Para la reparación del 2022-07-01
(7, 4, 1),   -- Juego de herramientas mecánicas
(10, 4, 1),  -- Sensor de temperatura
-- Para la reparación del 2022-08-01
(4, 5, 1),   -- Batería de arranque
(6, 5, 3),   -- Aceite sintético
-- Para la reparación del 2022-09-01
(5, 6, 2),   -- Aceite sintético
(2, 6, 1),   -- Pastillas de freno
-- Para la reparación del 2022-10-01
(1, 7, 1),   -- Suspensión delantera
(3, 7, 1),   -- Pintura automotriz
-- Para la reparación del 2022-11-01
(9, 8, 1),   -- Correa de transmisión
(10, 8, 1),  -- Sensor de temperatura
-- Para la reparación del 2022-12-01
(2, 9, 1),   -- Pastillas de freno
(8, 9, 1);   -- Filtro de aire