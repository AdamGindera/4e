-- Utwórz bazę danych i zaimportuj plik.

-- Zapytania: 
-- A. dodające nowego czytelnika Zuzannę Kowalską, kod pusty ( '' )
INSERT INTO czytelnicy
VALUES (11, 'Zuzanna', 'Kowalska', '');
-- B. wyświetlające id książki, tytuł, imię i nazwisko autora
SELECT ksiazki.id, tytul, autorzy.imie, autorzy.nazwisko
FROM ksiazki
    INNER JOIN autorzy ON ksiazki.id_autor=autorzy.id;
-- C. usuwające książkę o id równym 37
DELETE FROM ksiazki
WHERE id = 37;
-- D. wyświetlającą wypożyczenia
select * from wypozyczenia;
-- E. zmieniającą datę oddania wypożyczenia o id równym 1 na dzisiejszą  (CURRENT_DATE)
UPDATE wypozyczenia 
SET data_oddania = CURRENT_DATE
WHERE id = 1;

-- utwórz stronę:
-- A. formularz dodający nowego czytelnika z polami imię i nazwisko

-- B. Lista wypunktowana wyświetlająca książki, elementy listy wypełnione skryptem 
-- C. formularz do usuwania książki, z polem id książki
-- D. tabela wyświetlająca dane dotyczące wypożyczeń: id wypożyczenia, tytuł książki, nazwisko czytelnika. Tabela wpełniona skryptem D
-- E. formularz do zmiany daty oddania na bieżącą z polem id wypożyczenia

-- dodaj skrypty
--  A. dodaje nowego czytelnika, tylko jeśli w formularzu zostały uzupełnione dane czytelnika
INSERT INTO czytelnicy

-- B. wyświetlające id książki, tytuł, imię i nazwisko autora w formacie: "[id] [tutul], [imie] [nazwisko]" (id pogrubione znacznikiem semantycznym)
-- C. usuwający książkę o id wskazanym w formularzu
-- D. wyświetlający dane dotyczące wypożyczeń
-- E. zmieniający datę oddania na bieżącą dla wypożyczenia wskazanego w formularzu 