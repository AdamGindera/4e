-- 3. Które osoby figurujące w bazie jako czytelnicy, nie wypożyczyły ani razu choćby jednej książki? (tabele: Czytelnik, Wypożyczenia, pola w kwerendzie: Czytelnik_Imie, Czytelnik_Nazwisko, Data_wypozyczenia)
SELECT Czytelnik_Nazwisko, Czytelnik_Imie, Data_wypozyczenia
FROM Czytelnik
    LEFT JOIN wypozyczenia ON Czytelnik.ID=wypozyczenia.Czytelnik_ID
    WHERE Data_wypozyczenia IS NULL;
 

-- 4. Kto nie ma kota? (Tabele: Ludzie, Koty, pola w kwerendzie: Imie, Nazwisko, Imie_kota, Rasa)

-- 5.Jak ma na imię kot bez właściciela?   (Tabele: Ludzie, Koty, pola w kwerendzie: Imie_kota oraz nie wyświetlane pole Nazwisko - tylko dla kryterium) 

 

-- 6. Wyświetl informacje o uczniach, którzy nie mają ocen  (tabele: Uczniowie, Oceny, pola w kwerendzie: imie, nazwisko, ocena, data)
SELECT nazwisko, imie, ocena
FROM Uczniowie
    LEFT JOIN oceny ON uczniowie.IDucznia=Oceny.IDucznia
    WHERE ocena IS NULL;
-- 7. Wyświetl informacje o przedmiotach, z których nie wystawiono żadnych ocen (tabele: Oceny, Przedmioty, pola w kwerendzie: Nazwa_przedmiotu, Nazwisko_nauczyciela, Data)

-- 8. Właściciel wypożyczalni filmów (online) potrzebuje raportu o ich popularności (ile razy dany film został wypożyczony). Niestety przygotowane zestawienie nie uwzględniało filmów nigdy nie wypożyczonych. Napraw to. Przygotuj kwerendę wyświetlającą tytuły filmów nigdy nie wypożyczonych (tabele: Filmy, Wypożyczenia; pola w kwerendzie: Tytul, Gatunek, Data_wyp)
SELECT Tytul, COUNT(ID_wyp) AS ilosc_wypozyczen
FROM filmy
    LEFT JOIN wypozyczenia ON filmy.ID_filmu=wypozyczenia.ID_filmu
    GROUP BY tytul
    ORDER BY ilosc_wypozyczen DESC;
    
 

-- 9. Poprawiasz bazę danych pewnej przychodni. Twoim zadaniem jest wymusić więzy integralności między tabelami Pacjenci i Wizyty.

 

-- A. Odszukaj wiersze, które naruszają więzy integralności (tzn.w tabeli Wizyty występuje ID_pacjenta, którego nie ma w tabeli Pacjenci)
ALTER TABLE Wizyty
ADD FOREIGN KEY(ID_pacjenta) REFERENCES Pacjenci(ID_pacjenta);

SELECT wizyty.ID_pacjenta
FROM Wizyty
LEFT JOIN Pacjenci ON wizyty.ID_pacjenta=Pacjenci.ID_pacjenta
WHERE Pacjenci.ID_pacjenta IS NULL;
-- B. Być może w bazie brakuje pacjenta pacjenta Antoniego Mizerskiego (ubezpieczony), którego ktoś omyłkowo usunął z tabeli Pacjenci. Niestety nikt nie pamięta jaki miał identyfikator. Jeśli go odszukasz (przygotuj kwerendę), to dopisz Antoniego do tabeli Pacjenci.
 INSERT INTO Pacjenci
 VALUES(58, 'Antoni', 'Mizerski', 1, 'm');
