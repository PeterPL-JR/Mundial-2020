<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Query Admin</title>
    <style>
        textarea {
            width: 600px;
            height: 100px;
            font-size: 15px;
        }
        button {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form method="get">
        Zapytanie<br>
        <textarea name="query-text"></textarea><br>
        <button>Wykonaj</button>
    </form>
    <?php
    
    if($_GET['query-text']) {
        
    }
    
    ?>
</body>
</html>