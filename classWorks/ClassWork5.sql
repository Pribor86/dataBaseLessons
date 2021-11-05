--Копирование таблицы

CREATE TABLE CustCopy AS
SELECT *
FROM Customers;

--Обновление

update custcopy
set cust_email=NULL
where cust_id='1000000005';

--Удаление

delete from custcopy
WHERE cust_id = '1000000005';

--добавление столбца

alter TABLE custcopy
add cust_homephone char(20);

--удаление столбца, не во всех субд работает
alter TABLE custcopy
drop cust_homephone;

-- Создание представлений VIEW 

CREATE VIEW ProductCustomers
AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id=Orders.cust_id
AND OrderItems.order_num=Orders.order_num;


--Вызов VIEW 

select * from productcustomers;

-- Работаем с VIEW
SELECT cust_name, cust_contact
FROM productcustomers
WHERE prod_id = 'RGAN01';

--

SELECT   vend_name || '(' || vend_country || ')'
AS vend_title
FROM vendors;

--CREATE VIEW 
CREATE VIEW VendorLocations AS
SELECT   vend_name || '(' || vend_country || ')'
AS vend_title
FROM vendors;

--

CREATE VIEW CustomerEmailList AS
SELECT cust_id, cust_name, cust_email
from customers
WHERE cust_email IS NOT NULL;

--
CREATE VIEW OrderItemsExpanded AS
SELECT order_num, prod_id, item_price, quantity * item_price
AS expanded_price
FROM orderitems;

drop view orderitemsexpanded;
--

SELECT * FROM orderitemsexpanded
WHERE order_num = 20014;

CREATE VIEW custorder AS
SELECT customers.cust_id, cust_name, order_num, order_date
FROM customers
INNER JOIN orders
ON customers.cust_id = orders.cust_id;

SELECT * from custorder
where cust_id = '1002';