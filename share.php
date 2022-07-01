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
            <button name="share-button" class="button">Opublikuj</button>
        </form>
    </div>
</div>

</body>
</html>