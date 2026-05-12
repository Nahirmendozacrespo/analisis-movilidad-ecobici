🚴‍♂️ Análisis Estratégico: Expansión EcoBici CABA

📋 Resumen del Proyecto

Este proyecto analiza más de 26 millones de viajes del sistema EcoBici entre 2018 y 2025. El objetivo es diseñar una estrategia de expansión hacia la Zona Sur (Comunas 4 y 8) para recuperar el récord histórico de usuarios de 2019.

💡 Key Insights (Descubrimientos Clave)
Perfil del Usuario: La mayor concentración de demanda proviene de generaciones jóvenes (Gen Z y Millennials), dominando los horarios de movilidad laboral (8 AM y 6 PM). (Clasificación basada en edad declarada por el usuario al momento de registro).

Oportunidad en el Sur: Mientras el Norte está consolidado, el Sur presenta un mercado potencial de +400.000 habitantes y 350.000 tránsitos diarios por el nodo Nueva Pompeya.

Cuantificación de Impacto y Business Case
La expansión a Nueva Pompeya no asume demanda; la proyecta mediante un Framework comparativo basado en benchmark operacional.

Benchmark: Se utilizó la estación Constitución (Top 2 del sistema con características de trasbordo masivo similares) para proyectar el comportamiento.

Propuesta: Integrar la salud en la rutina laboral mediante corredores seguros y anclajes en puntos estratégicos como la Estación Pompeya.

🛠️ Stack Tecnológico y Metodología
Extracción y Limpieza (Python): Se utilizó Pandas para procesar el dataset masivo y extraer una muestra representativa de 31.000 viajes.

Podés ver el código de primera limpieza aquí: [https://github.com/Nahirmendozacrespo/analisis-movilidad-ecobici/blob/main/notebooks/01_exploraci%C3%B3n_y_limpieza.ipynb]

  1. Depuración de Anomalías (Outliers):
Previo al muestreo, se aplicaron estrictas reglas de negocio para asegurar la calidad de los datos, eliminando ruidos operativos del sistema EcoBici:

Se excluyeron viajes con una duración menor a 2 minutos (considerados falsos arranques, testeos o devoluciones inmediatas por fallas mecánicas).

Se filtraron viajes con una duración mayor a 180 minutos (considerados outliers por demoras inusuales, extravíos o no devoluciones).

  2. Ingeniería de Características (Feature Engineering):
Se desarrolló una nueva dimensión de análisis basada en el Perfil de Recorrido. A partir de los tiempos y patrones de uso esperados, los viajes fueron clasificados estratégicamente en categorías de propósito humano:

Transporte (Movilidad urbana habitual).

Bienestar (Uso físico y recreativo).

Mental (Desconexión y pausas activas).

  3. Muestreo Estratégico:
Sobre el dataset limpio (base original de 26M de viajes), se extrajo una muestra validada de 31.280 registros. Este muestreo optimizó el rendimiento computacional en Power BI, verificando rigurosamente que se conservara la distribución demográfica y temporal de la población original.

Union y modelado de tablas: Transformaciones SQL ejecutadas sobre entorno local versionado. [https://github.com/Nahirmendozacrespo/analisis-movilidad-ecobici/blob/main/notebooks/05_union_tablas_sql.ipynb]

<img width="686" height="410" alt="image" src="https://github.com/user-attachments/assets/5effe341-893d-43b2-aaad-cba98b221c7e" />

Para garantizar la reproducibilidad del análisis, todo el flujo de transformación fue documentado en un entorno de Google Colab (Python/Pandas), partiendo de los archivos crudos hasta la obtención de la muestra final.

Visualización: Desarrollo de un Dashboard interactivo en Power BI enfocado en el Storytelling de negocios.

📊 Visualización del Dashboard
<img width="712" height="413" alt="image" src="https://github.com/user-attachments/assets/2ad906c9-f384-465a-ba20-bafa7052236e" />

Drive para descargar el pbix. [https://drive.google.com/drive/folders/1hqR2Uf9m-05fDZEeEqVKhFB4C-wSr4QN?usp=sharing]

📊 Datos públicos del Gobierno de la Ciudad de Buenos Aires, Argentina. 

Bicicletas Públicas - dataset
[https://data.buenosaires.gob.ar/dataset/bicicletas-publicas]

