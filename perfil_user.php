<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="icon" href="./public/logo2_liver.png" type="image/x-icon">
    <title>Meu perfil</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="perfil.css">
  </head>

<body>
  <div class="container-fluid">
    <!--NAVBAR-->
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand">
            <img src="../imagens/liver_logo.png" alt="Logo LiVer" src="index.php" width="100" height="40"></a>
    </div>
    </nav>
    <br><br><br><br>
<!--NAVBAR TERMINA-->

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
    $fotoPerfil = $perfil['FOTO_PERFIL'];
    $fotoCapa = $perfil['FOTOCAPA_PERFIL'];
    $bio = $perfil['BIO'];

    // Exiba os dados do perfil
    echo "<section class='first-person'>";

    echo "<div class='fotos-perfil'>";
    echo "<img src='../imagens/img_user/fotos_capa/$fotoCapa' alt='Foto de Capa' id='foto-perfil-capa'><br>";
    echo "<img src='../imagens/img_user/fotos_user/$fotoPerfil' alt='Foto de Perfil' id='foto-perfil-user'><br>";
    echo "</div>";

    echo "<div class='info-perfil'>";
    echo "$nome<br><br>";
    echo "@$username<br><br>";
    echo "$bio<br><br>";
    echo "</div>";
    
    // Botão Alterar Perfil
    echo "<div class='config-first-person'>";
    echo "<a href='editar_perfil.php'>Alterar Perfil</a><br>";
    echo "<a href='logout.php'>Sair da Minha Conta</a><br>";
    echo "<a href='../listar_obras_CL.php'>Resenhar</a><br>";
    echo "<a href='../cadastro_obra/cadastro_obra.php'>Cadastre uma obra</a><br><br><br>";
} else {
    echo "Perfil não encontrado.";
}
    echo"</div>";

// Consulta as pessoas que o usuário segue
echo "<div class='seguidores-perfil'>";
$sqlSeguindo = "SELECT * FROM seguir WHERE perfil_ID_PERFIL = $idUsuario";
$resultadoSeguindo = mysqli_query($con, $sqlSeguindo);

if (mysqli_num_rows($resultadoSeguindo) > 0) {
    echo "<h3>Pessoas que você segue:</h3>";
    while ($rowSeguindo = mysqli_fetch_assoc($resultadoSeguindo)) {
        $idSeguido = $rowSeguindo['ID_SEGUINDO_SEGUIR'];
        $sqlPerfilSeguido = "SELECT * FROM perfil WHERE usuario_ID_USUARIO = $idSeguido";
        $resultadoPerfilSeguido = mysqli_query($con, $sqlPerfilSeguido);
        $perfilSeguido = mysqli_fetch_assoc($resultadoPerfilSeguido);
        $nomeSeguido = $perfilSeguido['NOME_PERFIL'];
        $usernameSeguido = $perfilSeguido['USERNAME_PERFIL'];
        $idU_Seguido = $perfilSeguido['usuario_ID_USUARIO'];
        
        // Verifica se o perfil sendo exibido é diferente do seu próprio perfil
        if ($idU_Seguido != $idUsuario) {
            echo "<p>$nomeSeguido - <a href='../perfil.php?id_usuario=$idU_Seguido'>@$usernameSeguido</a> <a href='../seguir/unfollow.php?idU_Seguido=$idU_Seguido'>Deixar de Seguir</a></p>";
        }
    }
} else {
    echo "<h3 id='seguindo'>Você não está seguindo ninguém.</h3>";
}
    echo"</div>";
    echo "</section>";

// Mostrar resenhas feitas pelo usuário 
    echo "<article class='resenhas-first-person'>";
$sqlR = "SELECT * FROM resenhas WHERE usuarios_ID_USUARIO = $idUsuario ORDER BY DATA_RESENHA DESC";
$resultadoResenhas = mysqli_query($con, $sqlR);

if (mysqli_num_rows($resultadoResenhas) > 0) {
    // Exibir as obras resenhadas pelo usuário
    while ($row = mysqli_fetch_assoc($resultadoResenhas)) {
        $idObra = $row["obra_ID_OBRA"];
        
        $sqlO = "SELECT * FROM obra WHERE ID_OBRA = $idObra";
        $resultadoObra = mysqli_query($con, $sqlO);
        $obra = mysqli_fetch_assoc($resultadoObra);
        
        // Exiba as informações da obra
        echo "<div class='info-resenha'>";
        echo $row['DATA_RESENHA'] . "<br>";
        echo "<img src='../imagens/img_obras/" . $obra['FOTO_OBRA'] . "' alt='Foto da Obra'><br>";
        echo $obra['NOME_OBRA'] . "<br>";
        echo $obra['AU_DI_OBRA'] . "<br>";
        // Adicione outras informações da obra que desejar exibir
        echo "Resenha: " . $row['TXT_RESENHA'];
        echo "<br><br>";

    }
} else {
    echo "<h3 id='resenha'>Aparentemente você ainda não tem resenhas.<br><a href='../listar_obras.php'>Resenhe uma obra agora!</a><br></h3><br>";
}
    echo "</div>";
    echo "</article";
// Fechar a conexão com o banco de dados
mysqli_close($con);
?>

</body>
</html>