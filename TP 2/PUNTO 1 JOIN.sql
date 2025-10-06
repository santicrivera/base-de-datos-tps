SELECT 
    Barcos.nombre AS nombre_barco,
    Barcos.cuota
FROM 
    Barcos
JOIN 
    Socios ON Barcos.id_socio = Socios.id_socio
WHERE 
    Socios.nombre = 'Juan Pérez';