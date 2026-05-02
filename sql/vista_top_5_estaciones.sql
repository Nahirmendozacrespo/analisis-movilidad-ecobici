USE ecobici;
-- Creamos un index porque solo con la vista no logra procesar la cantidad de datos. 
CREATE INDEX idx_estacion_origen ON recorridos(nombre_estacion_origen);
CREATE INDEX idx_estacion_destino ON recorridos_historico(nombre_estacion_destino);

-- Queremos ver el tp 5 de estaciones de origen y destino. 
CREATE VIEW vista_estaciones_top_extremos AS
(SELECT 
    'Origen' AS Tipo, 
    nombre_estacion_origen AS Estacion, 
    COUNT(*) AS Total_Viajes
 FROM recorridos
 GROUP BY nombre_estacion_origen
 ORDER BY Total_Viajes DESC
 LIMIT 5)
UNION ALL
(SELECT 
    'Destino' AS Tipo, 
    nombre_estacion_destino AS Estacion, 
    COUNT(*) AS Total_Viajes
 FROM recorridos
 GROUP BY nombre_estacion_destino
 ORDER BY Total_Viajes DESC
 LIMIT 5);
