<?php

function random_string($length) {
    $numbers = [];
    $letters = [];

    for($i = 0; $i < 10; $i++) array_push($numbers, $i + "");
    for($i = 0; $i < 26; $i++) array_push($letters, chr($i + 65 + 32));

    $string = "";
    for($i = 0; $i < $length; $i++) {

        $rand_n = $numbers[rand(0, count($numbers))];
        $rand_l = $letters[rand(1, count($letters))];

        $string = $string.$rand_n.$rand_l;
    }
    return $string;
}
?>