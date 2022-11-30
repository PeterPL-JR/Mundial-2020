<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>League Mundial</title>
    <script src="scripts/library.js"></script>
    <script src="scripts/styles-handler.js"></script>

    <link rel="icon" href="images/cup.png" type="image/png">
    <link rel="stylesheet" href="styles/css-colors.css">
    <link rel="stylesheet" href="styles/main-page-styles.css">

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
        <img src="images/cup.png" id="logo">
        <div id="logo-name">League <b>Mundial</b></div>
        <div style="clear: both;"></div>
    </div>
    <div id="content">
        <div class="round-name">
            <img src="images/ball.png">
            <div class="name-div">Koszyki</div>
            <div style="clear: both"></div>
        </div>
        <button class="button">Zatwierdź</button>
    </div>
</div>
<script src="initMainPage.js" id="init-script"></script>
<script src="prepare-pots.js"></script>
<script>
    initCustom();
</script>
</body>
</html>