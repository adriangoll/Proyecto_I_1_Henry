/*c) ¿A qué categorías pertenecen los 5 productos más vendidos y qué proporción representan dentro del total de unidades vendidas de su categoría? Utiliza funciones de ventana para comparar la relevancia de cada producto dentro de su propia categoría.*/


-- Top 5 productos más vendidos

WITH top_products AS (
    SELECT 
        product_id,
        SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY product_id
    ORDER BY total_quantity DESC
    LIMIT 5
),

-- Totales de venta por categoría (toda la categoría, no solo top)
category_totals AS (
    SELECT 
        p.category_id,
        SUM(s.quantity) AS category_total_quantity
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category_id
),

--  Ventas por producto del top 5 con su categoría
category_sales AS (
    SELECT 
        p.category_id,
        s.product_id,
        SUM(s.quantity) AS product_quantity
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    WHERE s.product_id IN (SELECT product_id FROM top_products)
    GROUP BY p.category_id, s.product_id
),

--  Ranking y proporción dentro de cada categoría
category_ranked AS (
    SELECT 
        cs.category_id,
        cs.product_id,
        cs.product_quantity,
        ct.category_total_quantity,
        (cs.product_quantity * 100.0 / ct.category_total_quantity) AS product_proportion,
        ROW_NUMBER() OVER (PARTITION BY cs.category_id ORDER BY cs.product_quantity DESC) AS rn
    FROM category_sales cs
    JOIN category_totals ct ON cs.category_id = ct.category_id
)

-- producto top de cada categoría con proporción
SELECT 
	cr.product_id,
    p.product_name,
    c.categorie_name,
    cr.product_quantity,
    cr.category_total_quantity,
    CONCAT(ROUND(cr.product_proportion, 2), '%') AS product_proportion
FROM category_ranked cr
JOIN categories c ON cr.category_id = c.category_id
JOIN products p ON cr.product_id = p.product_id
WHERE cr.rn = 1
ORDER BY product_proportion DESC;
