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
<!-- <img src="images/background.png" id="background"> -->
<div id="container">
    <div id="header-div">
        <img src="images/logo.png" id="logo">
        <div id="logo-name">Mundial 2022</div>
        <div style="clear: both;"></div>
    </div>
    <div id="content">
        <div class="round-name">
            <img src="images/ball.png">
            <div class="name-div"></div>
            <div style="clear: both"></div>
        </div>
    </div>
</div>
<script id="init-script">

    function createScript(src, variable, index) {
        var script = document.createElement("script");
        script.src = src;
        script.onload = function() { variable[index] = true; };
        document.body.appendChild(script);
    }

    var scripts = [];
    var int = setInterval(function() {
        var loaded = true;
        for(var elem of scripts) {
            if(!elem) loaded = false;
        }
        if(loaded) {
            start();
            clearInterval(int);
        };
    }, 100);

    var teams;
    serverGet("/create-mundial/get_data.php", {year: 2022}, function(text) {
        teams = JSON.parse(text);
        createScript("prepare-groups.js", scripts, 0);
        createScript("group-round-handler.js", scripts, 1);

        createScript("shared-obj-handler.js", scripts, 2);
        createScript("knock-round-handler.js", scripts, 3);
    });

    function start() {
        contentDiv = getId("content");
        roundNameDiv = document.querySelector(".round-name .name-div");
        prepareGroupRound();
        // auto_mundial();
    }
</script>
</body>
</html>