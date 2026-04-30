<?php
$link=new mysqli ('localhost','root','','biblioteka5');
// $result=$link->query($sql)

$first_name_f=$_POST['first-name'] ?? NULL;
$last_name_f=$_POST['last-name'] ?? NULL;
if ($first_name_f && $last_name_f) {
    $sql="INSERT INTO czytelnicy
    VALUES (NULL, '$first_name_f', '$last_name_f', '');";
    $result=$link->query($sql);
}

$book_id_f=$_POST['book-id'] ?? NULL;
if ($book_id_f) {
    $sql="DELETE FROM ksiazki
    WHERE id = $book_id_f;";
    $result=$link->query($sql);

}

$date_f=$_POST['borrow-id'] ?? NULL;
if ($date_f) {
    $sql="UPDATE wypozyczenia 
    SET data_oddania = CURRENT_DATE
    WHERE id = $date_f;";
    $result=$link->query($sql);
}

$sql="SELECT ksiazki.id, tytul, autorzy.imie, autorzy.nazwisko
FROM ksiazki
    INNER JOIN autorzy ON ksiazki.id_autor=autorzy.id;";
    $result=$link->query($sql);
    $books=$result->fetch_all(1);

$sql="SELECT * from wypozyczenia;";
    $result=$link->query($sql);
    $borrows=$result->fetch_all(1);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <label for="first-name"></label>
        <input type="text" name="first-name" id="first-name"> <br>
        <label for="last-name"></label>
        <input type="text" name="last-name" id="last-name"> <br>
        <button type="submit">Dodaj uzytkownika</button>
    </form>

    <ul>
        <!-- skrypt b -->
         <!-- <li><strong>[id]</strong>[tytul], [imie] [nazwisko]</li> -->
        <?php
        foreach ($books as $book){
    echo "<li><strong>{$book['id']}</strong>{$book['tytul']}, {$book['imie']} {$book['nazwisko']}</li>";
        }
        ?>
    </ul>

    <form action="" method="post">
        <label for="book-id">Podaj ID ksiazki do usuniecia</label>
        <!-- <input type="text" name="book-id" id="book-id"> <br> -->
         <select name="book-id" id="book-id">
            <!-- <option value='[id]'>[tytul]</option> -->
             <?php
                foreach ($books as $book) {
                    echo "<option value='{$book['id']}'>{$book['tytul']}</option>";
                }
             ?>
         </select>
        <button type="submit">Usuń ksiazke o ID</button>
    </form>

    <table>
        <!-- skrypt d -->
         <?php
        echo "<tr>";
        foreach ($borrows[0] as $key => $value) {
            echo "<th>$key</th>";
        }
        echo "</tr>";
        foreach ($borrows as $borrow){
            echo "<tr>";
            foreach ($borrow as $value){
                echo "<td>$value</td>";
            }
            echo "</tr>";
        }
         ?>
    </table>

    <form action="" method="post">
        <label for="borrow-id"></label>
        <input type="text" name="borrow-id" id="borrow-id"> <br>
        <button type="submit">Zmiana daty oddania</button>
    </form>
</body>
</html>

<?php
$link->close()
?>