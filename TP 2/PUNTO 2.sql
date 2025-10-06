SELECT nombre, cuota 
FROM Barcos
WHERE id_socio IN (
SELECT id_socio FROM Socios WHERE nombre = 'Juan Pérez'
) ;