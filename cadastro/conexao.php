<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "bd_liver";

// Criar conexão
$con = mysqli_connect($servername, $username, $password, $database);

// Verificar a conexão
if ($con->connect_error) {
    die("Erro na conexão com o banco de dados: " . $con->connect_error);
} else {
    echo "";
}

// Fechar a conexão
//$con->close();
?>
