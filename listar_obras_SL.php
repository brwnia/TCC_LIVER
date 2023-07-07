<!DOCTYPE html>
<html>
<head>
    <title>Descrição</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/detalhes.css">
</head>

<body>

    <!--NAVBAR-->
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark w-100">

        <a class="navbar-brand">
            <img src="./imagens/liver_logo.png" alt="Logo LiVer" src="index.php" width="100" height="40"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse me-auto y-2 my-lg-0" id="navbarScroll">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
            <a class="nav-link" href="./index.php">Início</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li class="nav-item">
            <a class="nav-link active" href="./login/doLogin.php">Login</a>
            </li>
        </ul>
    </div>
    </nav>
    <br><br><br><br>
<!--FIM DA NAVBAR--> 

<div class= 'container-fluid'>
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
    ?>

     <div class= 'col-md-4'><?php echo "<p><b>$nome_obra</b></p>"?></div>
    
    <div class = 'img-fluid'><?php echo "<img src='./imagens/img_obras/$foto_obra' alt='$nome_obra' class='card-img'>";?> </div>
    
    <div class = 'col-md-8'><?php 
    echo "<p>Ano de Lançamento: $ano_obra</p>";
    echo "<p>Sinopse: $sinopse</p>";
    echo "<p>Autor/Diretor: $autor_obra<br>";
    ?></div></div>

    <hr id="linha-resenha">
    
<div id="container-res">
<div id="content-res">

<?php
    // Verifica se o usuário está logado
 
    session_start();
    
    if (!isset($_SESSION['ID_USUARIO'])) {
        echo "<a id='resenha' href='login/index.html'><p id='login-res'>Faça login para resenhar esta obra.</p><button id='botao-res' type='submit'>Login</button></a>";
        echo"<div class='space'></div>";
    } else {
        
        $idUsuario = $_SESSION['ID_USUARIO'];
        echo "<form action='resenha/resenha.php' method='POST'>";
        echo "<input type='hidden' name='id_obra' value='$id_obra'>";
        echo "<a id='resenha'><p id='logado-res'>lugar dps p escrever e enviar e etc</p><button id='botao-res' type='submit'>Resenhar</button>";
        echo "</form>";
   
    }
} else {
    echo "Obra não encontrada.";
}

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
            echo "<p id='resenha'><a id='resenha-nome' href='perfil.php?id_usuario=$id_usuario'>$nome_usuario<br><br><a id='res'>$txt_resenha</a></a></p>";
        }
    } else {
        echo "<p id='resenha'><a id='not-res'>Ainda não há resenhas para esta obra.</a></p>";
    }
    // Fechar conexão com o banco de dados
$con->close();
    ?>


   
</div>
</div>
  </body>
</html>
