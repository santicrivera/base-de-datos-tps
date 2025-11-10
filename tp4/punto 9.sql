-- punto 9
DROP TRIGGER IF EXISTS actualizar_saldo_despues_movimiento;

DELIMITER $$

CREATE TRIGGER actualizar_saldo_y_historial
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    DECLARE saldo_anterior DECIMAL(10,2);
    DECLARE saldo_actual   DECIMAL(10,2);

    SELECT saldo INTO saldo_anterior
    FROM cuentas
    WHERE numero_cuenta = NEW.numero_cuenta;

    IF NEW.tipo = 'CREDITO' THEN
        SET saldo_actual = saldo_anterior + NEW.importe;
    ELSEIF NEW.tipo = 'DEBITO' THEN
        SET saldo_actual = saldo_anterior - NEW.importe;
    END IF;

    UPDATE cuentas
    SET saldo = saldo_actual
    WHERE numero_cuenta = NEW.numero_cuenta;

    INSERT INTO historial_movimientos (
        numero_cuenta,
        numero_movimiento,
        saldo_anterior,
        saldo_actual
    ) VALUES (
        NEW.numero_cuenta,
        NEW.numero_movimiento,
        saldo_anterior,
        saldo_actual
    );

END$$

DELIMITER ;