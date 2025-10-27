# Task 5: SQL Joins (Inner, Left, Right, Full)

## 🎯 Objective

Understand and demonstrate how to combine data from multiple related tables using different types of **SQL JOINs**:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN

---

## 🧰 Tools Used

* **DB Browser for SQLite** (for lightweight SQL testing)
* **MySQL Workbench** (for full SQL feature support)

---

## 🧱 Database Setup

### 1. Create Tables

```sql
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
```

### 2. Insert Sample Data

```sql
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
```

---

## 🔗 SQL JOIN Queries

### 1️⃣ INNER JOIN

Returns only customers who have placed orders.

```sql
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### 2️⃣ LEFT JOIN

Returns all customers and their orders (if any).

```sql
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### 3️⃣ RIGHT JOIN

Returns all orders and their customers (if any).
*(Supported in MySQL, not SQLite)*

```sql
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### 4️⃣ FULL OUTER JOIN

Returns all data from both tables.
*(MySQL syntax shown; for SQLite use a UNION of LEFT and RIGHT joins.)*

```sql
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

---

## 🧩 Outcome

* Learned how to merge data across related tables.
* Understood the behavior of each join type.
* Gained practical experience in relational data analysis.

---

## 🧠 Notes

* SQLite doesn’t natively support `RIGHT JOIN` or `FULL JOIN`; use MySQL for those or simulate using `UNION`.
* These concepts are essential for data analytics, backend development, and database management.
