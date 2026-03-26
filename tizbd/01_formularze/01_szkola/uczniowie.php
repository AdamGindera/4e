<?php
$link=new mysqli ('localhost', 'root', '', 'szkola');

$sql="SELECT *
FROM uczen;";
$result=$link->query($sql);
$students=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Uczniowie</h1>
    <section>
        <h2>Lista uczniów</h2>
        <table>
            <?php
        foreach ($students as $student) {
            echo "<tr>";
            foreach ($student as $data) {
                echo "<td> $data </td>";
            }
            echo "</tr>";
        } 
            ?>
        </table>
    </section>

    <section>
        <h2>Aktualizacja</h2>
        <form action="aktualizacja.php" method="post">
            <label for="id-student-update">Podaj id ucznia</label>
            <input type="text" name="id-student-update" id="id-student-update">
            <button>Wyslij</button>
        </form>
    </section>

    <section>
        <h2>Usuwanie</h2>
        <form action="usuwanie.php" method="post">
           <label for="id-student-delete">Podaj id ucznia</label> 
           <input type="text" name="id-student-delete" id="id-student-delete">
           <button>Wyslij</button>
        </form>
    </section>
</body>
</html>
<?php
$link -> close();
?>