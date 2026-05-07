-- 1. Destruimos el guardián viejo (para solucionar el Error 1359)
DROP TRIGGER IF EXISTS trg_respaldo_borrado;

CREATE TABLE auditoria_recorridos_borrados (
    id_usuario_afectado INT AUTO_INCREMENT PRIMARY KEY,
    estacion_origen VARCHAR(150),
    fecha_del_borrado DATETIME,
    usuario_bd_que_lo_borro VARCHAR(100)
); 

DELIMITER //

-- 2. Creamos el guardián nuevo y corregido
CREATE TRIGGER trg_respaldo_borrado 
BEFORE DELETE ON recorridos 
FOR EACH ROW 
BEGIN 
    -- Insertamos la "fotocopia" en la tabla secreta correcta
    INSERT INTO auditoria_recorridos_borrados ( 
        id_usuario_afectado, 
        estacion_origen, 
        fecha_del_borrado, 
        usuario_bd_que_lo_borro 
    ) VALUES ( 
        OLD.id_usuario,            -- Salvamos a qué usuario pertenecía 
        OLD.nombre_estacion_origen,-- Salvamos de dónde salió 
        NOW(),                     -- Hora exacta en la que ocurrió el "crimen" 
        USER()                     -- Nombre de la PC/Usuario que ejecutó el DELETE 
    ); 
END; //

DELIMITER ;

-- 1 Simulacro de borrado accidental:
DELETE FROM recorridos WHERE id_usuario = 40050 LIMIT 1;

-- 2 Revisar las cámaras (tu papelera):
SELECT * FROM auditoria_recorridos_borrados;