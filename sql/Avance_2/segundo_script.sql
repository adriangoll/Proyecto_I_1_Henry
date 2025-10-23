/*registra una venta correspondiente al vendedor con ID 9, al cliente con ID 84, del producto con ID 103, por una cantidad de 1.876 unidades y un valor de 1200 unidades.

Consulta la tabla de monitoreo, toma captura de los resultados y realiza un análisis breve de lo ocurrido.*/

INSERT INTO sales (sales_person_id, customer_id, product_id, quantity, total_price)
VALUES (9, 84, 103, 1876, 1200);

SELECT  * FROM monitoreo_productos_top