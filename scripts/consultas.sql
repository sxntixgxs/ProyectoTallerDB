-- Consultas requeridas
-- 1. Obtener el historial de reparaciones de un vehículo específico
SELECT R.reparacionID AS IDReparacion, V.placa AS Placa, R.fecha AS FechaReparacion, S.nombre AS Servicio, R.costoTotal AS CostoReparacion
FROM reparaciones AS R
INNER JOIN Vehiculo AS V ON R.vehiculoID = V.vehiculoID
INNER JOIN Servicio AS S ON R.servicioID = S.servicioID
WHERE V.placa = 'XVW986';
-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado
-- específico en un período de tiempo

SELECT SUM(costoTotal) AS CostoReparaciones
FROM reparaciones 
WHERE empleadoID = 14 AND fecha LIKE '2022-05%';
-- 3. Listar todos los clientes y los vehículos que poseen 
SELECT CONCAT(C.nombre,' ',C.apellido1,' ',C.apellido2) AS Cliente, CONCAT(T.marca,' ',T.modelo) AS Vehiculo
FROM tipoVehiculo AS T
INNER JOIN Vehiculo AS V ON T.tipoVehiculoID = V.tipoVehiculoID
INNER JOIN cliente AS C ON V.clienteID = C.clienteID;
-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT cantidad AS CantidadPieza
FROM inventario;
-- 5. Obtener las citas programadas para un día específico
SELECT citaID AS IDCita
FROM Cita
WHERE fecha LIKE '14-05-2022%';
-- 6. Generar una factura para un cliente específico en una fecha determinada
SELECT facturaID AS NroFactura, fecha AS FechaFacturacion, total AS ValorTotal
FROM factura 
WHERE clienteID = 2;

-- 7. Listar todas las órdenes de compra y sus detalles
SELECT OC.ordenID AS OrdenCompraID, P.nombre AS Proveedor, E.nombre AS Empleado, OC.total AS Total
FROM ordenes_compra AS OC
INNER JOIN proveedor AS P ON OC.proveedorID = P.proveedorID
INNER JOIN empleado AS E ON OC.empleadoID = OC.empleadoID;



-- 8. Obtener el costo total de piezas utilizadas en una reparación específica
SELECT (P.precio * RP.cantidad) AS CostoTotal, RP.reparacionID AS NroReparacion
FROM reparacion_pieza AS RP
INNER JOIN pieza P ON RP.piezaID = P.piezaID
WHERE RP.reparacionID = 2;


-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
-- menor que un umbral)
-- umbral = 15
SELECT inventarioID AS NroInventario, piezaID AS Pieza, cantidad AS NroUnidades
FROM inventario
WHERE cantidad < 15;
-- 10. Obtener la lista de servicios más solicitados en un período específico
-- periodo de marzo a junio del 2022
SELECT S.nombre AS Servicio

FROM cita C 
INNER JOIN Servicio AS S ON C.servicioID = S.servicioID
WHERE 03 <= MONTH(C.fecha) AND 06 >= MONTH(C.fecha)
GROUP BY C.servicioID
;

-- 11. Obtener el costo total de reparaciones para cada cliente en un período
-- específico
-- periodo de marzo a junio del 2022
SELECT SUM(S.costo) AS TotalRepxCliente, CONCAT(nombre, ' ',apellido1) AS Cliente
FROM cita C 
INNER JOIN Servicio AS S ON C.servicioID = S.servicioID
INNER JOIN Cliente AS CL ON C.clienteID = CL.clienteID
WHERE 03 <= MONTH(C.fecha) AND 06 >= MONTH(C.fecha)
GROUP BY C.clienteID; 
-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
-- período específico

SELECT CONCAT(E.nombre,' ',E.apellido1) AS Empleado
FROM reparaciones R
INNER JOIN 

13. Obtener las piezas más utilizadas en reparaciones durante un período
específico
14. Calcular el promedio de costo de reparaciones por vehículo
15. Obtener el inventario de piezas por proveedor
16. Listar los clientes que no han realizado reparaciones en el último año
17. Obtener las ganancias totales del taller en un período específico
18. Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación)
19. Obtener el listado de servicios prestados por cada empleado en un período
específico