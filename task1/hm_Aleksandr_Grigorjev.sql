CREATE TABLE Customers(
cust_id CHAR(10) NOT NULL PRIMARY KEY,
cust_name CHAR(50) NOT NULL,
cust_address CHAR(50) NULL,
cust_city CHAR(50) NULL,
cust_state CHAR(5) NULL,
cust_zip CHAR(10) NULL,
cust_country CHAR(50) NULL,
cust_contact CHAR(50) NULL,
cust_email CHAR(255) NULL
);

CREATE TABLE Vendors(
vend_id CHAR(10) NOT NULL PRIMARY KEY,
vend_name CHAR(50) NOT NULL,
vend_address CHAR(50) NULL,
vend_city CHAR(50) NULL,
vend_state CHAR(50) NULL,
vend_zip CHAR(10) NULL,
vend_country CHAR(50) NULL
);

CREATE TABLE Orders(
order_num INT NOT NULL PRIMARY KEY,
order_date DATE NOT NULL,
cust_id CHAR(10) NOT NULL REFERENCES Customers(cust_id)
);


CREATE TABLE Products(
prod_id CHAR(10) NOT NULL PRIMARY KEY,
vend_id CHAR(10) NOT NULL REFERENCES Vendors(vend_id),
prod_name CHAR(254) NOT NULL,
prod_price DECIMAL(8,2) NOT NULL,
prod_desc VARCHAR(1000) NULL
);

CREATE TABLE OrderItems(
    order_num INT NOT NULL REFERENCES Orders(order_num),
    order_item INT NOT NULL,
    prod_id CHAR(10) NOT NULL REFERENCES Products(prod_id),
    quantity INT NOT NULL,
    item_price DECIMAL(8, 2) NOT NULL
);

INSERT INTO Customers(
	cust_id, cust_name, cust_address,
	cust_city, cust_state, cust_zip,
	cust_country, cust_contact, cust_email)
VALUES
	('1001', 'Kids Zone', 'Narva mnt 1',
	'Tallinn', 'H-M', '19132', 'Estonia', 'Valentina Pupkina',
	'valentina.pupkina@kidszone.ee'),
	
	('1002', 'Mänguasjad', 'Tallinna mnt 11',
	'Tartu', 'T-M', '15515', 'Estonia', 'Eduard Mooses',
	'sales@manguasjad.ee'),
	
	('1003', 'X-Mäng', 'Kivila 13',
	'Rakvere', 'L-V', '19183', 'Estonia', 'Alla Elovika',
	'alla.elovika@xmang.com');

INSERT INTO Orders(
    order_num, order_date, cust_id)
VALUES
	(20001, TO_DATE('2020-05-01', 'yyyy-mm-dd'),
	 '1001'),
	 (20005, TO_DATE('2020-05-05', 'yyyy-mm-dd'),
	 '1001'),
	 (20008, TO_DATE('2020-05-08', 'yyyy-mm-dd'),
	 '1001'),
	 (20002, TO_DATE('2020-05-02', 'yyyy-mm-dd'),
	 '1002'),
	 (20009, TO_DATE('2020-05-09', 'yyyy-mm-dd'),
	 '1002'),
	 (20003, TO_DATE('2020-05-03', 'yyyy-mm-dd'),
	 '1002'),
	 (20004, TO_DATE('2020-05-04', 'yyyy-mm-dd'),
	 '1003'),
	 (20006, TO_DATE('2020-05-06', 'yyyy-mm-dd'),
	 '1003'),
	 (20007, TO_DATE('2020-05-07', 'yyyy-mm-dd'),
	 '1003');

INSERT INTO Vendors(
	vend_id, vend_name, vend_address,
	vend_city, vend_state, vend_zip,
	vend_country)
VALUES
	('BRS01','Lego',
	 'Ole Kirks Plads 1','Billund',
	 '','7190', 'Denmark'),
	 
	 ('BRS02','Plastic Toys',
	 'Tartu mnt 45','Viljandi',
	 'V-M','18913', 'Estonia'),
	 
	 ('BRS03','Fisher-Price',
	 '636 Girard Avenue','East Aurora',
	 'NY','14052', 'USA');

INSERT INTO Products(
	prod_id, vend_id, prod_name,
	prod_price, prod_desc)
VALUES
	('PR00001','BRS01',
	 'Lego City 17425','25.99',
	 'Lego City Shopping'),
	 
	 ('PR00002','BRS01',
	 'Lego Minecraft 19115','49.99',
	 'Lego Minecraft Underground'),
	 
	 ('PR00003','BRS02',
	 'Plastic car','3.99',
	 'Plastic car for kids under 3y.'),
	 
	 ('PR00004','BRS02',
	 'Plastic doll','6.99',
	 'Plastic doll for girls under 4y'),
	 
	 ('PR00005','BRS03',
	 'Soft Bear','9.99',
	 'Small soft bear toys for everyone.'),
	 
	 ('PR00006','BRS03',
	 'Boys set','25.99',
	 'Set of police equipment for kids under 6y');

INSERT INTO OrderItems(
	order_num, order_item,
	prod_id, quantity, item_price) 
VALUES
	(20001, 1, 'PR00001', 100, 25.99),
	(20002, 2, 'PR00002', 50, 49.99),
	(20003, 3, 'PR00003', 10, 3.99),
	(20004, 4, 'PR00004', 200, 6.99),
	(20005, 5, 'PR00005', 75, 9.99),
	(20006, 6, 'PR00006', 5, 25.99),
	(20007, 7, 'PR00003', 45, 3.99),
	(20008, 8, 'PR00005', 15, 9.99),
	(20009, 9, 'PR00001', 150, 25.99);