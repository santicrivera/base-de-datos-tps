-- punto 8
DELIMITER $$

CREATE TRIGGER actualizar_saldo_despues_movimiento
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    IF NEW.tipo = 'CREDITO' THEN
        UPDATE cuentas
        SET saldo = saldo + NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
        
    ELSEIF NEW.tipo = 'DEBITO' THEN
        UPDATE cuentas
        SET saldo = saldo - NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    END IF;
END$$

DELIMITER ;