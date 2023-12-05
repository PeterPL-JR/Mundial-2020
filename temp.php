<?php include_once "constants.php"; ?>

<?php function use_temp($year, $type) { ?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <?php $title = ($type == TYPE_MUNDIAL) ? "Mundial" : "Euro"; ?>
    <meta charset="UTF-8">
    <title><?php echo $title." ".$year; ?> - Wytypuj Wyniki</title>
    <link rel="icon" href="../../images/logo<?php echo $year; ?>.png" type="image/png">
    <link rel="stylesheet" href="../../styles/themes/theme-<?php echo $year; ?>.css">
    <script src="../../scripts/library.js"></script>
    <script src="../../scripts/constants.js"></script>
    <script src="../../scripts/football.js"></script>
    
    <link rel="stylesheet" href="../../styles/basic-styles.css">
    <link rel="stylesheet" href="../../styles/logo-styles.css">
    <link rel="stylesheet" href="../../styles/content-styles.css">
    
    <link rel="stylesheet" href="../../styles/pots-styles.css">
    <link rel="stylesheet" href="../../styles/group-table-styles.css">
    <link rel="stylesheet" href="../../styles/group-matches-styles.css">
    <link rel="stylesheet" href="../../styles/knock-matches-styles.css">

    <link rel="stylesheet" href="../../styles/share-styles.css">
    <link rel="stylesheet" href="../../styles/user-styles.css">
</head>
<body>
    <img src="../../images/user.png" id='user-menu-img'>
    <div id="container">
        <div id="logo">
            <img src="../../images/logo<?php echo $year; ?>.png" id="logo-image">
            <div id="logo-name"><?php echo $title." ".$year; ?></div>
            <div style="clear: both;"></div>
        </div>
        <div id="content">
            <div id='phase' class='phase-pots'>
                <img id='phase-img' src="../../images/ball.png">
                <div id='phase-div'></div>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
<script src="../../init-main-page.js" id="init-script"></script>
<script>
    initIndex(<?php echo $year; ?>, <?php echo $type; ?>);
</script>
</body>
</html>
<?php } ?>