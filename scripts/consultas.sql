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
SELECT OC.ordenID AS OrdenCompra, P.nombre AS Proveedor, CONCAT(E.nombre,' ',E.apellido1) AS Empleado, PZ.nombre AS Pieza, OD.cantidad AS Cantidad, OD.precioUnit AS PrecioPieza, OC.total AS TotalCompra
FROM


8. Obtener el costo total de piezas utilizadas en una reparación específica
9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)
10. Obtener la lista de servicios más solicitados en un período específico
11. Obtener el costo total de reparaciones para cada cliente en un período
específico
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
período específico
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