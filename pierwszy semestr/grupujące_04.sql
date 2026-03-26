-- policz ilość wszystkich rekordów (zapisów) ;
SELECT COUNT(*)
FROM towar;
-- z opisami - największą i najmniejsza CENĘ, oraz średnią arytmetyczną CENY ;
SELECT
    MAX(cena) AS max_cena, 
    MIN(cena) AS min_cena,
   ROUND( AVG(cena),2) AS avg_cena
FROM towar;
-- sumę wartości towarów, średnią arytmetyczną wartości (ILOSC * CENA) ;
SELECT SUM(ilosc * cena), AVG(ilosc * cena)
FROM towar;
-- policz średnią arytmetyczną ceny, a później policz ręcznie średnią arytmetyczną ceny = suma CENY / ilość rekordów. 

-- Wyświetl średnią cenę wszystkich towarów o cenie pomiędzy 10 a 1000 zł
SELECT AVG(cena)
FROM towar
WHERE cena BETWEEN 10 AND 1000;
-- wyświetl sumę masy (ilosc * waga) , ale tylko dla rodzaju  GD i TR
SELECT SUM(ilosc * waga)
FROM towar
WHERE rodzaj IN ('GN', 'TR');
-- Wyświetl łączną ilość wszystkich zamówionych produktów,
SELECT SUM(ilosc)
FROM towar
WHERE zamow = 'Prawda';
-- wyświetl największą wartość (ilosc * cena)  towarów wyprodukowanych w 1997 roku
SELECT MAX(ilosc * cena)
FROM towar
WHERE data_prod BETWEEN '1997-01-01' AND '1997-12-31';

SELECT MAX(ilosc * cena)
FROM towar
WHERE data_prod LIKE '1997-%';
-- policz ile rekordów jest w każdym RODZAJU 
SELECT rodzaj, COUNT(*)
FROM towar
GROUP BY rodzaj;
-- policz ile rekordów jest w każdym RODZAJU, posortuj malejąco wg RODZAJU;

-- policz sumę i średnią arytmetyczną wartości (ilość * cena) i minimalnej i maksymalnej masie (ilość * waga) dla każdego RODZAJU towaru ;

-- policz ile rekordów jest w każdym RODZAJU - wyświetl ilości rekordów większe od 15 ;

-- policz średnią arytmetyczną ceny dla każdego RODZAJU - wyświetl średnie mniejsze od 500;

-- dla każdego rodzaju towarów wyświetl ilość rekordów, średnią wagę, średnią ilość, maksymalną i minimalną cenę dla ilości rekordów w RODZAJU mniejszej od 15.

-- dla każdego rodzaju towarów wyświetl maksymalną cenę dla ilości rekordów w RODZAJU większe od 10. Uwzględnij tylko towary zamówione.

-- Oblicz minimalną cenę towarów niezamówionych dla każdego rodzaju. 

-- oblicz średnią cenę towarów zamówionych (zamow) i nie zamówionych

-- oblicz średnią cenę towarów wyprodukowanych w 1999 roku  dla poszczególnych rodzajów towaru