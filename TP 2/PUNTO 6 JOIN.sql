SELECT DISTINCT
    S.patron_nombre,
    S.patron_direccion
FROM
    Salidas S 
JOIN
    Barcos B ON S.matricula = B.matricula 
JOIN
    Socios SO ON B.id_socio = SO.id_socio 
WHERE
    SO.direccion = 'Barcelona'; 