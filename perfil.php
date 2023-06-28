<?php
include "conexao.php";
mysqli_query($con, "SET NAMES 'utf8'");
mysqli_query($con, 'SET character_set_connection=utf8');
mysqli_query($con, 'SET character_set_client=utf8');
mysqli_query($con, 'SET character_set_results=utf8');

$id_usuario_SL = $_GET['id_usuario'];

// Consulta ao banco de dados para obter as informações do perfil do usuário
$sql = "SELECT * FROM perfil WHERE usuario_ID_USUARIO = $id_usuario_SL";
$result = mysqli_query($con, $sql);

// Verificar se o perfil do usuário existe no banco de dados
if (mysqli_num_rows($result) > 0) {
    // Recuperar as informações do perfil do usuário
    $row = mysqli_fetch_assoc($result);
    $nome = $row['NOME_PERFIL'];
    $username = $row['USERNAME_PERFIL'];
    $fotoPerfil = $row['FOTO_PERFIL'];
    $fotoCapa = $row['FOTOCAPA_PERFIL'];
    $bio = $row['BIO'];

    // Exiba os dados do perfil
    echo "Nome: $nome<br>";
    echo "Username: $username<br>";
    echo "Bio: $bio<br>";
    echo "Foto de Perfil: <img src='imagens/img_user/fotos_usuario/$fotoPerfil' alt='Foto de Perfil'><br>";
    echo "Foto de Capa: <img src='imagens/img_user/fotos_capa/$fotoCapa' alt='Foto de Capa'><br>";

    // Botão Seguir Usuário
    echo "<form action='seguir/seguir.php' method='post'>";
    echo "<input type='hidden' name='idU_Seguir' value='$id_usuario_SL'>";
    echo "<input type='submit' value='Seguir Usuário'>";
    echo "</form>";

} else {
    echo "Perfil do usuário não encontrado.";
}

$sqlR = "SELECT * FROM resenhas WHERE usuarios_ID_USUARIO = $id_usuario_SL ORDER BY DATA_RESENHA DESC";
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
        echo "<img src='imagens/img_obras/" . $obra['FOTO_OBRA'] . "' alt='Foto da Obra'><br>";
        echo $obra['NOME_OBRA'] . "<br>";
        echo $obra['AU_DI_OBRA'] . "<br>";
        // Adicione outras informações da obra que desejar exibir
        echo "Resenha: " . $row['TXT_RESENHA'];
        echo "<br><br>";

    }
} else {
    echo "<h3>Este usuário ainda não tem resenhas</h3><br>";
}


// Fechar conexão com o banco de dados
$con->close();
?>
