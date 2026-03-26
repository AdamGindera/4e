<?php
$link=new mysqli('localhost','root','','biblioteka1');
$sql="SELECT imie, nazwisko
FROM czytelnicy
ORDER BY nazwisko;";
$result=$link->query($sql);
$readers=$result->fetch_all(1);

$sql="SELECT tytul
FROM ksiazki INNER JOIN kategorie ON ksiazki.id_kategoria=kategorie.id
WHERE nazwa = 'dramat';";
$result=$link->query($sql);
$titles=$result->fetch_all(1);

$sql="SELECT imie, nazwisko, COUNT(*) AS 'ile_tytulow'
FROM autorzy INNER JOIN ksiazki ON autorzy.id=ksiazki.id_autor
GROUP BY id_autor;";
$result=$link->query($sql);
$writers=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- <p>[imie] <strong>[nazwisko]</strong> </p> -->
    <?php
    foreach($readers as $reader){
        echo"<p>{$reader['imie']} <strong>{$reader['nazwisko']}</strong> </p>";
    }
    
    ?>

    <h2>Tytuły</h2>
    <ul>
        <!-- <li>['tytul']</li> -->
         <?php
    foreach($titles as $title){
        echo"<li>{$title['tytul']}</li>";
    }
         ?>
    </ul>

    <h2>Pisarze</h2>
    <table>
        <tr>
            <th>imię</th>
            <th>nazwisko</th>
            <th>ile tytułów</th>
        </tr>
        <!-- <tr>
            <td>['imie']</td>
            <td>['nazwisko']</td>
            <td>['ile_tytulow']</td>
        </tr> -->
    <?php
    foreach($writers as $writer){
        echo"<tr>
            <td>{$writer['imie']}</td>
            <td>{$writer['nazwisko']}</td>
            <td>{$writer['ile_tytulow']}</td>
        </tr>";
    }
    ?>
    </table>
</body>
</html>
<? 
$link=close;
?>