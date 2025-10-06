SELECT
    P.nombre AS Nombre_Procurador, 
    COUNT(AP.numero_expediente) AS Total_Asuntos 
FROM
    Procuradores P
LEFT JOIN 
    Asuntos_Procuradores AP ON P.id_procurador = AP.id_procurador
GROUP BY
    P.id_procurador, P.nombre 
ORDER BY
    Total_Asuntos DESC;
