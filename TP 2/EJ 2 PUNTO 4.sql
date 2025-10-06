SELECT
    A.numero_expediente, 
    A.fecha_inicio      
FROM
    Asuntos A
JOIN
    Clientes C ON A.dni_cliente = C.dni 
WHERE
    C.direccion LIKE '%Buenos Aires%';
