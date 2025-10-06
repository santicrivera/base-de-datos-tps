	SELECT DISTINCT
		s.patron_nombre, 
		s.patron_direccion
	FROM
		Salidas s, Barcos b, Socios so
	WHERE
		s.matricula = b.matricula
		AND b.id_socio = so.id_socio
		AND so.direccion = 'Barcelona';