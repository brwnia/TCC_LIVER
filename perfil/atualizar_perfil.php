<?php
// Conecta-se ao banco de dados
require '../conexao.php';

session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: login.php');
    exit();
}

// Obtém o ID do usuário logado
$idUsuario = $_SESSION['ID_USUARIO'];

$sql1 = "SELECT * FROM perfil WHERE usuario_ID_USUARIO = $idUsuario";
$resultado = mysqli_query($con, $sql1);

if (mysqli_num_rows($resultado) > 0) {
    $perfil = mysqli_fetch_assoc($resultado);
    $idPerfil = $perfil['ID_PERFIL'];
}

// Verifica se os dados foram enviados pelo formulário
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtém os novos dados do perfil do formulário
    $nome = $_POST['nome'];
    $username = $_POST['username'];
    $bio = isset($_POST['txtbio']) ? $_POST['txtbio'] : null;
    
    // Verifica se foram enviadas novas fotos de perfil e capa
    $fotoPerfil = isset($_FILES['fotoPerfil']) ? $_FILES['fotoPerfil']['name'] : null;
    $fotoCapa = isset($_FILES['fotoCapa']) ? $_FILES['fotoCapa']['name'] : null;

    // Atualiza os dados do perfil no banco de dados
    $sql = "UPDATE perfil SET NOME_PERFIL = '$nome', USERNAME_PERFIL = '$username'";
    
    if ($fotoPerfil) {
        // Realiza o upload da nova foto de perfil
        $targetDir = '../imagens/img_user/fotos_user/';
        $targetFile = $targetDir . basename($_FILES['fotoPerfil']['name']);
        move_uploaded_file($_FILES['fotoPerfil']['tmp_name'], './' . $targetFile);
        
        // Obtém apenas o nome do arquivo da foto de perfil
        $fotoPerfilNome = basename($_FILES['fotoPerfil']['name']);
        
        // Atualiza o nome da foto de perfil no banco de dados
        $sql .= ", FOTO_PERFIL = '$fotoPerfilNome'";
    }
    
    if ($fotoCapa) {
        // Realiza o upload da nova foto de capa
        $targetDir = '../imagens/img_user/fotos_capa/';
        $targetFile = $targetDir . basename($_FILES['fotoCapa']['name']);
        move_uploaded_file($_FILES['fotoCapa']['tmp_name'], './' . $targetFile);
        
        // Obtém apenas o nome do arquivo da foto de capa
        $fotoCapaNome = basename($_FILES['fotoCapa']['name']);
        
        // Atualiza o nome da foto de capa no banco de dados
        $sql .= ", FOTOCAPA_PERFIL = '$fotoCapaNome'";
    }
    
    // Verifica se foi fornecida uma nova bio
    if ($bio !== null) {
        $sql .= ", BIO = '$bio'";
    }
    
    $sql .= " WHERE ID_PERFIL = $idPerfil AND usuario_ID_USUARIO = $idUsuario";    
    // Executa a consulta SQL de atualização
    mysqli_query($con, $sql);
    
    // Redireciona o usuário para a página de perfil
    header('Location: perfil_user.php');
    exit();

}


?>