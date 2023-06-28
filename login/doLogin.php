<?php
    // 1) Conexão com o banco de dados
    require("../conexao.php");

    // 2) Recuperando os valores
    $email = $_POST['txtemail'];
    $senha = $_POST['txtsenha'];

    // 3) Verificando o usuário no banco de dados
    $email = mysqli_real_escape_string($con, $email); // Proteção contra injeção SQL
    $sql = "SELECT * FROM usuarios WHERE EMAIL_USUARIO='$email'";
    $resultado = mysqli_query($con, $sql);

    if (mysqli_num_rows($resultado) == 0) {
        echo "<script>window.alert('Infelizmente você ainda não possui um cadastro. Cadastre-se agora!');</script>";
        header("refresh:1.5,../cadastro/index.html");
        exit();
    } else {
        $row = mysqli_fetch_assoc($resultado);
        if ($row['SENHA_USUARIO'] == $senha) {
            session_start();
            $_SESSION['ID_USUARIO'] = $row['ID_USUARIO']; // Atribuindo o ID do usuário à sessão
            header("Location: ../perfil/perfil_user.php");
            exit();
        } else {
            echo "<script>window.alert('Senha incorreta. Por favor, tente novamente!');</script>";
            header('refresh:1.5;../index.html');
            exit();
        }
    }

    // Fecha a conexão com o banco de dados
    mysqli_close($con);
?>
