-- punto 5
drop procedure if exists TotalMovimientosDelMes;
use banco;


delimiter $$
CREATE PROCEDURE TotalMovimientosDelMes(IN cuenta INT, mes date, OUT total DECIMAL(10,2))
BEGIN
    SELECT(SUM(
            CASE 
                WHEN tipo = 'CREDITO' THEN movimientos.importe
                WHEN tipo = 'DEBITO' THEN -movimientos.importe
                ELSE 0
            END
        ), 0)
    INTO total
    FROM movimientos
    WHERE 
        numero_cuenta = cuenta
		AND MONTH(fecha) = MONTH(mes)
        AND YEAR(fecha) = YEAR(mes);
END$$

DELIMITER ;



