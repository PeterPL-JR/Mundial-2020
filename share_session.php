<?php

include 'database.php';
include 'link.php';
include 'library.php';

$str_groups =  $_GET['groups'];
$str_knock = $_GET['knock'];
$logged = $_GET['logged'];

$year = $_GET['year'];
$type = $_GET['type'];

$date = date("Y-m-d H:i:s");
$date_name = date("ymd");
$date_login = date("YmdHis");

$long_id = random_string(24);
$shared_link = $link."shared-games.php?id=".$long_id;

$user_id = NULL;
$game_id = NULL;

if($logged == "false") {
    $new_user_name = "player".$date_name;
    $new_login = $date_login."_".random_string(6);

    // Query (INSERT USER)
    mysqli_query($base, "INSERT INTO users(name, login) VALUES('$new_user_name', '$new_login');");
    $user_id = mysqli_insert_id($base);
}

// Query (INSERT GAME)
mysqli_query($base, "INSERT INTO shared_games(user_id, long_id, creation_date, year, type_id) VALUES($user_id, '$long_id', '$date', $year, $type)");
$game_id = mysqli_insert_id($base);

$obj_groups = json_decode($str_groups);
$obj_knock = json_decode($str_knock);

handle_groups($base, $obj_groups, $game_id);
handle_knock($base, $obj_knock, $game_id);

echo $shared_link;

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
        // Query (INSERT TEAMS)
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
    // Query (INSERT MATCHES)
    mysqli_query($base, <<<QUERY
        INSERT INTO shared_matches(team1_id, team2_id, score_1, score_2, penalty_1, penalty_2, round_id, group_ch, order_nr, game_id)
        VALUES ($elements_text $round_index, $group_name_text, $order_nr, $game_id);
    QUERY);
}
