<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Mundial 2022 - Wytypuj Wyniki</title>
    <link rel="icon" href="images/logo.png" type="image/png">
    <link rel="stylesheet" href="styles/basic-styles.css">
    <link rel="stylesheet" href="styles/game-styles.css">
    <link rel="stylesheet" href="styles/matches-styles.css">

    <link rel="stylesheet" href="styles/group-table-styles.css">
    <link rel="stylesheet" href="styles/matches-table-styles.css">
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
            <div class="name-div">Baraże</div>
            <div style="clear: both"></div>
        </div>
        <div id="play-off-matches-div"></div>
        <button class="button" id="play-button" onclick="playMatch();">
            Rozegraj Mecz
        </button>
    </div>
</div>
<script>
    let teams = {};
    let playOffTeams = {};
<?php

// $base = mysqli_connect(
//     "localhost",
//     "piotrk",
//     "6cfb985ff88b7ee105b53a1424035c62c1fe7dd2",
//     "piotrk"
// );

$base = mysqli_connect(
    "localhost",
    "PeterPL_JR",
    "Robociki.pl",
    "scores-league"
);

$query = mysqli_query($base, <<<QUERY
    SELECT
        names_teams.content as full_name,
        teams.name as name,
        teams.link as link,
        teams.group_ch as group_ch,
        teams.group_pos as group_pos
    FROM
        names_teams
    INNER JOIN 
        teams ON teams.name = names_teams.team_id
    INNER JOIN 
        lang ON lang.id = names_teams.lang_id
    WHERE
        lang.name = "polish";
QUERY);
?>

<?php
while($row = mysqli_fetch_assoc($query)) {

    $playOffTeams = [
        "sco", "ukr", "wal",
        "zae", "aus", "per",
        "cri", "nzl"
    ];

    $full_name = $row['full_name'];
    $name = $row['name'];
    $link = $row['link'];

    $group_ch = $row['group_ch'];
    $group_pos = $row['group_pos'];

    $array_name = (array_search($name, $playOffTeams) == "") ? "teams" : "playOffTeams";

    echo <<<OBJ
    $array_name ['$name'] = {
        fullName: '$full_name', name: '$name', link: '$link',
        group_ch: '$group_ch', group_pos: $group_pos
    };
    OBJ;
}
?>
</script>
<script src="play-offs-handler.js"></script>
<script src="prepare-groups.js"></script>

<script src="group-round-handler.js"></script>
<script src="knock-round-handler.js"></script>
</body>
</html>