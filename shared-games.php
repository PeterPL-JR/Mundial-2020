<?php

include 'database.php';
$id = $_GET['id'];

$mysql = mysqli_query($base, "SELECT * FROM shared_games WHERE long_id = '$id';");
echo mysqli_fetch_assoc($mysql)['long_id'];

?>