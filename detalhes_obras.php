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
mysqli_query($con,"SET NAMES 'utf8'");  
mysqli_query($con,'SET character_set_connection=utf8');  
mysqli_query($con,'SET character_set_client=utf8');  
mysqli_query($con,'SET character_set_results=utf8'); 
  

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
    //resenhar
    echo "<a href='../login/index.html'>Resenhar</a><br>";

  } else {
    echo "Obra não encontrada.";
  }

  // Fechar conexão com o banco de dados
  $con->close();
?>
</body>
</html>
