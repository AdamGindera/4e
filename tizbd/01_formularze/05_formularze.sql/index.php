<?php
$link=new mysqli ('localhost','root','','adam_gindera2');

$sql="SELECT kategoria AS typ, nazwa, cena
    FROM typy 
    INNER JOIN podzespoly ON typy.id=podzespoly.typy_id;";
$result=$link->query($sql);
$components=$result->fetch_all(1);

$sql="SELECT id, kategoria
FROM typy;";
$result=$link->query($sql);
$types=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Adam Gindera</h1>
    <ol>
        <!-- <li>
        [typ] <strong>[nazwa]</strong>-[cena]
    </li> -->
    <?php
    foreach ($components as $component){
        echo "<li>
        {$component['typ']} <strong>{$component['nazwa']}</strong>-{$component['cena']}
        </li>";
    }
    ?>
    </ol>

    <form action="dodawanie.php" method="post">
        <label for="name">nazwa</label>
        <input type="text" name="name" id="name">
        <label for="price">cena</label>
        <input type="number" name="price" id="price">
        <label for="producer_id">ID producenta</label>
        <input type="text" name="producer_id" id="producer_id">
        <select name="type-id" id="type-id">
            <!-- <option value="[id]">[nazwa]</option> -->
            <?php
            foreach($types as $type){
                echo"
                <option value='{$type['id']}'>{$type['kategoria']}</option>
                ";
            }
            ?>
        </select>
        <button type="submit">Dodaj</button>
    </form>
</body>
</html>

<?php
$link->close()
?>