<!DOCTYPE html>
<!-- Coding by CodingLab | www.codinglabweb.com -->
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="./imagens/logo2_liver.png" type="image/x-icon">
  <title>LiVer</title>
  <!-- Pesquisar CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
  <style>
    /* Google Fonts - Poppins */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

    body {
      justify-content: center;
      background-color: black;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    /*Estilo da NAVBAR*/
    .navbar-nav {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      margin-top: 0px;
      margin-right: 100px;
    }

    .search-box {
      position: absolute;
      top: 50%;
      left: 90%;
      transform: translate(-50%, -50%);
      background: white;
      height: 30px;
      border-radius: 20px;
      padding: 5px;
    }

    .search-box:hover > .search-txt {
      width: 110px;
      padding: 0 6px;
      top: 50px;
    }

    .search-btn {
      position: absolute;
      color: black;
      background: yellow;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      display: block;
    }

    .search-txt {
      border: none;
      background: none;
      outline: none;
      float: right;
      padding: 0;
      font-size: 14px;
      transition: 1.2s;
      width: 20px;
      margin-left: 20px;
      margin-top: -1px;
      display: block;
    }

    h3 {
      color: aliceblue;
      text-align: center;
    }

    .navbar {
      position: fixed;
      width: 100%;
      left: 0;
      background-color: black;
    }

    .card {
      color: black;
      border: 1px solid white;
      margin: 1px;
      padding: 2px;
    }

    .card img {
      height: 400px;
      width: 250px;
    }

    h2 {
      color: aliceblue;
      text-align: center;
    }

    .button {
      border: none;
      font-size: 16px;
      color: #FFF;
      padding: 8px 16px;
      background-color: #4070F4;
      border-radius: 6px;
      margin: 14px;
      cursor: pointer;
      transition: all 0.3s ease;
    }
  </style>
</head>
<body>
<!-- JS Bootstrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>

<!--NAVBAR-->
<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand">
      <img src="./imagens/liver_logo.png" alt="Logo LiVer" src="index.php" width="100" height="40">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse me-auto y-2 my-lg-0" id="navbarScroll">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.php">Início</a>
        </li>
        <li><hr class="dropdown-divider"></li>
        <li class="nav-item">
          <a class="nav-link" href="./login/index.html">Login</a>
        </li>
        <li><hr class="dropdown-divider"></li>
        <li class="nav-item">
          <a class="nav-link" href="./pages/citacoes.php">Citações</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Categorias</a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="#">Livros</a></li>
            <li><a class="dropdown-item" href="#">Filmes</a></li>
            <li><a class="dropdown-item" href="#">Séries</a></li>
            <li><a class="dropdown-item" href="#">Novelas</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" action="<?php $_SERVER['PHP_SELF'] ?>" method="GET">
        <div class="search-box">
          <input class="search-txt" type="text" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisar">
          <a class="search-btn" href="#">
            <i class="fas fa-search"></i>
          </a>
        </div>
      </form>
    </div>
  </div>
</nav>
<br><br><br><br>

<?php
include "conexao.php";
mysqli_set_charset($con, "utf8");
$nomex = $_GET["pesquisar"];

$pesq = mysqli_query($con, "SELECT NOME_OBRA, FOTO_OBRA, DESC_OBRA, ID_OBRA FROM obra WHERE NOME_OBRA LIKE '$nomex%'");

if (empty($nomex)) {
  echo "<h2>Nenhum termo foi pesquisado. Por favor, tente novamente!</h2>";
} else {
  if (mysqli_num_rows($pesq) == 0) {
    echo "<h2>Infelizmente não conseguimos encontrar resultados para o termo " . $nomex . ". Confira se você pesquisou o termo correto e tente novamente!</h2>";
  } else {
    while ($r = mysqli_fetch_array($pesq)) {
      ?>
      <div class="container">
        <div class="card mb-3 mx-auto">
          <div class="row g-0">
            <div class="col-md-4">
              <img src='imagens/img_obras/<?php echo $r['FOTO_OBRA']; ?>' class='card-img' alt="<?php echo $r['NOME_OBRA']; ?>">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title"><?php echo $r['NOME_OBRA']; ?></h5>
                <p class="card-text"><?php echo $r['DESC_OBRA']; ?></p>
                <form action="detalhes_obras.php" method="GET">
                  <input type="hidden" name="id_obra" value="<?php echo $r['ID_OBRA']; ?>">
                  <button type="submit" class="button">Ver Mais</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <?php
    }
  }
}
$con->close();
?>
</body>
</html>
