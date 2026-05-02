USE ecobici;

SELECT 
    recorridos.duracion_recorrido,  
    nombre_estacion_origen, 
    usuarios.edad_usuario,
    genero_usuario
FROM 
    recorridos
JOIN 
    usuarios
ON 
    recorridos.id_usuario = usuarios.id_usuario
LIMIT 10;