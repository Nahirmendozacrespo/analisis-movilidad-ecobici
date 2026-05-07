USE ecobici;

DELIMITER //

CREATE PROCEDURE sp_segmentacion_usuarios(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT 
        Perfil_Usuario,
        COUNT(*) AS Total_Usuarios
    FROM (
        SELECT 
            id_usuario,
            CASE 
                WHEN SUM(CASE WHEN DAYOFWEEK(fecha_origen_recorrido) BETWEEN 2 AND 6 THEN 1 ELSE 0 END) > 0 
                 AND SUM(CASE WHEN DAYOFWEEK(fecha_origen_recorrido) IN (1, 7) THEN 1 ELSE 0 END) = 0 
                THEN '1. Commuter (Solo Semana)'
                
                WHEN SUM(CASE WHEN DAYOFWEEK(fecha_origen_recorrido) BETWEEN 2 AND 6 THEN 1 ELSE 0 END) = 0 
                 AND SUM(CASE WHEN DAYOFWEEK(fecha_origen_recorrido) IN (1, 7) THEN 1 ELSE 0 END) > 0 
                THEN '2. Recreativo (Solo Finde)'
                
                ELSE '3. Mixto / Heavy User (Ambos)'
            END AS Perfil_Usuario
        FROM 
            recorridos
        WHERE 
            -- ¡El filtro súper rápido SARGable!
            fecha_origen_recorrido >= fecha_inicio 
            AND fecha_origen_recorrido <= fecha_fin
        GROUP BY 
            id_usuario
    ) AS Clasificacion_Individual
    GROUP BY 
        Perfil_Usuario
    ORDER BY 
        Perfil_Usuario ASC;
END; //

DELIMITER ;

CALL sp_segmentacion_usuarios('2025-01-01', '2025-12-31');
