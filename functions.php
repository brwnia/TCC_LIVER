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
    echo ' 
<style> 
.container{
    padding: 50px 0 20px;
}
.site-footer
{
  position: absolute;
  top: 2990px;
  width: 100%;
  background-color:#26272b;
  height: 450px; /* Ajuste o valor conforme necessário */
  padding: 50px 80px; /* Ajuste o valor conforme necessário para controlar o espaçamento interno */
  font-size:15px;
  line-height:24px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity: 0.3;
  margin-top: -1px;
}
.site-footer hr.small
{
  margin:80px 0;
}
.site-footer h6
{
  color:#fff;
  font-size:18px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 6px;
    margin-right: 3px; /* Adicione a unidade de medida, por exemplo, 1000px */
    border-radius: 100%;
    background-color: #33353d;
}
.site-footer .copyright-text
{
    margin-bottom: 50px;
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:50px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:10px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}
</style>
    <body>
    <!-- Site footer -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>Quem Somos?</h6>
            <p class="text-justify"> Somos uma rede social destinada para apreciadores de livros, filmes, séries e novelas; com o objetivo de enaltecer nossas produções nacionais.

</p>
          </div>

          <div class="col-xs-6 col-md-3">
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="##">Sobre Nós</a></li>
              <li><a href="##">SAC</a></li>
              <li><a href="###">Contribua</a></li>
              <li><a href="h##">Termos de Uso</a></li>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <p class="copyright-text">Copyright &copy; 2023 
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="instagram" href="https://www.instagram.com/liverbr_/"><i class="fa fa-instagram"></i></a></li>
              <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
             
            </ul>
          </div>
        </div>
      </div>
</footer>
    </body>
    </html>
    ';
}
?>