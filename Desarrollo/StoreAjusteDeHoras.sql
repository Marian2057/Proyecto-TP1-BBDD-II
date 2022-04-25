DELIMITER $$
CREATE PROCEDURE Ajustes(idc int, idp int, id_p int, difHs int )	
BEGIN
	    
	SELECT total_horas
	
    FROM liqMensual 
	
    WHERE id_participante = id_p
	and id_proyecto=idp 
	and id_cliente =idc;
	
	
	INSERT INTO ajuste(fecha, id_LiqMensual,diferenciaHoras)
    
END;  $$	
DELIMITER ;






