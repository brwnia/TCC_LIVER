<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "bd_liver";

// Criar conexão
$con = new mysqli($servername, $username, $password, $database);

// Verificar a conexão
if ($con->connect_error) {
    die("Erro na conexão com o banco de dados: " . $con->connect_error);
}

// Definir a codificação de caracteres para UTF-8
mysqli_set_charset($con, "utf8");

// Fechar a conexão
//$con->close();
?>
