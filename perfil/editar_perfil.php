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

// Consulta o perfil do usuário
$sql = "SELECT * FROM perfil WHERE usuario_ID_USUARIO = $idUsuario";
$resultado = mysqli_query($con, $sql);

if (mysqli_num_rows($resultado) > 0) {
    $perfil = mysqli_fetch_assoc($resultado);
    $nome = $perfil['NOME_PERFIL'];
    $username = $perfil['USERNAME_PERFIL'];
    $bio = $perfil['BIO'];
    $fotoPerfil = $perfil['FOTO_PERFIL'];
    $fotoCapa = $perfil['FOTOCAPA_PERFIL'];

    // Exiba o formulário de alteração do perfil
    echo "<h3>ALTERAR PERFIL</h3>";
    echo "<form enctype='multipart/form-data' method='POST' action='atualizar_perfil.php'>";
    echo "Nome: <input type='text' name='nome' value='$nome'><br>";
    echo "Username: <input type='text' name='username' value='$username'><br>";
    echo "Bio: <textarea name='txtbio'>$bio</textarea><br>";
    echo "Foto de Perfil: <input type='file' name='fotoPerfil'><br>";
    echo "Foto de Capa: <input type='file' name='fotoCapa'><br>";
    echo "<input type='submit' value='Salvar'>";
    echo "</form>";
}

// Fechar a conexão com o banco de dados
mysqli_close($con);
?>
