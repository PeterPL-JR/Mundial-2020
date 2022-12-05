<?php
include 'database.php';

if(isset($_GET['input_text'])) {
    find_team($_GET['input_text']);
    exit;
}
if(isset($_GET['get_confeds'])) {
    get_confeds();
    exit;
}

if(isset($_GET['year'])) {
    $year = $_GET['year'];
    // Query for Predicting a real Mundial (some teams)
    $query_one_year = mysqli_query($base, <<<QUERY
        SELECT
            names_teams.content as full_name,
            teams.name as name,
            teams.link as link,
            groups_teams.group_ch as group_ch,
            groups_teams.group_pos as group_pos,
            confederations.name as confed
        FROM
            names_teams
        INNER JOIN 
            teams ON teams.name = names_teams.team_id
        INNER JOIN 
            lang ON lang.id = names_teams.lang_id
        INNER JOIN 
            groups_teams ON groups_teams.team_name = teams.name
        INNER JOIN
            confederations ON confederations.id = teams.con_id
        WHERE
            lang.name = "polish" AND
            year = $year;
    QUERY);
    send_one_year();
} else {
    // Query for Custom Mundial (all teams)
    $query_all = mysqli_query($base, <<<QUERY
        SELECT
            names_teams.content as full_name,
            teams.name as name,
            teams.link as link,
            confederations.name as confed
        FROM
            names_teams
        INNER JOIN 
            teams ON teams.name = names_teams.team_id
        INNER JOIN 
            lang ON lang.id = names_teams.lang_id
        LEFT JOIN
            confederations ON confederations.id = teams.con_id
        WHERE
            lang.name = "polish";
    QUERY);
    send_all();
}

function send_one_year() {
    global $query_one_year;

    $teams = array();
    while($row = mysqli_fetch_assoc($query_one_year)) {
    
        $full_name = $row['full_name'];
        $name = $row['name'];
        $link = $row['link'];
    
        $group_ch = $row['group_ch'];
        $group_pos = $row['group_pos'];
        $confed = $row['confed'];

        $teams_object = [
            'fullName' => $full_name,
            'name' => $name,
            'link' => $link,
    
            'group_ch' => $group_ch,
            'group_pos' => $group_pos,
            'confed' => $confed
        ];
        $teams[$name] = $teams_object;
    }
    echo json_encode($teams);
}

function send_all() {
    global $query_all;

    $teams = array();
    while($row = mysqli_fetch_assoc($query_all)) {

        $full_name = $row['full_name'];
        $name = $row['name'];
        $link = $row['link'];
        $confed = $row['confed'];
    
        $teams_object = [
            'fullName' => $full_name,
            'name' => $name,
            'link' => $link,
            'confed' => $confed
        ];
        $teams[$name] = $teams_object;
    }
    echo json_encode($teams);
}

function find_team($text) {
    global $base;

    $query_get_team = mysqli_query($base, <<<QUERY
        SELECT 
            teams.name as team
        FROM 
            teams 
        INNER JOIN 
            names_teams ON names_teams.team_id = teams.name 
        INNER JOIN 
            lang ON lang.id = names_teams.lang_id 
        WHERE 
            lang.name = 'polish' AND 
            names_teams.content = '$text';
    QUERY);

    $result = mysqli_fetch_assoc($query_get_team);
    if(!is_null($result)) {
        echo $result['team'];
    }
}

function get_confeds() {
    global $base;

    $query_get_confeds = mysqli_query($base, "SELECT * FROM confederations;");
    
    $array = [];
    while($row = mysqli_fetch_assoc($query_get_confeds)) {
        array_push($array, $row['name']);
    }
    echo json_encode($array);
}