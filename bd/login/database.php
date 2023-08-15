<?php
    $server   = "localhost:3308";
    $username = "root";
    $password = "";
    $database = "login";
    try {
        $con = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
    } catch (PDOException $e) {
        die('Conexion fallada: '.$e->getMessage());
    }
?> 