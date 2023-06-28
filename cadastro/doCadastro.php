<?php
require 'conexao.php';

$email = $_POST['txtemail'];
$senha = $_POST['txtsenha'];

// Valida o formato do email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "<script>alert('Por favor, insira um email válido!');</script>";
    header('refresh:3;./index.html');
    exit();
}


// Valida a força da senha
if (strlen($senha) < 8 || !preg_match('/[A-Z]/', $senha) || !preg_match('/[a-z]/', $senha) || !preg_match('/[0-9]/', $senha)) {
    echo "<script>alert('A senha deve ter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas e números!');</script>";
    header('refresh:1.5;./index.html');
    exit();
}

// Prepara a consulta para inserir os dados no banco de dados
$stmt = mysqli_prepare($con, 'INSERT INTO usuarios(EMAIL_USUARIO, SENHA_USUARIO) VALUES(?, ?)');
if (!$stmt) {
    die("Erro na preparação da consulta: " . mysqli_error($con));
}

// Vincula as variáveis aos parâmetros da consulta
mysqli_stmt_bind_param($stmt, 'ss', $email, $senha);

// Executa a consulta
if (!mysqli_stmt_execute($stmt)) {
    echo "<script>alert('Ocorreu um erro ao criar sua conta. Por favor, tente com um novo email ou tente novamente mais tarde.');</script>";
    header('refresh:1.5;./index.html');
    exit();
}

// Fecha a consulta preparada
mysqli_stmt_close($stmt);

// Exibe uma mensagem de sucesso e redireciona para a página de perfil
echo "<script>alert('Sua conta foi criada com sucesso!');</script>";
// Inicia a sessão
session_start();

// Armazena o ID do usuário recém-criado na sessão
$idUsuario = mysqli_insert_id($con);
$_SESSION['ID_USUARIO'] = $idUsuario;

header('refresh:1;../perfil/perfil_config.php');

// Fecha a conexão com o banco de dados
mysqli_close($con);
?>
