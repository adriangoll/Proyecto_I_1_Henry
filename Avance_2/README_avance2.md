# Monitoreo de Ventas y Optimización de Consultas

Aquí el objetivo fue registrar automáticamente productos que superan cierto umbral de ventas, realizar análisis de las ventas y optimizar consultas en MySQL mediante índices.

---

## 1. Trigger de monitoreo de productos

- Se creó una tabla llamada `monitoreo_productos_top` que almacena:  
  - ID del producto  
  - Nombre del producto  
  - Cantidad total de unidades vendidas  
  - Fecha en que se superó el umbral

- Se implementó un trigger que se activa **después de insertar una venta**.  
- Cada vez que un producto supera las 200.000 unidades vendidas acumuladas, el trigger registra automáticamente la información en la tabla de monitoreo.  

---

## 2. Inserción de venta de prueba

- Se registró una venta de prueba con un vendedor, cliente y producto específico.  
- Al insertar la venta, el trigger se activa y, si corresponde, agrega el producto a la tabla de monitoreo.  
- Se realizó una consulta para revisar los registros en la tabla de monitoreo y verificar el funcionamiento del trigger.  
- Se analizó brevemente el resultado, confirmando que el trigger funciona correctamente y registra los productos que superan el umbral.

---

## 3. Consultas de análisis y optimización

- Se realizó una consulta para obtener los **5 productos más vendidos** y el **vendedor top por cada producto**.  
- Se aplicaron índices en las columnas más utilizadas en las agregaciones y joins para mejorar el rendimiento:  
  - Índices compuestos en ventas para facilitar el cálculo de totales por producto y por vendedor.  
  - Índices en empleados y productos para acelerar las operaciones de unión (joins) con la tabla de ventas.  
- Se compararon los tiempos de ejecución antes y después de aplicar los índices, verificando mejoras en rendimiento.  
- Se analizó el impacto de los índices, destacando que son más efectivos en columnas de tipo numérico que participan en filtrado, agregaciones o joins.  

---

## 4. Observaciones finales

- El proyecto permite monitorear automáticamente productos con altas ventas y analizar los datos de manera eficiente.  
- La creación de índices es fundamental para mejorar el rendimiento en tablas grandes y consultas complejas.  
- Se recomienda tomar registros de tiempos de ejecución y resultados antes y después de aplicar índices para documentar el impacto de la optimización.
