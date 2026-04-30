-- 1. Utwórz tabelę KatalogConfections zawierającą wszystkie dane o produktach z kategorii Confections
CREATE TABLE KatalogConfections AS
SELECT Products.* 
FROM categories 
    JOIN Products USING(CategoryID) 
WHERE CategoryName LIKE "Confections"; 

-- 2. ze względu na nowy podatek podnieś cenę wszystkich artykułów kategorii Confections o 20% w tabeli Products
UPDATE Products
SET Price = price * 1.20
WHERE CategoryID = (
    SELECT CategoryID
    FROM categories
    WHERE CategoryName = "Confections"
);
-- 3. Zmień nazwę tabeli KatalogConfections na KatalogTaniejJuzBylo 
ALTER TABLE KatalogConfections
RENAME TO KatalogTaniejJuzBylo;
-- 4. Skopiuj do tabeli KatalogTaniejJuzBylo wszystkie produkty z kategorii Beverages
INSERT INTO KatalogTaniejJuzBylo
SELECT Products.*
FROM categories
    JOIN Products USING(CategoryID)
WHERE CategoryName LIKE "Beverages";
-- 5. Do tabeli Archiwum przenieś dane z tabeli Orders dotyczące zamówień z 1996 roku (skopiuj - jeśli trzeba utwórz tabelę -i potem usuń)
CREATE TABLE Archiwum AS
SELECT Orders.*
FROM Orders
WHERE OrderDate LIKE "1996-%-%";
-- 6. Utwórz tabelę  Archiwum_Kontrahentów z danymi: nazwa dostawcy lub nazwa klienta, osoba do kontaktu, miasto, kraj z Włoch
CREATE TABLE Archiwum_Kontrahentow
SELECT SupplierName AS kontrahent , ContactName, City, Country
FROM Suppliers
WHERE Country = 'Italy'
UNION
SELECT CustomerName, ContactName, City, Country
FROM Customers
WHERE Country = 'Italy';
-- 7. Usuń klientów i dostawców z Włoch z tabel Customers i Suppliers (dwoma zapytaniami)

-- 8. Do tabeli Archiwum_Kontrahentów dodaj kontrahentów z Niemiec i Francji
INSERT INTO Archiwum_Kontrahentow
SELECT SupplierName, ContactName, City, Country
FROM Suppliers
WHERE Country = 'Germany' OR Country = 'France'
UNION
 SELECT CustomerName, ContactName, City, Country
 FROM Customers
 WHERE Country = 'Germany' OR Country = 'France';

-- 9. Z tabeli Customers wybierz dane klientów z Niemiec i dodaj ich do tabeli Suppliers

-- 10. Utwórz tabelę Archiwum zawierającą wszystkie dane z tabeli Orders dotyczące zamówień z 1996 roku
CREATE TABLE Archiwum
SELECT Orders.*
FROM Orders
WHERE OrderDate LIKE '1996-%-%';
 

-- 11. Usuń z tabeli Orders wszystkie zamówienia z 1996 roku
DELETE FROM Orders
WHERE OrderDate LIKE '1996-%-%';
UPDATE order_details
SET OrderID = NULL
WHERE OrderID IN (
    SELECT orderID
    FROM orders
    WHERE OrderDate LIKE '1996-%-%';
);
-- 12. Do tabeli Archiwum dodaj wszystkie dane dotyczące zamówień ze stycznia 1997 roku
INSERT INTO Archiwum
SELECT Orders.*
FROM Orders
WHERE OrderDate LIKE '1997-01-%';