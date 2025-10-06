SELECT DISTINCT
    P.nombre,
    P.direccion
FROM
    Procuradores P
JOIN
    Asuntos_Procuradores AP ON P.id_procurador = AP.id_procurador
JOIN
    Asuntos A ON AP.numero_expediente = A.numero_expediente
WHERE
    A.estado = 'Abierto';
