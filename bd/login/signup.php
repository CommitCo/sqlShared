<?php
    require 'database.php';

    $message = '';

    if (!empty($_POST['email']) && !empty($_POST['password']) &&
        !empty($_POST['nombres']) && !empty($_POST['apellidos'])) {
        $sql = "INSERT INTO users (nombres, apellidos, email, password) VALUES
        (:nombres, :apellidos, :email, :password)";
        $stmt = $con->prepare($sql);
    }
?>