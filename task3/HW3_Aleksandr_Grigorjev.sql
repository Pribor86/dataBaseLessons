--1. Показать наименование, цену и описание для всех товаров.
SELECT prod_name, prod_price, prod_desc
FROM products;
/*
Lego City 17425,25.99,Lego City Shopping
Lego Minecraft 19115,49.99,Lego Minecraft Underground
Plastic car,3.99,Plastic car for kids under 3y.
Plastic doll,6.99,Plastic doll for girls under 4y
Soft Bear,9.99,Small soft bear toys for everyone.
Boys set,25.99,Set of police equipment for kids under 6y
8 inch teddy bear,5.99,8 inch teddy bear, comes with cap and jacket
12 inch teddy bear,8.99,12 inch teddy bear, comes with cap and jacket
18 inch teddy bear,11.99,18 inch teddy bear, comes with cap and jacket
Fish bean bag toy,3.49,Fish bean bag toy, complete with bean bag worms with which to feed it
Bird bean bag toy,3.49,Bird bean bag toy, eggs are not included
Rabbit bean bag toy,3.49,Rabbit bean bag toy, comes with bean bag carrots
Raggedy Ann,4.99,18 inch Raggedy Ann doll
King doll,9.49,12 inch king doll with royal garments and crown
Queen doll,9.49,12 inch queen doll with royal garments and crown
Lego City 17425,25.99,Lego City Shopping
*/

--2. Показать данные всех поставщиков.

SELECT * FROM vendors;

/*
BRS01,Lego,Ole Kirks Plads 1,Billund,,7190,Denmark
BRS02,Plastic Toys,Tartu mnt 45,Viljandi,V-M,18913,Estonia
BRS03,Fisher-Price,636 Girard Avenue,East Aurora,NY,14052,USA
BRE02,Bear Emporium,500 Park Street,Anytown,OH,44333,USA
DLL01,Doll House Inc.,555 High Street,Dollsville,CA,99999,USA
FRB01,Furball Inc.,1000 5th Avenue,New York,NY,11111,USA
FNG01,Fun and Games,42 Galaxy Road,London,null,N16 6PS,England
JTS01,Jouets et ours,1 Rue Amusement,Paris,null,45678,France
*/


--3. Показать данные всех клиентов.

SELECT * FROM customers;
/*
1002,Mänguasjad,Tallinna mnt 11,Tartu,T-M,15515,Estonia,Eduard Mooses,sales@manguasjad.ee
1003,X-Mäng,Kivila 13,Rakvere,L-V,19183,Estonia,Alla Elovika,alla.elovika@xmang.com
1000000001,Village Toys,200 Maple Lane,Detroit,MI,44444,USA,John Smith,sales@villagetoys.com
1000000002,Kids Place,333 South Lake Drive,Columbus,OH,43333,USA,Michelle Green,null
1000000003,Fun4All,1 Sunny Place,Muncie,IN,42222,USA,Jim Jones,jjones@fun4all.com
1000000004,Fun4All,829 Riverside Drive,Phoenix,AZ,88888,USA,Denise L. Stephens,dstephens@fun4all.com
1000000005,The Toy Store,4545 53rd Street,Chicago,IL,54545,USA,Kim Howard,null
1001,Kids Zone,Narva mnt 1,Tallinn,MI,19132,Estonia,Valentina Pupkina,valentina.pupkina@kidszone.ee
*/


--4. Кто поставляет King doll?
SELECT prod_name, vend_name
FROM products
JOIN vendors
ON vendors.vend_id = products.vend_id
where prod_name = 'King doll';

/*
King doll,Fun and Games
*/

--5. Кто заказал Queen doll?


SELECT cust_name, prod_name
FROM products
JOIN orderitems
ON products.prod_id = orderitems.prod_id
JOIN orders
ON orderitems.order_num = orders.order_num
JOIN customers ON orders.cust_id = customers.cust_id
WHERE prod_name = 'Queen doll';

/*
Village Toys,Queen doll
*/

--6. Какой товар самый дешёвый?

SELECT * from products
where prod_price IN
(SELECT MIN(prod_price) from products);

