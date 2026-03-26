<?php
$link=new mysqli('localhost','root','','szkola');

$id_student_delete_f=$_POST['id-student-delete']??'';
if($id_student_delete_f) {
    $sql ="DELETE FROM uczen
WHERE id = $id_student_delete_f";
$result=$link->query($sql);
echo " usunieto ucznia o id = $id_student_delete_f";
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
<?php
$link->close();
?>