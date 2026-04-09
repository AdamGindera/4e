SELECT tytul, nazwisko, IDfilm
FROM filmy
    INNER JOIN rezyserzy ON filmy.rezyserid=rezyserzy.idrezyser;


SELECT imie, nazwisko, idrezyser, COUNT(idrezyser) AS liczba_filmow
FROM rezyserzy 
    LEFT JOIN filmy ON rezyserzy.idrezyser=filmy.rezyserid
GROUP BY nazwisko;
