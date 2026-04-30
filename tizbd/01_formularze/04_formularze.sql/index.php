<?php
$link=new mysqli ('localhost','root','','adam_gindera');


$sql = "SELECT dania.nazwa, typy_dan.nazwa AS typy_dan, cena
FROM dania INNER JOIN typy_dan ON dania.typ=typy_dan.id;";
$result=$link->query($sql);
$dishes=$result->fetch_all(1);

$sql = "SELECT id, nazwa
FROM typy_dan;";
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
        [typy_dan] <strong>[nazwa]</strong>-[cena]
    </li> -->
    <?php
    foreach ($dishes as $dish){
        echo "
        <li>
            {$dish['typy_dan']} <strong>{$dish['nazwa']}</strong>-{$dish['cena']}
        </li>
        ";
    }
    ?>
    </ol>

    <form action="dodawanie.php" method="post">
        <label for="name">nazwa dania</label>
        <input type="text" name="name" id="name">
        <label for="price">cena</label>
        <input type="number" name="price" id="price">
        <select name="type-id" id="type-id">
            <!-- <option value="[id]">[nazwa]</option> -->
             <?php
            foreach($types as $type){
                echo"
                <option value='{$type['id']}'>{$type['nazwa']}</option>
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