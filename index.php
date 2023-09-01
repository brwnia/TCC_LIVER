<?php
session_start();
include "conexao.php";
include "funcoes/functions.php";

// Verifica se o usuário está logado
if (isset($_SESSION['ID_USUARIO'])) {
    header('Location: listar_obras_CL.php');
    exit(); // O código será interrompido aqui se o usuário não estiver logado
}
else{
mostrarNavbar();
?>
<div class="container-main">
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
                   $valor_obra = $row['VALOR_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra&valor_obra=$valor_obra'><img src='./imagens/img_livros/$foto_obra' alt='$nome_obra' class='card-img'></a>";
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
                   $valor_obra = $row['VALOR_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra&valor_obra=$valor_obra'><img src='./imagens/img_series/$foto_obra' alt='$nome_obra' class='card-img'></a>";
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
                   $valor_obra = $row['VALOR_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra&valor_obra=$valor_obra'><img src='./imagens/img_filmes/$foto_obra' alt='$nome_obra' class='card-img'></a>";
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
                   $valor_obra = $row['VALOR_OBRA'];

                   echo '<div class="card swiper-slide">';
                   echo '<div class="image-content">';
                   echo '<span class="overlay"></span>';
                   echo '<div class="card-image">';
                   echo "<a href='listar_obras_SL.php?id_obra=$id_obra&valor_obra=$valor_obra'><img src='./imagens/img_novelas/$foto_obra' alt='$nome_obra' class='card-img'></a>";
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
    <br><br><br>
</div>
</div> <!--Fecha Container-Main-->
    <!-- RODAPÉ  --> 
    <?php } 
    Rodape();
    ?>
<!-- RODAPÉ  --> 

    <!-- Swiper JS -->
    <script src="js/swiper-bundle.min.js"></script>

    <!-- JavaScript -->
    <script src="js/script.js"></script>

    </body>
</html>



