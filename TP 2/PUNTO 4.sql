SELECT 
    Barcos.matricula,
    Barcos.nombre AS nombre_barco,
    Barcos.cuota,
    Socios.id_Socio,
    Socios.nombre AS nombre_socio,
    Socios.direccion
FROM Barcos, Socios
WHERE Barcos.id_socio = Socios.id_Socio
  AND Barcos.cuota > 500;