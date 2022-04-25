
DELIMITER $$
CREATE PROCEDURE Liquidacion_mensual()	
BEGIN
	
	/*
    INSERT INTO LiqMensual(total_horas, fecha_inicio, fecha_final, id_cliente, id_proyecto)
	*/
	declare total int;
    declare fecha_inicio date;
    declare fecha_fin date;
    
	SELECT sum(cantidad_hora) as total,fecha_inicio,fecha_fin,id_cliente, id_proyecto     
	FROM rendir_hora 
	WHERE fecha>=fecha_inicio 		
    and fecha <=fecha_fin 		
    and id_cliente  		
    and id_proyecto;
    

END;  $$	
DELIMITER ;


