/*Crea un trigger que registre en una tabla de monitoreo cada vez que un producto supere las 200.000 unidades vendidas acumuladas.

El trigger debe activarse después de insertar una nueva venta y registrar en la tabla el ID del producto, su nombre, la nueva cantidad total de unidades vendidas, y la fecha en que se superó el umbral.*/

CREATE TABLE monitoreo_productos_top(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    nombre_producto VARCHAR(255),
    ventas_totales INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER // $$

CREATE TRIGGER superar_200k
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    DECLARE total INT;

    SELECT SUM(quantity)
    INTO total
    FROM sales
    WHERE product_id = NEW.product_id;

    IF total > 200000 AND NOT EXISTS (
		SELECT 1
        FROM monitoreo_productos_top
        WHERE product_id = NEW.product_id
    ) THEN
        INSERT INTO monitoreo_productos_top (product_id, nombre_producto, ventas_totales)
        SELECT product_id, product_name, total
        FROM products
        WHERE product_id = NEW.product_id;
    END IF;
END;
DELIMITER: //
