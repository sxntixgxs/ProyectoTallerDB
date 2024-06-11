# Proyecto Taller Automotriz DB ~ Santiago Sandoval Torres
## Consultas
Consultas requeridas
1. Obtener el historial de reparaciones de un vehículo específico
```SQL
SELECT R.reparacionID AS IDReparacion, V.placa AS Placa, R.fecha AS FechaReparacion, S.nombre AS Servicio, R.costoTotal AS CostoReparacion
FROM reparaciones AS R
INNER JOIN Vehiculo AS V ON R.vehiculoID = V.vehiculoID
INNER JOIN Servicio AS S ON R.servicioID = S.servicioID
WHERE V.placa = 'XVW986';
-- Nos piden el historial de reparaciones entonces obtenemos todos los ID de reparacion relacionados con el vehiculo en especifico (XVW986 para el ejemplo) y relacionamos la tabla servicio para obtener datos adicionales como el nombre del servicio que se realizó en esa reparación, esto con el fin de ser claros visualmente ocon la información 
```
```
+--------------+--------+-----------------+------------------+-----------------+
| IDReparacion | Placa  | FechaReparacion | Servicio         | CostoReparacion |
+--------------+--------+-----------------+------------------+-----------------+
|            1 | XVW986 | 2022-04-01      | Cambio de Aceite |          300000 |
+--------------+--------+-----------------+------------------+-----------------+
1 row in set (0,01 sec)
```
2. Calcular el costo total de todas las reparaciones realizadas por un empleado
específico en un período de tiempo
```SQL
SELECT SUM(costoTotal) AS CostoReparaciones
FROM reparaciones 
WHERE empleadoID = 1 AND fecha LIKE '2022%'; 
-- El codigo de empleado para la consulta va a ser 1 y todas las reparaciones realizadas durante el año 2022
--Hacemos uso de la funcion SUM para sumar todas las ocurrencias donde coincida el codigo del empleado y el periodo de tiempo
```
```
+-------------------+
| CostoReparaciones |
+-------------------+
|           1350000 |
+-------------------+
1 row in set (0,00 sec)
```
3. Listar todos los clientes y los vehículos que poseen
```SQL
SELECT CONCAT(C.nombre,' ',C.apellido1,' ',C.apellido2) AS Cliente, IFNULL(CONCAT(T.marca,' ',T.modelo),'No tiene vehículo asociado')AS Vehiculo
FROM tipoVehiculo AS T
INNER JOIN Vehiculo AS V ON T.tipoVehiculoID = V.tipoVehiculoID
RIGHT JOIN Cliente AS C ON V.clienteID = C.clienteID;
-- Nos piden obtener todos los clientes y los vehiculos que poseen por lo que obtenemos los nombres y apellidos de los clientes asociados a vehiculo y como estamos usando un right join nos deja ver también los clientes sin vehiculo
--Usamos IFNULL para mejorar la visibilidad de los datos al hacer la consulta;
```
```
+--------------------------+-----------------------------+
| Cliente                  | Vehiculo                    |
+--------------------------+-----------------------------+
| Pablo Azcarate Ramirez   | Toyota Corolla              |
| Pablo Azcarate Ramirez   | Audi A4                     |
| Juan Torres Ramirez      | Mazda CX-30                 |
| Juan Torres Ramirez      | Nissan Altima               |
| Charlotte Perez Ramirez  | Ford Mustang                |
| Charlotte Perez Ramirez  | Kia Sorento                 |
| Charlotte Perez Ramirez  | Toyota Corolla              |
| Mozart La Para           | Chevrolet Camaro            |
| Mozart La Para           | Hyundai Tucson              |
| Pablo Sandoval Ramirez   | Honda Civic                 |
| Pablo Sandoval Ramirez   | Volkswagen Golf             |
| Samuel Ramirez Azcarate  | No tiene vehículo asociado  |
| Pablo Sambueza Ramirez   | No tiene vehículo asociado  |
| Pablo Perez Ramirez      | No tiene vehículo asociado  |
| Karol Graham Ramirez     | No tiene vehículo asociado  |
| Julieta Ramirez Libreros | No tiene vehículo asociado  |
+--------------------------+-----------------------------+
16 rows in set (0,00 sec)
```
4. Obtener la cantidad de piezas en inventario para cada pieza
```SQL
SELECT I.cantidad AS CantidadPieza, P.nombre AS Pieza
FROM inventario I
INNER JOIN pieza P ON I.piezaID=P.piezaID ;
-- obtenemos la cantidad de cada pieza con su respectivo registro de inventario y realizamos un inner join con la tabla pieza con el fin de mejorar la visibilidad y mostrar el nombre de la respectiva pieza
```
```
+---------------+----------------------------------+
| CantidadPieza | Pieza                            |
+---------------+----------------------------------+
|            20 | Suspensión delantera             |
|            10 | Pastillas de freno               |
|            25 | Pintura automotriz               |
|            30 | Batería de arranque              |
|            18 | Aceite sintético                 |
|            35 | Juego de herramientas mecánicas  |
|            40 | Sensor de temperatura            |
|            12 | Filtro de aire                   |
|             8 | Correa de transmisión            |
|            22 | Lámparas LED                     |
+---------------+----------------------------------+
10 rows in set (0,00 sec)
```
5. Obtener las citas programadas para un día específico
```SQL
SELECT citaID AS IDCita
FROM Cita
WHERE fecha LIKE '2022-05-04%';
-- sacamos el ID de la cita para el dia sin especificar su hora para poder usar LIKE, con esto obtendremos todas las citas de un mismo dia.
```
```
+--------+
| IDCita |
+--------+
|      2 |
+--------+
1 row in set (0,00 sec)
```
6. Generar una factura para un cliente específico en una fecha determinada
```SQL
SELECT facturaID AS NroFactura, fecha AS FechaFacturacion, total AS ValorTotal
FROM factura 
WHERE clienteID = 12 AND fecha = '2022-04-14';
-- Elegimos al cl 12 y una fecha especifica; Como tal buscamos el numero de la factura, la fecha de facturacion y el valor de la factura
```
```
+------------+------------------+------------+
| NroFactura | FechaFacturacion | ValorTotal |
+------------+------------------+------------+
|         11 | 2022-04-14       |    1050000 |
+------------+------------------+------------+
1 row in set (0,01 sec)
```
7. Listar todas las órdenes de compra y sus detalles
```SQL
SELECT OD.ordenID AS NroOrden, P.nombre AS Pieza, OD.cantidad AS Unidades, OD.precioUnit AS PrecioUnitario
FROM orden_detalle OD
INNER JOIN pieza P ON OD.piezaID = P.piezaID
ORDER BY OD.ordenID
;
-- Como nos piden todos los detalles usamos un inner join para mejorar la visibilidad del resultado de la consulta y mostramos qué se pidió en cada orden, cuánto y el precio de cada pieza.
```
```
+----------+----------------------------------+----------+----------------+
| NroOrden | Pieza                            | Unidades | PrecioUnitario |
+----------+----------------------------------+----------+----------------+
|        1 | Suspensión delantera             |        1 |        1000000 |
|        2 | Pastillas de freno               |        2 |         250000 |
|        3 | Pintura automotriz               |        6 |         200000 |
|        3 | Correa de transmisión            |        3 |         400000 |
|        4 | Batería de arranque              |        1 |         800000 |
|        4 | Filtro de aire                   |        2 |         100000 |
|        5 | Aceite sintético                 |        5 |        1000000 |
|        6 | Pastillas de freno               |        1 |         500000 |
|        6 | Juego de herramientas mecánicas  |        2 |         300000 |
|        7 | Sensor de temperatura            |        2 |          50000 |
|        7 | Correa de transmisión            |        1 |        1500000 |
|        7 | Filtro de aire                   |        2 |         100000 |
|        8 | Suspensión delantera             |        1 |        1000000 |
|        8 | Lámparas LED                     |        4 |         300000 |
|        9 | Juego de herramientas mecánicas  |        3 |         400000 |
|        9 | Lámparas LED                     |        1 |         300000 |
|        9 | Pastillas de freno               |        4 |         250000 |
|       10 | Sensor de temperatura            |        4 |          50000 |
|       10 | Pintura automotriz               |        6 |         200000 |
|       10 | Lámparas LED                     |        2 |         300000 |
+----------+----------------------------------+----------+----------------+
20 rows in set (0,00 sec)
```
8. Obtener el costo total de piezas utilizadas en una reparación específica
```SQL
SELECT SUM(P.precio * RP.cantidad) AS CostoTotal, RP.reparacionID AS NroReparacion
FROM reparacion_pieza AS RP
INNER JOIN pieza P ON RP.piezaID = P.piezaID
WHERE RP.reparacionID = 2
;
-- Multiplicamos las columnas precio de la pieza y cantidad usada en la reparacion con el fin de obtener el total por reparacion, luego ese resultado va dentro de una funcion suma con el fin de obtener un resultado global con cada reparacion especifica, en este caso, 2.
```
```
+------------+---------------+
| CostoTotal | NroReparacion |
+------------+---------------+
|     900000 |             2 |
+------------+---------------+
1 row in set (0,00 sec)
```
9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)
```SQL
SELECT I.inventarioID AS NroInventario, P.nombre AS Pieza, I.cantidad AS NroUnidades
FROM inventario I
INNER JOIN pieza P ON I.piezaID = P.piezaID
WHERE I.cantidad < 15;
-- Usamos el inner join para obtener el nombre de pieza y en where establecemos el umbral de reabastecimiento con un minimo de 15 unidades
```
```
+---------------+------------------------+-------------+
| NroInventario | Pieza                  | NroUnidades |
+---------------+------------------------+-------------+
|             2 | Pastillas de freno     |          10 |
|             8 | Filtro de aire         |          12 |
|             9 | Correa de transmisión  |           8 |
+---------------+------------------------+-------------+
3 rows in set (0,00 sec)
```
10. Obtener la lista de servicios más solicitados en un período específico
```SQL
SELECT S.nombre AS Servicio, COUNT(S.servicioID) AS NroSolicitudes
FROM Cita C 
INNER JOIN Servicio AS S ON C.servicioID = S.servicioID
WHERE fecha > '2022-03-01 00:00:00' AND fecha < '2022-07-01 00:00:00' 
GROUP BY C.servicioID
ORDER BY NroSolicitudes DESC LIMIT 3
;
-- haciendo uso de count contamos cada vez que aparezca el codigo de servicio luego de agruparlos por el mismo, establecemos un orden descendente con el fin de obtener los 3 mayores estaleciendo su limite
```
```
+--------------------------+----------------+
| Servicio                 | NroSolicitudes |
+--------------------------+----------------+
| Cambio de Filtro de Aire |              4 |
| Cambio de Aceite         |              1 |
| Revisión de Frenos       |              1 |
+--------------------------+----------------+
3 rows in set (0,00 sec)
```
11. Obtener el costo total de reparaciones para cada cliente en un período
específico
```SQL
SELECT SUM(S.costo) AS TotalRepXCliente, CONCAT(CL.nombre, ' ',CL.apellido1,' ', CL.apellido2) AS Cliente
FROM reparaciones R
INNER JOIN Servicio AS S ON R.servicioID = S.servicioID
INNER JOIN Vehiculo AS V ON R.vehiculoID = V.vehiculoID
INNER JOIN Cliente AS CL ON V.clienteID = CL.clienteID
WHERE 03 <= MONTH(R.fecha) AND 06 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022
GROUP BY CL.clienteID; 
-- hacemos un 3 inner joins con el fin de obtener todos los datos relacionados por cada reparacion realizada en la fecha especificada; se hace un group by y sum con el fin de que nos muestre los valores de cada cliente especificamente y la suma del valor de sus reparaciones
```
```
+------------------+------------------------+
| TotalRepXCliente | Cliente                |
+------------------+------------------------+
|           300000 | Juan Torres Ramirez    |
|           150000 | Pablo Azcarate Ramirez |
|          1130000 | Pablo Sandoval Ramirez |
+------------------+------------------------+
3 rows in set (0,00 sec)
```
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
período específico
```SQL
SELECT CONCAT(E.nombre,' ',E.apellido1) AS Empleado, COUNT(R.empleadoID) AS ReparacionesRealizadas
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
WHERE 03 <= MONTH(R.fecha) AND 06 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022
GROUP BY R.empleadoID
ORDER BY ReparacionesRealizadas DESC LIMIT 3
;
-- periodo: marzo y junio del 2022
-- usamos inner join para obtener los nombres del empleado
-- group by para poder contar correctamente todas las reparaciones de cada empleado
-- usamos el order by en el numero de reparaciones descendentemente con un limitante de 3 filas para obtener los 3 que mas reparaciones hicieron
```
```
+-------------------+------------------------+
| Empleado          | ReparacionesRealizadas |
+-------------------+------------------------+
| Silvestre Diaz    |                      5 |
| Carlos Rodríguez  |                      1 |
| Andrés Gómez      |                      1 |
+-------------------+------------------------+
3 rows in set (0,00 sec)
```
13. Obtener las piezas más utilizadas en reparaciones durante un período
específico
```SQL
SELECT P.nombre AS Pieza, COUNT(RP.piezaID) AS NroPiezasUsadas
FROM reparaciones R
INNER JOIN reparacion_pieza RP ON R.reparacionID = RP.reparacionID
INNER JOIN pieza P ON RP.piezaID = P.piezaID
WHERE 07 <= MONTH(R.fecha) AND 12 >= MONTH(R.fecha) AND YEAR(R.fecha) = 2022 
GROUP BY RP.piezaID
ORDER BY NroPiezasUsadas DESC LIMIT 3
;
-- Hacemos 2 inner joins para relacionar las tablas pieza y reparacion_pieza con reparacion, luego, en el where establecemos el periodo de julio a diciembre del 2022 y agrupamos por piezas usadas en cada reparacion para poderlas contar. Finalmente, ordenamos por el Nro de piezas usadas y obtenemos los 3 mayores
```
```
+-----------------------+-----------------+
| Pieza                 | NroPiezasUsadas |
+-----------------------+-----------------+
| Pastillas de freno    |               2 |
| Lámparas LED          |               2 |
| Suspensión delantera  |               1 |
+-----------------------+-----------------+
3 rows in set (0,00 sec)
```
14. Calcular el promedio de costo de reparaciones por vehículo
```SQL
SELECT ROUND(AVG(R.costoTotal),0)AS PromedioCostoReparaciones, V.placa
FROM reparaciones R
INNER JOIN Vehiculo V ON R.vehiculoID = V.vehiculoID
GROUP BY R.vehiculoID;
-- Sacamos el promedio del costoTotal de las reparaciones con la funcion AVG y aplicamos un ROUND de 0 decimales ya que como son valores enteros, no es necesario mostrarlos en la consulta. 
-- Añadimos un inner join con el fin de que sea mas agradable la tabla resultante mostrando cada placa junto con el promedio del valor de sus reparaciones
```
```
+---------------------------+--------+
| PromedioCostoReparaciones | placa  |
+---------------------------+--------+
|                    300000 | XVW986 |
|                    150000 | ABC123 |
|                    226000 | DEF456 |
|                    120000 | GHI789 |
|                    250000 | JKL012 |
|                    180000 | MNO345 |
|                    350000 | PQR678 |
|                    200000 | STU901 |
|                     90000 | VWX234 |
|                    100000 | YZA567 |
+---------------------------+--------+
10 rows in set (0,00 sec)
```
15. Obtener el inventario de piezas por proveedor
```SQL
SELECT P.nombre AS Proveedor, SUM(I.cantidad) AS NroPiezas
FROM proveedor AS P 
INNER JOIN pieza PZ ON P.proveedorID = PZ.proveedorID
INNER JOIN inventario I ON PZ.piezaID = I.piezaID
GROUP BY P.proveedorID;
-- Desde la tabla proveedor hacemos dos inner join con las tablas pieza e inventario para tener los datos relacionados.
-- Agrupamos por proveedorID para poder hacer uso de la funcion SUM que sumara todas las piezas que hayan de cada proveedor.
```
```
+---------------------------+-----------+
| Proveedor                 | NroPiezas |
+---------------------------+-----------+
| AutoPartes Express        |        12 |
| Mecánica Total            |        22 |
| Repuestos Rápidos         |         8 |
| Carrocerías y Pinturas    |        25 |
| Servicio de Suspensión    |        20 |
| Frenos Seguros            |        10 |
| Baterías y Motores        |        30 |
| Aceites y Lubricantes     |        18 |
| Herramientas Automotrices |        35 |
| Electrónica Vehicular     |        40 |
+---------------------------+-----------+
10 rows in set (0,00 sec)
```
16. Listar los clientes que no han realizado reparaciones en el último año
```SQL
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
-- En esta DB el último año seria 2023 sin embargo, para obtenerlo de forma general vamos a hacer subconsultas
-- La mas fundamental, para obtener el año mayor de todas las reparaciones, este sería el último año
-- Con este dato, hacemos otra consulta que seria de donde obtenemos todos los clientes que hicieron reparaciones en ese año obtenido por la subconsulta anterior
-- Finalmente, obtenemos el nombre del cliente haciendo 2 inner joins y buscamos los clientes que sean diferentes a los que aparezcan del resultado de las dos subconsultas anidadas.
```
```
+-------------------------+
| Cliente                 |
+-------------------------+
| Juan Torres Ramirez     |
| Charlotte Perez Ramirez |
| Mozart La Para          |
| Pablo Sandoval Ramirez  |
+-------------------------+
4 rows in set (0,00 sec)
```
17. Obtener las ganancias totales del taller en un período específico
```SQL
SELECT SUM(total)
FROM factura
WHERE fecha LIKE '2022-04%';
-- Sumamos todas las facturas registradas en el mes de abril del 2022
```
```
+------------+
| SUM(total) |
+------------+
|    1940000 |
+------------+
1 row in set (0,00 sec)
```
18. Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación)
```SQL
SELECT CONCAT(E.nombre,' ',E.apellido1,' ',E.apellido2) AS Empleado, COUNT(R.empleadoID) AS HorasTrabajadasMarzoAJulio
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
WHERE R.fecha RLIKE '^2022-0[4-7]'
GROUP BY R.empleadoID;
-- Como en la base de datos no está contemplada la duración de cada reparación, asumiremos que cada reparación dura 1 hora
-- Relacionamos las tablas de reparaciones y empleados para obtener aquellos que cumplan con la condicion
-- Listamos todas las reparaciones de abril a junio del 2022 usando RLIKE que nos permite escribir una REGEXP. Usamos ^ para marcar que debe iniciar ahí, es decir, no puede haber nada antes, y el [4-7] para marcar la variacion de los numeros que estén dentro del rango
-- finalmente agrupamos por empleado con e lfin de poder hacer el conteo de las horas trabajadas por cada empleado
```
```
+--------------------------+----------------------------+
| Empleado                 | HorasTrabajadasMarzoAJulio |
+--------------------------+----------------------------+
| Silvestre Diaz Maestre   |                          5 |
| Carlos Rodríguez López   |                          1 |
| Andrés Gómez Martínez    |                          1 |
| Juan Pérez Hernández     |                          1 |
+--------------------------+----------------------------+
4 rows in set (0,00 sec)
```
19. Obtener el listado de servicios prestados por cada empleado en un período
específico
```SQL
SELECT CONCAT(E.nombre,' ',E.apellido1,' ',E.apellido2) AS Empleado, S.nombre AS ServicioPrestado
FROM reparaciones R
INNER JOIN empleado E ON R.empleadoID = E.empleadoID
INNER JOIN Servicio S ON R.servicioID = S.servicioID
WHERE R.fecha RLIKE '^2022-0[4-7]'
GROUP BY R.empleadoID, R.servicioID;
--Aquí hacemos 2 inner join para relacionar las tablas empleado y servicio con reparaciones
-- Establecemos el periodo de abril a julio del 2022 usando REGEXP
-- Agrupamos por empleado y servicio con el fin de no tener resultados duplicados sino una lista.
```
```
+--------------------------+-----------------------------------+
| Empleado                 | ServicioPrestado                  |
+--------------------------+-----------------------------------+
| Silvestre Diaz Maestre   | Cambio de Aceite                  |
| Silvestre Diaz Maestre   | Alineación y Balanceo             |
| Silvestre Diaz Maestre   | Cambio de Batería                 |
| Silvestre Diaz Maestre   | Cambio de Correa de Distribución  |
| Carlos Rodríguez López   | Alineación y Balanceo             |
| Andrés Gómez Martínez    | Cambio de Filtro de Aire          |
| Juan Pérez Hernández     | Revisión de Frenos                |
+--------------------------+-----------------------------------+
7 rows in set (0,01 sec)
```
## Subconsultas
1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
```SQL
SELECT CONCAT(C.nombre, ' ',C.apellido1,' ',C.apellido2) AS Cliente, S.Total AS TotalReparaciones
FROM (SELECT SUM(total) AS Total, clienteID FROM factura GROUP BY clienteID) AS S
INNER JOIN Cliente C ON S.clienteID = C.clienteID
GROUP BY S.clienteID
ORDER BY S.Total DESC LIMIT 1;
--Hacemos una subconsulta S donde obtenemos el total de las facturas de cada cliente y su id
-- Luego relacionamos esta subconsulta con la tabla cliente para poder acceder a los nombres de los mismos
-- Finalmente para obtener el cliente que más gastó simplemente agrupamos por ID para tener los resultados apropiados y ordenamos por el Total de forma descendente y limitamos a 1 fila.
```
```
+------------------------+-------------------+
| Cliente                | TotalReparaciones |
+------------------------+-------------------+
| Pablo Sandoval Ramirez |           1200000 |
+------------------------+-------------------+
1 row in set (0,00 sec)
```

