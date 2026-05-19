<?php
$link=new mysqli ('localhost','root','','w3schools');

$sql="SELECT SupplierID, SupplierName
FROM suppliers";
$result=$link->query($sql);
$suppliers=$result->fetch_all(1);


$supplier_id_f=$_POST['supplier-id'] ?? NULL;
if ($supplier_id_f){
    $sql="SELECT ProductName, Price
        FROM products
        WHERE SupplierID=$supplier_id_f;";
    $result=$link->query($sql);
    $products=$result->fetch_all(1);
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
    
<form action="" method="post">
    <label for="supplier-id">Nazwy dostawców</label>
    <select name="supplier-id" id="supplier-id">
        <!-- <option value="SupplierID">SupplierName</option> -->
         <?php




    foreach ($suppliers as $supplier){
        echo"
        <option value='{$supplier['SupplierID']}'>{$supplier['SupplierName']}</option>";
    }
         ?>
    </select>
    <button type="submit">Wyślij</button>
    
    
</form>
<ol>
    <!-- <li>ProductName Price</li> -->
<?php
if ($supplier_id_f){
    foreach ($products as $product){
        echo"<li>{$product['ProductName']} {$product['Price']}</li>";
    }}

?>

</ol>
</body>
</html>

<?php
$link->close()
?>