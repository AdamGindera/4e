<?php
$link=new mysqli('localhost','root','','wynajem');
$sql="SELECT *
FROM pokoje;";
$result=$link->query($sql);
$rooms=$result->fetch_all(1);

$sql="SELECT id, nazwa, sezon
FROM pokoje INNER JOIN rezerwacje ON pokoje.id=rezerwacje.id_pok
WHERE liczba_dn > 7;";
$result=$link->query($sql);
$reservations=$result->fetch_all(1);

$sql="SELECT sezon, SUM(liczba_dn) AS razem_rezerwacji
FROM rezerwacje
GROUP BY sezon;";
$result=$link->query($sql);
$seasons=$result->fetch_all(1);
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
    
    <?php
    foreach($rooms as $room){
        echo "<tr>";
        foreach($room as $data){
            echo "<td>$data</td>";
        }
        echo "</tr>";
    }

    ?>
    </table>
    <h3>zad2</h3>
    <ul>
        <!-- <li>[id] <strong>[nazwa]</strong> <em>[sezon]</em></li> -->
         <?php
    foreach($reservations as $reservation){
        echo"<li>{$reservation['id']} <strong>{$reservation['nazwa']}</strong> <em>{$reservation['sezon']}</em></li>";
    }
         ?>
    </ul>
    <h3>zad3</h3>
    <!-- <h4>[sezon]</h4> -->
    <!-- <p>suma dni rezerwacji dla sezonu [sezon] wynosi [razem_rezerwacji]</p> -->
     <?php
    foreach($seasons as $season){
        echo"<h4>{$season['sezon']}</h4>
        <p>suma dni rezerwacji dla sezonu {$season['sezon']} wynosi {$season['razem_rezerwacji']}</p>";
    }
     ?>
    
</body>
</html>

<?php
$link -> close();
?>