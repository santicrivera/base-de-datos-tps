SELECT 
    Barcos.nombre AS nombre_barco,
    Barcos.cuota,
    Socios.nombre AS nombre_socio,
    Socios.direccion AS direccion_socio
FROM 
    Barcos
JOIN 
    Socios ON Barcos.id_socio = Socios.id_socio
WHERE 
    Barcos.cuota > 500;