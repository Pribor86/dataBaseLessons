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
CREATE TABLE REPAIR(
    bill_id INT NOT NULL PRIMARY KEY,
    prod_id INT NOT NULL REFERENCES product(prod_id),
    repair_date DATE NOT NULL,
    repair_desc VARCHAR(1000),
    repair_price DECIMAL(8, 2) NOT NULL,
    cust_id INT NOT NULL REFERENCES customer(cust_id)
);

INSERT INTO
    customer(cust_id, cust_name, cust_phone, cust_email)
VALUES
    (
        '1',
        'Ivan Ivanov',
        '+3725212345',
        'ivan@gmail.com'
    ),
    (
        '2',
        'Dmitri Ziguljev',
        '+3725254321',
        'dmitri@gmail.com'
    ),
    (
        '3',
        'Alex Vorobjov',
        '+3725209876',
        'alex@gmail.com'
    ),
    (
        '4',
        'Alisa Vasilisa',
        '+3725267890',
        'alisa@gmail.com'
    ),
    (
        '5',
        'Anna Oborneva',
        '+3725245678',
        'anna@gmail.com'
    ),
    (
        '6',
        'Alex Grigorjev',
        '+3725287654',
        'grig@gmail.com'
    ),
    (
        '7',
        'Ivan Reshemkin',
        '+3725214654',
        NULL
    ),
    (
        '8',
        'Vedu Kucko',
        '+3725214612',
        NULL
    );

INSERT INTO
    product(prod_id, prod_type, prod_vers, prod_date)
VALUES
    (
        '1',
        'FiredNow',
        '1.1',
        TO_DATE('2020-06-10', 'yyyy-mm-dd')
    ),
    (
        '2',
        'FiredAlways',
        '2.1',
        TO_DATE('2020-07-11', 'yyyy-mm-dd')
    ),
    (
        '3',
        'FiredAtCamp',
        '3.1',
        TO_DATE('2020-08-12', 'yyyy-mm-dd')
    ),
    (
        '4',
        'FiredNow',
        '1.1',
        TO_DATE('2020-06-10', 'yyyy-mm-dd')
    ),
    (
        '5',
        'FiredAlways',
        '2.1',
        TO_DATE('2020-07-11', 'yyyy-mm-dd')
    ),
    (
        '6',
        'FiredAtCamp',
        '3.1',
        TO_DATE('2020-08-12', 'yyyy-mm-dd')
    ),
    (
        '7',
        'FiredNow',
        '1.1',
        TO_DATE('2020-06-10', 'yyyy-mm-dd')
    ),
    (
        '8',
        'FiredAlways',
        '2.1',
        TO_DATE('2020-07-11', 'yyyy-mm-dd')
    ),
    (
        '9',
        'FiredAtCamp',
        '3.1',
        TO_DATE('2020-08-12', 'yyyy-mm-dd')
    ),
    (
        '10',
        'FiredNow',
        '1.1',
        TO_DATE('2020-06-10', 'yyyy-mm-dd')
    ),
    (
        '11',
        'FiredAlways',
        '2.1',
        TO_DATE('2020-07-11', 'yyyy-mm-dd')
    ),
    (
        '12',
        'FiredAtCamp',
        '3.1',
        TO_DATE('2020-08-12', 'yyyy-mm-dd')
    ),
    (
        '13',
        'FiredNow',
        '1.1',
        TO_DATE('2020-06-10', 'yyyy-mm-dd')
    ),
    (
        '14',
        'FiredAlways',
        '2.1',
        TO_DATE('2020-07-11', 'yyyy-mm-dd')
    ),
    '15',
    'FiredAtCamp',
    '3.1',
    TO_DATE('2020-08-12', 'yyyy-mm-dd')
),
(
    '16',
    'FiredNow',
    '3.1',
    TO_DATE('2020-08-12', 'yyyy-mm-dd')
),
(
    '17',
    'FiredNow',
    '3.2',
    TO_DATE('2020-09-12', 'yyyy-mm-dd')
),
(
    '18',
    'FiredNow',
    '3.3',
    TO_DATE('2020-10-12', 'yyyy-mm-dd')
),
(
    '19',
    'FiredNow',
    '3.4',
    TO_DATE('2020-11-12', 'yyyy-mm-dd')
);

INSERT INTO
    registration(reg_id, cust_id, prod_id, reg_date)
VALUES
    (
        '001',
        '1',
        '2',
        TO_DATE('2021-02-21', 'yyyy-mm-dd')
    ),
    (
        '002',
        '2',
        '3',
        TO_DATE('2021-08-13', 'yyyy-mm-dd')
    ),
    (
        '003',
        '3',
        '3',
        TO_DATE('2021-08-20', 'yyyy-mm-dd')
    ),
    (
        '004',
        '4',
        '2',
        TO_DATE('2021-08-21', 'yyyy-mm-dd')
    ),
    (
        '005',
        '1',
        '1',
        TO_DATE('2021-02-28', 'yyyy-mm-dd')
    ),
    (
        '006',
        '2',
        '2',
        TO_DATE('2020-10-05', 'yyyy-mm-dd')
    ),
    (
        '007',
        '6',
        '1',
        TO_DATE('2021-08-15', 'yyyy-mm-dd')
    ),
    (
        '008',
        '5',
        '3',
        TO_DATE('2020-09-05', 'yyyy-mm-dd')
    );

