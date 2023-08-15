<?php
    session_start();
    if (isset($_SESSIONP['user_id'])) {
        header('Location:/login');
    }
    require 'database.php';
    if (!empty($_POST['email']) && !empty($_POST['password'])) {
        $records = $con->prepare('SELECT id, email, password FROM users WHERE email = :email');
        $records ->bindParam(':email', $_POST['email']);
        $records ->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);

        $message = '';

        if (count($results)> 0 && password_verify($_POST['password'],$results['password'])) {
            $_SESSION['user_id'] = $results['id'];
            header('Location: /login/index.php');
        } else {
            $message = 'lo sentimos, la password ingresada no coincide';
        }
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
    <?php require 'partials/header.php'?>
    <?php if(!empty($message)): ?>
        <p><?= $message?></p>
    <?php endif; ?>

    <h1>Ingresar</h1>
    <span>o <a href="Signup.php">Registrate</a></span>
    <form action="login.php" method="POST">
        <input type="text" name="email" placeholder="Ingrese Correo electronico">
        <input type="password" name="password" placeholder="Ingrese contraseña">
        <input type="submit" value="Ingresar">
    </form>
</body>
</html>