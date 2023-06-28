<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LiVer</title>
</head>
<body>
    
<?php
include "conexao.php";
mysqli_query($con, "SET NAMES 'utf8'");
mysqli_query($con, 'SET character_set_connection=utf8');
mysqli_query($con, 'SET character_set_client=utf8');
mysqli_query($con, 'SET character_set_results=utf8');

$id_obra = $_GET['id_obra'];

// Consulta ao banco de dados para obter as informações da obra
$sql = "SELECT * FROM obra WHERE ID_OBRA = $id_obra";
$result = $con->query($sql);

// Verificar se a obra existe no banco de dados
if ($result->num_rows > 0) {
    // Recuperar as informações da obra
    $row = $result->fetch_assoc();
    $nome_obra = $row['NOME_OBRA'];
    $ano_obra = $row['ANO_OBRA'];
    $sinopse = $row['DESC_OBRA'];
    $foto_obra = $row['FOTO_OBRA'];
    $autor_obra = $row['AU_DI_OBRA'];

    // Exibir as informações da obra
    echo "<h2>$nome_obra</h2>";
    echo "<img src='./imagens/img_obras/$foto_obra' alt='$nome_obra' class='card-img'>";
    echo "<p>Ano de Lançamento: $ano_obra</p>";
    echo "<p>Sinopse: $sinopse</p>";
    echo "<p>Autor/Diretor: $autor_obra<br>";

    // Consulta ao banco de dados para obter as resenhas da obra
    $sql_resenhas = "SELECT resenhas.*, perfil.NOME_PERFIL
    FROM resenhas
    INNER JOIN perfil ON resenhas.usuarios_ID_USUARIO = perfil.usuario_ID_USUARIO
    WHERE resenhas.obra_ID_OBRA = $id_obra
    ORDER BY resenhas.DATA_RESENHA DESC
    LIMIT 0, 25";
    $result_resenhas = $con->query($sql_resenhas);

    if ($result_resenhas->num_rows > 0) {
        // Exibir as resenhas da obra
        while ($row_resenha = $result_resenhas->fetch_assoc()) {
            $nome_usuario = $row_resenha['NOME_PERFIL'];
            $txt_resenha = $row_resenha['TXT_RESENHA'];
            $id_usuario = $row_resenha['usuarios_ID_USUARIO'];
            echo "<p>Resenha de <a href='perfil.php?id_usuario=$id_usuario'>$nome_usuario</a>: $txt_resenha</p>";
        }
    } else {
        echo "<p>Ainda não há resenhas para esta obra.</p>";
    }
    // Verifica se o usuário está logado
    session_start();
    if (!isset($_SESSION['ID_USUARIO'])) {
        echo "<p>Faça login para resenhar esta obra.</p>";
        echo "<a href='login/index.html'>Ir para página de login</a>";
    } else {
        $idUsuario = $_SESSION['ID_USUARIO'];
        echo "<form action='resenha/resenha.php' method='POST'>";
        echo "<input type='hidden' name='id_obra' value='$id_obra'>";
        echo "<button type='submit'>Resenhar</button>";
        echo "</form>";
    }
} else {
    echo "Obra não encontrada.";
}

// Fechar conexão com o banco de dados
$con->close();
?>

</body>
</html>