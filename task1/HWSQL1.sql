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
