-- SELECT nazwa
-- FROM dania;

-- SELECT imie, nazwisko 
-- FROM pracownicy;

-- a) Zwrócenie tytułów filmów, dla których gatunek to SF,
SELECT tytul
FROM filmy
WHERE gatunek LIKE 'SF';
-- b) Zwrócenie wszystkich tytułów filmów wraz z nazwiskami reżyserów,
SELECT tytul, nazwisko
FROM filmy  INNER JOIN rezyserzy ON filmy.RezyserID=rezyserzy.IDRezyser;
-- c) Zwrócenie filmów, dla których ocena w recenzji jest równa 4, 
SELECT tytul, Tresc
FROM filmy INNER JOIN recenzje ON filmy.RecenzjaID=recenzje.IDrecenzja
WHERE ocena = 4;
-- 5. Wykonaj zrzuty ekranowe z wynikami działania kwerend a, b, c. Na zrzucie powinny być widoczne zwrócone rekordy. Zrzuty zapisz w podfolderze baza.

 

-- Wyświetlenie raportów

-- 6 Wyświetl wynik działania kwerendy a. w postaci listy numerowanej

-- 7 Wyświetl wynik działania kwerendy b. w postaci listy wypunktowanej, tytuł powinien być pogrubiony

-- 8. Wyświetl wynik działania kwerendy c. w postaci tabeli, każde pole w osobnej komórce