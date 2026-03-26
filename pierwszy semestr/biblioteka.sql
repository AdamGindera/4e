-- Zapytanie wybierające jedynie pola imie i nazwisko dla wszystkich rekordów w tabeli czytelnicy, posortowane rosnąco nazwiskami czytelników
SELECT imie, nazwisko
FROM czytelnicy
ORDER BY nazwisko;
-- wybierające jedynie pole tytul dla wszystkich utworów w tabeli książki, należącej do kategorii dramat
SELECT tytul
FROM ksiazki INNER JOIN kategorie ON ksiazki.id_kategoria=kategorie.id
WHERE nazwa = 'dramat';
-- wybierające jedynie pole tytul wszystkich utworów w tabeli ksiązki, wypożyczonych przez czytelnika o identyfikatorze 2. W zapytaniu należy posłużyć się relacją
SELECT tytul
FROM ksiazki INNER JOIN wypozyczenia ON ksiazki.id=wypozyczenia.id_ksiazka
WHERE id_czytelnik = 2;
-- wybierające jedynie pola imie i  nazwisko dla wszystkich rekordów w tabeli autorzy oraz obliczające liczbę tytułów danego autora znajdujących się w bazie biblioteka. Nazwa kolumny (alias) dla zliczania tytułów: ile_tytulow
SELECT imie, nazwisko, COUNT(*) AS 'ile_tytulow'
FROM autorzy INNER JOIN ksiazki ON autorzy.id=ksiazki.id_autor
GROUP BY id_autor;

-- \RAPORTY

-- 5. na podstawie zapytania 1 - wyświetlające imiona i nazwiska czytelników, każdy czytelnik w osobnym paragrafie, nazwiska czytelników powinny być podgrubione (wyróżnione, znacznik semantyczny)

-- 6. Na podstawie zapytania 2 - wyświetlające tytuły utworów w postaci listy wypunktowanej

-- 7. na podstawie zapytania 3 - wyświetlające tytuły utworów w postaci listy numerowanej

-- 8.8. Na podstawie zapytania 4 - wyświetlające dane w postaci tabeli, wraz z wierszem nagłówkowym