2. Obtener la pieza más utilizada en reparaciones durante el último mes
```SQL
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
-- Primero, usando inner join, relacionamos las tablas reparaciones y pieza con reparacion_pieza
-- luego agrupamos por el id de cada pieza para poder realizar el conteo
-- establecemos el ultimo mes sacando la fecha mayor y a esta le sacamos el mes y el año por separado con dos subconsultas
-- finalmente ordenamos por el NrodeUsos que es el resultado del conteo y dejamos limite uno y orden descendente para obtener el resultado esperado
```
```
+--------------------+---------+
| Pieza              | NroUsos |
+--------------------+---------+
| Pastillas de freno |       1 |
+--------------------+---------+
1 row in set (0,00 sec)
```
3. Obtener los proveedores que suministran las piezas más caras
```SQL
SELECT PR.proveedorID AS Proveedor, P.nombre AS Pieza, P.precio AS ValorPieza
FROM pieza P
INNER JOIN proveedor PR ON P.proveedorID = PR.proveedorID
ORDER BY P.precio DESC LIMIT 3;
-- Obtenemos las piezas mas caras ordenando por la columna precio de forma descendente y establecemos un limite de 3 filas
-- Luego, relacionamos la tabla proveedor para poder acceder y mostrar el nombre de cada uno.
```
```
+-----------+----------------------------------+------------+
| Proveedor | Pieza                            | ValorPieza |
+-----------+----------------------------------+------------+
|         9 | Juego de herramientas mecánicas  |    1500000 |
|         5 | Suspensión delantera             |    1000000 |
|         7 | Batería de arranque              |     800000 |
+-----------+----------------------------------+------------+
3 rows in set (0,01 sec)
```

