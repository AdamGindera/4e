-- A. Utwórz nową pustą bazę (imię_nazwisko - wpisz swoje dane). Zaimportuj pobrany plik. 

-- B. Utwórz poniższe kwerendy. Wykonaj  i udokumentuj wykonanie pełnoekranowym zrzutem. Treść kwerend zapisz w pliku kwerendy.sql 

-- Dodaj nowy podzespół do tabeli podzespoły(id typu, id producenta, nazwa, cena) (2, 6,'DDR4 32', 300)
INSERT INTO podzespoly (typy_id, producenci_id,nazwa, cena)
VALUES (2, 6,'DDR4 32', 300);
-- Wyświetla dostępne podzespoły(wybierz wersję): 
-- nazwy typów podzespołów (pole kategoria) i nazwy podzespołów wraz z ceną (tabele typy i podzespoly )
SELECT kategoria AS typ, nazwa, cena
FROM typy 
INNER JOIN podzespoly ON typy.id=podzespoly.typy_id;
-- lub niżej punktowane zapytanie wyświetlajace tylko id typu, nazwę i cenę z tabeli podzespoly
SELECT typy_id, nazwa, cena
FROM podzespoly;
-- Wyświetla id  i  kategorię z tabeli typy
SELECT id, kategoria
FROM typy;
-- C. przygotuj witrynę index.php

-- nawiąż połączenie z bazą imię_nazwisko 

-- W nagłówku h1 wypisz swoje imię i nazwisko. Następnie wyświetl raport pokazujący dostępne podzespoły(typ, nazwa, cena) w postaci listy wypunktowanej, typ podzespołu powinien być pogrubiony (wybierz wersję) (wykorzystaj zapytanie 2):
--   <kategoria> <nazwa podzespołu>-<cena>
-- lub niżej punktowana <id typu> <nazwa>-<cena>

-- Utwórz formularz do wprowadzania danych do tabeli podzespoły: (wybierz wersję) Formularz powinien być obsługiwany przez stronę dodawanie.php, a dane przekazywane metodą bezpieczną:
-- nazwa (pole tekstowe), cena (pole numeryczne), id producenta (pole numeryczne) oraz typ podzespołu wybierany z listy rozwijanej na postawie tabeli typy (na liście kategorie, jako value id, wykrzystaj zapytanie 3)

-- lub niżej punktowany: nazwa(pole tekstowe), cena(pole numeryczne), id producenta (pole numeryczne) oraz typ podzespołu( pole typu numerycznego)
 
-- zamknij połączenie z bazą danych

-- C. przygotuj witrynę dodawanie.php

-- nawiąż połączenie z bazą danych 
-- Sprawdź, czy zostały wypisane wszystkie dane do pól formularza, jeśli tak, to odczytaj dane z formularza i wykonaj podpunkty 3-4, jeśli nie to wypisz komunikat "popraw dane"
-- przygotuj zapytanie dodające dane do tabeli podzespoly(wykorzystaj zapytanie 1)
-- Wykonaj zapytanie dodające dane do tabeli podzespoly, w przypadku pomyślnego wykonania  wypisz komentarz "<nazwa> został dodany" - w polu nazwa powinna być nazwa podzespołu
-- zamknij połączenie z bazą danych