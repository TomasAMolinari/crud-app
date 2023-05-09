<?php
$__servername__ = "localhost";
$__username__ = "root";
$__password__ = "";
$__db_name__ = "crud_app";

// Create connection
$conn = mysqli_connect($__servername__, $__username__, $__password__, $__db_name__);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
