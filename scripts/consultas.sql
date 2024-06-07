-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Consultas requeridas
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
WHERE empleadoID = 1 AND fecha LIKE '2022%'; 
-- 3. Listar todos los clientes y los vehículos que poseen 
SELECT CONCAT(C.nombre,' ',C.apellido1,' ',C.apellido2) AS Cliente, IFNULL(CONCAT(T.marca,' ',T.modelo),'No tiene vehículo asociado')AS Vehiculo
FROM tipoVehiculo AS T
INNER JOIN Vehiculo AS V ON T.tipoVehiculoID = V.tipoVehiculoID
RIGHT JOIN Cliente AS C ON V.clienteID = C.clienteID;
-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT I.cantidad AS CantidadPieza, P.nombre AS Pieza
FROM inventario I
INNER JOIN pieza P ON I.piezaID=P.piezaID ;
-- 5. Obtener las citas programadas para un día específico
SELECT citaID AS IDCita
FROM Cita
WHERE fecha LIKE '2022-05-04%';
-- 6. Generar una factura para un cliente específico en una fecha determinada
SELECT facturaID AS NroFactura, fecha AS FechaFacturacion, total AS ValorTotal
FROM factura 
WHERE clienteID = 12 AND fecha = '2022-04-14';

-- 7. Listar todas las órdenes de compra y sus detalles
SELECT OD.ordenID AS NroOrden, P.nombre AS Pieza, OD.cantidad AS Unidades, OD.precioUnit AS PrecioUnitario
FROM orden_detalle OD
INNER JOIN pieza P ON OD.piezaID = P.piezaID
ORDER BY OD.ordenID
;



-- 8. Obtener el costo total de piezas utilizadas en una reparación específica
SELECT SUM(P.precio * RP.cantidad) AS CostoTotal, RP.reparacionID AS NroReparacion
FROM reparacion_pieza AS RP
INNER JOIN pieza P ON RP.piezaID = P.piezaID
WHERE RP.reparacionID = 2
;


-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
-- menor que un umbral)
-- umbral = 15
SELECT I.inventarioID AS NroInventario, P.nombre AS Pieza, I.cantidad AS NroUnidades
FROM inventario I
INNER JOIN pieza P ON I.piezaID = P.piezaID
WHERE I.cantidad < 15;
-- 10. Obtener la lista de servicios más solicitados en un período específico
-- periodo de marzo a junio del 2022
SELECT S.nombre AS Servicio, COUNT(S.servicioID) AS NroSolicitudes
FROM Cita C 
INNER JOIN Servicio AS S ON C.servicioID = S.servicioID
WHERE fecha > '2022-03-01 00:00:00' AND fecha < '2022-07-01 00:00:00' 
GROUP BY C.servicioID
ORDER BY NroSolicitudes DESC LIMIT 3
;

-- 11. Obtener el costo total de reparaciones para cada cliente en un período
-- específico
-- periodo de marzo a junio del 2022
SELECT SUM(S.costo) AS TotalRepXCliente, CONCAT(CL.nombre, ' ',CL.apellido1,' ', CL.apellido2) AS Cliente
FROM reparaciones R
INNER JOIN Servicio AS S ON R.servicioID = S.servicioID
INNER JOIN Vehiculo AS V ON R.vehiculoID = V.vehiculoID
INNER JOIN Cliente AS CL ON V.clienteID = CL.clienteID
WHERE 03 <= MONTH(R.fecha) AND 06 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022
GROUP BY CL.clienteID;  
-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
-- período específico

SELECT CONCAT(E.nombre,' ',E.apellido1) AS Empleado, COUNT(R.empleadoID) AS ReparacionesRealizadas
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
WHERE 03 <= MONTH(R.fecha) AND 06 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022
GROUP BY R.empleadoID
ORDER BY ReparacionesRealizadas DESC LIMIT 3
;

-- 13. Obtener las piezas más utilizadas en reparaciones durante un período
-- específico

SELECT P.nombre AS Pieza, COUNT(RP.piezaID) AS NroPiezasUsadas
FROM reparaciones R
INNER JOIN reparacion_pieza RP ON R.reparacionID = RP.reparacionID
INNER JOIN pieza P ON RP.piezaID = P.piezaID
WHERE 07 <= MONTH(R.fecha) AND 12 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022 
GROUP BY RP.piezaID
ORDER BY NroPiezasUsadas DESC LIMIT 3
;

-- 14. Calcular el promedio de costo de reparaciones por vehículo

SELECT ROUND(AVG(R.costoTotal),0)AS PromedioCostoReparaciones, V.placa
FROM reparaciones R
INNER JOIN Vehiculo V ON R.vehiculoID = V.vehiculoID
GROUP BY R.vehiculoID;

