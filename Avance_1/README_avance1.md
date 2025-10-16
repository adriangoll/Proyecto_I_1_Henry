# Consultas SQL - Análisis de Ventas

Este conjunto de archivos contiene tres consultas SQL que analizan los productos y vendedores con mejor desempeño, así como el comportamiento de los clientes y las categorías más relevantes dentro de las ventas totales.

Cada consulta aborda un aspecto diferente del análisis y está acompañada de una breve interpretación de resultados.

---

## 📊 Consulta 1 - Productos y vendedores destacados

**Archivo:** `a_top_productos_y_vendedores.sql`

**Objetivo:**  
Identificar los **5 productos más vendidos** (por cantidad total) y determinar **qué vendedor vendió más unidades de cada uno**.

**Descripción técnica:**
- Se calcula la cantidad total de unidades vendidas por producto.  
- Se usa una función de ventana (`ROW_NUMBER()`) para encontrar el vendedor con mayor volumen por producto.  
- Se muestran los 5 productos más vendidos junto con su vendedor más destacado.

**Análisis del resultado:**  
Devon Brewer aparece como el vendedor principal en **2 de los 5 productos más vendidos**, lo que muestra un desempeño sobresaliente.  
Ningún vendedor representa más del **10%** de las ventas totales de su producto, lo que indica que las ventas están bien distribuidas entre el equipo.

---

## 👥 Consulta 2 - Distribución de clientes por producto

**Archivo:** `b_clientes_por_producto.sql`

**Objetivo:**  
Determinar cuántos **clientes únicos** compraron cada uno de los 5 productos más vendidos y qué porcentaje representan respecto al total de clientes.

**Descripción técnica:**
- Se cuenta la cantidad de clientes distintos por producto (`COUNT(DISTINCT customer_id)`).
- Se calcula la proporción de esos clientes sobre el total de clientes.
- Se comparan los resultados entre productos para entender si el éxito de ventas proviene de una base amplia de clientes o de un grupo reducido con alto volumen de compra.

**Análisis del resultado:**  
El porcentaje de clientes varía según el producto, lo que permite identificar si un producto tiene una **alta adopción general** o depende de **un segmento específico**.  
Esto ayuda a entender la fidelidad o concentración de ventas por tipo de producto.

---

## 🏷️ Consulta 3 - Relevancia por categoría

**Archivo:** `c_productos_por_categoria.sql`

**Objetivo:**  
Analizar a qué **categorías** pertenecen los 5 productos más vendidos y qué proporción representan dentro del total de su categoría.

**Descripción técnica:**
- Se calculan las ventas totales por categoría.
- Se determina el peso de cada producto dentro de su categoría (`product_quantity / category_total_quantity`).
- Se utiliza una función de ventana para ordenar los productos y obtener el top dentro de cada categoría.

**Análisis del resultado:**  
Permite ver qué productos dominan su categoría y si las ventas están concentradas en pocos artículos o más equilibradas entre varios.  
Esta información es útil para estrategias de catálogo, inventario o marketing.

---

## 🥇 Consulta 4 - Ranking general y posición en categoría

**Archivo:** `d_ranking_general_y_categoria.sql`

**Objetivo:**  
Identificar los **10 productos con mayor cantidad de unidades vendidas** en todo el catálogo y mostrar su **posición dentro de su propia categoría**.

**Descripción técnica:**
- Se calcula el total de unidades vendidas por producto.  
- Se aplica la función de ventana `RANK()` para establecer el orden de cada producto dentro de su categoría.  
- Se listan los 10 productos con mayor volumen global junto a su ranking en la categoría.

**Análisis del resultado:**  
La consulta permite observar si los productos líderes a nivel general también dominan su categoría o si compiten de cerca con otros de rendimiento similar.  
En algunas categorías puede notarse una **alta concentración de ventas** en pocos artículos, mientras que en otras la distribución es más equilibrada.

---

## 🧠 Resumen general

Las tres consultas combinadas ofrecen una visión clara sobre:
- Qué productos generan más ventas.  
- Qué vendedores y clientes tienen mayor impacto.  
- Cómo se distribuyen las ventas dentro de cada categoría.

---

## ⚙️ Requisitos y entorno

- Base de datos con las tablas:  
  `sales`, `products`, `employees`, `customers`, `categories`
- Lenguaje: **SQL (MySQL)**
- Ejecutado con Workbrench Mysql.

---

