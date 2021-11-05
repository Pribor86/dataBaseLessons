-- 1 "Двухкомнатные квартиры" (все поля отношения "Квартиры").
CREATE VIEW twoBedroomsFlat AS
SELECT * FROM flat
WHERE flat_rooms = '2';

--2 "Владение квартирами" (имя владельца, количество квартир, общая площадь этих квартир).
CREATE VIEW  whoisowner AS
SELECT owner_name, COUNT(flat_id) AS countFlat, SUM(flat_all_square) AS sumSquare
FROM flatowner
JOIN flat
ON flat.owner_id = flatowner.owner_id
GROUP BY flatowner.owner_name;

--3 "Владельцы однокомнатных квартир" (имя, телефон, площадь квартиры).
CREATE VIEW oneBedroomsOwners AS
SELECT owner_name, owner_phone, flat_all_square
FROM flatowner
JOIN flat
ON flat.owner_id = flatowner.owner_id
WHERE flat.flat_rooms = '1';