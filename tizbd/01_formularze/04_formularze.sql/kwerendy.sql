-- A. Utwórz nową pustą bazę (imię_nazwisko - wpisz swoje dane). Zaimportuj pobrany plik . 

-- B. Utwórz poniższe kwerendy. Wykonaj  i udokumentuj wykonanie pełnoekranowym zrzutem. Treść kwerend zapisz w pliku kwerendy.sql 

-- Dodaje nowe danie do tabeli dania (id typu, nazwa, cena) (4, 'Herbata', 3)
INSERT INTO dania (typ, nazwa, cena)
VALUES (4, 'Herbata', 3);
-- Wyświetla dostępne dania (wybierz wersję): 
-- nazwy typów dań i nazwy dań wraz z ceną (tabela dania i typy_dan)
SELECT dania.nazwa, typy_dan.nazwa, cena
FROM dania INNER JOIN typy_dan ON dania.typ=typy_dan.id;
-- lub niżej punktowane zapytanie wyświetlajace tylko id typu, nazwę i cenę z tabeli dania 
SELECT typ, nazwa, cena
FROM dania;
-- Wyświetla id i nazwę z tabeli typy_dan
SELECT id, nazwa
FROM typy_dan;
-- C. przygotuj witrynę index.php

-- nawiąż połączenie z bazą imię_nazwisko 

-- W nagłówku h1 wypisz swoje imię i nazwisko. Następnie wyświetl raport pokazujący dostępne dania (typ, nazwa, cena) w postaci listy numerowanej, typ powinien być pogrubiony (wybierz wersję) (wykorzystaj zapytanie 2):
--   <nazwa typu> <nazwa dania>-<cena>
-- lub niżej punktowana <id typu> <nazwa>-<cena>

-- Utwórz formularz do wprowadzania danych do tabeli dania: (wybierz wersję) Formularz powinien być obsługiwany przez stronę dodawanie.php, a dane przekazywane metodą bezpieczną:
-- nazwa (pole tekstowe), cena (pole numeryczne) oraz typ dania wybierany z listy rozwijanej na postawie tabeli typy_dan (na liście nazwy typów dania, jako value id, wykrzystaj zapytanie 3

-- lub niżej punktowany: nazwa(pole tekstwowe), cena(pole numeryczne) oraz typ dania ( pole typu numerycznego)
 
-- zamknij połączenie z bazą danych

-- C. przygotuj witrynę dodawanie.php

-- nawiąż połączenie z bazą danych 
-- Sprawdź, czy zostały wypisane wszystkie dane do pól formularza, jeśli tak, to odczytaj dane z formularza i wykonaj podpunkty 3-4, jeśli nie to wypisz komunikat "uzupełnij dane"
-- przygotuj zapytanie dodające dane do tabeli dane (wykorzystaj zapytanie 1)
-- Wykonaj zapytanie dodające dane do tabeli dane, w przypadku pomyślnego wykonania  wypisz komentarz "danie <nazwa> zostało dodane" - w polu nazwa powinna być nazwa dania
-- zamknij połączenie z bazą danych
