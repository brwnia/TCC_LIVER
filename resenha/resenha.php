<!DOCTYPE html>
<html>
<head>
    <title>Resenhar no Liver</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<?php
// Conecta-se ao banco de dados
require '../conexao.php';

session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login/index.html');
    exit();
}

// Obtém o ID do usuário logado
$idUsuario = $_SESSION['ID_USUARIO'];
$idObra = $_POST['id_obra'];
$_SESSION['id_obra'] = $idObra;

mysqli_query($con, "SET NAMES 'utf8'");
mysqli_query($con, 'SET character_set_connection=utf8');
mysqli_query($con, 'SET character_set_client=utf8');
mysqli_query($con, 'SET character_set_results=utf8');

$comando = "SELECT * FROM obra where ID_OBRA = $idObra";
$resulta = mysqli_query($con, $comando);
$p = 0;
?>

<div style='text-align: center'>

<?php
while ($registro = mysqli_fetch_array($resulta)) {
?>

    <div style='display: flex; justify-content: center; align-items: center; margin-bottom: 20px;'>

        <div style='margin-right: 20px;'>
            <img src='../imagens/img_obras/<?php echo $registro['FOTO_OBRA']; ?>' width='250' height='250' alt='Foto da Obra'>
        </div>

        <div>
            <p><strong>Nome da Obra:</strong> <?php echo $registro['NOME_OBRA']; ?></p>
            <form name='fox' action='./doResenha.php' method='POST'>
                <input name='id_obra' id='id_obra' type='hidden' value='<?php echo $idObra; ?>'><br><br>
                <p><strong>Resenha</strong> <br><br>
                <textarea name='txtResenha' id='txtResenha'></textarea></p>
                <p><input type='submit' name='bot2' value='Enviar' class='btn btn-primary'></p>
            </form>
        </div>

    </div>

<?php
}

$close = mysqli_close($con);
?>

</div>

</body>
</html>
