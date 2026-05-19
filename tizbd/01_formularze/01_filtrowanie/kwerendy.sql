-- najwyższa cena w bazie
SELECT MAX(price) AS max_price
FROM Products


-- Wyświetla nazwy i ceny towarów o cenie pomiędzy 10 a 50
SELECT productName, price
FROM products
WHERE price BETWEEN 10 AND 50;

-- Utwórz formularz z listą rozwijąna z nazwami dostawców
SELECT SupplierID, SupplierName
FROM suppliers;

-- Po wybraniu pozycji powinna być wyświetlona lista produktów dostarczanych przez tego dostawcę
SELECT ProductName, Price
FROM products INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID;