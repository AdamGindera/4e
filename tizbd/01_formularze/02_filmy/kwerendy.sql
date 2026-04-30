SELECT tytul, nazwisko, IDfilm
FROM filmy
    INNER JOIN rezyserzy ON filmy.rezyserid=rezyserzy.idrezyser;


SELECT imie, nazwisko, idrezyser, COUNT(idrezyser) AS liczba_filmow
FROM rezyserzy 
    LEFT JOIN filmy ON rezyserzy.idrezyser=filmy.rezyserid
GROUP BY nazwisko;

INSERT INTO rezyserzy
(imie, nazwisko) 
VALUES ('Jan', 'Kowalski');

DELETE FROM filmy
WHERE IDFilm = 5;

UPDATE filmy
SET tytul = 'glupi i glupszy'
WHERE IDfilm = 1;

SELECT idfilm, tytul 
FROM filmy;