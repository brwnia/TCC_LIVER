<?php
require_once('../PHPMailer/src/PHPMailer.php');
require_once('../PHPMailer/src/SMTP.php');
require_once('../PHPMailer/src/Exception.php');
 
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require("../conexao.php");


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capturar o endereço de e-mail do formulário
    $email = $_POST ['txtemail'];

    // Verificar se o e-mail está registrado no banco de dados ou em sua lógica de aplicativo
    $email = mysqli_real_escape_string($con, $email); // Proteção contra injeção SQL
    $sql = "SELECT * FROM usuarios WHERE EMAIL_USUARIO='$email'";
    $resultado = mysqli_query($con, $sql);

    if (mysqli_num_rows($resultado) == 0) {
        echo "<script>window.alert('Você ainda não possui um cadastro. Cadastre-se agora!');</script>";
        header("refresh:1.5,../cadastro/index.html");
        exit(); } else {

$mail = new PHPMailer(true);
// Dados do cliente
$emailDoCliente = $email; // Substitua pelo e-mail do cliente
$nomeDoCliente = $_POST['txtnome'];

try {
	
	$mail->isSMTP();
	$mail->Host = 'smtp.gmail.com';
	$mail->SMTPAuth = true;
	$mail->Username = 'liverbrasil1@gmail.com';
	$mail->Password = 'sucmwgnfyeldjvxr';   
	$mail->Port = 587;
 
	$mail->setFrom('liverbrasil1@gmail.com');
    $mail->addAddress("$email");
	$mail->isHTML(true);
	$mail->Subject = 'Recuperando minha senha do Liver';
	$mail->Body = 'Redefina sua senha <a href="http://localhost/TCC_LIVER_TUDO_2_VERSAO_APRESENTACAO/novasenha.html" target="_blank"><button>aqui.</button></a> ';

	if(!$mail->send()) {
		echo "<script>alert('Erro ao enviar o e-mail. Tente novamente.');</script>";
	} else {
        echo "<script>alert('E-mail enviado com sucesso! Verifique sua caixa de entrada.');</script>";
        header("refresh:0.5,../index.php");
  
    } 
	
}  catch (Exception $e) {
	echo "Erro ao enviar mensagem: {$mail->ErrorInfo}";
}

}
}
mysqli_close($con);
?>
