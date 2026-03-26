<?php
$link=new mysqli('localhost', 'root','','szkola');

// var_dump($_POST['id_ucznia']);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Usuwanie</h1>
    <form action="uczniowie.php" method="post">
        <label for="id_ucznia">Podaj id ucznia</label>
        <input type="text" name="id_ucznia" id="id_ucznia">
        <button type="submit">Wyslij</button>
    </form>
    <?php
if (isset(($_POST['id_ucznia']))) {
    $id_ucznia = $_POST['id_ucznia'];
    $sql = "DELETE FROM uczen WHERE id = $id_ucznia ";
// var_dump($sql);
$result=$link->query($sql);
if ($result) {
    echo "uczen numer $id_ucznia zostal usuniety z bazy danych";
}
}
    ?>
</body>
</html>
<?php
$link->close()
?>