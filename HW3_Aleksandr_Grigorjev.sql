--1. Показать наименование, цену и описание для всех товаров.

SELECT prod_name, prod_price, prod_desc
FROM products;

--2. Показать данные всех поставщиков.

SELECT * FROM vendors;

--3. Показать данные всех клиентов.

SELECT * FROM customers;

--4. Кто поставляет King doll?

SELECT prod_name, vend_name
FROM products
JOIN vendors
ON vendors.vend_id = products.vend_id
where prod_name = 'King doll';

--5. Кто заказал Queen doll?

select cust_name, prod_name
FROM products
JOIN orderitems
ON products.prod_id = orderitems.prod_id
JOIN orders
ON orderitems.order_num = orders.order_num
JOIN customers ON orders.cust_id = customers.cust_id
WHERE prod_name = 'Queen doll';

--6. Какой товар самый дешёвый?

SELECT * from products
where prod_price IN
(SELECT MIN(prod_price) from products);

--7. Какой товар самый дорогой?

SELECT * from products
where prod_price IN
(SELECT MAX(prod_price) from products);

--8. Сколько всего наименований товаров?

SELECT COUNT(DISTINCT prod_name) AS CountProd from products;

--9. Сколько всего поставщиков?

SELECT COUNT(DISTINCT vend_name) AS CountVend from vendors;

--10. Сколько всего клиентов, имеющих адреса электронной почты?

SELECT COUNT(DISTINCT cust_name) AS CountCust from customers
WHERE cust_email IS NOT NULL;

--11. Показать без повторений все товары, которые когда-либо были заказаны.

SELECT DISTINCT orderitems.prod_id, prod_name 
FROM orderitems
JOIN products
ON orderitems.prod_id = products.prod_id;

--12. Узнать, какие товары не были ни разу заказаны.

SELECT prod_name, products.prod_id FROM products
LEFT JOIN orderitems
ON products.prod_id = orderitems.prod_id
WHERE order_num IS NULL;

--13. Узнать, товары каких поставщиков заказывал клиент Village Toys?

SELECT DISTINCT vendors.vend_name FROM vendors
JOIN products ON products.vend_id = vendors.vend_id
JOIN orderitems ON products.prod_id = orderitems.prod_id
JOIN orders ON orderitems.order_num = orders.order_num
JOIN customers ON orders.cust_id = customers.cust_id
WHERE cust_name = 'Village Toys';

--второй вариант через SELECT 

SELECT vend_name FROM vendors
WHERE vend_id IN
(SELECT vend_id FROM products
WHERE prod_id IN
(SELECT prod_id FROM orderitems
WHERE order_num IN
(SELECT order_num FROM orders
WHERE cust_id IN
(SELECT cust_id FROM customers
WHERE cust_name = 'Village Toys'))));

--14. Узнать, кто из клиентов не делал заказов.

SELECT customers.cust_id, cust_name, 
cust_contact, cust_country, cust_email 
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
WHERE order_num IS NULL;

--15. Узнать, товары какого поставщика чаще всего заказывают.

--первый вариант

SELECT vend_name, COUNT(*) vc FROM orderitems oi
INNER JOIN products p ON p.prod_id = oi.prod_id
INNER JOIN vendors v ON v.vend_id = p.vend_id
GROUP BY v.vend_name
ORDER BY vc DESC 
LIMIT 1;

-- Второй вариант я считаю более правильный, 
--так как если будет два поставщика с одинаковым числом заказов, 
--первый вариант не выдаст верный результат, 
--а покажет только одного поставщика.

--второй вариант

SELECT vend_name, COUNT(*) AS vc 
FROM orderitems oi
INNER JOIN products p ON p.prod_id = oi.prod_id
INNER JOIN vendors v ON v.vend_id = p.vend_id
GROUP BY vend_name
HAVING count(*) =(select  MAX(myCount) FROM 
(
SELECT vend_name,COUNT(*) AS myCount 
FROM orderitems oi
INNER JOIN products p ON p.prod_id = oi.prod_id
INNER JOIN vendors v ON v.vend_id = p.vend_id
GROUP BY vend_name
) as myCount);

--16. Показать, на какую сумму сделал заказы каждый из клиентов.

SELECT cust_name, customers.cust_id, SUM(quantity * item_price) AS totalprice
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
LEFT JOIN orderitems
ON orders.order_num = orderitems.order_num
GROUP BY Customers.cust_id;

--Или такой вариант, в зависимости что имелось ввиду order_item и quantity

SELECT cust_name, customers.cust_id, SUM(order_item * item_price) AS totalprice
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
LEFT JOIN orderitems
ON orders.order_num = orderitems.order_num
GROUP BY Customers.cust_id;

--17. Узнать, у кого из клиентов самое большое число заказов.

SELECT customers.cust_id, customers.cust_name, 
COUNT(orders.order_num) AS oc
FROM customers
JOIN orders
ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id
HAVING count(*) =( SELECT MAX(order_counter) FROM
( 
SELECT customers.cust_id, customers.cust_name, 
COUNT(orders.order_num) AS order_counter
FROM customers
JOIN orders
ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id
) AS myCounter);

--18. Добавить нового клиента.

INSERT INTO Customers(
	cust_id, cust_name, cust_address,
	cust_city, cust_state, cust_zip,
	cust_country, cust_contact, cust_email)
VALUES('1000000006', 'Baby Shop', 
'Narva mnt 11', 'Tallinn', 
'MI', '12342', 'Estonia', 
'Aleksei Saikin', 'saikin@gmail.com'
);

--19. Переименовать клиента Fun4All с адресом 829 Riverside Drive в клиента
--All4Fun с тем же адресом.
--Какие еще изменения необходимо внести в базу данных?

UPDATE customers 
SET cust_name = 'All4Fun' 
WHERE cust_name = 'Fun4All' AND cust_address = '829 Riverside Drive';

--20. Удалить из базы данных клиента Fun4All. Обеспечить ссылочную
--целостность базы данных.

DELETE FROM orderitems
WHERE order_num IN (
	SELECT order_num FROM orders 
	WHERE cust_id = (
		SELECT cust_id FROM customers
		WHERE cust_name = 'Fun4All'
	));

/*
Так как я использую PostgreSQL, то что б удалить каскадно,
нуджно модифицировать все таблицы и поместить в них поле ON DELETE CASCADE,
либюо как я сделал в примере, через вложеный запрос
*/
