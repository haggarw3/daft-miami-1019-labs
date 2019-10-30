#CREATE DATABASE company1;
USE company1;

CREATE TABLE Cars
(
VIN INT NOT NULL,
manufacturer VARCHAR(12) NOT NULL,
model VARCHAR(12) NOT NULL,
cars_year INT NOT NULL,
color VARCHAR(12) NOT NULL,
PRIMARY KEY(VIN)
);

CREATE TABLE Invoice
(
invoice_number INT NOT NULL,
invoice_date DATE NOT NULL,
car INT NOT NULL,
customer VARCHAR(6) NOT NULL,
salesperson VARCHAR(6) NOT NULL,
PRIMARY KEY(invoice_number),
CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY(car) REFERENCES Cars(VIN), 
CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY(customer) REFERENCES Customers(customer_ID), 
CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY(salesperson) REFERENCES Salesperson(staff_ID)
);

CREATE TABLE Customers
(
customer_ID VARCHAR(6) NOT NULL,
first_name VARCHAR(12) NOT NULL,
last_name VARCHAR(12) NOT NULL,
city VARCHAR(12) NOT NULL,
PRIMARY KEY(customer_ID)
);

CREATE TABLE Salesperson
(
staff_ID VARCHAR(6) NOT NULL,
first_name VARCHAR(12) NOT NULL,
last_name VARCHAR(12) NOT NULL,
city VARCHAR(12) NOT NULL,
PRIMARY KEY(staff_ID)
);

INSERT INTO Cars
VALUES(3949385, 'Honda', 'Civic', 2020, 'Grey'), 
(5647902, 'Jeep', 'Wrangler JK', 2018, 'Green'), 
(7547343, 'Honda', 'Ridgeline', 2019, 'Black'), 
(1929292, 'Chrysler', 'Sedan', 2000, 'White'),
(3624701, 'Renault', 'Clio', 2010, 'Gold');

INSERT INTO Invoice
VALUES(875678, '2019-03-23', 1929292, 'c43501', 's80703'), 
(658370, '2014-10-05', 5647902, 'c08335', 's12239'), 
(128936, '2017-12-13', 3949385, 'c99884', 's55829'), 
(356921, '2015-01-28', 7547343, 'c43501', 's38686');

INSERT INTO Customers
VALUES('c99884', 'John', 'Smith', 'New York'),
('c43501', 'Wayne', 'Chester', 'London'), 
('c08335', 'Juan', 'Flores', 'Miami');

INSERT INTO Salesperson
VALUES ('s12239', 'James', 'Williams', 'New York'),
('s80703', 'Marie', 'Gonzalez', 'Miami'),
('s55829', 'Seth', 'Parker', 'Atlanta'),
('s38686', 'Jorge', 'Thompson', 'New York');

UPDATE Salesperson
SET city = 'Houston'
WHERE staff_ID = 's80703';

DELETE FROM Cars
WHERE VIN = 3624701;