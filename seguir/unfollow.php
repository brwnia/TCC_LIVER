<?php
// Conecta-se ao banco de dados
require '../conexao.php';

session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login/index.html');
    exit();
}

// Obtém o ID do usuário logado
$idUsuario = $_SESSION['ID_USUARIO'];

// Verifica se foi enviado um ID de usuário a ser deixado de seguir
if (isset($_GET['idU_Seguido'])) {
    $idU_Seguido = $_GET['idU_Seguido'];

    // Remove o relacionamento de seguir no banco de dados
    $sqlRemoverSeguir = "DELETE FROM seguir WHERE ID_SEGUINDO_SEGUIR = '$idU_Seguido' AND perfil_ID_PERFIL = $idUsuario";
    // FROM seguir WHERE ID_SEGUINDO_SEGUIR = $idSeguido AND perfil_ID_PERFIL = $idUsuario";
    $resultadoRemoverSeguir = mysqli_query($con, $sqlRemoverSeguir);
    if ($resultadoRemoverSeguir) {
        // Redireciona de volta para a página de perfil ou qualquer outra página desejada
        echo "<script>alert('Usuário deletado da lista seguindo');</script>";
        header('refresh:1.5;../perfil/perfil_user.php');
        exit();
    } else {
        echo "<script>alert('Ocorreu um erro ao deixar de seguir o usuário.');</script>";
    }
} else {
    echo "<script>alert('ID de usuário inválido.');</script>";
}

// Fechar a conexão com o banco de dados
mysqli_close($con);
?>

