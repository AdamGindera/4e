<!-- − Składa się ze strony o nazwie index.php

− Zapisana w języku HTML5

− Zadeklarowany polski język zawartości witryny

− Jawnie zastosowany właściwy standard kodowania polskich znaków

− Tytuł strony „ZGŁOSZENIA”

− Arkusz stylów w pliku o nazwie styl.css prawidłowo połączonyz kodem strony

− Podział strony na bloki zrealizowany za pomocą semantycznych znaczników bloków języka HTML5 tak, aby po uruchomieniu w przeglądarce układ bloków na stronie był zgodny z ilustracją 3



− Zawartość bloku nagłówkowego: nagłówek pierwszego stopnia o treści „Zgłoszenia wydarzeń”

− Zawartość bloku głównego: bloki sekcji lewej i sekcji prawej

− Zawartość bloku sekcji lewej:

− Nagłówek drugiego stopnia o treści „Personel”

− Formularz wysyłający dane do tego samego pliku metodą bezpieczną, z elementami:

− Pole opcji z treścią „Policjant”, domyślnie zaznaczone

− Pole opcji z treścią „Ratownik”

− W jednym momencie można zaznaczyć tylko jedno pole opcji

− Przycisk „Pokaż”, wysyłający dane z formularza do skryptu 1

− Tabela z trzema kolumnami, w której pierwszy wiersz zawiera komórki nagłówkowe: „Id”, „Imię”, „Nazwisko”. Pozostałe wiersze wypełnione są przez skrypt 1

− Zawartość bloku sekcji prawej:

− Nagłówek drugiego stopnia o treści „Nowe zgłoszenie”

− Lista numerowana (uporządkowana) wypełniona przez skrypt 2

− Formularz wysyłający dane do tego samego pliku metodą bezpieczną, z elementami:

− Pole etykiety „Wybierz id osoby z listy: ”, powiązane z polem edycyjnym

− Pole edycyjne przeznaczone do wpisywania liczb

− Przycisk „Dodaj zgłoszenie”, wysyłający dane z formularza do skryptu 3

− Zawartość stopki: paragraf o treści „Stronę wykonał: ”, dalej wstawiony numer zdającego -->
<?php
$link=new mysqli('localhost','root','','zgloszenia');
$status_f = $_POST['status'] ?? 'policjant';
$id_f = $_POST['id'] ?? NULL;

if ($id_f){
    $sql = "INSERT INTO rejestr(id_personel, id_pojazd, data)
            VALUES($id_f,14,CURDATE())";
    $link->query($sql);
}


$sql = "SELECT id, imie, nazwisko
        FROM personel
        WHERE status='$status_f'";
$result = $link->query($sql);
$peoples = $result->fetch_all(1);

$sql = "SELECT id, nazwisko
        FROM personel
        WHERE id NOT IN (
            SELECT id_personel
            FROM rejestr
        )";

$result = $link->query($sql);
$lists = $result->fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zgłoszenia</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <h1>Zgłoszenia wydarzeń</h1>
    </header>
    <main>
        <section class="left">
            <h2>Personel</h2>
            <form method="post">

                <input type="radio" name="status" value="policjant" checked> Policjant
                <input type="radio" name="status" value="ratownik"> Ratownik

                <button type="submit">Pokaż</button>

            </form>
            <h3>Wybrano opcje: <?=$status_f?></h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                </tr>
            
                <?php
                foreach($peoples as $people){
                    echo "<tr>
                        <td>{$people['id']}</td>
                        <td>{$people['imie']}</td>
                        <td>{$people['nazwisko']}</td>
                    </tr>";
                }
                ?>
            </table>
        </section>

        <section class="right">
            <h2>Nowe zgłoszenie</h2>
            <ol>
                <?php
                foreach ($lists as $list){
                    echo "<li>{$list['id']} {$list['nazwisko']}</li>";
                }
                ?>
            </ol>
            <form action="" method="post">
                <label for="id">Wybierz id osoby z listy:</label>
                <input type="number" name="id" id="id">
                <button type="submit">Dodaj zgłoszenie</button>
            </form>
        </section>
    </main>
    <footer>
        <p>Stronę wykonał: qwer631412365y18923yh</p>
    </footer>
    
    
</body>
</html>
<?php
$link->close();
?>