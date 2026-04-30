-- 1. Wyświetl nazwy firm klientów  i daty zamówień
 SELECT CustomerName, OrderDate
 FROM customers INNER JOIN orders ON customers.CustomerID=orders.CustomerID;
-- 2, Wyświetl dane spedytora z datą zamówienia
SELECT ShipperName, OrderDate
FROM orders INNER JOIN shippers
ON orders.ShipperID = shippers.ShipperID;
-- 3. Wyświetl nazwiska pracowników i daty zamówień
 SELECT LastName, OrderDate
 FROM employees INNER JOIN orders ON employees.EmployeeID=orders.EmployeeID;
-- 4. Wyświetl nazwy towarów, nazwy kategorii
 SELECT ProductName, CategoryName
 FROM products INNER JOIN categories ON products.CategoryID=categories.CategoryID;
-- 5. Wyświetl nazwy towarów, nazwy kategorii i idzamówień
SELECT ProductName, CategoryName, OrderID
FROM products
INNER JOIN categories 
ON products.CategoryID = categories.CategoryID
INNER JOIN order_details 
ON products.ProductID = order_details.ProductID;
-- 6. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i idklienta
 SELECT ProductName, CategoryName, OrderDate, CustomerID
FROM products
INNER JOIN categories 
ON products.CategoryID = categories.CategoryID
INNER JOIN order_details 
ON products.ProductID = order_details.ProductID
INNER JOIN orders 
ON order_details.OrderID = orders.OrderID;
-- 7. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i nazwę firmy klienta
    SELECT ProductName, CategoryName, OrderDate, CustomerName
FROM products
INNER JOIN categories 
ON products.CategoryID = categories.CategoryID
INNER JOIN order_details 
ON products.ProductID = order_details.ProductID
INNER JOIN orders 
ON order_details.OrderID = orders.OrderID
INNER JOIN customers 
ON orders.CustomerID = customers.CustomerID;
-- 8. Ile razy był zamawiany dany produkt? (podaj nazwy produktów)
SELECT ProductName, COUNT(order_details.OrderID) AS IloscZamowien
FROM products
INNER JOIN order_details 
ON products.ProductID = order_details.ProductID
GROUP BY ProductName;