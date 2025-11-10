-- punto 6

DELIMITER $$

CREATE PROCEDURE Depositar(IN cuenta INT, IN monto DECIMAL(10,2))
BEGIN
    DECLARE saldo_actual DECIMAL(10,2);

    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE numero_cuenta = cuenta;

    IF monto > 0 AND saldo_actual IS NOT NULL THEN
        UPDATE cuentas
        SET saldo = saldo + monto
        WHERE numero_cuenta = cuenta;
    END IF;
END$$

DELIMITER ;