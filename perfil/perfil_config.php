<?php

// Conecta-se ao banco de dados
require '../conexao.php';


session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login/doLogin.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Liver</title>
</head>
<body>
<h1>Vamos terminar de configurar o seu perfil?</h1>

<form method="POST" action="salvar_perfil.php" enctype="multipart/form-data">
    <label for="nome">Primeiro, insira seu nome:</label><br>
    <input type="text" id="nome" name="txtnome" required><br>

    <label for="username">Qual username você deseja usar?</label><br>
    <input type="text" id="username" name="username" required><br>

    <label for="bio">Faça uma breve biografia sobre você e seus gostos!</label><br>
    <textarea id="bio" name="txtbio"></textarea><br>
    
    <label for="foto">Escolha uma foto de perfil</label><br>
    <input type="file" id="foto" name="foto"><br>
    
    <label for="foto_capa">Escolha sua foto de capa</label><br>
    <input type="file" id="foto_capa" name="foto_capa"><br>
    
    <input type="submit" value="Salvar">
</form>  
</body>
</html>




