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
    echo "Nome: $nome<br>";
    echo "Username: $username<br>";
    echo "Bio: $bio<br>";
    echo "Foto de Perfil: <img src='imagens/img_user/fotos_usuario/$fotoPerfil' alt='Foto de Perfil'><br>";
    echo "Foto de Capa: <img src='imagens/img_user/fotos_capa/$fotoCapa' alt='Foto de Capa'><br>";
    // Botão Alterar Perfil
    echo "<a href='editar_perfil.php'>Alterar Perfil</a><br>";
    echo "<a href='logout.php'>Sair da Minha Conta</a><br>";
    echo "<a href='../listar_obras_CL.php'>Resenhar</a><br><br><br>";
} else {
    echo "Perfil não encontrado.";
}

// Consulta as pessoas que o usuário segue
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
    echo "<h3>Você não está seguindo ninguém.</h3>";
}



// Mostrar resenhas feitas pelo usuário 
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
        echo $row['DATA_RESENHA'] . "<br>";
        echo "<img src='../imagens/img_obras/" . $obra['FOTO_OBRA'] . "' alt='Foto da Obra'><br>";
        echo $obra['NOME_OBRA'] . "<br>";
        echo $obra['AU_DI_OBRA'] . "<br>";
        // Adicione outras informações da obra que desejar exibir
        echo "Resenha: " . $row['TXT_RESENHA'];
        echo "<br><br>";

    }
} else {
    echo "<h3>Aparentemente você ainda não tem resenhas. Resenhe uma obra agora!</h3><br>";
    echo "<a href='../listar_obras.php'>Resenhar</a><br>";
}

// Fechar a conexão com o banco de dados
mysqli_close($con);
?>
