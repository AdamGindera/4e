<?php
$link=new mysqli ('localhost','root','','filmoteka');

$first_name_f=$_POST['first-name']?? NULL;
$last_name_f=$_POST['last-name']?? NULL;
if ($first_name_f && $last_name_f) {
    $sql="INSERT INTO rezyserzy
        (imie, nazwisko) 
        VALUES ('$first_name_f', '$last_name_f')
    ";
$result=$link->query($sql);
}

$id_film_f=$_POST['id-film']?? NULL;
if ($id_film_f) {
    $sql="DELETE FROM filmy
    WHERE IDFilm = $id_film_f;
    ";
    $result=$link->query($sql);
}

$title_f=$_POST['title']?? NULL;
$id_film_update_f=$_POST['id-film-update']?? NULL;
if ($title_f && $id_film_update_f){
    $sql="UPDATE filmy
    SET tytul = '$title_f'
    WHERE IDfilm = $id_film_update_f;";
    $result=$link->query($sql);
}


$sql="SELECT tytul, nazwisko, IDfilm
        FROM filmy
            INNER JOIN rezyserzy ON filmy.rezyserid=rezyserzy.idrezyser
        ";
$result=$link->query($sql);
$movies=$result->fetch_all(1);

$sql="SELECT imie, nazwisko, idrezyser, COUNT(rezyserid) AS liczba_filmow
FROM rezyserzy 
    LEFT JOIN filmy ON rezyserzy.idrezyser=filmy.rezyserid
GROUP BY nazwisko
";
$result=$link->query($sql);
$directors=$result->fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <!-- <tr>
            <td>[IDfilm]</td>
            <td>[tytul]</td>
            <td>[nazwisko]</td>
        </tr> -->
        <?php
        foreach($movies as $movie){
            echo"
            <tr>
            <td>{$movie['IDfilm']}</td>
            <td>{$movie['tytul']}</td>
            <td>{$movie['nazwisko']}</td>
        </tr>
            ";
        }
        ?>
    </table>

    <!-- <ul>
        <li>[imie] [nazwisko] - [liczba_filmow]</li>
    </ul> -->
    <ul>
    <?php
    foreach($directors as $director){
        echo "
        
        <li> {$director['imie']} {$director['nazwisko']} - {$director['liczba_filmow']}</li>
        ";
    }
    ?> </ul>

    <form action="" method="post">
        <label for="first-name">Podaj imie rezysera</label>
        <input type="text" name="first-name" id="first-name">
        <label for="last-name">Podaj nazwisko rezysera</label>
        <input type="text" name="last-name" id="last-name">
        <button type="submit">Dodaj</button>
    </form>

    <form action="" method="post">
        <label for="id-film">Podaj film do usuniecia</label>
        <input type="number" name="id-film" id="id-film">
        <button type="submit">Usun</button>
    </form>

     <form action="" method="post">
        <label for="id-film-update">Podaj ID</label>
        <!-- <input type="number" name="id-film-update" id="id-film-update"> -->
         <select name="id-film-update" id="id-film-update">
            <option value='[idfilm]'>[tytul]</option>
         </select>
         
        <label for="title">Podaj tytul</label>
        <input type="text" name="title" id="title">
        <button type="submit">ok</button>

    </form>
</body>
</html>

    
<?php
$link->close()
?>