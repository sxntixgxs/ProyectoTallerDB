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


3. Crear un procedimiento almacenado para eliminar una cita
4. Crear un procedimiento almacenado para generar una factura
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