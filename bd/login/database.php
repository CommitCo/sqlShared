<?php
    $server = "3307";
    $username = "root";
    $password = "";
    $database = "login";
    try {
        $con = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
    } catch (PDOExcetion $e) {
        die('Connetion failed: '.$e->getMessage());
    }
?>