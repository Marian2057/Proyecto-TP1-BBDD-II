
DELIMITER $$
	CREATE PROCEDURE Ajustes(in idp int,in idc int, in fecha_inicio date, in fecha_fin date, in ajuste_horas int)	
BEGIN
	declare id_liqMensual int;
 
	SELECT id_liqmensual into id_liqmensual 
    FROM liqMensual 
    where fecha>=fecha_inicio and id_proyecto <=idp and id_cliente <=idc;
    
    INSERT INTO ajuste(fecha, id_LiqMensual,diferenciaHoras)VALUES(curdate(), id_LiqMensual, ajuste_horas );
    
END;  $$	
DELIMITER ;







delimiter $$
create procedure RendicionHoras(in d_inicial date, c_dias int, c_horas decimal
(5,2),d_id_proyecto int, d_id_participante int)
BEGIN
DECLARE cont INT;
SET cont:=0;
WHILE cont<c_dias DO
WHILE ((DAYOFWEEK(d_inicial)=1) or (DAYOFWEEK(d_inicial)=7)) DO
SET d_inicial:=(DATE_ADD(d_inicial, INTERVAL 1 DAY));
END
WHILE;
insert into carga_horas
(dia, hora, id_proyecto, id_participante)
VALUES
(d_inicial, c_horas, d_id_proyecto, d_id_participante);
SET d_inicial:=(DATE_ADD(d_inicial, INTERVAL 1 DAY));
SET cont:= cont +1;
END
WHILE;
END $$

delimiter $$


create procedure CalcularLiquidacionMensual (in usuario int, cliente int, proyecto int, mes int)
BEGIN
DECLARE suma1 int;
if usuario <=>5
THEN
set suma1
=
(SELECT ifNULL(SUM(hora),0)
FROM carga_horas
WHERE id_proyecto=proyecto AND MONTH(dia)=mes);

CREATE TABLE tabla_horas2
(
    id_cliente_t int,
    id_proyecto_t int,
    horas_d decimal default 0
);
insert into tabla_horas2
    (id_cliente_t, id_proyecto_t, horas_d)
VALUES
    (cliente, proyecto, suma1);
SELECT id_proyecto_t, id_cliente_t, horas_d as horas_mensuales
FROM tabla_horas2
GROUP BY id_proyecto_t, id_cliente_t, horas_d
;
END
IF;
END $$
delimiter $$

create procedure CalcularDiferencia (in usuario int, proyecto int, anio int)
BEGIN
DECLARE suma1 int;
DECLARE h_as decimal;
if usuario <=>5
THEN
set
suma1
=
(SELECT ifNULL(SUM(hora),0)
FROM carga_horas
WHERE id_proyecto=proyecto AND YEAR(dia)=anio);
set
h_as
=
(SELECT pack_horas
FROM proyecto
WHERE id=proyecto);

CREATE TABLE tabla_horas3
(
    id_proyecto_t int,
    horas_d decimal default 0,
    horas_a decimal default 0
);
INSERT INTO tabla_horas3
    (id_proyecto_t, horas_d, horas_a)
VALUES
    (proyecto, suma1, h_as);
SELECT id_proyecto_t, horas_d  as horas_trabajadas, horas_a as horas_contratadas,
    (horas_d-horas_a) as horas_extra
FROM tabla_horas3
GROUP BY id_proyecto_t,horas_d,horas_a;

END
IF;
END $$











DELIMITER $$
	CREATE PROCEDURE Ajuste(in idpro int,in idc int, in fecha_inicio date, in fecha_fin date)	
BEGIN
	declare total_hora_mes int;
	SELECT sum(cantidad_hora) as total into total_hora_mes FROM rendir_hora where fecha>=fecha_inicio and fecha <=fecha_fin and id_proyecto = idpro;
    INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_final, id_cliente, id_proyecto)VALUES(total_hora_mes, fecha_inicio, fecha_fin, idc, idpro );
    
END;  $$	
DELIMITER ;

