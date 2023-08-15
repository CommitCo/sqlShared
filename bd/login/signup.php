<?php
    require 'database.php';

    $message = '';

    if (!empty($_POST['email']) && !empty($_POST['password']) &&
        !empty($_POST['nombres']) && !empty($_POST['apellidos'])) {
        $sql = "INSERT INTO users (nombres, apellidos, email, password) VALUES
        (:nombres, :apellidos, :email, :password)";
        $stmt = $con->prepare($sql);
        $stmt -> bindParam(':nombres', $_POST['nombres']);
        $stmt -> bindParam(':apellidos', $_POST['apellidos']);
        $stmt -> bindParam(':email', $_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $stmt -> bindParam(':password', $password);

        if ($stmt ->execute()) {
            $message = 'El usuario fue creado exitosamente';
        } else {
            $message = 'Lo sentimos! pero hay problemas al crear el usuario';
        }
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
    <?php require 'partials/header.php'?>
    <?php if(!empty($message)): ?>
        <p> <?= $message?></p>
    <?php endif; ?>
    <h1>Formulario</h1>
    <form action="signup.php" method="POST">
        <input name="nombres" type="text" placeholder="Ingrese nombre">
        <input name="apellidos" type="text" placeholder="Ingrese apellidos">
        <input name="email" type="text" placeholder="Ingrese email">
        <input name="password" type="password"placeholder="Ingrese contraseña">
        <h3>De acuerdo con los terminos y condiciones</h3>
        <input type="submit" value="Guardado">
    </form>
    <a href="login.php">¿Ya tengo una cuenta?</a>
</body>
</html>