--HomeWork 2 Aleksandr Grigorjev

/*
У меня INSERT не вставились, так как уже сущевствовали id, 
пришлось поменять
*/

-- l. Запишите команду SELECT, которая выводит номер заказа, дату заказа для всех строк таблицы Orders.

SELECT order_num, order_date
FROM orders;

/*
20001,2020-05-01
20005,2020-05-05
20008,2020-05-08
20002,2020-05-02
20009,2020-05-09
20003,2020-05-03
20004,2020-05-04
20006,2020-05-06
20007,2020-05-07
20010,2021-09-15
20011,2020-05-01
20012,2020-01-12
20013,2020-01-30
20014,2020-02-03
20015,2020-02-08
*/

-- 2. Запишите запрос, который выдает строку таблицы Customers, где клиент
-- имеет идентификатор '1000000003'.

SELECT * 
FROM customers
where cust_id='1000000003';

/*
1000000003,Fun4All,1 Sunny Place,Muncie,IN,42222,USA,Jim Jones,jjones@fun4all.com
*/

-- 3. Запишите запрос, который выдает все строки таблицы Products, где поставщик
-- имеет идентификатор 'DLL01'.

SELECT *
FROM products
WHERE vend_id='DLL01';

/*
BNBG01,DLL01,Fish bean bag toy,3.49,Fish bean bag toy, complete with bean bag worms with which to feed it
BNBG02,DLL01,Bird bean bag toy,3.49,Bird bean bag toy, eggs are not included
BNBG03,DLL01,Rabbit bean bag toy,3.49,Rabbit bean bag toy, comes with bean bag carrots
RGAN01,DLL01,Raggedy Ann,4.99,18 inch Raggedy Ann doll
*/

-- 4. 4. Запишите запрос, который выдает строки таблицы Customers
-- в таком порядке: Идентификатор клиента, Имя клиента, Контактное имя клиента, Адрес электронной почты

SELECT cust_id, cust_name, cust_contact, cust_email
FROM customers;

/*
1001,Kids Zone,Valentina Pupkina,valentina.pupkina@kidszone.ee
1002,Mänguasjad,Eduard Mooses,sales@manguasjad.ee
1003,X-Mäng,Alla Elovika,alla.elovika@xmang.com
1000000001,Village Toys,John Smith,sales@villagetoys.com
1000000002,Kids Place,Michelle Green,null
1000000003,Fun4All,Jim Jones,jjones@fun4all.com
1000000004,Fun4All,Denise L. Stephens,dstephens@fun4all.com
1000000005,The Toy Store,Kim Howard,null
*/

-- 5. Запишите запрос, который выдает строки таблицы Customers
-- в таком порядке: Контактное имя клиента , Идентификатор клиента, Имя клиента,
-- отсортированные по полю Контактное имя клиента

SELECT cust_contact, cust_id, cust_name
FROM customers
ORDER BY  cust_contact;

/*
Alla Elovika,1003,X-Mäng
Denise L. Stephens,1000000004,Fun4All
Eduard Mooses,1002,Mänguasjad
Jim Jones,1000000003,Fun4All
John Smith,1000000001,Village Toys
Kim Howard,1000000005,The Toy Store
Michelle Green,1000000002,Kids Place
Valentina Pupkina,1001,Kids Zone
*/

-- 6. Запишите запрос, который покажет все товары, стоимость которых меньше $ 5.00 .

SELECT * FROM products
WHERE prod_price < 5;

/*
PR00003,BRS02,Plastic car,3.99,Plastic car for kids under 3y.
BNBG01,DLL01,Fish bean bag toy,3.49,Fish bean bag toy, complete with bean bag worms with which to feed it
BNBG02,DLL01,Bird bean bag toy,3.49,Bird bean bag toy, eggs are not included
BNBG03,DLL01,Rabbit bean bag toy,3.49,Rabbit bean bag toy, comes with bean bag carrots
RGAN01,DLL01,Raggedy Ann,4.99,18 inch Raggedy Ann doll
*/

-- 7. Запишите запрос, который выбирает всех клиентов, имена которых начинаются
-- на любую из букв от 'А' до 'G'.

-- выбор по cust_name

SELECT * FROM customers
WHERE cust_name >= 'A%' AND cust_name < 'G%'
ORDER BY  cust_name;

--выбор по cust_contact так как в cust_name попадает только один customer

SELECT * FROM customers
WHERE cust_contact BETWEEN 'A' AND 'G'
ORDER BY cust_contact;

/*
1003,X-Mäng,Kivila 13,Rakvere,L-V,19183,Estonia,Alla Elovika,alla.elovika@xmang.com
1000000004,Fun4All,829 Riverside Drive,Phoenix,AZ,88888,USA,Denise L. Stephens,dstephens@fun4all.com
1002,Mänguasjad,Tallinna mnt 11,Tartu,T-M,15515,Estonia,Eduard Mooses,sales@manguasjad.ee
*/


-- 8. Запишите запрос, который выбирает всех клиентов, имена которых начинаются
-- на 'J'.
-- по cust_name не находит ни одного клиента

SELECT * FROM customers
WHERE cust_name LIKE 'J%';

-- поиск по cust_contact дал результат

SELECT * FROM customers
WHERE cust_contact LIKE 'J%';

/*
1000000001,Village Toys,200 Maple Lane,Detroit,MI,44444,USA,John Smith,sales@villagetoys.com
1000000003,Fun4All,1 Sunny Place,Muncie,IN,42222,USA,Jim Jones,jjones@fun4all.com
*/

-- 9. Запишите запрос, который выдаёт сведения о всех заказах, принятых 30 января 2020 года.

SELECT * FROM orders
WHERE order_date = '2020-01-30';

-- 20013,2020-01-30,1000000004
