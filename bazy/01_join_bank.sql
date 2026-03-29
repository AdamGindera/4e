-- 1.Imię i nazwisko pracownika oraz region, w którym pracuje.
SELECT imie, nazwisko, region
FROM pracownicy INNER JOIN oddzialy ON pracownicy.nrrozliczoddz=oddzialy.nrrozlicz; 
-- 2.Imię i nazwisko pracownika, nazwa i ilość sprzedanych produktów.
SELECT imie, nazwisko, nazwaproduktu, ilosc
FROM pracownicy INNER JOIN sprzedaz ON pracownicy.nr=sprzedaz.nrpracownika;
-- 3.Imię i nazwisko pracownika, nazwa i punktacja produktu
SELECT imie, nazwisko, nazwaproduktu, punktacja
FROM pracownicy INNER JOIN sprzedaz ON pracownicy.nr=sprzedaz.nrpracownika
                INNER JOIN produkty ON produkty.nazwa=sprzedaz.nazwaproduktu;
-- 4. .Imię i nazwisko pracownika, nazwa oraz wartość sprzedanych produktów. (ilość razy punktacja)
SELECT imie, nazwisko, nazwa, punktacja*ilosc
FROM pracownicy INNER JOIN sprzedaz ON pracownicy.nr=sprzedaz.nrpracownika
                INNER JOIN produkty ON produkty.nazwa=sprzedaz.nazwaproduktu;
-- 5.Imię i nazwisko pracownika, nazwa i suma punktów ze sprzedaży produktu – tylko dla pracowników z oddziału w Warszawie
SELECT imie, nazwisko, nazwa, punktacja*ilosc
FROM pracownicy INNER JOIN sprzedaz ON pracownicy.nr=sprzedaz.nrpracownika
                INNER JOIN produkty ON produkty.nazwa=sprzedaz.nazwaproduktu
                INNER JOIN oddzialy ON oddzialy.nrrozlicz=pracownicy.nrrozliczoddz
WHERE miejscowosc = 'Warszawa';
-- 6.Imiona, nazwiska i numery pracowników wyróżnionych w zeszłym okresie.
SELECT imie, nazwisko, nrpracownika
FROM pracownicy INNER JOIN wyroznieni ON pracownicy.nr=wyroznieni.Nrpracownika;
--  połącz tabelę Pracownicy i Wyroznieni (pole łączące to NrPracownika i Nr), w zestawieniu pojawią się tylko Ci pracownicy, których numery są w tabeli Wyróżnieni - sprawdź