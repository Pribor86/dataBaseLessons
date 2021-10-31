--HomeWork 2 Aleksandr Grigorjev

/*
У меня INSERT не вставились, так как уже сущевствовали id, 
пришлось поменять
*/

-- l. Запишите команду SELECT, которая выводит номер заказа, дату заказа для всех строк таблицы Orders.

SELECT order_num, order_date
FROM orders;

-- 2. Запишите запрос, который выдает строку таблицы Customers, где клиент
-- имеет идентификатор '1000000003'.

SELECT * 
FROM customers
where cust_id='1000000003';

-- 3. Запишите запрос, который выдает все строки таблицы Products, где поставщик
-- имеет идентификатор 'DLL01'.

SELECT *
FROM products
WHERE vend_id='DLL01';

-- 4. 4. Запишите запрос, который выдает строки таблицы Customers
-- в таком порядке: Идентификатор клиента, Имя клиента, Контактное имя клиента, Адрес электронной почты

SELECT cust_id, cust_name, cust_contact, cust_email
FROM customers;

-- 5. Запишите запрос, который выдает строки таблицы Customers
-- в таком порядке: Контактное имя клиента , Идентификатор клиента, Имя клиента,
-- отсортированные по полю Контактное имя клиента

SELECT cust_contact, cust_id, cust_name
FROM customers
ORDER BY  cust_contact;

-- 6. Запишите запрос, который покажет все товары, стоимость которых меньше $ 5.00 .

SELECT * FROM products
WHERE prod_price < 5;

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

-- 8. Запишите запрос, который выбирает всех клиентов, имена которых начинаются
-- на 'J'.
-- по cust_name не находит ни одного клиента

SELECT * FROM customers
WHERE cust_name LIKE 'J%';

-- поиск по cust_contact дал результат

SELECT * FROM customers
WHERE cust_contact LIKE 'J%';

-- 9. Запишите запрос, который выдаёт сведения о всех заказах, принятых 30 января 2020 года.

SELECT * FROM orders
WHERE order_date = '2020-01-30';
