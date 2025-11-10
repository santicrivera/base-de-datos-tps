-- punto 10

DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(
    IN p_cuenta INT,
    OUT p_total DECIMAL(10,2)
)
BEGIN
    DECLARE v_importe DECIMAL(10,2);
    DECLARE v_tipo ENUM('CREDITO', 'DEBITO');
    DECLARE v_fecha DATE;
    DECLARE done INT DEFAULT 0;


    DECLARE cur_movimientos CURSOR FOR
        SELECT tipo, importe, fecha
        FROM movimientos
        WHERE numero_cuenta = p_cuenta
          AND MONTH(fecha) = MONTH(CURDATE())
          AND YEAR(fecha) = YEAR(CURDATE());

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Inicializar total
    SET p_total = 0;

    -- Abrir cursor
    OPEN cur_movimientos;

    read_loop: LOOP
        FETCH cur_movimientos INTO v_tipo, v_importe, v_fecha;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF v_tipo = 'CREDITO' THEN
            SET p_total = p_total + v_importe;
        ELSEIF v_tipo = 'DEBITO' THEN
            SET p_total = p_total - v_importe;
        END IF;
    END LOOP;

    CLOSE cur_movimientos;

END$$

DELIMITER ;