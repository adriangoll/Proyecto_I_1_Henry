/*b) Entre los 5 productos más vendidos, ¿cuántos clientes únicos compraron cada uno y qué proporción representa sobre el total de clientes? Analiza si ese porcentaje sugiere que el producto fue ampliamente adoptado entre los clientes o si, por el contrario, fue comprado por un grupo reducido que generó un volumen alto de ventas. Compara los porcentajes entre productos e identifica si alguno de ellos depende más de un segmento específico de clientes*/

WITH top_products AS (
    SELECT 
        product_id,
        SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY product_id
    ORDER BY total_quantity DESC
    LIMIT 5
),
unique_customers AS (
    SELECT 
        s.product_id,
        COUNT(DISTINCT s.customer_id) AS unique_customer
    FROM sales s
    WHERE s.product_id IN (SELECT product_id FROM top_products)
    GROUP BY s.product_id
),
total_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS total_customer
    FROM sales
)
SELECT 
    u.product_id,
    p.product_name,
    u.unique_customer,
    t.total_customer,
    concat
    (ROUND((u.unique_customer *100 / t.total_customer_count), 2),
    '%'
    )
    AS customer_proportion
FROM unique_customers u
JOIN total_customers t ON u.product_id = u.product_id
JOIN products p ON p.product_id = u.product_id
ORDER BY u.unique_customer DESC;
