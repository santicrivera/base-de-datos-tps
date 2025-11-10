-- punto 7
DELIMITER $$

CREATE PROCEDURE Extraer(IN cuenta INT, IN monto DECIMAL(10,2))
BEGIN
    DECLARE saldo_actual DECIMAL(10,2);

    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE numero_cuenta = cuenta;

    IF monto > 0 AND saldo_actual IS NOT NULL AND saldo_actual >= monto THEN
        UPDATE cuentas
        SET saldo = saldo - monto
        WHERE numero_cuenta = cuenta;
    END IF;
END$$

DELIMITER ;