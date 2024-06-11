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
CALL generar_factura(2024-06-08,111111,3);
5. Crear un procedimiento almacenado para obtener el historial de reparaciones
de un vehículo
6. Crear un procedimiento almacenado para calcular el costo total de
reparaciones de un cliente en un período
7. Crear un procedimiento almacenado para obtener la lista de vehículos que
requieren mantenimiento basado en el kilometraje.
8. Crear un procedimiento almacenado para insertar una nueva orden de compra
9. Crear un procedimiento almacenado para actualizar los datos de un cliente
10. Crear un procedimiento almacenado para obtener los servicios más solicitados
en un período