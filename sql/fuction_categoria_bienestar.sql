USE ecobici;

DELIMITER //

CREATE FUNCTION fn_clasificar_bienestar(minutos INT) 
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
    DECLARE etiqueta VARCHAR(40);

    IF minutos >= 2 AND minutos <= 26 THEN 
        SET etiqueta = '1. Transporte Urbano (2-26 min)';
    ELSEIF minutos >= 27 AND minutos <= 45 THEN 
        SET etiqueta = '2. Bienestar Fisico (27-45 min)';
    ELSEIF minutos >= 46 AND minutos <= 180 THEN 
        SET etiqueta = '3. Bienestar Mental (46-180 min)';
    ELSE 
        SET etiqueta = '4. Fuera de Rango / Error';
    END IF;

    RETURN etiqueta;
END; //

DELIMITER ;

SELECT 
    CASE 
        WHEN duracion_recorrido >= 2 AND duracion_recorrido <= 26 THEN '1. Transporte Urbano (2-26 min)'
        WHEN duracion_recorrido >= 27 AND duracion_recorrido <= 45 THEN '2. Bienestar Fisico (27-45 min)'
        WHEN duracion_recorrido >= 46 AND duracion_recorrido <= 180 THEN '3. Bienestar Mental (46-180 min)'
        ELSE '4. Fuera de Rango / Error'
    END AS Categoria_Bienestar,
    COUNT(*) AS Total_Viajes
FROM 
    recorridos 
GROUP BY 
    Categoria_Bienestar
ORDER BY 
    Categoria_Bienestar ASC;