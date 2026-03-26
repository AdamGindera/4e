<?php 
$link = new mysqli('localhost', 'root', '', 'baza');

$sql = "SELECT nazwa
        FROM dania";
$result = $link -> query($sql);
$dishes = $result -> fetch_all(1);

$sql = "SELECT imie, nazwisko 
FROM pracownicy;";
$result = $link -> query($sql);
$employees = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3> Dania </h3>
    <ol>
        <!-- <li> [nazwa]   </li>  -->
    </ol>
    <?php
    foreach($dishes as $dish){
        echo "
        <li> {$dish['nazwa']}   </li>
        ";
    }

    ?>
    <h3>pracownicy</h3>
    <ul>
        <!-- <li>[imie] [nazwisko]</li> -->
         <?php
         foreach($employees as $employee){
            echo "
            <li>{$employee['imie']} {$employee['nazwisko']}</li>";
         }

         ?>
    </ul>

</body>
</html>

<?php
$link -> close();
?>