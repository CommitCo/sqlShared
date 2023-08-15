<?php
    session_start();
    require "database.php";

    if (isset($_SESSION['user_id'])) {
        $records = $con->prepare('SELECT id, email, password FROM users WHERE id = :id');
        $records->bindParam(':id', $_SESSION['user_id']);
        $records->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);
    
        $user = NULL;

        if (count($results) > 0) {
            $user = $results;
        }
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenidos aprendices</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
    <?php require 'partials/header.php'?>
    <?php if(!empty($user)): ?>
        <br>Bienvenido. <?= $user['email'];?>
        <br>El login fue exitoso.
        <a href="logout.php">Cierre de sesion</a>
    <?php else:?>
        <h3>Si ya tiene cuenta, ingresa. si no la tiene registrase</h3>
        <a href="login.php">Ingreso</a> o
        <a href="signup.php">Registro</a> 
    <?php endif;?>
    <div style="display: flex; justify-content:center; align-items:center; height:70vh;">
        <img src="partials/img.png" alt="Aqui va algo">
    </div>
</body>
</html>