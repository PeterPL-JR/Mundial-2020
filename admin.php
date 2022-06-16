<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Database Admin</title>
    <style>
        td:last-child {
            color: red;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <?php
    
    include 'database.php';
    $select = mysqli_query($base, "SELECT * FROM teams;");
    
    echo "<table>";
    while($row = mysqli_fetch_row($select)) {
        echo "<tr>";
        for($i = 0; $i < count($row); $i++) {
            echo "<td>$row[$i]</td>"; 
        }
        echo "<td onclick='remove(`$row[0]`);'>X</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    ?>

    <script>
        function remove(id) {
            window.location.href = "admin.php?remove=" + id;
        }
    </script>

    <?php
    
    if(isset($_GET['remove'])) {
        $id = $_GET['remove'];
        mysqli_query($base, "DELETE FROM teams WHERE name = '$id';");
        header("Location: admin.php");
    }
    
    ?>
</body>
</html>