SELECT 
    Socios.nombre AS nombre_socio,
    Barcos.nombre AS nombre_barco,
    Barcos.numero_amarre
FROM 
    Socios
JOIN 
    Barcos ON Socios.id_socio = Barcos.id_socio
WHERE 
    Barcos.numero_amarre > 10;