 
-- Podzapytanie wybierające wiele wartości
-- 1. Wybierz dane klientów klientów, którzy nie kupili żadnego produktu z kategorii Confections
 SELECT CustomerName
 FROM customers
 WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM orders INNER JOIN order_details USING(orderID)
    JOIN products USING (ProductID) 
    JOIN categories USING (CategoryID)
    WHERE CategoryName = 'Confections'
 );
-- 2. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe.
 SELECT Address, City, Country
 FROM customers
 WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM orders
    WHERE OrderDate LIKE '1997-%-%'
 );
-- 3. Wyświetl nazwiska i imiona pracowników, którzy nie sprzedali niczego do Argentyny.
SELECT FirstName, LastName
FROM employees
WHERE EmployeeID NOT IN (
    SELECT EmployeeID
    FROM orders INNER JOIN Customers ON orders.CustomerID=Customers.CustomerID
    WHERE Country LIKE 'Argenitna'
);
-- 4. Wypisz nazwy i kraje klientów, którzy zawsze zamawiali tylko jeden rodzaj produktu (na każdym zamówieniu).
SELECT CustomerName, Country
FROM Customers 
WHERE CustomerID NOT IN (
 SELECT CustomerID
 FROM orders INNER JOIN order_details USING(orderID)
 GROUP BY OrderID
 HAVING count(*) > 1
);

 
 
 
-- Podzapytania i zapytania DML
-- 1. Usuń wszystkich szczegóły zamówień (wiersze z OrderDetails) dotyczące produktu o nazwie "Chang"

-- 2. Zwiększ o 10% ceny wszystkich produktów z kategorii "Confections"

-- 3. Zmniejsz o 5% ceny wszystkich produktów dostarczanych przez dostawców z  Tokyo  (city)

-- 4. Usuń wszystkie produkty z kategorii  o opisie "Cheeses" (Description)  o cenie większej od 50

-- 5. Zwiększ o 10% cenę wszystkich produktów z kategorii o nazwie zaczynającej się na literę C 

-- 6. Usuwamy wszystkie produkty dostarczane przez dostawców z USA

-- 7. Usuń wszystkie zamówienia z Orders złożone przez klientów z Londynu ('London').

 
-- Podzapytania wybierające jedną wartość
-- 1. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii 
 
-- 2. Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich produktów oraz różnicę między ceną produktu a średnią ceną wszystkich produktów
 
 
 
 
 
 
-- ------------------ NIETYPOWE ----------------------------------------------------------------------------
-- 1. Podaj produkty kupowane przez więcej niż 10 klientów (lub 10 różnych klientów - wsk. utwórz zapytanie wybierające różne wiersze CustomerID, ProductID z tabel Orders i OrdersDetalis i użyj jako podzapytanie w części FROM)
 
-- 2. Wybierz nazwy i numery telefonów klientów, którzy kupili więcej niż 3 różne produkty z kategorii .Confections.
 
 
-- 3. Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią cenę wszystkich produktów danej kategorii 