4. Listar las reparaciones que no utilizaron piezas específicas durante el último
año
```SQL
SELECT R.reparacionID AS NroReparacion, R.fecha AS FechaReparacion,R.costoTotal AS Total
FROM reparacion_pieza RP
INNER JOIN reparaciones R ON RP.reparacionID = R.reparacionID
WHERE RP.piezaID <> 1 AND RP.piezaID <> 5 AND YEAR(R.fecha)=(
    SELECT YEAR(MAX(fecha)) FROM reparaciones
);
-- Obtenemos primero el ultimo año mediante una subconsulta donde buscamos la fecha mayor y luego seleccionamos solo el año.
-- En la consulta principal seleccionamos los datos relevantes de la reparacion relacionando reparacion_pieza y reparaciones
-- Adicionamos una condicion para recibir las reparaciones donde no se hayan usado las piezas 1 y 5
```
```
+---------------+-----------------+--------+
| NroReparacion | FechaReparacion | Total  |
+---------------+-----------------+--------+
|            10 | 2023-01-01      | 100000 |
+---------------+-----------------+--------+
1 row in set (0,01 sec)
```
5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
```SQL
SELECT P.nombre AS Pieza, I.cantidad AS StockActual
FROM inventario I
INNER JOIN pieza P ON I.piezaID = P.piezaID
WHERE I.cantidad < (115-(115*90/100));
-- Como no hay un registro de cambios en el inventario asumimos que todas las piezas tenian un stock inicial de 115 unidades
-- Obtenemos el nombre de la pieza y su stock actual relacionando la tabla inventario y pieza
-- Mostramos solo las piezas que están debajo del 10% de las 115 unidades iniciales
```
```
+------------------------+-------------+
| Pieza                  | StockActual |
+------------------------+-------------+
| Pastillas de freno     |          10 |
| Correa de transmisión  |           8 |
+------------------------+-------------+
2 rows in set (0,00 sec)
```
## Procedimientos Almacenados
1. Crear un procedimiento almacenado para insertar una nueva reparación.
```SQL
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
-- Creamos el procedimiento acorde a la estructura de mysql declarando los parametros de entrada y su tipo de dato; no pedimos id de la reparacion porque por definicion de la tabla se genera automaticamente
-- dentro del bloque begin hacemos la insercion de datos en cada campo
CALL insertar_reparacion(320000,'2023-03-03',1,5,3);
```
```
Query OK, 1 row affected (0,01 sec)
```
2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
```SQL
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
```
```
+---------------------------------+
| El inventario se ha actualizado |
+---------------------------------+
| El inventario se ha actualizado |
+---------------------------------+
1 row in set (0,00 sec)

Query OK, 0 rows affected (0,00 sec)
```
3. Crear un procedimiento almacenado para eliminar una cita
```SQL
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
```
```
+---------------------+
| Eliminado con exito |
+---------------------+
| Eliminado con exito |
+---------------------+
1 row in set (0,01 sec)

Query OK, 0 rows affected (0,01 sec)
```
4. Crear un procedimiento almacenado para generar una factura
```SQL
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
```
```
```
+----------------------------+
| Factura añadida con exito  |
+----------------------------+
| Factura añadida con exito  |
+----------------------------+
1 row in set (0,01 sec)
5. Crear un procedimiento almacenado para obtener el historial de reparaciones
de un vehículo
```SQL
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
```
```
+----------+--------------+------------+------------+
| Vehiculo | reparacionID | costoTotal | fecha      |
+----------+--------------+------------+------------+
| XVW986   |            1 |     300000 | 2022-04-01 |
| XVW986   |           15 |     320000 | 2023-03-03 |
+----------+--------------+------------+------------+
2 rows in set (0,00 sec)

Query OK, 0 rows affected (0,00 sec)
```
6. Crear un procedimiento almacenado para calcular el costo total de
reparaciones de un cliente en un período
7. Crear un procedimiento almacenado para obtener la lista de vehículos que
requieren mantenimiento basado en el kilometraje.
8. Crear un procedimiento almacenado para insertar una nueva orden de compra
9. Crear un procedimiento almacenado para actualizar los datos de un cliente
10. Crear un procedimiento almacenado para obtener los servicios más solicitados
en un período