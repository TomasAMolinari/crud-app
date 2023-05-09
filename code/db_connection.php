<?php
$servername = "localhost";
$username = "root";
$password = "";
$db_name = "crud_app";

// Create connection
$conn = mysqli_connect($__servername__, $__username__, $__password__, $__db_name__);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
