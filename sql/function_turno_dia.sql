USE ecobici;

DELIMITER //

CREATE FUNCTION fn_turno_dia(fecha DATETIME) 
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
    DECLARE turno VARCHAR(40);
    DECLARE hora_viaje INT;
    
    -- Extraemos solo la hora (del 0 al 23) de la fecha completa
    SET hora_viaje = HOUR(fecha);

    IF hora_viaje >= 6 AND hora_viaje < 12 THEN 
        SET turno = '1. Mañana (06:00 - 11:59)';
    ELSEIF hora_viaje >= 12 AND hora_viaje < 17 THEN 
        SET turno = '2. Tarde (12:00 - 16:59)';
    ELSEIF hora_viaje >= 17 AND hora_viaje < 22 THEN 
        SET turno = '3. Noche - Hora Pico (17:00 - 21:59)';
    ELSE 
        SET turno = '4. Madrugada (22:00 - 05:59)';
    END IF;

    RETURN turno;
END; //

DELIMITER ;

SELECT 
    fecha_origen_recorrido AS Fecha_Exacta,
    HOUR(fecha_origen_recorrido) AS Hora_Extraida,
    fn_turno_dia(fecha_origen_recorrido) AS Turno_Asignado
FROM 
    recorridos
LIMIT 10;