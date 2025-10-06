SELECT 
    Barcos.nombre AS nombre_barco,
    COUNT(Salidas.id_salida) AS cantidad_salidas
FROM 
    Barcos
JOIN 
    Salidas ON Barcos.matricula = Salidas.matricula
WHERE 
    Barcos.matricula = 'ABC123'
GROUP BY 
    Barcos.matricula, Barcos.nombre;