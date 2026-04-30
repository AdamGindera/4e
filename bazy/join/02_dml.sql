-- 1. Usuń klientów z Meksyku
DELETE FROM customers
WHERE Country LIKE 'Mexico';
 

-- 2. Usuń produkty o cenie mniejszej niż 15
DELETE FROM products
 WHERE Price BETWEEN 0 AND 15;

UPDATE order_details
SET ProductID = NULL
WHERE ProductID IN (
    SELECT ProductID
    FROM products
    WHERE Price BETWEEN 0 AND 15
);
-- 3. Zmień numer dostawcy produktu o id 2 na dostawcę o id 3
 
-- 4, Zmień osobę do kontaktów na siebie dla klienta o numerze 1
 UPDATE customers
 SET ContactName = 'Adam Gindera'
 WHERE CustomerID = 1;
-- 5. Zmniejsz o 5% cenę wszystkich produktów dostarczanych przez dostawcę o numerze 7
 UPDATE products
 SET price = price * 0.95
 WHERE supplierID = 7;
-- 6. Zwiększ cenę produktów z kategorii 1 o 10%
 UPDATE products
 SET price = price * 1.10
 WHERE CategoryID = 1;
-- 7. Dodaj nową kategorię produktów
 INSERT INTO categories
 VALUES ('','Nowa kategoria', NULL);
-- 8. Z tabeli Pracownicy (Employees) usuń pracownika o numerze 3 (EmployeeID). 
DELETE FROM Employees
WHERE employeeID = 3;
-- 9. Dodaj jeszcze jednego dostawcę (tabela Shippers)
INSERT INTO shippers
VALUES ('','Nowy dostawca',NULL);
-- 10. Podnieś cenę Tofu do 30 (ProductName -nazwa produktu, Price - cena, tabela Products)
UPDATE products
SET price = 30
WHERE ProductName = 'Tofu';
-- 11. Podnieś o 10% cenę (Price) wszystkich produktów o nazwie (ProductName) zaczynającej się na literę C) (tabela Products)
UPDATE products
SET price = price * 1.10
WHERE ProductName LIKE 'C%';
-- 12. Usuń z tabeli OrderDetails zamówienia o ID 10443 oraz 10440 (OrderID).
DELETE FROM order_details
WHERE OrderID IN (10443, 10440);
-- 13. Zmień adres (Address), miasto (City) i kraj (Country) dostawcy o numerze 2  (SupplierID) na ul. Pocztową, Nakło, Polskę. (tabela Suppliers)
UPDATE Suppliers
SET Address = 'ul. Pocztowa',
City = "Nakło",
Country = 'Polska'
WHERE SupplierID = 2;