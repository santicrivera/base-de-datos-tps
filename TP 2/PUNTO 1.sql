SELECT nombre
FROM Socios
WHERE id_socio IN (
SELECT id_socio FROM Barcos WHERE numero_amarre > 10
);