<?php
// Conecta-se ao banco de dados
require '../conexao.php';

session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['ID_USUARIO'])) {
    header('Location: ../login.php');
    exit();
}

$idUsuario = $_SESSION['ID_USUARIO'];
$nome = $_POST['txtnome'];
$username = $_POST['username'];
$bio = isset($_POST['txtbio']) ? $_POST['txtbio'] : null;


// Função para verificar se o username já existe no banco de dados
function verificarUsername($con, $username) {
    $sql = "SELECT * FROM perfil WHERE USERNAME_PERFIL = '$username'";
    $resultado = mysqli_query($con, $sql);
    return mysqli_num_rows($resultado) > 0;
}

// Verificar se o username já existe
if (verificarUsername($con, $username)) {
    echo "<script>alert('O username já está em uso. Por favor, escolha outro.');</script>";
    header('refresh:3;./perfil_config.php');
} 
else {

    // Função para mover a foto para o diretório desejado e retornar o nome do arquivo
    function moverFoto($nomeInput, $diretorioDestino) {
        if (isset($_FILES[$nomeInput]) && $_FILES[$nomeInput]['error'] === UPLOAD_ERR_OK) {
            $nomeArquivo = $_FILES[$nomeInput]['name'];
            $caminhoTemporario = $_FILES[$nomeInput]['tmp_name'];
            $caminhoDestino = $diretorioDestino . '/' . $nomeArquivo;
            if (move_uploaded_file($caminhoTemporario, $caminhoDestino)) {
                return $nomeArquivo;
            }
        }
        return null;
    }

    // Diretório onde as fotos serão armazenadas
    $diretorioFotoP = 'imagens/img_user/fotos_usuario';
    $diretorioFotoC = 'imagens/img_user/fotos_capa';

    // Mover foto de perfil
    $fotoPerfil = moverFoto('foto', $diretorioFotoP);

    // Mover foto de capa
    $fotoCapa = moverFoto('foto_capa', $diretorioFotoC);

    // Preparar a consulta SQL para inserir os valores na tabela "perfil"
    $sql = "INSERT INTO perfil (NOME_PERFIL, USERNAME_PERFIL, FOTO_PERFIL, FOTOCAPA_PERFIL, BIO, usuario_ID_USUARIO)
            VALUES ('$nome', '$username', '$fotoPerfil', '$fotoCapa', '$bio', '$idUsuario')";

    // Executar a consulta SQL
    if (mysqli_query($con, $sql)) {
        echo "Dados do perfil salvos com sucesso!";
        header('refresh:3;./perfil_user.php');
    } else {
        echo "<script>alert('Ocorreu um erro. Tente novamente mais tarde.');</script>";
        header('refresh:3;./perfil_config.php');
    }

}

// Fechar a conexão com o banco de dados
mysqli_close($con);
?>
