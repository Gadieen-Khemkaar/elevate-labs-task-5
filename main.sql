CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Paris'),
(4, 'Diana', 'Tokyo');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 1200.00),
(102, 2, 'Phone', 800.00),
(103, 1, 'Headphones', 150.00),
(104, 3, 'Camera', 600.00);

SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- MySQL syntax:
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- SQLite equivalent (simulate FULL JOIN)
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
