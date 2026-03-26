<?php 
$link = new mysqli('localhost', 'root', '', 'katalog');
$sql="SELECT zespol, COUNT(*)
        FROM katalog
        GROUP BY zespol;";
$result=$link->query($sql);
$artists=$result->fetch_all(1);

$sql="SELECT rok, COUNT(*)
    FROM katalog
    GROUP BY rok;";
$result=$link->query($sql);
$years=$result->fetch_all(1);

$sql="SELECT zespol, MIN(rok) 
FROM katalog
GROUP BY zespol;";
$result=$link->query($sql);
$earliest=$result->fetch_all(1);

$sql="SELECT zespol, COUNT(*)
FROM katalog
GROUP BY zespol
HAVING COUNT(*) > 4
ORDER BY zespol DESC;";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    foreach ($artists as $artist) {
        echo "<li>{$artist['zespol']} — {$artist['COUNT(*)']} </li>";
    }
    ?>

    <?php
    foreach ($years as $year){
        echo "<li>{$year['rok']} - {$year['COUNT(*)']} <li>";
    }

    ?>

    <?php
    foreach ($earliest as $earlier){
        echo"<li>{$earlier['zespol']} - {$earlier['MIN(rok)']}<li>";
    }
    ?>
</body>
</html>

<?php
$link -> close();
?>