/*
BNBG01,DLL01,Fish bean bag toy,3.49,Fish bean bag toy, complete with bean bag worms with which to feed it
BNBG02,DLL01,Bird bean bag toy,3.49,Bird bean bag toy, eggs are not included
BNBG03,DLL01,Rabbit bean bag toy,3.49,Rabbit bean bag toy, comes with bean bag carrots
*/

--7. Какой товар самый дорогой?

SELECT * from products
where prod_price IN
(SELECT MAX(prod_price) from products);

/*
PR00002,BRS01,Lego Minecraft 19115,49.99,Lego Minecraft Underground
*/

--8. Сколько всего наименований товаров?

SELECT COUNT(DISTINCT prod_name) AS CountProd from products;

/*
15
*/

--9. Сколько всего поставщиков?

SELECT COUNT(DISTINCT vend_name) AS CountVend from vendors;

/*
8
*/

--10. Сколько всего клиентов, имеющих адреса электронной почты?

SELECT COUNT(DISTINCT cust_name) AS CountCust from customers
WHERE cust_email IS NOT NULL;
 
/*
5
*/

--11. Показать без повторений все товары, которые когда-либо были заказаны.

SELECT DISTINCT orderitems.prod_id, prod_name 
FROM orderitems
JOIN products
ON orderitems.prod_id = products.prod_id;

/*
BNBG02,Bird bean bag toy
RYL02,Queen doll
BR02,12 inch teddy bear
RGAN01,Raggedy Ann
BNBG03,Rabbit bean bag toy
PR00002,Lego Minecraft 19115
BNBG01,Fish bean bag toy
PR00004,Plastic doll
BR03,18 inch teddy bear
PR00001,Lego City 17425
PR00006,Boys set
BR01,8 inch teddy bear
PR00005,Soft Bear
PR00003,Plastic car
*/

--12. Узнать, какие товары не были ни разу заказаны.

SELECT prod_name, products.prod_id FROM products
LEFT JOIN orderitems
ON products.prod_id = orderitems.prod_id
WHERE order_num IS NULL;

/*
Lego City 17425,PR000018
King doll,RYL01
*/

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

/*
Doll House Inc.
Fun and Games
Lego
*/


--14. Узнать, кто из клиентов не делал заказов.

SELECT customers.cust_id, cust_name, 
cust_contact, cust_country, cust_email 
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
WHERE order_num IS NULL;

/*
1000000002,Kids Place,Michelle Green,USA,null
*/


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

/*
Lego,14
*/

--16. Показать, на какую сумму сделал заказы каждый из клиентов.

SELECT cust_name, customers.cust_id, SUM(quantity * item_price) AS totalprice
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
LEFT JOIN orderitems
ON orders.order_num = orderitems.order_num
GROUP BY Customers.cust_id;

/*
X-Mäng,1003,1707.50
Kids Place,1000000002,null
Village Toys,1000000001,3562.95
Fun4All,1000000003,329.60
Mänguasjad,1002,7237.74
Baby Shop,1000000006,null
The Toy Store,1000000005,189.60
All4Fun,1000000004,1696.00
Kids Zone,1001,6227.05
*/

--Или такой вариант, в зависимости что имелось ввиду order_item и quantity

SELECT cust_name, customers.cust_id, SUM(order_item * item_price) AS totalprice
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
LEFT JOIN orderitems
ON orders.order_num = orderitems.order_num
GROUP BY Customers.cust_id;

/*
X-Mäng,1003,211.83
Kids Place,1000000002,null
Village Toys,1000000001,51.90
Fun4All,1000000003,59.94
Mänguasjad,1002,3345.26
Baby Shop,1000000006,null
The Toy Store,1000000005,70.85
All4Fun,1000000004,60.85
Kids Zone,1001,389.77
*/

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

/*
1001,Kids Zone,4
*/

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

/*
*/

--19. Переименовать клиента Fun4All с адресом 829 Riverside Drive в клиента
--All4Fun с тем же адресом.
--Какие еще изменения необходимо внести в базу данных?

UPDATE customers 
SET cust_name = 'All4Fun' 
WHERE cust_name = 'Fun4All' AND cust_address = '829 Riverside Drive';

/*
*/

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
