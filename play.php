<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Mundial 2022 - Wytypuj Wyniki</title>
    <script src="library.js"></script>

    <link rel="icon" href="images/logo.png" type="image/png">
    <link rel="stylesheet" href="styles/basic-styles.css">
    <link rel="stylesheet" href="styles/game-styles.css">
    <link rel="stylesheet" href="styles/matches-styles.css">

    <link rel="stylesheet" href="styles/group-table-styles.css">
    <link rel="stylesheet" href="styles/matches-table-styles.css">
    <link rel="stylesheet" href="styles/share-styles.css">
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
    </div>
</div>
<script>

    var teams;
    serverGet("/create-mundial/get_data.php", null, function(text) {
        teams = JSON.parse(text);
        createScript("prepare-groups.js");
        createScript("group-round-handler.js");

        createScript("shared-obj-handler.js");
        createScript("knock-round-handler.js");
    });
</script>
</body>
</html>