INSERT INTO
    REPAIR(
        bill_id,
        prod_id,
        repair_date,
        repair_desc,
        repair_price,
        cust_id
    )
VALUES
    (
        '01',
        '3',
        TO_DATE('2021-09-09', 'yyyy-mm-dd'),
        'no fire',
        '100.50',
        '1'
    ),
    (
        '02',
        '2',
        TO_DATE('2021-09-09', 'yyyy-mm-dd'),
        'doesnt work',
        '50',
        '2'
    ),
    (
        '03',
        '1',
        TO_DATE('2021-10-05', 'yyyy-mm-dd'),
        'fail',
        '150',
        '3'
    ),
    (
        '04',
        '2',
        TO_DATE('2021-10-04', 'yyyy-mm-dd'),
        '',
        '300',
        '4'
    ),
    (
        '05',
        '3',
        TO_DATE('2021-05-03', 'yyyy-mm-dd'),
        '',
        '15',
        '5'
    ),
    (
        '06',
        '1',
        TO_DATE('2021-05-02', 'yyyy-mm-dd'),
        '',
        '35',
        '1'
    );

-- Выведите список версий всех горелок типа «FiredNow».
SELECT
    DISTINCT prod_type,
    prod_vers
FROM
    product
WHERE
    prod_type = 'FiredNow';

--2. Выведите серийный номер и дату регистрации для продуктов, 
-- зарегистрированных в феврале.
SELECT
    prod_id,
    reg_date date
FROM
    registration
WHERE
    EXTRACT(
        MONTH
        FROM
            reg_date
    ) = 2;

-- 3. Выведите список имен покупателей, 
-- не имеющих электронной почты; 
-- отсортируйте результаты в обратном алфавитном порядке.
SELECT
    *
FROM
    customer
WHERE
    cust_email IS NULL
ORDER BY
    cust_name DESC;

-- 4. Определите среднюю стоимость ремонта горелки.
SELECT
    ROUND(AVG(repair_price), 2) AS avg_price
FROM
    REPAIR;

-- 5. Определите количество горелок каждого типа 
-- и выведите тип и количество.
SELECT
    prod_type,
    COUNT(prod_type) AS quantity
FROM
    product
GROUP BY
    prod_type;

-- 6. Выведите имена и адреса электронной почты 
-- всех покупателей, на которых зарегистрирована 
-- горелка типа «FiredNow». 
-- Используйте вложенный запрос.
SELECT
    cust_name,
    cust_email
FROM
    customer,
    registration
WHERE
    customer.cust_id = registration.cust_id
    AND registration.prod_id IN(
        SELECT
            prod_id
        FROM
            product
        WHERE
            prod_type = 'FiredNow'
    );

--7. Выведите имена и адреса электронной почты 
--всех покупателей, на которых зарегистрирована 
--горелка типа «FiredNow». 
--Используйте объединение.
SELECT
    cust_name,
    cust_email
FROM
    customer
    JOIN registration ON customer.cust_id = registration.cust_id
    JOIN product ON product.prod_id = registration.prod_id
WHERE
    product.prod_type = 'FiredNow';

--8. Выведите имена и адреса электронной почты покупателей,
-- имеющих зарегистрированную горелку, но не сдававших 
-- ни одной горелки в ремонт.
SELECT
    cust_name,
    cust_email
FROM
    customer
    JOIN registration ON customer.cust_id = registration.cust_id
    LEFT JOIN REPAIR ON REPAIR.cust_id = registration.cust_id
WHERE
    bill_id IS NULL;

-- 9. Постройте представление, начинающееся с таблицы ГОРЕЛКА
-- и содержащее все данные из всех таблиц. Назовите это представление 
-- ГОРЕЛКА_ПР.
CREATE VIEW burners AS;

SELECT
    DISTINCT product.*,
    customer.*,
    registration.reg_id,
    registration.reg_date,
    REPAIR.bill_id,
    REPAIR.repair_date,
    REPAIR.repair_desc,
    REPAIR.repair_price
FROM
    product
   LEFT JOIN registration ON product.prod_id = registration.prod_id
   LEFT JOIN repair ON repair.prod_id = registration.prod_id
    JOIN customer ON customer.cust_id = registration.cust_id
ORDER BY
    product.prod_id;

-- 10. Напишите SQL-операторы, необходимые для чтения представления 
--ГОРЕЛКА_ПР. Начните с некоторого серийного номера.
SELECT
    prod_id,
    cust_name
FROM
    burners;

SELECT
    DISTINCT prod_id,
    bill_id,
    cust_name
FROM
    burners
WHERE
    bill_id IS NOT NULL;