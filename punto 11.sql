-- punto 11

DELIMITER $$

CREATE PROCEDURE AplicarInteres(
    IN p_porcentaje DECIMAL(5,2),
    IN p_saldo_minimo DECIMAL(10,2)
)
BEGIN
    DECLARE v_cuenta INT;
    DECLARE v_saldo DECIMAL(10,2);
    DECLARE v_interes DECIMAL(10,2);
    DECLARE done INT DEFAULT 0;

    DECLARE cur_cuentas CURSOR FOR
        SELECT numero_cuenta, saldo
        FROM cuentas
        WHERE saldo > p_saldo_minimo;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur_cuentas;

    read_loop: LOOP
        FETCH cur_cuentas INTO v_cuenta, v_saldo;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET v_interes = v_saldo * (p_porcentaje / 100);

        -- Actualizar saldo
        UPDATE cuentas
        SET saldo = saldo + v_interes
        WHERE numero_cuenta = v_cuenta;


        INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
        VALUES (v_cuenta, CURDATE(), 'CREDITO', v_interes);

    END LOOP;

    CLOSE cur_cuentas;

END$$

DELIMITER ;