<?php
$link=new mysqli('localhost', 'root', '','kadry');
$sql="SELECT pensja, COUNT(*) AS 'ilosc'
FROM Pracownicy
GROUP BY pensja
ORDER BY pensja DESC;";
$result=$link->query($sql);
$salaries=$result->fetch_all(1);

$sql="SELECT imie, nazwisko, nazwa
FROM Pracownicy
INNER JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id
WHERE staz > 10;";
$result=$link->query($sql);
$employees=$result->fetch_all(1);

$sql="SELECT ROUND(AVG(pensja),2) AS srednia_pensja, nazwa
FROM Pracownicy
INNER JOIN stanowiska ON pracownicy.stanowiska_id=stanowiska.id
GROUP BY nazwa;";
$result=$link->query($sql);
$avg_salaries=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
   <h2>Statystyki dotyczące pensji</h2>
   <table>
    <tr>
        <th>pensja</th>
        <th>ilość pracowników</th>

    </tr>
    <!-- skrypt 1 -->
     <!-- <tr>
        <td>[pensja]</td>
        <td>[ilosc]</td>
     </tr> -->
     <?php
     foreach($salaries as $salary){
        echo"
        <tr>
        <td>{$salary['pensja']}</td>
        <td>{$salary['ilosc']}</td>
        </tr>
        ";
     }
     ?>
   </table> 

   <h1>Pracownicy ze stażem wyższym niż 10 lat</h1>
   <table>
    <!-- <tr>
        <th>[imie]</th>
        <th>[nazwisko]</th>
        <th>[stanowisko]</th>
    </tr> -->
    <!-- skrypt 2 -->
    <?php
    foreach($employees as $employee){
        echo"
        <tr>
            <th>{$employee['imie']}</th>
            <th>{$employee['nazwisko']}</th>
            <th>{$employee['nazwa']}</th>
        </tr>
        ";
    }
    ?>
   </table>

   <hr>
   <h2>Średnie pensje ze względu na rodzaj stanowiska</h2>
   <!-- skrypt 3 -->
    <!-- <section class="statistic">
        <h3>[nazwa]</h3>
        <p>średnia pensja na stanowisku [nazwa] wynosi: [srednia_pensja]</p>
    </section> -->
    <?php
    foreach ($avg_salaries as $avg_salary){
        echo"
        <section class='statistic'>
        <h3>{$avg_salary['nazwa']}</h3>
        <p>średnia pensja na stanowisku {$avg_salary['nazwa']} wynosi: {$avg_salary['srednia_pensja']}</p>
    </section>
        ";
    }
    ?>
</body>
</html>
<?php
$link->close();
?>