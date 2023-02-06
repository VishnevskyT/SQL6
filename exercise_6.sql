USE ShopDB; 								-- Завдання 6: Используя базу данных ShopDB и страницу Customers (удалите таблицу, если есть и создайте заново первый раз без первичного ключа затем – с первичным) 
											-- и затем добавьте индексы и проанализируйте выборку данных.

SELECT * FROM customers;

DROP TABLE customers;
DROP TABLE orders;
DROP TABLE orderdetails;

CREATE TABLE Customers
	(
	CustomerNo int NOT NULL,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
						-- primary key(CustomerNo)
	);
    
INSERT Customers 
(CustomerNo, LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
(1, 'Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
(2, 'Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
(3, 'Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
(4, 'Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
(5, 'Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT * FROM customers;

DROP TABLE customers;

CREATE TABLE Customers
	(
	CustomerNo int NOT NULL AUTO_INCREMENT,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL,
	PRIMARY KEY(CustomerNo)
	);
    
INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
('Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
('Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
('Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
('Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT * FROM Customers;

DROP INDEX name
ON Customers;

CREATE INDEX name
ON Customers(LName, FName, MName);

DROP INDEX Phone
ON Customers;

CREATE UNIQUE INDEX Phone
ON Customers(Phone);

EXPLAIN SELECT * FROM Customers
WHERE LName = 'Выжлецов';