<!DOCTYPE html>
<html>
<head>
    <title>Liver</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 50px;
        }

        .product-bg {
            background-color: #ffff;
        }

        .product-item {
            width: 200px;
            height: 350px;
            text-align: center;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
        }

        .product-item img {
            max-width: 100%;
            max-height: 200px;
        }

        .product-item .product-name {
            margin-top: 10px;
        }

        .product-item .buy-button {
            margin-top: auto;
        }
    </style><?php
// Conecta-se ao banco de dados
require 'conexao.php';

session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: login/index.html');
    exit();
}

// Obtém o ID do usuário logado
$idUsuario = $_SESSION['ID_USUARIO'];

mysqli_query($con, "SET NAMES 'utf8'");
mysqli_query($con, 'SET character_set_connection=utf8');
mysqli_query($con, 'SET character_set_client=utf8');
mysqli_query($con, 'SET character_set_results=utf8');

$comando = "SELECT * FROM obra";
$resulta = mysqli_query($con, $comando);
$p = 0;
echo "<div class='product-container product-bg'>";
while ($registro = mysqli_fetch_array($resulta)) {
    echo "<div class='product-item'>";
    echo "<form name='fox' action='resenha/resenha.php' method='POST'>";
    echo "<img src='imagens/img_obras/" . $registro['FOTO_OBRA'] . "' alt='Foto da Obra'><br>";
    echo "<div class='nome_obra'>" . $registro['NOME_OBRA'] . "</div>";
    echo "<input name='id_obra' id='id_obra' type='hidden' value='" . $registro['ID_OBRA'] . "'><br>";
    echo "<input type='submit' name='obra_resenha' value='Resenhar' class='buy-button'>";
    echo "</form>";
    
    // Adicione os botões de favoritos e verdepois
    echo "<form name='lista_favoritos' action='listas/lista_favoritos.php' method='POST'>";
    echo "<input name='id_obra' type='hidden' value='" . $registro['ID_OBRA'] . "'>";
    echo "<input type='submit' name='add_lista_favoritos' value='Adicionar aos Favoritos' class='buy-button'>";
    echo "</form>";
    
    echo "<form name='lista_verdps' action='listas/lista_verdps.php' method='POST'>";
    echo "<input name='id_obra' type='hidden' value='" . $registro['ID_OBRA'] . "'>";
    echo "<input type='submit' name='add_lista_verdps' value='Adicionar à Lista de Ver depois' class='buy-button'>";
    echo "</form>";
    
    echo "</div>";
}
echo "</div>";
$close = mysqli_close($con);
?>
