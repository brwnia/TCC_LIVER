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
$idObra = $_POST['id_obra'];
$_SESSION['id_obra'] = $idObra;
$resenha = $_POST['txtResenha'];

// Insere a resenha no banco de dados
$sql = "INSERT INTO resenhas (TXT_RESENHA, DATA_RESENHA, usuarios_ID_USUARIO, obra_ID_OBRA) VALUES ('$resenha', CURRENT_TIMESTAMP, '$idUsuario', '$idObra')";
$resultado = mysqli_query($con, $sql);
if ($resultado) {
    // Resenha inserida com sucesso
    echo "<script>window.alert('Resenha Salva!');</script>";
    header('refresh:1.5;../perfil/perfil_user.php');
    exit();
} else {
    // Erro ao inserir a resenha
    echo "Erro ao criar a resenha. Por favor, tente novamente.";
}

mysqli_query($con, "SET NAMES 'utf8'");
mysqli_query($con, 'SET character_set_connection=utf8');
mysqli_query($con, 'SET character_set_client=utf8');
mysqli_query($con, 'SET character_set_results=utf8');

// Fecha a conexão com o banco de dados
mysqli_close($con);
?>
