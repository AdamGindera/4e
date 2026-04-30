<?php
$link=new mysqli ('localhost','root','','adam_gindera2');
$name_f=$_POST['name'] ?? NULL;
$price_f=$_POST['price'] ?? NULL;
$type_id_f=$_POST['type-id'] ?? NULL;
$producer_id_f=$_POST['producer_id'] ?? NULL;
if ($name_f && $price_f && $producer_id_f && $type_id_f) {
    $sql="INSERT INTO podzespoly (typy_id, producenci_id, nazwa, cena)
    VALUES ($type_id_f, $producer_id_f,'$name_f', $price_f);";
    $result=$link->query($sql);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body><a href="index.php">powrot</a>
    
</body>
</html>
<?php
$link->close()
?>