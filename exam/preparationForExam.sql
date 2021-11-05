
--ПОКУПАТЕЛЬ (ПокупательСК, Имя, Телефон, ЭлектронныйАдрес) 
CREATE TABLE customer(
cust_id INT NOT NULL PRIMARY KEY,
cust_name CHAR(50) NOT NULL,
cust_phone CHAR(20) NOT NULL,
cust_email CHAR(50)
);

--ГОРЕЛКА (СерийныйНомер, Тип, Версия, ДатаИзготовления)
CREATE TABLE product(
prod_id INT NOT NULL PRIMARY KEY,
prod_type CHAR(20) NOT NULL,
prod_vers CHAR(20) NOT NULL,
prod_date DATE NOT NULL
);

--РЕГИСТРАЦИЯ (ПокупательСК, Серийный_Номер, Дата)
CREATE TABLE registration(
reg_id INT NOT NULL PRIMARY KEY,
cust_id INT NOT NULL REFERENCES customer(cust_id),
prod_id INT NOT NULL REFERENCES product(prod_id),
reg_date DATE NOT NULL
);

--РЕМОНТ (НомерСчета, СерийныйНомер, Дата, Описание, Стоимость, ПокупательСК)
CREATE TABLE repair(
bill_id INT NOT NULL PRIMARY KEY,
prod_id INT NOT NULL REFERENCES product(prod_id),
repair_date DATE NOT NULL,
repair_desc VARCHAR(1000),
repair_price DECIMAL(8,2) NOT NULL,
cust_id INT NOT NULL REFERENCES  customer(cust_id)
);

INSERT INTO customer(cust_id, cust_name,
cust_phone, cust_email)
VALUES
('1', 'Ivan Ivanov', '+3725212345', 'ivan@gmail.com'),
('2', 'Dmitri Ziguljev', '+3725254321', 'dmitri@gmail.com'),
('3', 'Alex Vorobjov', '+3725209876', 'alex@gmail.com'),
('4', 'Alisa Vasilisa', '+3725267890', 'alisa@gmail.com'),
('5', 'Anna Oborneva', '+3725245678', 'anna@gmail.com'),
('6', 'Alex Grigorjev', '+3725287654', 'grig@gmail.com');

INSERT INTO product(prod_id, prod_type,
prod_vers, prod_date)
VALUES
('1', 'FiredNow', '1.1', TO_DATE('2020-06-10', 'yyyy-mm-dd'),
('2', 'FiredAlways', '2.1', TO_DATE('2020-07-11', 'yyyy-mm-dd'),
('3', 'FiredAtCamp', '3.1', TO_DATE('2020-08-12', 'yyyy-mm-dd'),
('1', 'FiredNow', '1.1', TO_DATE('2020-06-10', 'yyyy-mm-dd'),
('2', 'FiredAlways', '2.1', TO_DATE('2020-07-11', 'yyyy-mm-dd'),
('3', 'FiredAtCamp', '3.1', TO_DATE('2020-08-12', 'yyyy-mm-dd'),
('1', 'FiredNow', '1.1', TO_DATE('2020-06-10', 'yyyy-mm-dd'),
('2', 'FiredAlways', '2.1', TO_DATE('2020-07-11', 'yyyy-mm-dd'),
('3', 'FiredAtCamp', '3.1', TO_DATE('2020-08-12', 'yyyy-mm-dd'),
('1', 'FiredNow', '1.1', TO_DATE('2020-06-10', 'yyyy-mm-dd'),
('2', 'FiredAlways', '2.1', TO_DATE('2020-07-11', 'yyyy-mm-dd'),
('3', 'FiredAtCamp', '3.1', TO_DATE('2020-08-12', 'yyyy-mm-dd'),
('1', 'FiredNow', '1.1', TO_DATE('2020-06-10', 'yyyy-mm-dd'),
('2', 'FiredAlways', '2.1', TO_DATE('2020-07-11', 'yyyy-mm-dd'),
('3', 'FiredAtCamp', '3.1', TO_DATE('2020-08-12', 'yyyy-mm-dd');

INSERT INTO registration(cust_id, prod_id,
reg_date)
VALUES
('001', '1', '2', TO_DATE('2021-02-21', 'yyyy-mm-dd'),
('002', '2', '3', TO_DATE('2021-08-13', 'yyyy-mm-dd'),
('003', '3', '3', TO_DATE('2021-08-20', 'yyyy-mm-dd'),
('004', '4', '2', TO_DATE('2021-08-21', 'yyyy-mm-dd'),
('005', '1', '1', TO_DATE('2021-02-30', 'yyyy-mm-dd'),
('006', '2', '2', TO_DATE('2020-10-05', 'yyyy-mm-dd'),
('007', '6', '1', TO_DATE('2021-08-15', 'yyyy-mm-dd'),
('008', '5', '3', TO_DATE('2020-09-05', 'yyyy-mm-dd');

INSERT INTO repair(bill_id, prod_id, repair_date,
repair_desc, repair_price, cust_id)
VALUES
('01', '3', TO_DATE('2021-09-09', 'yyyy-mm-dd'), 'no fire', '100,50', '1'),
('02', '2', TO_DATE('2021-09-09', 'yyyy-mm-dd'), 'doesnt work', '50', '2'),
('03', '1', TO_DATE('2021-10-05', 'yyyy-mm-dd'), 'fail', '150', '3'),
('04', '2', TO_DATE('2021-10-04', 'yyyy-mm-dd'), '', '300', '4'),
('05', '3', TO_DATE('2021-05-03', 'yyyy-mm-dd'), '', '15', '5'),
('06', '1', TO_DATE('2021-05-02', 'yyyy-mm-dd'), '', '35', '1');


