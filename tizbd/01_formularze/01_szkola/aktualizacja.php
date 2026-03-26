<?php
$link=new mysqli ('localhost', 'root','','szkola');
$id_student_update_f=$_POST['id-student-update']??'';
if($id_student_update_f){
    $sql="UPDATE uczen
    SET miejsce_urodzenia = 'Bydgoszcz'
    WHERE id = $id_student_update_f";
    $result=$link->query($sql);
    echo "zaaktualizowano dane ucznia o id = $id_student_update_f";
} else {
    echo "brak danych";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="uczniowie.php">Powrot</a>
</body>
</html>