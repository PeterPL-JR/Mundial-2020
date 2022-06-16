<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Mundial 2022 - Udostępnij</title>
    <script src="library.js"></script>

    <link rel="icon" href="images/logo.png" type="image/png">
    <link rel="stylesheet" href="styles/basic-styles.css">
    <link rel="stylesheet" href="styles/game-styles.css">
    <link rel="stylesheet" href="styles/matches-styles.css">

    <link rel="stylesheet" href="styles/group-table-styles.css">
    <link rel="stylesheet" href="styles/matches-table-styles.css">
    <link rel="stylesheet" href="styles/share-styles.css">

    <style>
        body {color: white;}
    </style>
</head>
<body>
<img src="images/background.png" id="background">
<div id="container">
    <div id="header-div">
        <img src="images/logo.png" id="logo">
        <div id="logo-name">Mundial 2022</div>
        <div style="clear: both;"></div>
    </div>
    <div id="content">
        <div class="round-name">
            <img src="images/ball.png">
            <div class="name-div">Udostępnij</div>
            <div style="clear: both"></div>
        </div>
        <form action="" method="post">
            Twoja Nazwa<br><input type="text" name="user-name" value="PeterPLJR"><br>
            Opis<br><textarea name="description">To jest mój mundial w Katarze 2022.</textarea><br>
            <input type="hidden" name="logged" value="false">
            <button name="share-button">Opublikuj</button>
        </form>
    </div>
</div>

<?php
session_start();
include 'library.php';
include 'database.php';

if(isset($_POST['share-button'])) {
    $session_name = $_GET['user'];

    if(!isset($_SESSION[$session_name."_groups_obji"]) || !isset($_SESSION[$session_name."_knock_obji"])) {
        header("Location: index.php");
    }

    $str_groups = $_SESSION[$session_name."_groups_obji"];
    $str_knock = $_SESSION[$session_name."_knock_obji"];

    unset($_SESSION[$session_name."_groups_obji"]);
    unset($_SESSION[$session_name."_knock_obji"]);

    $user_name = $_POST['user-name'];
    $description = $_POST['description'];
    $logged = $_POST['logged'];

    $date = date("Y-m-d H:i:s");
    $date_name = date("ymd");
    $date_login = date("YmdHis");
    $user_id = NULL;
    $game_id = NULL;

    if($logged == "false") {

        $new_user_name = $user_name."_player".$date_name;
        $new_login = $date_login."_".random_string(6);

        // Query
        mysqli_query($base, "INSERT INTO users(name, login) VALUES('$new_user_name', '$new_login');");
        
        $get_user = mysqli_query($base, "SELECT id FROM users WHERE login = '$new_login';");
        while($row = mysqli_fetch_assoc($get_user)) $user_id = $row['id'];
    }

    // Query
    mysqli_query($base, "INSERT INTO shared_games(user_id, description, creation_date) VALUES($user_id, '$description', '$date')");
    $get_game = mysqli_query($base, "SELECT id FROM shared_games WHERE user_id = $user_id AND creation_date = '$date';");
    while($row = mysqli_fetch_assoc($get_game)) $game_id = $row['id'];

    $obj_groups = json_decode($str_groups);
    $obj_knock = json_decode($str_knock);

    handle_groups($base, $obj_groups, $game_id);
    handle_knock($base, $obj_knock, $game_id);

    header("Location: index.php");
}

function handle_groups($base, $obj, $game_id) {
    $teams = [];

    $group_counter = 0;
    foreach($obj as $group) {
        foreach($group[0] as $team) {
            array_push($teams, $team);
        }
        $match_counter = 0;
        foreach($group[1] as $match) {
            $group_char = strtoupper(chr($group_counter + 97));
            // Query
            insert_match($base, $match, $game_id, 1, $group_char, $match_counter + 1);
            $match_counter++;
        }
        $group_counter++;
    }
    
    $counter = 0;
    foreach($teams as $team_obj) {
        
        $team_name = $team_obj[0];
        $group_place = ($counter % 4) + 1;
        $stats_text = "";

        foreach($team_obj[1] as $stat) $stats_text = $stats_text.$stat.",";
        // Query
        mysqli_query($base, <<<QUERY
            INSERT INTO shared_teams (team_id, group_place, points, goals, goals_scored, goals_lost, wins, draws, loses, game_id) 
            VALUES ('$team_name', $group_place, $stats_text $game_id);
        QUERY);
        $counter++;
    }
}

function handle_knock($base, $obj, $game_id) {

    $round_counter = 2;
    foreach($obj as $round) {
        $match_counter = 0;
        foreach($round as $match) {
            // Query
            insert_match($base, $match, $game_id, $round_counter, -1, $match_counter + 1);
            $match_counter++;
        }
        $round_counter++;
    }
}

function insert_match($base, $match_obj, $game_id, $round_index, $group_name, $order_nr) {
    $elements_text = "'$match_obj[0]', '$match_obj[1]', ";
    $group_name_text = ($group_name == -1) ? "NULL" : "'$group_name'";

    for($i = 2; $i < count($match_obj); $i++) {

        $stat = $match_obj[$i];
        if(($i == 4 || $i == 5) && $stat == -1) $stat = "NULL";
        $elements_text = $elements_text.$stat.", ";
    }
    // Query
    mysqli_query($base, <<<QUERY
        INSERT INTO shared_matches(team1_id, team2_id, score_1, score_2, penalty_1, penalty_2, round_id, group_ch, order_nr, game_id)
        VALUES ($elements_text $round_index, $group_name_text, $order_nr, $game_id);
    QUERY);
}

?>

</body>
</html>