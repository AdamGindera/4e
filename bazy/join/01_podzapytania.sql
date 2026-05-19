select
-- SELECT ROUND(AVG(price),2) 
-- FROM products;  
1.  Wypisać nazwę wszystkich towarów, cenę i pole ze średnią cenę wszystkich towarów
SELECT 
    ProductName, 
    price,
    (SELECT ROUND(AVG(price),2) 
    FROM products   ) AS srednia_cena
FROM products;

2 . Wypisać nazwę towaru, cenę i różnicę między jego ceną a średnią ceną wszystkich towarów
SELECT 
    ProductName, 
    price,
    price-
    (SELECT ROUND(AVG(price),2) 
    FROM products   ) AS roznica
FROM products;
3. wypisze nazwę towaru, cenę oraz ile razy jego cena jest większa od najmniejszej ceny wszystkich towarów (stosunek ceny do ceny minimalnej)
SELECT
    ProductName,
    Price,
    ROUND(Price/
    (SELECT MIN(price)
    FROM products),2) AS min_cena
FROM products;
where
4.  wybieramy te zamówienia, w których łączna ilość zamówionych produktów jest mniejsza od średniej ilości zamawianych produktów
SELECT
    orderID,
    SUM(Quantity) as suma
FROM order_details
GROUP BY orderID
HAVING suma > (SELECT AVG(Quantity) as srednia_ilosc
FROM order_details);

-- SELECT AVG(Quantity) as srednia_ilosc
-- FROM order_details;
5. zapytanie zwracające nazwę najtańszego towaru
SELECT 
    MIN(price) as najtanszy 
FROM products

SELECT productName, Price
FROM products
WHERE price = (
    SELECT MIN(Price)
    FROM products
);
6. zapytanie zwracające nazwy i ceny wszystkich produktów z kategorii Seafood o cenach niższych niż średnia cena produktów
SELECT ProductName, Price
FROM products
WHERE CategoryID = (
    SELECT CategoryID
    FROM categories
    WHERE CategoryName = 'Seafood'
) AND Price < (
    SELECT AVG(price)
    FROM products
);
7. wyświetl nazwę i cenę towarów, które zostały zamówione (kiedykolwiek) w ilości co najmniej 15 sztuk (Quantity )
SELECT Distinct ProductName, Price
FROM products JOIN order_details ON order_details.ProductID=products.ProductID
WHERE Quantity > 15;

SELECT ProductName, Price
FROM products 
WHERE ProductID IN (
    SELECT ProductID
    FROM order_details
    WHERE Quantity > 15
);

8. wyświetl nazwę i cenę towarów, które zawsze są zamawiane w ilości co najmniej 15 sztuk (Quantity ) (i były co najmniej raz zamówione)
SELECT ProductName, Price
FROM products
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM order_details
    WHERE Quantity <= 15
);
9. Wyświetl nazwiska i imiona klientów (Customer Name), którzy nie korzystali z firmy  Speedy Express
SELECT CustomerName
FROM customers 
WHERE CustomerID NOT IN (SELECT Distinct CustomerID
FROM orders JOIN shippers USING (ShipperID)
WHERE ShipperName = 'Speedy Express');

-- SELECT Distinct CustomerID
-- FROM orders JOIN shippers USING (ShipperID)
-- WHERE ShipperName = 'Speedy Express';
10. Wszystkie informacje o klientach, mających tę samą wartość w polu CustomerName (może wpisanych przez pomyłkę?)
SELECT *
FROM customers
WHERE CustomerName IN (SELECT CustomerName
FROM customers
GROUP BY CustomerName
HAVING COUNT(*) > 1);
-- INSERT INTO customers
-- (CustomerName, Country)
-- VALUES('Wolski','Polska');
SELECT CustomerName,
FROM customers
GROUP BY CustomerName
HAVING ilosc > 1;


update

11 Podnieś o 10% ceny produktów z kategorii  "Confections"

12  Dla zamówień klientów z UK zmień spedytora na "United Package"

13. Dodaj nowy produkt z kategorii Confections dostarczony przez Exotic Liquid 