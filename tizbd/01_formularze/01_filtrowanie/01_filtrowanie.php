<!-- <!-- Utwórz formularz z dwoma polami typu numerycznego, minimalna cena i maksymalna cena (placeholder), ustawione wartości domyślne na 0 i 1000 (jeśli potrafisz, wstaw maksymalną cenę dostępną w bazie). Po kliknięciu na przycisk Filtruj poniżej powinny być wyświetlone towary (nazwa towaru, nazwa kategorii i cena) w formie tabeli. Po starcie, jeśli nie została wybrana cena, powinny być wyświetlane wszystkie produkty.

 -->
<?php
$link=new mysqli ('localhost','root','','w3schools');

$sql="
SELECT ceil(MAX(price)) AS max_price
FROM Products";
$result=$link->query($sql);
$max_price=$result->fetch_assoc();
$max_price=$max_price['max_price'];
// var_dump($max_price);

$min_price_f=$_POST['min-price'] ?? 0;
$max_price_f=$_POST['max-price'] ?? $max_price;
$sql="SELECT productName, price
FROM products
WHERE price BETWEEN $min_price_f AND $max_price_f;";
$result=$link->query($sql);
$products=$result->fetch_all(1)
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
    <label for="min-price">Minimalna cena</label>
    <input type="number" name="min-price" id="min-price"
     min=0 max=<?= $max_price ?>  
        value=0>
    <label for="max-price">Maksymalna cena</label>
    <input type="number" name="max-price" id="max-price"
     min=0 max=<?= $max_price ?>
     value=<?= $max_price ?> >
    <button type="submit">Wyślij</button>
</form>
<table>
    <tr>
        <th>Nazwa produktu</th>
        <th>Cena produktu</th>
    </tr>
    <!-- <tr>
        <td>productName</td>
        <td>price</td>
    </tr> -->
    <?php
    foreach ($products as $product){
        echo"<tr>
                <td>{$product['productName']}</td>
                <td>{$product['price']}</td>
            </tr>";
    }
    ?>
</table>
</body>
</html>

<?php
$link->close()
?>