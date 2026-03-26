<?php
$link=new mysqli('localhost','root','','filmoteka');
$sql="SELECT tytul
FROM filmy
WHERE gatunek LIKE 'SF'";
$result=$link->query($sql);
$titles=$result->fetch_all(1);

$sql="SELECT tytul, nazwisko
FROM filmy  INNER JOIN rezyserzy ON filmy.RezyserID=rezyserzy.IDRezyser";
$result=$link->query($sql);
$movies=$result->fetch_all(1);

$sql="SELECT tytul, Tresc
FROM filmy INNER JOIN recenzje ON filmy.RecenzjaID=recenzje.IDrecenzja
WHERE ocena = 4";
$result=$link->query($sql);
$reviews=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

<!-- -- 6 Wyświetl wynik działania kwerendy a. w postaci listy numerowanej -->
<ul>
    <!-- <li>[tytul]</li> -->
     <?php
     foreach($titles as $title){
        echo"
        <li>{$title['tytul']}</li>
        ";
     }
     ?>
</ul>
<!-- 7 Wyświetl wynik działania kwerendy b. w postaci listy wypunktowanej, tytuł powinien być pogrubiony -->
<ol>
    <!-- <li>[tytul] - reżyser <strong>[nazwisko]</strong></li> -->
     <?php
     foreach($movies as $movie){
        echo"
        <li>{$movie['tytul']} - reżyser <strong>{$movie['nazwisko']}</strong></li>
        ";
     }
     ?>
</ol>
<!-- 8. Wyświetl wynik działania kwerendy c. w postaci tabeli, każde pole w osobnej komórce -->

<table border="1" cellpadding="8" style="border-collapse: collapse;">
    <!-- <table ...>[tytul] - [Tresc] </table> -->
<?php
foreach($reviews as $review){
    echo"
    <tr>
    <td>{$review['tytul']} </td>
    <td>{$review['Tresc']}</td>
    </tr>
    ";
}
?>
</table>
</body>
</html>

<?php
$link->close();
?>