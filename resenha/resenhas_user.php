<?php
// Conecta-se ao banco de dados
require '../conexao.php';
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login/index.html');
    exit();
}

// Recupera os valores do formulário
$idUsuario = $_SESSION['ID_USUARIO'];
$idObra = $_SESSION['id_obra'];

$sql = "SELECT * FROM resenhas WHERE usuarios_ID_USUARIO = $idUsuario AND obra_ID_OBRA = $idObra";
$result = mysqli_query($con, $sql);

while ($registro = mysqli_fetch_array($result)) {
    echo $registro['TXT_RESENHA']; "<br>";
}

$close = mysqli_close($con);
?>
