-- punto 4 


delimiter $$

create procedure CuentasConSaldoMayorQue (in limite DECIMAL (10,2))
begin
SELECT * FROM cuentas
where saldo > limite;
end$$

delimiter ;

call CuentasConSaldoMayorQue(2300)


