USE ecobici;

CREATE VIEW vista_bienestar_millennials AS
SELECT 
    u.genero_usuario,
    u.edad_usuario,
    'Millennials Jóvenes' AS Generacion,
    r.nombre_estacion_origen,
    r.duracion_recorrido
FROM 
    recorridos r
JOIN 
    usuarios u ON r.id_usuario = u.id_usuario
WHERE 
    r.duracion_recorrido > 30 
    AND u.edad_usuario BETWEEN 25 AND 34;