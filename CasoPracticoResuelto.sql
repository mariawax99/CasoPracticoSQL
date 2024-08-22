/*Explorar la tabla “menu_items” para conocer los productos del menú.
1.- Realizar consultas para contestar las siguientes preguntas:
● Encontrar el número de artículos en el menú.
● ¿Cuál es el artículo menos caro y el más caro en el menú?
● ¿Cuántos platos americanos hay en el menú?
● ¿Cuál es el precio promedio de los platos?
c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados. 1.- Realizar consultas para contestar las siguientes preguntas:
● ¿Cuántos pedidos únicos se realizaron en total?
● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
● ¿Cuándo se realizó el primer pedido y el último pedido?
● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).
e) Una vez que hayas explorado los datos en las tablas correspondientes 
y respondido las preguntas planteadas, realiza un análisis adicional 
utilizando este join entre las tablas. El objetivo es identificar 5 puntos clave 
que puedan ser de utilidad para los dueños del restaurante en el lanzamiento 
de su nuevo menú. 
Para ello, crea tus propias consultas y utiliza los resultados obtenidos 
para llegar a estas conclusiones*/

SELECT * FROM order_details
	SELECT * FROM menu_items

--Encontrar el número de articulos en el menu
--32
SELECT COUNT (menu_item_id)
FROM menu_items;

--El artículo menos caro (5.00) y el más caro (19.95) en el menú 

SELECT MIN(price), MAX(price) 
FROM menu_items;

-- Platos americanos hay en el menú
--6
SELECT COUNT(menu_item_id) 
FROM menu_items
WHERE category = 'American';

--Precio promedio de los platos 
--13.29
SELECT ROUND (AVG(price),2)
FROM menu_items;

--Pedidos únicos se realizaron en total 
--5370
SELECT COUNT(DISTINCT order_id)
FROM order_details;

-- Los 5 pedidos que tuvieron el mayor número de artículos
-- 440,2675,3472,4305,443
SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 5

--Primer pedido y el último pedido
	-- PRIMERO DE ENERO DEL 2023 Y 31 DE MARZO DEL 2023
SELECT MIN(order_date), MAX(order_date)
FROM order_details;

--Pedidos se hicieron entre el '2023-01-01' y el '2023-01-05
-- 308
SELECT COUNT(DISTINCT order_id)
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

SELECT 
    od.order_details_id, 
    od.order_id, 
    od.order_date, 
    od.order_time, 
    od.item_id, 
    mi.item_name, 
    mi.category, 
    mi.price
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id;

/*1) Identificar los artículos más vendidos en el menú:*/
SELECT 
    mi.item_name, 
    mi.category, 
    COUNT(od.item_id) AS total_sold
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY total_sold DESC
LIMIT 5;

/*2) Identificar los días de la semana con más ventas::*/
SELECT 
    TO_CHAR(od.order_date, 'Day') AS day_of_week, 
    COUNT(od.order_id) AS total_orders
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY TO_CHAR(od.order_date, 'Day')
ORDER BY total_orders DESC;

/*3) Análisis del precio promedio por categoría*/
SELECT mi.category, ROUND(AVG(mi.price), 2) AS average_price
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE mi.price IS NOT NULL
GROUP BY mi.category
ORDER BY average_price DESC;

/*4) Identificar los artículos menos vendidos*/
SELECT 
    mi.item_name, 
    mi.category, 
    COUNT(od.item_id) AS total_sold
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE od.item_id IS NOT NULL
GROUP BY mi.item_name, mi.category
ORDER BY total_sold ASC
LIMIT 5;

/*5) Análisis de las ventas de artículos más caros:*/

SELECT 
    mi.item_name, 
    mi.category, 
    mi.price, 
    COUNT(od.item_id) AS total_sold
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE mi.price = (SELECT MAX(price) FROM menu_items)
GROUP BY mi.item_name, mi.category, mi.price;
