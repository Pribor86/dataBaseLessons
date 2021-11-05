-- Функции для манипулирования числами

--avg среднее значение ::numeric(10,2) параметры округления( если нужно)
select avg(prod_price) ::numeric(10,3) AS avg_price from products;

--COUNT
SELECT COUNT(cust_email) AS num_cust FROM customers;

--MAX
SELECT MAX(prod_price) AS max_price from products;

--MIN
SELECT MIN(prod_price) AS max_price from products;

--SUM
SELECT SUM(quantity) AS item_orders FROM orderitems;

SELECT SUM(quantity*item_price) AS total_price FROM orderitems;

----

SELECT count(*) AS number_items,
min(prod_price) AS price_min,
max(prod_price) AS price_max,
avg(prod_price) AS price_AVG
FROM products;

SELECT COUNT(*) as num_prods FROM products
WHEre vend_id = 'DLL01';

SELECT vend_id, COUNT(*) AS num_prods FROM products
GROUP BY vend_id;

--HAVING

SELECT cust_id, COUNT(*) As orders FROM Orders
GROUP BY cust_id
HAVING COUNT(*) <= 3;

SELECT vend_id, COUNT(*) AS num_prods FROM products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;


SELECT vend_id, COUNT(*) AS num_prods FROM products
--WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT order_num, COUNT(*) AS items
FROM orderitems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY 2, 1;

--Последовательность запроса в запросе

SELECT order_num FROM orderitems
WHERE prod_id = 'PR00001';

SELECT cust_id FROM orders
WHERE order_num IN (20001,20009);


SELECT cust_id FROM orders
WHERE order_num IN 
(SELECT order_num FROM orderitems
WHERE prod_id = 'PR00001');

--
SELECT cust_name, cust_contact from customers
where cust_id in
(SELECT cust_id FROM orders
WHERE order_num IN 
(SELECT order_num FROM orderitems
WHERE prod_id = 'PR00001'));

---
SELECT COUNT(*) AS orders
from orders
where cust_id = '1001';

SELECT cust_name, cust_state,
(SELECT COUNT(*) from orders
WHERE orders.cust_id = customers.cust_id) AS orders
from customers
ORDER BY cust_name;

--Минимальная цена продукта
SELECT prod_name, prod_price from products
where prod_price IN
(SELECT MIN(prod_price) from products);


--Максимальная цена продукта
SELECT prod_name, prod_price from products
where prod_price IN
(SELECT MAX(prod_price) from products);

--Сколько разных наименований товара
SELECT COUNT(DISTINCT prod_name) AS Count from products;


SELECT COUNT(vend_name) AS vendors_count from vendors;