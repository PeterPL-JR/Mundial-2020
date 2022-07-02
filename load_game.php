<?php

$_groups_obj = [];
$_knock_obj = [];

include 'database.php';
$long_id = $_GET['id'];

$get_query = mysqli_query($base, "SELECT shared_games.id, users.name FROM shared_games JOIN users ON users.id = shared_games.user_id WHERE long_id = '$long_id';");
$array = mysqli_fetch_assoc($get_query);
if(count($array) == 0) {
    echo -1;
} else {
    $game_id = $array['id'];
    $user_name = $array['name'];

    create_groups_obj();
    create_knock_obj();
    
    echo json_encode([
        $_groups_obj,
        $_knock_obj
    ]);
}

// Function for creating 'Group Round' object
function create_groups_obj() {
    global $_groups_obj;

    for($i = 0; $i < 8; $i++) {
        $group_ch = chr(65 + $i);
        $_groups_obj[$group_ch]['teams'] = get_groups_teams($group_ch);
        $_groups_obj[$group_ch]['matches'] = get_groups_matches($group_ch);
    }
}

// Function for creating 'Knockout Round' object
function create_knock_obj() {
    global $_knock_obj, $base, $game_id;
    for($i = 0; $i <= 4; $i++) {
        $round_id = $i + 2;
        $round_query = mysqli_query($base, "SELECT team1_id, team2_id, score_1, score_2, penalty_1, penalty_2 FROM shared_matches WHERE game_id = 344 AND round_id = $round_id;");
        $_knock_obj[$i] = [];

        while($row = mysqli_fetch_assoc($round_query)) {
            array_push($_knock_obj[$i], [
                "team1" => $row['team1_id'],
                "team2" => $row['team2_id'],
            
                "score1" => (int) $row['score_1'],
                "score2" => (int) $row['score_2'],

                "penalty1" => ($row['penalty_1'] == NULL) ? -1 : (int) $row['penalty_1'],
                "penalty2" => ($row['penalty_2'] == NULL) ? -1 : (int) $row['penalty_2']
            ]);
        }
    }
}

function get_groups_teams($group_ch) {
    global $base, $game_id;
    $array = [];

    $group_query = mysqli_query($base, "SELECT * FROM shared_teams JOIN groups_teams ON groups_teams.team_name = shared_teams.team_id WHERE game_id = $game_id AND year = 2022 AND group_ch = '$group_ch' ORDER BY group_place;");
    while($row = mysqli_fetch_assoc($group_query)) {
        $team_id = $row['team_name'];
        $team_details_query = mysqli_query($base, "SELECT link, content FROM teams INNER JOIN names_teams ON names_teams.team_id = teams.name WHERE team_id = '$team_id' AND lang_id = 1;");
        $team_details = mysqli_fetch_assoc($team_details_query);

        array_push($array, [
            "fullName" => $team_details['content'],
            "name" => $team_id,
            "link" => $team_details['link'],

            "stats" => [
                "points" => (int) $row['points'],
                "group_place" => (int) $row['group_place'],
                
                "goals" => (int) $row['goals'],
                "goals_scored" => (int) $row['goals_scored'],
                "goals_lost" => (int) $row['goals_lost'],

                "wins" => (int) $row['wins'],
                "draws" => (int) $row['draws'],
                "losses" => (int) $row['loses'],
            ]
        ]);
    }
    return $array;
}

function get_groups_matches($group_ch) {
    global $base, $game_id;
    $array = [];

    $matches_query = mysqli_query($base, "SELECT team1_id, team2_id, score_1, score_2 FROM shared_matches WHERE game_id = $game_id AND group_ch = '$group_ch' ORDER BY order_nr;");
    while($row = mysqli_fetch_assoc($matches_query)) {
        array_push($array, [
            "team1" => $row['team1_id'],
            "team2" => $row['team2_id'],
            
            "score1" => (int) $row['score_1'],
            "score2" => (int) $row['score_2']
        ]);
    }
    return $array;
}

?>