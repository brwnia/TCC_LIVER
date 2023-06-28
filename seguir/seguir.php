<?php
session_start();
include "../conexao.php";

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login/index.html');
    exit(); // O código será interrompido aqui se o usuário não estiver logado
}

$idUsuario = $_SESSION['ID_USUARIO'];

// Verifica se o formulário de seguir foi enviado
if (isset($_POST['idU_Seguir'])) {
    $idU_Seguido = $_POST['idU_Seguir'];

    // Verifica se o usuário já está seguindo o perfil
    $sqlVerifica = "SELECT * FROM seguir WHERE ID_SEGUINDO_SEGUIR = '$idU_Seguido' AND perfil_ID_PERFIL = '$idUsuario'";
    $resultadoVerifica = mysqli_query($con, $sqlVerifica);

    if (mysqli_num_rows($resultadoVerifica) > 0) {
        echo "<script>alert('Você já está seguindo o usuário.');</script>";
        header('refresh:1.5;../perfil.php?id_usuario=' . $idU_Seguido);
    } else {
        // Insere os dados na tabela de seguidores
        $sql = "INSERT INTO seguir (DATA_SEGUIR, ID_SEGUINDO_SEGUIR, perfil_ID_PERFIL) VALUES (CURRENT_TIMESTAMP, '$idU_Seguido', '$idUsuario')";
        $resultado = mysqli_query($con, $sql);

        // Verifica se a inserção foi bem-sucedida
        if ($resultado) {
            echo "<script>alert('Você está seguindo o usuário!');</script>";
            header('refresh:1.5;../perfil.php?id_usuario=' . $idU_Seguido);    
        } else {
            echo "<script>alert('Erro ao seguir o usuário');</script>";
            header('refresh:1.5;../perfil.php?id_usuario=' . $idU_Seguido);    
        }
    }
}

// Fecha a conexão com o banco de dados
mysqli_close($con);
?>
