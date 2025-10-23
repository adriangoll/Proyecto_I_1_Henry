/*d) ¿Cuáles son los 10 productos con mayor cantidad de unidades vendidas en todo el catálogo y cuál es su posición dentro de su propia categoría? Utiliza funciones de ventana para identificar el ranking de cada producto en su categoría. Luego, analiza si estos productos son también los líderes dentro de sus categorías o si compiten estrechamente con otros productos de alto rendimiento. ¿Qué observas sobre la concentración de ventas dentro de algunas categorías?*/


WITH ventas_por_producto AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category_id,
        c.categorie_name,
        SUM(s.quantity) AS total_vendido,
        RANK() OVER (
            PARTITION BY p.category_id
            ORDER BY SUM(s.quantity) DESC
        ) AS ranking_categoria
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    GROUP BY 
        p.product_id, 
        p.product_name, 
        p.category_id, 
        c.categorie_name
)
SELECT 
    product_id
    product_name,
    categorie_name,
    total_vendido,
    ranking_categoria
FROM ventas_por_producto
ORDER BY total_vendido DESC
LIMIT 10;
