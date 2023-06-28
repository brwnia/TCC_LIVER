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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse me-auto y-2 my-lg-0" id="navbarScroll">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php">Início</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li class="nav-item">
            <a class="nav-link" href="perfil/perfil_user.php">Meu Perfil</a>
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
        </div>
        <form class="d-flex" action="pesquisar.php" method="GET">
        <div class="search-box"> 
        <input class="search-txt" type="text" placeholder= "     Pesquisar" aria-label="Pesquisar" name="pesquisar">
            <a class="search-btn" href="#">
            <i class="fas fa-search"></i>
            </a>
        </div>
        </form>
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
    <!--CAROUSEL COM BANNERS TERMINA-->
    <!--CITAÇÕES COMEÇA-->
    <main class="cards">
    <section class="card">
        <img src="" alt=".">
        <a href="">@dos_santos</a>
        <span>“Se contar o acontecido já é uma traição com o vivido, pois muitas vezes, se trata de uma reconstrução malfeita de lembranças, recontar o que ouvimos pode ser dupla traição.” </span>
        <a id="ref" href="">-Canção para ninar meninos grandes </a>
    </section>
    <section class="card">
        <img src="" alt=".">
        <a href="">@murillo_ordonho11</a>
        <span>“As vezes a morte é leve como a poeira. E a vida se confunde com um pó branco qualquer.”</span>    
        <a id= "ref" href="">-Olhos D’Água </a>
    </section>
    <section class="card">
        <img src="" alt=".">
        <a href="">@nik_b4bolim</a>
        <span>“Você só precisa tomar cuidado para não ir de um extremo a outro”, o dr. Max disse. “O excesso de amor é tão perigoso quanto a falta.”</span>
        <a id="ref" href="">-Uma mulher no escuro</a>
    </section>    
    </main>  

    <!--CITAÇÕES TERMINA-->


    <!--VITRINE DE LIVROS COMEÇA --> 
        <div class="slide-container swiper">      
        <div class="slide-content">
        <h3>Livros</h3>
            <div class="card-wrapper swiper-wrapper">
                <?php
                // Faz a conexão com o banco de dados
                include "conexao.php";
                mysqli_query($con,"SET NAMES 'utf8'");  
                mysqli_query($con,'SET character_set_connection=utf8');  
                mysqli_query($con,'SET character_set_client=utf8');  
                mysqli_query($con,'SET character_set_results=utf8'); 
                // Selecionando os livros da tabela
                $query = "SELECT * FROM obra WHERE VALOR_OBRA = 4";
                $result = mysqli_query($con, $query);


                // Checa se a busca retornou resultados
                if (mysqli_num_rows($result) > 0) {
                    // Cria um loop para exibir os resultados em grupos de 4

                 while($row = mysqli_fetch_assoc($result)) {
                   $id_obra = $row['ID_OBRA'];
                   $nome_obra = $row['NOME_OBRA'];
                   $foto_obra = $row['FOTO_OBRA'];
                   $autor_obra = $row['AU_DI_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra'><img src='./imagens/img_livros/$foto_obra' alt='$nome_obra' class='card-img'></a>";
                   echo '</div>';
                   echo '</div>';
                   echo '<div class="card-content">';
                   echo "<h2 class='name'>$nome_obra</h2>";
                   echo "<p class='description'>$autor_obra</p>";
                   echo '</div>';
                   echo '</div>';
                 }
                 }
                    // Cria um loop para exibir os resultados em grupos de 4
                // Fecha a conexão com o banco de dados
                mysqli_close($con);
                ?>
            </div>

            <!-- Swiper Navigation Buttons -->
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>

            <!-- Swiper Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!--VITRINE DE LIVROS TERMINA --> 

    <!--VITRINE DE SÉRIES COMEÇA --> 
    <div class="slide-container swiper">
        <div class="slide-content">
        <h3>Séries</h3>
            <div class="card-wrapper swiper-wrapper">
                <?php
                // Faz a conexão com o banco de dados
                include "conexao.php";
                mysqli_query($con,"SET NAMES 'utf8'");  
                mysqli_query($con,'SET character_set_connection=utf8');  
                mysqli_query($con,'SET character_set_client=utf8');  
                mysqli_query($con,'SET character_set_results=utf8'); 
                // Selecionando as séries da tabela
                $query = "SELECT * FROM obra WHERE VALOR_OBRA = 1";
                $result = mysqli_query($con, $query);

                // Checa se a busca retornou resultados
                if (mysqli_num_rows($result) > 0) {
                    // Cria um loop para exibir os resultados em grupos de 4
                    while($row = mysqli_fetch_assoc($result)) {
                   $id_obra = $row['ID_OBRA'];
                   $nome_obra = $row['NOME_OBRA'];
                   $foto_obra = $row['FOTO_OBRA'];
                   $autor_obra = $row['AU_DI_OBRA'];
                   $ano_obra = $row['ANO_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra'><img src='./imagens/img_series/$foto_obra' alt='$nome_obra' class='card-img'></a>";
                   echo '</div>';
                   echo '</div>';
                   echo '<div class="card-content">';
                   echo "<h2 class='name'>$nome_obra</h2>";
                   echo "<p class='description'>$ano_obra</p>";
                   echo '</div>';
                   echo '</div>';
                 }
                 }

                // Fecha a conexão com o banco de dados
                mysqli_close($con);
                ?>
            </div>

            <!-- Swiper Navigation Buttons -->
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>

            <!-- Swiper Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!--VITRINE DE SÉRIES TERMINA --> 
    <!--VITRINE DE FILMES COMEÇA --> 
    <div class="slide-container swiper">
        <div class="slide-content">
        <h3>Filmes</h3>
            <div class="card-wrapper swiper-wrapper">
                <?php
                // Faz a conexão com o banco de dados
                include "conexao.php";
                mysqli_query($con,"SET NAMES 'utf8'");  
                mysqli_query($con,'SET character_set_connection=utf8');  
                mysqli_query($con,'SET character_set_client=utf8');  
                mysqli_query($con,'SET character_set_results=utf8'); 
                // Selecionando as séries da tabela
                $query = "SELECT * FROM obra WHERE VALOR_OBRA = 2";
                $result = mysqli_query($con, $query);

                // Checa se a busca retornou resultados
                if (mysqli_num_rows($result) > 0) {
                    // Cria um loop para exibir os resultados em grupos de 4
                    while($row = mysqli_fetch_assoc($result)) {
                   $id_obra = $row['ID_OBRA'];
                   $nome_obra = $row['NOME_OBRA'];
                   $foto_obra = $row['FOTO_OBRA'];
                   $autor_obra = $row['AU_DI_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra'><img src='./imagens/img_filmes/$foto_obra' alt='$nome_obra' class='card-img'></a>";
                   echo '</div>';
                   echo '</div>';
                   echo '<div class="card-content">';
                   echo "<h2 class='name'>$nome_obra</h2>";
                   echo "<p class='description'>$ano_obra</p>";
                   echo '</div>';
                   echo '</div>';
                 }
                 }

                // Fecha a conexão com o banco de dados
                mysqli_close($con);
                ?>
            </div>

            <!-- Swiper Navigation Buttons -->
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>

            <!-- Swiper Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!--VITRINE DE FILMES TERMINA --> 

    <!--VITRINE DE NOVELAS COMEÇA --> 
    <div class="slide-container swiper">
        <div class="slide-content">
        <h3>Novelas</h3>
            <div class="card-wrapper swiper-wrapper">
                <?php
                // Faz a conexão com o banco de dados
                include "conexao.php";
                mysqli_query($con,"SET NAMES 'utf8'");  
                mysqli_query($con,'SET character_set_connection=utf8');  
                mysqli_query($con,'SET character_set_client=utf8');  
                mysqli_query($con,'SET character_set_results=utf8'); 
                // Selecionando as séries da tabela
                $query = "SELECT * FROM obra WHERE VALOR_OBRA = 3";
                $result = mysqli_query($con, $query);

                // Checa se a busca retornou resultados
                if (mysqli_num_rows($result) > 0) {
                    // Cria um loop para exibir os resultados em grupos de 4
                    while($row = mysqli_fetch_assoc($result)) {
                   $id_obra = $row['ID_OBRA'];
                   $nome_obra = $row['NOME_OBRA'];
                   $foto_obra = $row['FOTO_OBRA'];
                   $autor_obra = $row['AU_DI_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra'><img src='./imagens/img_novelas/$foto_obra' alt='$nome_obra' class='card-img'></a>";
                   echo '</div>';
                   echo '</div>';
                   echo '<div class="card-content">';
                   echo "<h2 class='name'>$nome_obra</h2>";
                   echo "<p class='description'>$ano_obra</p>";
                   echo '</div>';
                   echo '</div>';
                 }
                 }

                // Fecha a conexão com o banco de dados
                mysqli_close($con);
                ?>
            </div>

            <!-- Swiper Navigation Buttons -->
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>

            <!-- Swiper Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!--VITRINE DE NOVELAS TERMINA --> 
</div>
    <!-- RODAPÉ  --> 
    
<!-- RODAPÉ  --> 

    <!-- Swiper JS -->
    <script src="js/swiper-bundle.min.js"></script>

    <!-- JavaScript -->
    <script src="js/script.js"></script>

    </body>
</html>


