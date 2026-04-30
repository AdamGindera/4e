 
-- 1.  Wykonaj zapytania sql wyszukujące odpowiedzi na poniższe pytania:
-- A. Ile jest chętnych do przyjęcia do poszczególnych przedszkoli? Wyświetl nazwę przedszkola i ilość chętnych.
SELECT nazwa_przedszkola, COUNT(*) AS ilosc_chetnych
FROM przedszkola INNER JOIN dzieci ON przedszkola.id_przedszkola=dzieci.id_przedszkola
GROUP BY nazwa_przedszkola;
-- B. Ilu jest chętnych do przyjęcia do poszczególnych przedszkoli, uwzględnij wyłącznie trzylatków
SELECT nazwa_przedszkola, COUNT(*) AS ilosc_chetnych
FROM przedszkola INNER JOIN dzieci ON przedszkola.id_przedszkola=dzieci.id_przedszkola
WHERE dzieci.wiek = 3
GROUP BY nazwa_przedszkola;
-- C. Wyświetl imiona i nazwiska dzieci, które mają na liście preferencji przedszkole mające w nazwie "Zuch". 
SELECT imie, nazwisko
FROM dzieci 
    INNER JOIN przedszkola ON przedszkola.id_przedszkola=dzieci.id_przedszkola
WHERE nazwa_przedszkola LIKE '%Zuch%';
 
-- D. Wyświetl imiona i nazwiska dzieci, które chodzą do przedszkola o identyfikatorze 16, 14, 8,28, 27 . Użyj operatora IN.
SELECT imie, nazwisko 

-- E. Zmodyfikuj zapytanie z części D tak, aby zamiast numerów przedszkoli były wyświetlane ich nazwy.
SELECT imie, nazwisko, nazwa_przedszkola
FROM dzieci
    INNER JOIN przedszkola ON przedszkola.id_przedszkola=dzieci.id_przedszkola
WHERE przedszkola.id_przedszkola IN (16,14,8,28,27);
 
-- F. Policz, ilu jest kandydatów do poszczególnych przedszkoli (wystarczą identyfikatory, uwzględnij tylko chłopców. Dane uporządkuj malejąco według ilości chętnych. Wyświetl tylko te wiersze, w których  ta ilość jest większa od 15.
SELECT nazwa_przedszkola, COUNT(*) AS ilosc_kandydatow
FROM przedszkola 
    INNER JOIN dzieci ON przedszkola.id_przedszkola=dzieci.id_przedszkola
WHERE plec = 'chlopiec'
GROUP BY nazwa_przedszkola
HAVING ilosc_kandydatow > 15
ORDER BY ilosc_kandydatow DESC;
-- G. Policz, ilu jest chętnych do poszczególnych przedszkoli. Wyświetl nazwy przedszkoli i liczbę miejsc w przedszkolach. Czy są takie przedszkola, w których liczba chętnych jest różna od ilości miejsc? 
 SELECT nazwa_przedszkola, liczba_miejsc, COUNT(*) AS kandydaci
 FROM przedszkola
    INNER JOIN dzieci ON przedszkola.id_przedszkola=dzieci.id_przedszkola
GROUP BY nazwa_przedszkola
HAVING liczba_miejsc != kandydaci;
-- H. Utwórz uporządkowaną alfabetycznie według nazwisk, listę pięcioletnich dziewczynek, które są zapisane do przedszkola Smerf lub Stokrotka.
SELECT nazwisko, nazwa_przedszkola, plec
FROM dzieci
    INNER JOIN przedszkola ON przedszkola.id_przedszkola=dzieci.id_przedszkola
WHERE plec = 'dziewczynka'
    AND (nazwa_przedszkola LIKE '%Smerf%' OR nazwa_przedszkola LIKE '%Stokrotka%')
ORDER BY nazwisko;

-- I.  Podaj nazwy czterech przedszkoli, które mają największą ilość chętnych (uporządkowane malejąco według ilości chętnych) 
SELECT nazwa_przedszkola, COUNT(*) AS ilosc_chetnych
FROM przedszkola
    INNER JOIN dzieci ON przedszkola.id_przedszkola=dzieci.id_przedszkola
GROUP BY nazwa_przedszkola
ORDER BY ilosc_chetnych DESC
LIMIT 4;
