-- The purpose of this lab is to create a databse to track purchases,loans, inventory, and customers of a rug
-- business

CREATE DATABASE Rugs;

SHOW DATABASES;

USE Rugs;

-- creating inventories table w/ all the fields needed
CREATE TABLE Inventories
(
    inventory_id INT(100) NOT NULL,
    descriptions  VARCHAR(50) NOT NULL,
    purchase_price INT NOT NULL,
    date_acquired DATETIME,
    markup_price INT NOT NULL,
    list_price INT NOT NULL,
    style_num INT NOT NULL,
    material_id INT NOT NULL,
    country_id INT NOT NULL, 
    dimension INT NOT NULL,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY(style_num) REFERENCES Styles(style_num)
    ON DELETE RESTRICT, 
    FOREIGN KEY(material_id) REFERENCES Materials(material_id)
    ON DELETE RESTRICT, 
    FOREIGN KEY(country_id) REFERENCES Countries(material_id)
    ON DELETE RESTRICT,
    FOREIGN KEY(dimension) REFERENCES Dimensions(dimension)
    ON DELETE RESTRICT
);

-- creating Customers table w/ fields necessary
CREATE TABLE Customers
(
    customer_firstname VARCHAR(50) NOT NULL,
    customer_lastname VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    customer_id INT(100) NOT NULL,
    city VARCHAR(25) NOT NULL,
    states VARCHAR(25) NOT NULL,
    zip_code INT NOT NULL,
    mobile_phone INT NOT NULL UNIQUE,
    PRIMARY KEY(customer_id)
  

);

CREATE TABLE Transactions
(
customer_id INT(100) NOT NULL,
inventory_id INT(100) NOT NULL,
date_of_sale DATETIME,
sale INT, 
net_on_sale INT, 
date_returned DATETIME,
PRIMARY KEY (customer_id, inventory_id),
FOREIGN KEY(inventory_id) REFERENCES Inventories(inventory_id),
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)


);

CREATE TABLE Loans
(
    customer_id INT(100) NOT NULL,
    inventory_id INT(100) NOT NULL,
    loan_status BINARY,
    loan_id INT,
    start_trial DATETIME,
    actual_date DATETIME,
    reserved_from DATETIME,

    FOREIGN KEY(inventory_id) REFERENCES Inventories(inventory_id),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT loan_date CHECK (start_trial < actual_date),
    PRIMARY KEY (inventory_id, customer_id)
    
    
);

CREATE TABLE Countries
(
country_name VARCHAR (25) NOT NULL,
country_id INT NOT NULL,
PRIMARY KEY(country_id)
);

CREATE TABLE Styles
(
style_name VARCHAR (25) NOT NULL,
style_num INT NOT NULL,
PRIMARY KEY(style_num)

);

CREATE TABLE Materials 
(
material_name VARCHAR (25) NOT NULL,
material_id INT NOT NULL,
PRIMARY KEY(material_id)

);

CREATE TABLE Dimensions  
(

dimension Varchar(10) NOT NULL,
PRIMARY KEY(dimension)

);

