USE ecobici;

DROP TRIGGER IF EXISTS trg_bloqueo_viajes_invalidos;

DELIMITER //

CREATE TRIGGER trg_bloqueo_viajes_invalidos
BEFORE INSERT ON recorridos
FOR EACH ROW
BEGIN
    -- Regla 1: No puede haber viajes sin un usuario (Usuarios fantasma)
    IF NEW.id_usuario IS NULL OR NEW.id_usuario = 0 THEN
        -- Aquí lanzamos el error personalizado y bloqueamos el INSERT
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR CRÍTICO: Intento de registrar un viaje sin ID de usuario válido.';
    END IF;

    -- Regla 2: Un viaje no puede durar más de 24 horas (1440 minutos)
    IF NEW.duracion_recorrido > 1440 THEN
        -- Lanzamos otro error distinto
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ALERTA SEGURIDAD: La duración supera las 24 horas. Operación cancelada.';
    END IF;

END; //

DELIMITER ;

INSERT INTO recorridos (id_usuario, nombre_estacion_origen, duracion_recorrido, fecha_origen_recorrido)
VALUES (5555, '001 - Facultad de Derecho', 2000, NOW());