CREATE TABLE flatowner(
    owner_id INT NOT NULL PRIMARY KEY,
    owner_name CHAR NOT NULL,
    owner_phone CHAR(20)
);

CREATE TABLE flat(
    flat_id INT NOT NULL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES flatowner(owner_id),
    flat_all_square DECIMAL (4,1) NOT NULL,
    flat_live_square DECIMAL(4,1) NOT NULL,
    flat_rooms INT NOT NULL,
    flat_kitchensize DECIMAL(3,1) NOT NULL,
    flat_floor INT NOT NULL,
    flat_allfloors INT,
    flat_price INT NOT NULL,
    flat_address CHAR(30) NOT NULL,
    flat_date DATE

);

INSERT INTO flatowner(owner_id, owner_name, owner_phone)
VALUES
('1', 'Vasja Vasechkin', '55544222'),
('2', 'Petja Vasechkin', '55544333');

INSERT INTO flat(flat_id, owner_id, flat_all_square, 
flat_live_square, flat_rooms, flat_kitchensize, flat_floor, flat_allfloors,
flat_price, flat_address, flat_date) 
VALUES 
( '10', '1', '85', '84', '4', '6', '4', '9','65000','Viru 1-1', TO_DATE('2021-10-01', 'yyyy-mm-dd')),
( '11', '2', '75', '74', '3', '6', '4','9','65000','Viru 1-2', TO_DATE('2021-10-05', 'yyyy-mm-dd')),
( '12', '2', '74', '74', '2', '6', '9','9','65000','Viru 1-12', TO_DATE('2016-05-15', 'yyyy-mm-dd'));



--Проверить, что для всех квартир общая площадь больше, чем жилая площадь плюс размер кухни.
SELECT * from flat
WHERE flat_all_square < flat_live_square + flat_kitchensize;


--трехкомнатных квартир, расположенных не на первом и последнем этажах, информация о которых поступила за последний месяц

SELECT * from flat
where flat_rooms = 3 
AND
flat_floor != flat_allfloors
AND
flat_floor != 1
AND
flat_date >= CURRENT_DATE - INTERVAL '1' MONTH;


--владельцев и их квартир (идентификатор квартиры и адрес)

select owner_name, flat_id, flat_address
from flatowner
INNER JOIN flat
ON flatowner.owner_id = flat.owner_id;

-- квартир общей площадью не менее 80 м2 не дороже 150000

SELECT * FROM flat
WHERE flat_all_square >= 80
AND
flat_price <= 150000;