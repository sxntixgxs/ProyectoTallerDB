-- Procedimientos Almacenados
-- 1. Crear un procedimiento almacenado para insertar una nueva reparación.
DELIMITER $$
CREATE PROCEDURE insertar_reparacion(
    IN IcostoTotal INT,
    IN Ifecha DATE,
    IN IvehiculoID INT,
    IN IempleadoID INT,
    IN IservicioID INT
)
BEGIN 
    INSERT INTO reparaciones(costoTotal,fecha,vehiculoID,empleadoID,servicioID)VALUES
    (IcostoTotal,Ifecha,IvehiculoID,IempleadoID,IservicioID);
END $$
DELIMITER ;
CALL insertar_reparacion(320000,'2023-03-03',1,5,3);


-- 2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.

DELIMITER $$
CREATE PROCEDURE update_inventario(
    IN idPieza INT,
    IN nuevaCantidad INT
)
BEGIN
    UPDATE inventario
    SET cantidad =  nuevaCantidad
    WHERE piezaID = idPieza;
    SELECT 'El inventario se ha actualizado';
END $$
DELIMITER ;
CALL update_inventario(4,69); 

-- 3. Crear un procedimiento almacenado para eliminar una cita
DELIMITER $$
CREATE PROCEDURE eliminar_cita(
    IN idCita INT
)
BEGIN 
    DELETE FROM Cita WHERE citaID = idCita;
    SELECT 'Eliminado con exito';
END $$
DELIMITER ;
CALL eliminar_cita(13);
--4. Crear un procedimiento almacenado para generar una factura
DELIMITER $$
CREATE PROCEDURE generar_factura(
    IN fechaFactura DATE,
    IN totalFactura INT,
    IN idCliente INT
)
BEGIN
    INSERT INTO factura(fecha,total,clienteID) VALUES
    (fechaFactura,totalFactura,idCliente);
    SELECT 'Factura añadida con exito';
END $$
DELIMITER ;
CALL generar_factura('2024-06-08',111111,3);
--5. Crear un procedimiento almacenado para obtener el historial de reparaciones
--de un vehículo
DELIMITER $$
CREATE PROCEDURE historial_reparaciones(
    IN placa VARCHAR(6)
)
BEGIN 
    SELECT V.placa AS Vehiculo, R.reparacionID, R.costoTotal, R.fecha
    FROM Vehiculo V
    INNER JOIN reparaciones R ON V.vehiculoID = R.vehiculoID
    WHERE V.placa = placa;
END $$
DELIMITER ;
CALL historial_reparaciones('XVW986') ;
-- 6. Crear un procedimiento almacenado para calcular el costo total de
-- reparaciones de un cliente en un período
DELIMITER $$
CREATE PROCEDURE costo_total_rep_cliente_periodo(
    IN idCliente INT,
    IN fechaMin DATE,
    IN fechaMax DATE
)
BEGIN
    SELECT SUM(R.costoTotal) AS CostoTotalxReparacionesCliente
    FROM reparaciones R
    INNER JOIN Vehiculo V ON R.vehiculoID = V.vehiculoID
    INNER JOIN Cliente C ON V.clienteID = C.clienteID
    WHERE C.clienteID = idCliente AND R.fecha > fechaMin AND R.fecha < fechaMax;
END $$
DELIMITER ;
CALL costo_total_rep_cliente_periodo(1,'2022-01-01','2023-01-01');
-- 7. Crear un procedimiento almacenado para obtener la lista de vehículos que
-- requieren mantenimiento basado en el kilometraje.
DELIMITER $$
CREATE PROCEDURE vehiculos_mantenimiento()
BEGIN
    SELECT placa AS VehiculosNecesitanMantenimiento
    FROM Vehiculo
    WHERE km > 30000; -- umbral mantenimiento
END $$
DELIMITER ;
CALL vehiculos_mantenimiento();

-- 8. Crear un procedimiento almacenado para insertar una nueva orden de compra
DELIMITER $$
CREATE PROCEDURE insertar_orden_compra(
    IN idEmpleado INT,
    IN idProveedor INT,
    IN totalOrden INT
)
BEGIN
    INSERT INTO ordenes_compra(empleadoID,proveedorId,total)
    VALUES(
        idEmpleado,idProveedor,totalOrden
    );
END $$
DELIMITER ;
CALL insertar_orden_compra(5,4,2300000);
--9. Crear un procedimiento almacenado para actualizar los datos de un cliente
DELIMITER $$
CREATE PROCEDURE actualizar_cliente(
    IN idCliente INT,
    IN nombreC VARCHAR(45),
    IN apellido1C VARCHAR(45),
    IN apellido2C VARCHAR(45),
    IN direccionC VARCHAR(200),   
    IN telefonoC VARCHAR(45),
    IN emailC VARCHAR(45)
)BEGIN
    UPDATE Cliente
    SET nombre = nombreC, apellido1 = apellido1C, apellido2 = apellido2C, direccion = direccionC, telefono = telefonoC, email = emailC
    WHERE clienteID = idCliente;
    SELECT 'Cliente Actualizado';
END $$
DELIMITER ;
CALL actualizar_cliente(14,'Pablo','Perez','Aveiro','Calle 44 22 11','321421532','invented@email.com');
-- 10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período
DELIMITER $$
CREATE PROCEDURE servicios_solicitados_periodo(
    IN fechaIN DATE,
    IN fechaFIN DATE
)BEGIN
    SELECT S.nombre
    FROM Servicio S
    INNER JOIN reparaciones R ON S.servicioID = R.servicioID
    WHERE R.fecha > fechaIN AND R.fecha < fechaFIN;
END $$
DELIMITER ;
CALL servicios_solicitados_periodo('2022-01-01','2023-01-01');