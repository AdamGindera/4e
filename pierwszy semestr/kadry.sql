-- ‒ Utwórz bazę danych o nazwie kadry, z zestawem polskich znaków (np. utf8_unicode_ci) 

-- ‒ Do bazy zaimportuj tabele z pliku baza.sql z rozpakowanego archiwum

-- ‒ Zapytanie 1: wybierające jedynie liczbę wierszy i pensję grupując pracowników według pensji i sortując  dane malejąco ze względu na pensję. W wyniku zapytania są wyświetlane poszczególne pensje oraz liczba osób, które pobierają taką pensję. Alias dla pola z liczbą osób: ilosc
SELECT pensja, COUNT(*) AS 'ilosc'
FROM Pracownicy
GROUP BY pensja
ORDER BY pensja DESC;

-- ‒ Zapytanie 2: wybierające jedynie imiona i nazwiska pracowników oraz odpowiadające im nazwy stanowisk dla pracowników o stażu wyższym niż 10 lat. Należy posłużyć się relacją
SELECT imie, nazwisko, nazwa
FROM Pracownicy
INNER JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id
WHERE staz > 10;
-- ‒ Zapytanie 3: liczące średnią pensję pracowników ze względu na rodzaj stanowiska. Zapytanie pokazuje średnią pensję na danym stanowisku i nazwę stanowiska. Należy posłużyć się
-- relacją. Średnia pensja powinna być zaokrąglona do dwóch miejsc po przecinku i mieć alias srednia_pensja
SELECT ROUND(AVG(pensja),2) AS srednia_pensja, nazwa
FROM Pracownicy
INNER JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id
GROUP BY nazwa;
-- Strona
-- − Nagłówek drugiego stopnia o treści: „Statystki dotyczące pensji”

-- − tabela z wierszem nagłówkowym o pozycjach: pensja, ilość pracowników

-- - tabela wypełniona jest przez skrypt 1

-- − Nagłówek pierwszego stopnia „Pracownicy ze stażem wyższym niż 10 lat”

-- - Tabela z wierszem nagłówkowym o pozycjach: imię, nazwisko, stanowisko

-- − tabela wypełniona jest przez skrypt 2

-- − Linia pozioma

-- − Nagłówek drugiego stopnia o treści: „Średnie pensje ze względu na rodzaj stanowiska”

-- − Efekt działania skryptu 3

-- CSS
-- - dla tabeli, komórek nagłówkowych i komórek z danymi określono obramowanie czarną linią 1px, 

-- - dla tabeli obramowania komórek połączone (collapse)

-- - utworzona klasa statistic o szerokości 30rem, obramowanie 2px, zielona linia, zaokrąglone rogi na 8px

-- Skrypt połączenia z bazą
-- Wymagania dotyczące skryptów:
-- ‒ Napisane w języku PHP

-- ‒ Należy stosować znaczące nazewnictwo wszystkich zmiennych lub funkcji

-- ‒ Skrypty łączą się z serwerem bazodanowym na localhost, użytkownik root bez hasła, baza danych o nazwie kadra

-- − Skrypt 1

-- ‒ Wysyła do bazy danych zapytanie 1

-- ‒ Zwrócone zapytaniem dane wypisuje jako kolejne wiersze w tabeli

-- ‒ Skrypt 2

-- ‒ Wysyła do bazy danych zapytanie 2

-- ‒ Zwrócone zapytaniem dane wypisuje jako kolejne wiersze w tabeli

-- ‒ Skrypt 3

-- ‒ Wysyła do bazy danych zapytanie 3

-- ‒ Wyświetla dane pobrane z bazy danych, w postaci oddzielnych bloków w klasie statistic w następujący sposób

-- - w nagłówku trzeciego stopnia stanowisko

-- ‒ W paragrafie treść „średnia pensja na stanowisku [stanowisko] wynosi: [srednia_pensja]”, gdzie dane zapisane w nawiasach [ ] wybrane zostały z bazy danych