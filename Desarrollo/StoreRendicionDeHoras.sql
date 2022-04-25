DELIMITER $$
	CREATE PROCEDURE RendicionDeHoras(in cantidad_hora INT, in fecha DATE, in id_proyecto int, in id_participante INT, in id_rol INT, in id_cliente INT, in id_detalle_hora INT)	
BEGIN

	INSERT INTO rendir_hora(cantidad_hora, fecha, id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora)
    VALUES(cantidad_hora, fecha, id_proyecto, id_participante, id_rol, id_cliente, id_detalle_hora);   
END;  $$	
DELIMITER ;
