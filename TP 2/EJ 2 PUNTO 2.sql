SELECT DISTINCT
    C.nombre,
    C.dni
FROM
    Clientes C
JOIN
    Asuntos A ON C.dni = A.dni_cliente             
JOIN
    Asuntos_Procuradores AP ON A.numero_expediente = AP.numero_expediente 
JOIN
    Procuradores P ON AP.id_procurador = P.id_procurador 
WHERE
    P.nombre = 'Carlos López'; 