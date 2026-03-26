-- Zapytanie 1: wybierające wszystkie wiersze z tabeli pokoje
SELECT *
FROM pokoje;
-- Zapytanie 2: wybierające z tabeli rezerwacje i pokoje jedynie id pokoju, nazwa oraz sezon dla rezerwacji o liczbie dni przekraczającej tydzień. Zastosuj relację.
SELECT id, nazwa, sezon
FROM pokoje INNER JOIN rezerwacje ON pokoje.id=rezerwacje.id_pok
WHERE liczba_dn > 7;
-- Zapytanie 3: liczące sumę dni rezerwacji dla różnych sezonów. Alias dla pola z sumą dnia to razem_rezerwacji
SELECT sezon, SUM(liczba_dn) AS razem_rezerwacji
FROM rezerwacje
GROUP BY sezon;
-- Raporty:

-- A. Skrypt wysyła do bazy danych zapytanie 1
--  Dane z każdego zwróconego zapytaniem wiersza wypisywane są w kolejnym wierszu tabeli

-- B. Skrypt wysyła do bazy danych zapytanie 2
--  Dane z każdego zwróconego zapytaniem wiersza wypisywane są formie listy wypunktowanej,  nazwa pokoju powinna być pogrubiona, a sezon pochyloną czcionką

-- C. B. Skrypt wysyła do bazy danych zapytanie 3
--  Nazwa sezonu powinna być wypisana jako nagłówek poziomu 4, suma dni rezerwacji poniżej w formie: "suma dni rezerwacji dla sezonu [sezon] wynosi [razem_rezerwacji]". w miejscu [sezon] i [razem_rezerwacji} wpisz właściwe pola wybrane zapytaniem