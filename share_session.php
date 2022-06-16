<?php

session_start();
include 'library.php';

$string_groups = $_POST['groups'];
$string_knock = $_POST['knock'];

unset($_POST['groups']);
unset($_POST['knock']);

if($string_groups == "" || $string_knock == "") {
    header("Location: index.php");
} else {

    $session_name = random_string(18);
    $_SESSION[$session_name."_groups_obji"] = $string_groups;
    $_SESSION[$session_name."_knock_obji"] = $string_knock;
    echo $session_name;
}

function parse_object($json_string) {
    $new_string = "";
    for($i = 1; $i < strlen($json_string) - 1; $i++) {
        if($json_string[$i] != "\\") {
            $new_string = $new_string.$json_string[$i];
        }
    }
    return json_decode($new_string);
}

?>