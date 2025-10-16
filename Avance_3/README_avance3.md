# Análisis de Ventas - Avance 3

Este notebook (`Avance3.ipynb`) contiene un proceso completo de análisis de datos de ventas, desde la carga y exploración de los archivos hasta la preparación del dataset final para modelado.

## Contenido.

1. **Importación de librerías**  
   Se importan las librerías necesarias, principalmente **Pandas**, para la manipulación y análisis de datos:
      - **Pandas**
      - **Google Colab / Drive**

2. **Montaje del entorno de trabajo**  
   Se conecta Google Drive para acceder a los archivos de datos almacenados, porque se trabajó con Google Colaboratory.

3. **Carga de archivos**  
   Se extrae la ruta del archivo en Drive y se crean los DataFrames con la información de ventas, productos y empleados.

4. **Análisis exploratorio**  
   Se inspecciona la estructura, tipos de datos y contenido de los DataFrames, identificando posibles inconsistencias y verificando relaciones entre tablas.

5. **Cálculo de precios reales de venta**  
   Ya que el campo `TotalPrice` no tenía valores válidos, se calculó el valor real de cada venta utilizando la información de precios  desde la tabla de productos, generando una columna `TotalPriceCalculated`.

6. **Detección de outliers**  
   Se identifican valores atípicos en la columna `TotalPriceCalculated` mediante el método del rango intercuartílico (IQR) y se marcan en una nueva columna `IsOutlier`.

7. **Análisis temporal de ventas**  
   A partir de la fecha de venta (`SalesDate`), se clasifica cada registro como **“Entre semana”** o **“Fin de semana”**, permitiendo comparar los volúmenes de venta según el tipo de día.

8. **Cálculo de edad y experiencia**  
   Se calcula la edad del empleado al momento de su contratación y los años de experiencia al momento de cada venta.

9. **Preparación del dataset final**  
   Se combinan las tablas relevantes, aplicando transformaciones y cálculos adicionales, con el objetivo de obtener un conjunto de datos limpio y estructurado para futuros análisis o modelado.

- **Pandas**
- **Google Colab / Drive**

## Resultados

El notebook finaliza con un dataset procesado que incluye:
- Valores de venta corregidos.  
- Identificación de outliers.  
- Clasificación temporal de ventas.  
- Información complementaria de empleados (edad y experiencia).  

Este conjunto de datos queda listo para su uso en análisis descriptivo o predictivo posterior.


###
Proyecto desarrollado en Python, orientado al análisis y procesamiento de datos utilizando herramientas de Pandas.
