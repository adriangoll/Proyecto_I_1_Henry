/*Selecciona dos consultas del avance 1 y crea los índices que consideres más adecuados para optimizar su ejecución.
Prueba con índices individuales y compuestos, según la lógica de cada consulta. Luego, vuelve a ejecutar ambas consultas y compara los tiempos de ejecución antes y después de aplicar los índices. Finalmente, describe brevemente el impacto que tuvieron los índices en el rendimiento y en qué tipo de columnas resultan más efectivos para este tipo de operaciones.*/

-- CONSULTA 1: Top 5 productos más vendidos y vendedor top por producto

-- PASO 1: Ejecutar EXPLAIN antes de crear índices
EXPLAIN 
WITH top_products AS (
    SELECT 
        product_id,
        SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY product_id
    ORDER BY total_quantity DESC
    LIMIT 5
),
sales_employee AS (
    SELECT 
        s.product_id,
        s.sales_person_id AS employee_id,
        SUM(s.quantity) AS total_sold
    FROM sales s
    WHERE s.product_id IN (SELECT product_id FROM top_products)
    GROUP BY s.product_id, s.sales_person_id
),
ranked_sales AS (
    SELECT 
        product_id,
        employee_id,
        total_sold,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY total_sold DESC) AS rn
    FROM sales_employee
)
SELECT 
    r.product_id,
    p.product_name,
    t.total_quantity,
    r.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    r.total_sold
FROM ranked_sales r
JOIN top_products t ON r.product_id = t.product_id
JOIN employees e ON e.employee_id = r.employee_id
JOIN products p ON p.product_id = r.product_id
WHERE r.rn = 1
ORDER BY t.total_quantity DESC;


-- PASO 2: CREACIÓN DE ÍNDICES PARA CONSULTA 1

-- Índice compuesto en sales para agregaciones por producto
CREATE INDEX idx_sales_product_quantity 
ON sales(product_id, quantity);

-- Índice compuesto para agregaciones por producto y vendedor
CREATE INDEX idx_sales_product_employee_quantity 
ON sales(product_id, sales_person_id, quantity);

-- Índice en employees para joins rápidos
CREATE INDEX idx_employees_id_name 
ON employees(employee_id, first_name, last_name);

-- Índice en products para joins rápidos
CREATE INDEX idx_products_id_name 
ON products(product_id, product_name);


-- PASO 3: EJECUTAR CONSULTA NUEVAMENTE CON EXPLAIN


-- Las imagenes estan en archivo adjunto.