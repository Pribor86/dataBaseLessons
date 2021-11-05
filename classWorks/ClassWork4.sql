-- Объеденение таблиц

select vend_name, prod_name, prod_price 
from vendors, products 
where vendors.vend_id = products.vend_id;

--JOIN

select prod_name, vend_name, prod_price, quantity 
from orderitems, products, vendors 
where vendors.vend_id = products.vend_id 
and 
orderitems.prod_id = products.prod_id 
and 
order_num = 20013;

select vend_name, prod_name, prod_price, quantity
from vendors
INNER JOIN products
ON vendors.vend_id = products.vend_id
INNER JOIN  orderitems
ON orderitems.prod_id=products.prod_id
WHERE order_num= 20013;

SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id=orders.cust_id
AND orderitems.order_num=orders.order_num
AND prod_id='RGAN01';

/*
select rtrim(vend_name) || '(' || rtrim(vend_country) ||')' as vend_title 
from vendors 
order by vend_name;
*/

-- Те кто работает в одной фирме
--( если допустим знаем чувака, 
--узнаем где он работает и потом узнаем 
--кто работает с ним в одной и той же фирме)
SELECT cust_id, cust_name, cust_contact
FROM customers
WHERE cust_name=(SELECT cust_name
FROM customers
where cust_contact='Jim Jones');

SELECT cust_name, cust_contact
FROM customers
where cust_contact='Jim Jones';

--расширеное объеденение

SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM customers c1, customers c2
WHERE c1.cust_name = c2.cust_name
AND c2.cust_contact = 'Jim Jones';


--Естевственное объеденение()
SELECT C.*, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM customers C, orders O, orderitems OI
WHERE C.cust_id = O.cust_id
AND OI.order_num = O.order_num
AND prod_id = 'RGAN01';


--Внутреннее объеденение

SELECT customers.cust_id, orders.order_num
FROM customers
INNER JOIN  orders
ON customers.cust_id = orders.cust_id;

SELECT customers.cust_id, orders.order_num
FROM customers
LEFT OUTER JOIN  orders
ON customers.cust_id = orders.cust_id;

SELECT customers.cust_id, orders.order_num
FROM customers, orders
where customers.cust_id = orders.cust_id;

SELECT customers.cust_id, 
COUNT(Orders.order_num) AS num_ord
FROM customers INNER JOIN orders
ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id
ORDER BY customers.cust_id DESC ;

SELECT customers.cust_id, cust_name
FROM customers INNER JOIN orders
ON customers.cust_id = orders.cust_id;
GROUP BY customers.cust_id
ORDER BY customers.cust_id DESC ;


-- Комбинированые запросы
-- UNION должен содержать 2 и более запроса SELECT
-- должен содержать одни и теже  столбцы в одном и том же порядке

SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_state IN ('IL','IN','MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_name = 'Fun4all';

SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_state IN ('IL','IN','MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_name = 'Fun4all';

select cust_name, cust_contact, cust_email 
from customers 
where cust_state in ( 'IL', 'IN', 'MI') 
or cust_name = 'Fun4All'