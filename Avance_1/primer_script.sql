/*a) ¿Cuáles fueron los 5 productos más vendidos (por cantidad total), y cuál fue el vendedor que más unidades vendió de cada uno? Una vez obtenga los resultados, en el análisis responde: ¿Hay algún vendedor que aparece más de una vez como el que más vendió un producto? ¿Algunos de estos vendedores representan más del 10% de la ventas de este producto?*/

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
    concat(e.first_name,' ', e.last_name) as employee_name,
    r.total_sold
    
FROM ranked_sales r
join top_products t on r.product_id = t.product_id
join employees e on e.employee_id = r.employee_id
JOIN products p ON p.product_id = r.product_id
WHERE r.rn = 1
ORDER BY t.total_quantity DESC;


/* Respuesta Analisis:
Devon Brewer es el vendedor que más productos ha vendido en 2 de los 5 productos más   vendidos, lo que indica que es un vendedor destacado en la empresa. 
Además, en ninguno de los productos mas vendidos  Devon Brewer  representa más del 10% de las ventas totales, ni ningun otro vendedor lo que sugiere que tiene una influencia significativa en las ventas de esos productos específicos.