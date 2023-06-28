<?php
function mostrarNavbar() {
    echo '
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="./imagens/logo2_liver.png" type="image/x-icon">
        <title>Liver</title>
        <!-- Pesquisar CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <!-- Swiper CSS -->
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
        <!-- CSS -->
        <link rel="stylesheet" href="css/style.css">
        <style>
            /* Estilo da NAVBAR */
            .navbar-nav {
                display: flex;
                justify-content: start;
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

            .navbar {
                position: fixed;
                width: 100%;
                left: 0;
                background-color: black; 
            }
        </style>
    </head>
    <body>
    <!-- JS Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"></script>

    <div class="container-fluid">
    <!--NAVBAR-->
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark w-100">
        <div class="container">
            <a class="navbar-brand">
                <img src="./imagens/liver_logo.png" alt="Logo LiVer" src="index.php" width="100" height="40"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.php">Início</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li class="nav-item">
                        <a class="nav-link" href="login/index.html">Login</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li class="nav-item">
                        <a class="nav-link" href="./pages/citacoes.php">Citações</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item" href="categorias/categ_livros.php">Livros</a></li>
                            <li><a class="dropdown-item" href="categorias/categ_filmes.php">Filmes</a></li>
                            <li><a class="dropdown-item" href="categorias/categ_series.php">Séries</a></li>
                            <li><a class="dropdown-item" href="categorias/categ_novelas.php">Novelas</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" action="pesquisar.php" method="GET">
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
    <!--NAVBAR TERMINA-->
    <!--CAROUSEL COM BANNERS-->
    <div class="container">
        <div id="carouselExampleLight" class="carousel carousel-light slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleLight" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleLight" data-bs-slide-to="1" aria-label="Slide 2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2000">
                    <img src="./imagens/Consciência.jpg" class="d-block w-100" alt="Banner sobre dia da Consciência Negra">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="./imagens/Bandeira.jpg" class="d-block w-100" alt="Banner Bandeira Brasileira">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleLight" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleLight" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>';
}
?>
<?php

function Rodape() {
    echo ' <style> 
    .footer{
    position: absolute;
    left:0;
    right:0;
    top: 2750px;
    width: 100%;
    display: flex;
    height: 8%;
    justify-content: space-between;
    align-items: center;
    background: #333;
    padding: 0px 20px;
    color: white;
    }
    
    
    .barra2 {
    position: relative;
      left:-1px;
    height: 10px;
    border: 1px solid #FDFDFD;
    border-radius: 2px;
    transform: rotate(-90deg);
    }
    
    
    .barra3 {
    position: relative;
     left: -4px;
     height: 10px;
    border: 1px solid #FDFDFD;
    border-radius: 2px;
    transform: rotate(-90deg);
    
    
    }
    
    
    .emailimg{
        position: relative;
      left:3px;
      color: #fff;
          text-decoration: none;
    }
    .email{
        position: relative;
      left:-0px;
      color: #fff;
          text-decoration: none;
    }
    .quem{
        position: relative;
      left:-4px;
      color: #fff;
          text-decoration: none;
    }
    
    .termo{
        position: relative;
      left:-1px;
      color: #fff;
          text-decoration: none;
    }
    .insta{
        position: relative;
      left:-1px;
      color: #fff;
          text-decoration: none;
    }
    .twitter{
        position: relative;
      left:-1px;
      color: #fff;
          text-decoration: none;
    }
    </style>
    <body>
    <div class="footer fixed-bottom">
          <h7 class="ano">&copy2023</h7>
        <div class="sociais">
            <div class="socia">
                <a class="quem" href="#">Quem Somos</a>
                <span class="barra3"></span>
                <a class="termo" href="#">Termos de Uso</a>
                <span class="barra2"></span>
                <a class="emailimg" href="#"><i class="far fa-envelope" aria-hidden="true"></i></a>
                <span class="email">liverbrasil1@gmail.com</span>
                <a class="insta" href="https://www.instagram.com/liver"><i class="fab fa-instagram" aria-hidden="true"></i></a>
                <a class="twitter" href="https://www.twitter.com/liver"><i class="fab fa-twitter" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>
    ';
}
?>