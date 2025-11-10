-- punto 3
use banco;

DELIMITER $$
create procedure VerCuentas()
begin
select * from cuentas;
end$$

delimiter ;

call VerCuentas