-- 15. Obtener el inventario de piezas por proveedor
SELECT P.nombre AS Proveedor, SUM(I.cantidad) AS NroPiezas
FROM proveedor AS P 
INNER JOIN pieza PZ ON P.proveedorID = PZ.proveedorID
INNER JOIN inventario I ON PZ.piezaID = I.piezaID
GROUP BY P.proveedorID;
-- 16. Listar los clientes que no han realizado reparaciones en el último año
SELECT CONCAT(C.nombre,' ',C.apellido1,' ',C.apellido2) AS Cliente
FROM reparaciones R
INNER JOIN Vehiculo V ON R.vehiculoID = V.vehiculoID
INNER JOIN Cliente C ON V.clienteID = C.clienteID
WHERE C.clienteID NOT IN(
    SELECT C2.clienteID
    FROM reparaciones R2 
    INNER JOIN Vehiculo V2 ON R2.vehiculoID = V2.vehiculoID
    INNER JOIN Cliente C2 ON V2.clienteID = C2.clienteID
    WHERE YEAR(R2.fecha) = (
        SELECT MAX(YEAR(R3.fecha))
        FROM reparaciones R3
    ))
GROUP BY C.clienteID;

-- 17. Obtener las ganancias totales del taller en un período específico
SELECT SUM(total)
FROM factura
WHERE fecha LIKE '2022-04%';

-- 18. Listar los empleados y el total de horas trabajadas en reparaciones en un
-- período específico (asumiendo que se registra la duración de cada reparación)

--se asume que cada reparacion dura 1hr
SELECT CONCAT(E.nombre,' ',E.apellido1,' ',E.apellido2) AS Empleado, COUNT(R.empleadoID) AS HorasTrabajadasMarzoAJulio
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
WHERE R.fecha RLIKE '^2022-0[4-7]'
GROUP BY R.empleadoID;


-- 19. Obtener el listado de servicios prestados por cada empleado en un período
-- específico
SELECT CONCAT(E.nombre,' ',E.apellido1,' ',E.apellido2) AS Empleado, S.nombre AS ServicioPrestado
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
INNER JOIN Servicio S ON R.servicioID = S.servicioID
WHERE R.fecha RLIKE '^2022-0[4-7]'
GROUP BY R.empleadoID, R.servicioID;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- SUBCONSULTAS 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
SELECT CONCAT(C.nombre, ' ',C.apellido1,' ',C.apellido2) AS Cliente, S.Total AS TotalReparaciones
FROM (SELECT SUM(total) AS Total, clienteID FROM factura GROUP BY clienteID) AS S
INNER JOIN Cliente C ON S.clienteID = C.clienteID
GROUP BY S.clienteID
ORDER BY S.Total DESC LIMIT 1;

-- 2. Obtener la pieza más utilizada en reparaciones durante el último mes

SELECT P.nombre AS Pieza, COUNT(R.piezaID) AS NroUsos
FROM reparacion_pieza R
INNER JOIN reparaciones R2 ON R.reparacionID = R2.reparacionID
INNER JOIN pieza P ON R.piezaID = P.piezaID
WHERE MONTH(R2.fecha) = (SELECT MONTH(MaxFecha)FROM(SELECT MAX(fecha)AS MaxFecha FROM reparaciones)AS Mes)
AND 
YEAR(R2.fecha) = (SELECT YEAR(MaxFecha)FROM(SELECT MAX(fecha)AS MaxFecha FROM reparaciones)AS Anio)
GROUP BY R.piezaID
ORDER BY NroUsos DESC LIMIT 1
;
-- 3. Obtener los proveedores que suministran las piezas más caras
SELECT PR.proveedorID AS Proveedor, P.nombre AS Pieza, P.precio AS ValorPieza
FROM pieza P
INNER JOIN proveedor PR ON P.proveedorID = PR.proveedorID
ORDER BY P.precio DESC LIMIT 3;
-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año
--piezas especificas 1 y 5
SELECT R.reparacionID AS NroReparacion, R.fecha AS FechaReparacion,R.costoTotal AS Total
FROM reparacion_pieza RP
INNER JOIN reparaciones R ON RP.reparacionID = R.reparacionID
WHERE RP.piezaID <> 1 AND RP.piezaID <> 5 AND YEAR(R.fecha)=(
    SELECT YEAR(MAX(fecha)) FROM reparaciones
);
-- 5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
-- vamos a tomar el stock inicial de todas como 115
SELECT P.nombre AS Pieza, I.cantidad AS StockActual
FROM inventario I
INNER JOIN pieza P ON I.piezaID = P.piezaID
WHERE I.cantidad < (115-(115*90/100));