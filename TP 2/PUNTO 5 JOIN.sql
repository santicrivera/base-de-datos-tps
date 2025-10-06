SELECT 
    Barcos.nombre AS nombre_barco,
    Salidas.fecha_salida,
    Salidas.hora_salida,
    Salidas.destino
FROM 
    Salidas
JOIN 
    Barcos ON Salidas.matricula = Barcos.matricula
WHERE 
    Salidas.destino = 'Mallorca';