

<!DOCTYPE html>
<html>
  <head>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="icon" href="./public/logo2_liver.png" type="image/x-icon">
    <title>Entrar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script> 
    <link rel="stylesheet" href="./global.css" />
    <link rel="stylesheet" href="./index.css" />
    
  </head>
  <div class="container-fluid">
    <!--NAVBAR-->
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark w-100">
    <div class="container">
        <a href="../index.php" class="navbar-brand">
            <img src="./public/liver_logo.png" alt="Logo LiVer" src="index.php" width="100" height="40"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse me-auto y-2 my-lg-0" id="navbarScroll">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
            <a class="nav-link" href="../index.php">Início</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li class="nav-item">
            <a class="nav-link active" aria-current="page">Login</a>
            </li>
        </ul>
        </div>
    </div>
    </nav>
    <br><br><br><br>
<!--FIM DA NAVBAR--> 
       
    <form class="row g-3"  name="focad" action="doLogin.php" method="POST">

      <div class="frame-child">
        <div class="pagelogin">
       
        <img class="image-1-icon" alt="" src="./public/image-1@2x.png" >
         <div class="entrar-no-liver">Entrar no Liver</div>
          
         <label>
          <div class="e-mail">E-mail</div>
          <input type="text" class="barraemail" name="txtemail" required>
          <div class="senha">Senha</div>
        <input type="password" class="barrasenha" name="txtsenha" required>
         </label>
    
    </div>

    <button class="botao1">Entrar</button>
    
      
      <a href="#"></a><span class="esqueci-minha-senha">Esqueci minha senha</span></a> 
      <div class="no-possui-uma-container">Não possui uma conta no Liver?
      <a href="../cadastro/index.html"><span class="conecte-se">Cadastre-se</span></a> 
    </div>
         </div>
        </div>
      </form>
    


  </body>
</html>

