-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2023 at 04:21 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_liver`
--
CREATE DATABASE IF NOT EXISTS `bd_liver` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_liver`;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_CATEGORIA` varchar(45) NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_categoria_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `citacoes`
--

DROP TABLE IF EXISTS `citacoes`;
CREATE TABLE IF NOT EXISTS `citacoes` (
  `ID_CITACOES` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_CITACAO` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `obra_NOME_OBRA` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `perfil_ID_PERFIL` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CITACOES`),
  UNIQUE KEY `ID_CITACOES_UNIQUE` (`ID_CITACOES`),
  KEY `fk_citacoes_obra_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_citacoes_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classificar`
--

DROP TABLE IF EXISTS `classificar`;
CREATE TABLE IF NOT EXISTS `classificar` (
  `ID_CLASSIFICAR` int(11) NOT NULL AUTO_INCREMENT,
  `NOTA_CLASSIFICAR` decimal(2,1) NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CLASSIFICAR`),
  UNIQUE KEY `ID_CLASSIFICAR_UNIQUE` (`ID_CLASSIFICAR`),
  KEY `fk_classificar_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_classificar_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `ID_COMENTARIO` int(11) NOT NULL AUTO_INCREMENT,
  `TXT_COMENTARIO` text NOT NULL,
  `resenha_ID_RESENHA` int(11) NOT NULL,
  `resenha_usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  UNIQUE KEY `ID_COMENTARIO_UNIQUE` (`ID_COMENTARIO`),
  KEY `fk_comentarios_resenha1_idx` (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `curtir`
--

DROP TABLE IF EXISTS `curtir`;
CREATE TABLE IF NOT EXISTS `curtir` (
  `ID_CURTIR` int(11) NOT NULL AUTO_INCREMENT,
  `TIME_CURTIR` datetime NOT NULL,
  `resenha_ID_RESENHA` int(11) NOT NULL,
  `resenha_usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURTIR`,`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`),
  UNIQUE KEY `ID_CURTIR_UNIQUE` (`ID_CURTIR`),
  KEY `fk_curtir_resenha1_idx` (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depois`
--

DROP TABLE IF EXISTS `depois`;
CREATE TABLE IF NOT EXISTS `depois` (
  `ID_DEPOIS` int(11) NOT NULL AUTO_INCREMENT,
  `MARCAR_DEPOIS` int(11) NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_DEPOIS`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_DEPOIS_UNIQUE` (`ID_DEPOIS`),
  KEY `fk_depois_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_depois_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `ID_FAVORITOS` int(11) NOT NULL AUTO_INCREMENT,
  `MARCAR_FAVORITO` int(11) NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_FAVORITOS`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_FAVORITOS_UNIQUE` (`ID_FAVORITOS`),
  KEY `fk_favoritos_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_favoritos_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
CREATE TABLE IF NOT EXISTS `filmes` (
  `ID_FILME` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR_OBRA` int(11) NOT NULL,
  `PRODUTORA_FILME` varchar(45) CHARACTER SET utf8 NOT NULL,
  `DISTRIBUIDORA_FILME` varchar(45) CHARACTER SET utf8 NOT NULL,
  `C_IND_FILME` int(11) NOT NULL,
  `DURACAO` varchar(10) NOT NULL,
  `ELENCO` varchar(225) CHARACTER SET utf8 NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_FILME`),
  KEY `fk_filmes_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filmes`
--

INSERT INTO `filmes` (`ID_FILME`, `VALOR_OBRA`, `PRODUTORA_FILME`, `DISTRIBUIDORA_FILME`, `C_IND_FILME`, `DURACAO`, `ELENCO`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`) VALUES
(1, 2, 'Â Santa Rita Filmes', 'Galeria Distribuidora', 16, '85 min', 'Carla Diaz, Leonardo Bittencourt', 33, 1, 1),
(2, 2, 'Â Santa Rita Filmes', 'Galeria Distribuidora', 16, '87 min', 'Carla Diaz, Leonardo Bittencourt', 34, 1, 1),
(3, 2, 'Globo Filmes, GÃ¡vea Filmes', 'Europa Filmes', 16, '100 min', 'FabrÃ­cio Boliveira, Isis Valverde, Felipe Abib', 35, 1, 1),
(4, 2, 'Globo Filmes, Gullane', 'Paris Filmes,Â Downtown Filmes', 12, '104 min', 'Leandro Hassum, Kiko Mascarenhas, Julia Dalavia', 37, 1, 1),
(5, 2, 'Globo Filmes, Gullane', 'Downtown Filmes', 12, '102 min', 'Leandro Hassum, Jerry Lewis, Camila Morgado', 38, 1, 1),
(6, 2, 'Globo Filmes, Gullane, Miravista', 'Paris Filmes,Â Downtown Filmes', 14, '100 min', 'Leandro Hassum, Emanuelle AraÃºjo, Camila Morgado, Julia Dalavia', 39, 1, 1),
(7, 2, 'Migdal Filmes, Globo Filmes, ', 'Paris Filmes,Â Downtown Filmes', 12, '120 min', 'Paulo Gustavo, Mariana Xavier, Rodrigo Pandolfo', 41, 1, 1),
(8, 2, 'Canto Claro ProduÃ§Ãµes ArtÃ­sticas', '20th Century Studios, Imagem Filmes', 14, '104 min', 'Bruno Torres, Renato Russo, Bianca Comparato', 43, 1, 1),
(9, 2, 'Kinoscopio', 'O2Play', 16, '110 min', 'Bianca Bin, Daniela Nefussi, Eriberto LeÃ£o', 44, 1, 1),
(10, 2, 'Globo Filmes, VideoFilmes, O2 Filmes', 'Miramax', 16, '130 min', 'Alexandre Rodrigues, Alice Braga, Douglas Silva', 46, 1, 1),
(11, 2, 'Globo Filmes, Lereby', 'Elo Company', 14, '103 min', 'Alfred Enoch, TaÃ­s AraÃºjo, Seu Jorge, Aldri AnunciaÃ§Ã£o', 49, 1, 1),
(12, 2, 'Morena Films, Globo Filmes, H Filmes', 'Paris Filmes, Downtown Filmes', 12, '102 min', 'FÃ¡bio Porchat, MiÃ¡ Mello, Marcelo Valle', 50, 1, 1),
(13, 2, 'Downtown Filmes', 'Netflix', 12, '90 min', 'Samantha SchmÃ¼tz, Marcus Majella', 51, 1, 1),
(14, 2, 'RT Features', 'Downtown Filmes', 16, '109 min', 'Caio Blat, CauÃ£ Raymond, Gabriel Braga Nunes', 52, 1, 1),
(15, 2, 'Lapfilme ProduÃ§Ãµes', 'Pandora Filmes', 12, '94 min', 'Marianna Alexandre, Danillo Franccesco, Mylena Alves', 54, 1, 1),
(16, 2, 'Globo Filmes, Miravista, Lereby', 'Walt Disney Studios Motion Pictures', 12, '96 min', 'Giovanna Antonelli, Thalita Carauta, FabÃ­ula Nascimento', 55, 1, 1),
(17, 2, 'CasÃ© Filmes', 'Imagem Filmes', 10, '85 min', 'Leandro Hassum, Marcus Melhem, Christine Fernandes', 56, 1, 1),
(18, 2, 'Globo Filmes', 'Downtown Filmes', 14, '127 min', 'Matheus Costa, Fernanda Montenegro, Thiago Lacerda', 57, 1, 1),
(19, 2, 'Globo Filmes, Morena Films', 'Downtown Filmes, Paris Filmes', 14, '97 min', 'Ingrid GuimarÃ£es, Marcelo Saback', 58, 1, 1),
(20, 2, 'Downtown Filmes, Globo Filmes', 'Paris Filmes,Â Downtown Filmes', 12, '115 min', 'Ingrid GuimarÃ£es, Bruno Garcia, Cristina Pereira', 59, 1, 1),
(21, 2, 'Globo Filmes, Morena Films', 'Paris Filmes,Â Downtown Filmes', 14, '109 min', 'Ingrid GuimarÃ£es, Duda Batista, Maria Paula Fidalgo', 60, 1, 1),
(22, 2, 'Globo Filmes, Lereby, TriStar Pictures', 'TriStar Pictures', 12, '104 min', 'Matheus Nachtergaele, Selton Melo, VirgÃ­nia Cavendish, Fernanda Montenegro', 64, 1, 1),
(23, 2, 'Camisa Listrada, Netflix Brazil', 'Netflix', 12, '101 min', 'Leandro Hassum, Elisa Pinheiro, Danielle Winits', 67, 1, 1),
(24, 2, 'O2 Filmes, Globo Filmes, Elle Driver', 'Paris Filmes,Â Downtown Filmes', 16, '155 min', 'Bella Camero, Seu Jorge, Bruno Gagliasso', 69, 1, 1),
(25, 2, 'Globo Filmes, Lereby', 'Sony Pictures Entertainment', 14, '96 min', 'Maria Mariana, Deborah Secco, Dani Valente', 70, 1, 1),
(26, 2, 'CasÃ© Filmes', 'Paris Filmes', 14, '104 min', 'EmÃ­lio Orciollo Netto, Bruno Mazzeo, Marcos Palmeira', 71, 1, 1),
(27, 2, 'RT Features', 'Manequim Filmes', 16, '110 min', 'Aline Borges, Mariana Nunes, DigÃ£o Ribeiro', 72, 1, 1),
(28, 2, 'ConspiraÃ§Ã£o Filmes, Globo Filmes', 'Warner Bros. Entertainment', 14, '88 min', 'Marcelo Adnet, Mariana Ximenes, Eduardo Sterblitch', 73, 1, 1),
(29, 2, 'Globo Filmes, LC Barreto', 'Paris Filmes', 12, '86 min', 'Marcelo Serrado, KÃ¡tia Moraes, Alexandre Nero', 74, 1, 1),
(30, 2, 'Globo Filmes, Telecine', 'Imagem Filmes', 12, '87 min', 'FÃ¡bio Porchat, Danton Mello, NatÃ¡lia Lage', 75, 1, 1),
(31, 2, 'Globo Filmes, Lupa Filmes, Mixer', 'Imagem Flmes', 12, '122 min', 'Leandra Leal, Bruno Gagliasso', 78, 1, 1),
(32, 2, 'Melodrama ProduÃ§Ãµes', 'Paris Filmes,Â Downtown Filmes', 10, '93 min', 'IvÃ¡n Espeche, Fabiana Karla, Mouhamed Harfouch', 79, 1, 1),
(33, 2, 'Globo Filmes,Â Downtown Filmes', 'Sony Pictures Entertainment', 14, '124 min', 'Selton Mello, Cleo', 80, 1, 1),
(34, 2, 'Lap Filme', 'Pandora Filmes', 10, '100 min', 'Matheus Nachtergaele, Gorete Milagres', 81, 1, 1),
(35, 2, 'Cineluz, Globo Filmes, LerebyTriStar Pictures', 'Sony Pictures Motion Picture Group', 16, '', 'Daniel de Oliveira, Marieta Severo, Reginaldo Faria', 82, 1, 1),
(36, 2, 'Africa Filmes, Dezenove Som e Imagem', 'Grupo PlayArte', 16, '89 min', 'Paulo Miklos, GlÃ³ria Pires, Marisa Orth', 84, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
CREATE TABLE IF NOT EXISTS `livros` (
  `ID_LIVRO` int(20) NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `VALOR_OBRA` int(11) NOT NULL,
  `EDITORA_LIVRO` text NOT NULL,
  `PAGINAS_LIVRO` int(11) NOT NULL,
  `C_IND_LIVRO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_LIVRO`),
  KEY `fk_livros_obra4_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livros`
--

INSERT INTO `livros` (`ID_LIVRO`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`, `VALOR_OBRA`, `EDITORA_LIVRO`, `PAGINAS_LIVRO`, `C_IND_LIVRO`) VALUES
(1, 126, 1, 1, 4, 'Penalux ', 132, 1),
(2, 127, 1, 1, 4, 'Todavia', 264, 1),
(3, 128, 1, 1, 4, 'Verus', 471, 1),
(4, 129, 1, 1, 4, 'Ãtica', 216, 1),
(5, 130, 1, 1, 4, 'Gutenberg', 336, 1),
(6, 131, 1, 1, 4, 'Record', 256, 1),
(7, 132, 1, 1, 4, 'Record', 175, 1),
(8, 133, 1, 1, 4, 'Moderna', 197, 1),
(9, 134, 1, 1, 4, 'Planeta do Brasil', 192, 1),
(10, 135, 1, 1, 4, 'Companhia das Letras', 360, 1),
(11, 136, 1, 1, 4, 'Record', 210, 1),
(12, 137, 1, 1, 4, 'Globo Alt', 208, 1),
(13, 138, 1, 1, 4, 'NÃ³s ', 168, 1),
(14, 139, 1, 1, 4, 'Globo Alt', 352, 1),
(15, 140, 1, 1, 4, 'Verus', 476, 1),
(16, 141, 1, 1, 4, 'Ãtica', 200, 1),
(17, 142, 1, 1, 4, 'Pallas', 116, 1),
(18, 143, 1, 1, 4, 'Seguinte ', 272, 1),
(19, 144, 1, 1, 4, 'Companhia das Letras', 288, 1),
(20, 145, 1, 1, 4, 'Companhia das Letras', 192, 1),
(21, 146, 1, 1, 4, 'Rocco Jovens Leitores', 240, 1),
(22, 147, 1, 1, 4, 'EssÃªncia ', 304, 1);

-- --------------------------------------------------------

--
-- Table structure for table `novelas`
--

DROP TABLE IF EXISTS `novelas`;
CREATE TABLE IF NOT EXISTS `novelas` (
  `ID_NOVELA` int(11) NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `VALOR_OBRA` int(11) NOT NULL,
  `EMISSORA_NOVELA` text NOT NULL,
  `EPISODIOS_NOVELA` text NOT NULL,
  `ELENCO_NOVELA` text NOT NULL,
  `C_IND_NOVELA` int(11) NOT NULL,
  PRIMARY KEY (`ID_NOVELA`),
  KEY `fk_novelas_obra3_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `novelas`
--

INSERT INTO `novelas` (`ID_NOVELA`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`, `VALOR_OBRA`, `EMISSORA_NOVELA`, `EPISODIOS_NOVELA`, `ELENCO_NOVELA`, `C_IND_NOVELA`) VALUES
(1, 85, 1, 1, 3, 'TV Globo', '107', 'Deborah Secco, Juliana Paiva, VitÃƒÂ³ria Strada', 12),
(2, 86, 1, 1, 3, 'TV Globo', '167', 'Marcos Palmeira, Alanis Guillen, JesuÃƒÂ­ta Barbosa', 14),
(3, 87, 1, 1, 3, 'TV Globo', '71 -em andamento', 'Lucy Alves, Chay Suede, Romulo Estrela', 12),
(4, 88, 1, 1, 3, 'TV Globo', '125', 'Thelma Ã‚Â· Adriana Esteves ; Danilo Ã‚Â· Chay Suede ; Brenda Clara Galinari ; Betina Ã‚Â· Isis Valverde ; Lurdes Regina CasÃƒÂ©.\n', 14),
(5, 89, 1, 1, 3, 'TV Globo', '172', 'Rodrigo Lombardi, Juliana Paes, EmÃƒÂ­lio Dantas', 12),
(6, 90, 1, 1, 3, 'TV Globo', '59 - em andamento', 'Sheron Menezzes, Elisa Lucinda, Che Moais,JosÃƒÂ© Loreto', 12),
(7, 91, 1, 1, 3, 'TV Globo', '154', 'GlÃƒÂ³ria Pires, Nicolas Prattes, Danilo Mesquita, Giullia Buscacio, AndrÃƒÂ© Luiz Frambach, Simone Spoladore, Ricardo Pereira e CÃƒÂ¡ssio Gabus Mendes.\n', 12),
(8, 92, 1, 1, 3, 'TV Globo', '126', 'Giovanna Antonelli, Vladimir Brichta, Mateus Solano', 12),
(9, 93, 1, 1, 3, 'TV Globo', '167', 'Carla Cristina Cardoso, Larissa Manoela, Rafael Vitti', 12),
(10, 94, 1, 1, 3, 'TV Globo', '139', 'Mariana Ximenes, Malvino Salvador, JoÃƒÂ£o Baldasserini', 10),
(11, 95, 1, 1, 3, 'TV Globo', '155', 'Grazi Massafera, Romulo Estrela, David Junior', 12),
(12, 96, 1, 1, 3, 'TV Globo', '119', 'Rodrigo Lombardi ,Nanda Costa , ClÃƒÂ¡udia Raia , FlÃƒÂ¡via Alessandra , Giovanna Antonelli ,Alexandre Nero , Cleo , Domingos Montagner', 14),
(13, 97, 1, 1, 3, 'TV Globo', '154', 'Bruna Marquezine, TatÃƒÂ¡ Werneck, MaurÃƒÂ­cio Destri', 10),
(14, 98, 1, 1, 3, 'TV Globo', '114', 'Camila Queiroz, Rodrigo Lombardi, Drica Moraes, Marieta Severo, Reynaldo Gianecchini, Grazi Massafera, Agatha Moreira e Gabriel Leone', 18),
(15, 99, 1, 1, 3, 'TV Globo', '149', 'JÃƒÂºlia Lemmertz , Gabriel Braga Nunes , Bruna Marquezine ,Humberto, Martins , Giovanna Antonelli , Helena Ranaldi, Ana Beatriz Nogueira', 12),
(16, 100, 1, 1, 3, 'TV Globo', '175', 'Marina Ruy Barbosa , FÃƒÂ¡bio AssunÃƒÂ§ÃƒÂ£o ,Juliana Paes ,Felipe Simas,Humberto Martins , Vivianne Pasmanter , Daniel Rocha', 12),
(17, 101, 1, 1, 3, 'TV Globo', '209', ' AntÃƒÂ´nio Fagundes , Patricia Pillar , Raul Cortez , GlÃƒÂ³ria Pires , FÃƒÂ¡bio AssunÃƒÂ§ÃƒÂ£o', 14),
(18, 102, 1, 1, 3, 'TV Globo', '179', '', 14),
(19, 103, 1, 1, 3, 'TV Globo', '160', 'VitÃƒÂ³ria Strada ,Rafael Cardoso , JoÃƒÂ£o Vicente de Castro , Alinne Moraes , KÃƒÂ©fera Buchmann , Felipe Camargo , JÃƒÂºlia Lemmertz ', 10),
(20, 104, 1, 1, 3, 'TV Globo', '203', 'Alexandre Nero ,LÃƒÂ­lia Cabral ,Leandra Leal , Drica Moraes ,Marjorie Estiano ,JosÃƒÂ© Mayer ,Paulo Betti , Caio Blat', 12),
(21, 105, 1, 1, 3, 'TV Globo', '175', 'JoÃƒÂ£o CÃƒÂ´rtes ; Luis Melo ; Jacqueline Sato ; Giovanna Lancellotti ', 10),
(22, 106, 1, 1, 3, 'TV Globo', '161', 'Tony Ramos, Olavo de AragÃƒÂ£o Duarte ; Dan Stulbach, Eurico Rocha ; LetÃƒÂ­cia Spiller, Marilda Rocha ; Milhem Cortaz, Joubert Machado.', 12),
(23, 107, 1, 1, 3, 'TV Globo ', '179', 'Adriana Esteves , Marcos Pasquim , FlÃƒÂ¡via Alessandra , Mateus Solano, Elizabeth Savalla , Ary Fontoura , Paulo JosÃƒÂ©', 10),
(24, 108, 1, 1, 3, 'TV Globo', '162', 'Nathalia Dill ; Thiago Lacerda ; Tato Gabus Mendes ; Vera Holtz ; Agatha Moreira', 12),
(25, 109, 1, 1, 3, 'TV Globo', '160', 'Marco Pigossi , Sophie Charlotte , Fernanda Vasconcellos , Jayme Matarazzo , Isabelle Drummond , Humberto CarrÃƒÂ£o , Giulia Gam ', 10),
(26, 110, 1, 1, 3, 'TV Globo', '174', 'Bruna Marquezine, Marina Ruy Barbosa, Romulo Estrela', 12),
(27, 111, 1, 1, 3, 'TV Globo', '155', ' EmÃƒÂ­lio Dantas, Giovanna Antonelli, Deborah Secco', 14),
(28, 112, 1, 1, 3, 'TV Globo', '190', 'SÃƒÂ©rgio GuizÃƒÂ©, DÃƒÂ©bora Nascimento e FlÃƒÂ¡via Alessandra.', 10),
(29, 113, 1, 1, 3, 'TV Globo', '185', 'TaÃƒÂ­s AraÃƒÂºjo ,Reynaldo Gianecchini , Giovanna Antonelli ,Lima Duarte, Rosi Campos ,Aracy Balabanian,Guilherme Weber ,Tuca Andrada', 12),
(30, 114, 1, 1, 3, 'SBT', '265 -em andamento', 'Sophia Valverde ,Igor Jansen, Lucas Burgatti; LuÃƒÂ­sa Bresser; Dalton Vigh ,ThaÃƒÂ­s Melchior , Murilo Cezar', 10),
(31, 115, 1, 1, 3, 'SBT', '564', 'Sophia Valverde ,Igor Jansen, Lucas Burgatti; LuÃƒÂ­sa Bresser; Dalton Vigh ,ThaÃƒÂ­s Melchior , Murilo Cezar', 10),
(32, 116, 1, 1, 3, 'SBT', '357', 'Bia JordÃƒÂ£o, Bia Lanutti, Dani Moreno, Duda Nagle, Duda Wendling, Elam Lima, Giovanna Chaves, JoÃƒÂ£o Guilherme, Juliana Baroni, Larissa Manuela\n', 10),
(33, 117, 1, 1, 3, 'SBT', '194', 'Olivetti Herrera ; Delano Avelar ; Cris Bessa, ; Priscila Ferreira', 14),
(34, 118, 1, 1, 3, 'SBT', '545', 'Giovanna Grigio,LÃƒÂ­via Inhundes,', 12),
(35, 119, 1, 1, 3, 'SBT', '197', 'Felipe Folgosi,Cinthia Cruz,Raissa Chaddad,Naiumi Goldoni,Gabriel Santana,Giovanna Grigio,Leticia Neves,Gabriella Saraivah', 14),
(36, 121, 1, 1, 3, 'Record TV', '242', 'Guilherme Winter , Denise Del Vecchio ,Paulo Gorgulho , PetrÃƒÂ´nio Gontijo ,Larissa Maciel , SÃƒÂ©rgio Marone , ZÃƒÂ© Carlos Machado', 12),
(37, 122, 1, 1, 3, 'Record TV', '220', 'Igor Rickli,LetÃƒÂ­cia Almeida,Camila Rodrigues,ZÃƒÂ© Carlos Machado,Juliano Laham,Juliana Boller,Carlo Porto,Miguel Coelho\n\n', 14),
(38, 123, 1, 1, 3, 'Record TV', '197', 'Bianca Rinaldi , Leopoldo Pacheco ,PatrÃƒÂ­cia FranÃƒÂ§a , ThÃƒÂ©o Becker , Renata Dominguez ', 12),
(39, 124, 1, 1, 3, 'Record TV', '245', 'Julianne Trevisol,ThaÃƒÂ­s Fersoza,Betty Lago,Simone Spoladore', 14),
(40, 125, 1, 1, 3, 'Record TV', '229', 'LavÃƒÂ­nia Vlasak,Leonardo Vieira\nPatrÃƒÂ­cia FranÃƒÂ§a,Marcelo Serrado\nVanessa Gerbelli,AndrÃƒÂ© Mattos', 12);

-- --------------------------------------------------------

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
CREATE TABLE IF NOT EXISTS `obra` (
  `ID_OBRA` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR_OBRA` int(11) NOT NULL,
  `DESC_OBRA` text CHARACTER SET utf8 NOT NULL,
  `NOME_OBRA` varchar(45) CHARACTER SET utf8 NOT NULL,
  `FOTO_OBRA` varchar(225) CHARACTER SET utf8 NOT NULL,
  `AU_DI_OBRA` varchar(45) CHARACTER SET utf8 NOT NULL,
  `ANO_OBRA` int(11) NOT NULL,
  `perfil_ID_PERFIL` int(11) NOT NULL,
  `perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_OBRA`,`perfil_ID_PERFIL`,`perfil_usuario_ID_USUARIO`),
  UNIQUE KEY `ID_OBRA_UNIQUE` (`ID_OBRA`),
  KEY `fk_obra_perfil1_idx` (`perfil_ID_PERFIL`,`perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obra`
--

INSERT INTO `obra` (`ID_OBRA`, `VALOR_OBRA`, `DESC_OBRA`, `NOME_OBRA`, `FOTO_OBRA`, `AU_DI_OBRA`, `ANO_OBRA`, `perfil_ID_PERFIL`, `perfil_usuario_ID_USUARIO`) VALUES
(1, 1, 'Na sÃ©rie Cidade InvisÃ­vel, Eric (Marco Pigossi) Ã© um detetive da PolÃ­cia Ambiental que, apÃ³s encontrar um boto-cor-de-rosa morto em uma praia do Rio de Janeiro, se envolve em uma investigaÃ§Ã£o de assassinato. A partir desse caso, Eric esbarra em um mundo habitado por entidades mÃ­ticas que costumam passar despercebidas pelos humanos, ao mesmo tempo em que investiga mortes estranhas que, de forma bizarra, refletem a de sua prÃ³pria esposa, Gabriela (Julia Konrad). A procura de novas pistas, Eric descobre o passado do pai e desvenda sua verdadeira identidade como meio humano e meio entidade. As coisas complicam para Eric e seus companheiros quando Corpo Seco, um espÃ­rito fugitivo de um anti ambientalista, possui sua pequena filha (Manu Dieguez). Por vinganÃ§a, o espÃ­rito estÃ¡ matando outras entidades da floresta e Ã© o grande responsÃ¡vel pela morte de Gabriela. Agora, cabe a Eric e as entidades encontrarem uma maneira de parar Corpo Seco.', 'Cidade InvisÃ­vel', 'cidadeinvisivel.jpg', 'Carlos Saldanha', 2021, 1, 1),
(2, 1, 'Em um futuro pÃ³s-apocalÃ­ptico nÃ£o muito distante, o planeta Ã© um lugar devastado. O Continente Ã© uma regiÃ£o do Brasil miserÃ¡vel, decadente e escassa de recursos. Aos 20 anos de idade, todo cidadÃ£o recebe a chance de passar pelo Processo, uma rigorosa seleÃ§Ã£o de provas fÃ­sicas, morais e psicolÃ³gicas que oferece a chance de ascender ao Mar Alto, uma regiÃ£o onde tudo Ã© abundante e as oportunidades de vida sÃ£o extensas. Entretanto, somente 3% dos inscritos chegarÃ£o atÃ© lÃ¡.', '3%', '3porcento.jpg', 'Cesar Charlone, Pedro Aguilera', 2016, 1, 1),
(3, 1, 'Coisa Mais Linda Ã© ambientada na SÃ£o Paulo, no final da dÃ©cada de 50, onde Maria Luiza Carone (Maria Casadevall), uma moÃ§a conservadora e completamente dependente de dois homens: seu pai, Ademar (JoÃ£o Bourbonnais) e o marido, Pedro (Kiko Bertholini). Sua vida toma um rumo completamente diferente quando Pedro desaparece ao viajar para o Rio de Janeiro a fim de montar um restaurante. Maria Luiza, claro, segue os rastros do marido, e descobre que ele transformou o sofisticado negÃ³cio numa casa noturna. Em terras cariocas, a jovem descobre entÃ£o um novo mundo na companhia de mulheres feministas e liberais e ao som da Bossa Nova. Ela conhece Chico (Leandro Lima), um talentoso cantor tentando ganhar a vida com sua arte e AdÃ©lia (Pathy DeJesus), uma jovem negra moradora de uma favela que precisa enfrentar o racismo da elite carioca diariamente. Juntos, os trÃªs tentam abrir um clube de Bossa Nova para tentar realizar seus sonhos.', 'Coisa mais linda', 'coisamaislinda.jpg', 'Heather Roth, Giuliano Cedroni', 2019, 1, 1),
(4, 1, 'VerÃ´nica Torres (TainÃ¡ MÃ¼ller) trabalha como escrivÃ£ na Delegacia de HomicÃ­dios de SÃ£o Paulo e tem uma rotina bastante entediante. ApÃ³s presenciar um suicÃ­dio, ela precisa lutar contra os traumas de seu passado e acaba tomando uma arriscada decisÃ£o: usar toda a sua habilidade investigativa para ajudar duas mulheres desconhecidas. A primeira Ã© uma jovem que se vÃª enganada por um golpista na internet. JÃ¡ a segunda, Janete (Camila Morgado), Ã© a esposa submissa de BrandÃ£o (Eduardo Moscovis), um policial de alta patente que a maltrata e leva uma vida dupla.', 'Bom Dia, VerÃ´nica', 'bomdiaveronica.jpg', 'JosÃ© Henrique Fonseca, Raphael Montes', 2020, 1, 1),
(5, 1, 'DOM conta a histÃ³ria real de Pedro Dom (Gabriel Leone), um atraente rapaz da classe mÃ©dia carioca que Ã© apresentado Ã  cocaÃ­na muito cedo, evoluindo para se tornar o lÃ­der de uma gangue criminosa que estampa os tablÃ³ides no inÃ­cio dos anos 2000. Do outro lado estÃ¡ o pai de Pedro, Victor Dantas (Flavio Tolezani), que acabou entrando no serviÃ§o de inteligÃªncia policial por ter feito, ainda na adolescÃªncia, uma importante descoberta no fundo do mar e tÃª-la denunciado Ã s autoridades. Ao longo da dÃ©cada de 70, Victor se engaja no combate Ã s drogas, sem imaginar que, anos depois, precisaria lutar para retirar o prÃ³prio filho do mundo criminoso. SÃ£o jornadas opostas que, por vezes, se espelham e se complementam, enquanto ambos enfrentam situaÃ§Ãµes que confundem os limites entre o certo e o errado.', 'Dom', 'dom.jpg', 'Gonzaga', 2021, 1, 1),
(6, 1, 'Sintonia, sÃ©rie brasileira original da Netflix, traz as histÃ³rias de Doni (Christian Malheiros), Nando (MC JottapÃª) e Rita (Bruna Mascarenhas), todos moradores da mesma favela em SÃ£o Paulo. Crescendo juntos pelas ruas da comunidade, eles descobriram aos poucos o mundo do trÃ¡fico de drogas, da religiÃ£o e tambÃ©m da mÃºsica. No entanto, as experiÃªncias da infÃ¢ncia os levaram a trilhar caminhos bem diferentes, e agora esse trio sabe que quem pode salvÃ¡-los dos problemas com os quais se envolveram sÃ£o eles mesmos. A sÃ©rie apresenta a dinÃ¢mica das organizaÃ§Ãµes criminosas nas periferias dos centros urbanos. E, alÃ©m dos problemas sociais referentes Ã  favela, a trama tambÃ©m traz um olhar intimista sobre os jovens mÃºsicos que ascendem no funk e conquistam a fama.', 'Sintonia', 'sintonia.jpg', 'KondZilla', 2019, 1, 1),
(7, 1, 'Na sÃ©rie brasileira Sem Filtro, Marcely Menezes, vivida pela humorista pernambucana Ademara Barros, fica frustrada com os estudos e larga a faculdade para se lanÃ§ar na, aparentemente, prÃ³spera e fÃ¡cil carreira de influenciadora digital, mas nem tudo sÃ£o flores. Por mais que seu jeito espontÃ¢neo e - realmente - sem filtro de ser atraia muitos seguidores, curtidas e compartilhamentos, tanta sinceridade acaba atraindo muitas confusÃµes no pacote. Apesar da empolgaÃ§Ã£o e das vantagens que vieram, de uma hora para a outra, junto com a fama, a jovem acaba descobrindo o lado nÃ£o tÃ£o radiante do estrelato, incluindo notÃ­cias desagradÃ¡veis e tretas. Agora, Marcely precisarÃ¡ lidar com os dilemas do mundo digital e, tambÃ©m, com as questÃµes da vida real, jÃ¡ que o restante da famÃ­lia Menezes, junto com seus amigos acabam se envolvendo nas desventuras digitais da mais nova influencer.', 'Sem filtro', 'semfiltro.jpg', 'Cris D\'Amato ', 2023, 1, 1),
(8, 1, 'Ambientada na cidade de SÃ£o Paulo em meados dos anos 90, Irmandade Ã© uma sÃ©rie que acompanha a histÃ³ria de Cristina (Naruna Costa). Ela Ã© uma advogada honesta e dedicada que descobre o envolvimento do irmÃ£o Edson (Seu Jorge) com uma facÃ§Ã£o criminosa em ascensÃ£o, mais conhecida como a â€˜Irmandadeâ€™. Edson Ã© o lÃ­der do grupo e estÃ¡ preso, fazendo com que Cristina seja pressionada pela polÃ­cia para ser uma informante e ir contra o seu irmÃ£o, alguÃ©m que ela nÃ£o encontra hÃ¡ muito tempo. Edson esteve desaparecido por anos e na prisÃ£o enfrenta torturas que o aproximam da morte. Cristina acredita que a Ãºnica chance de salvÃ¡-lo serÃ¡ trabalhando em comum acordo com a polÃ­cia. No entanto, conforme Cristina se infiltra na facÃ§Ã£o, a advogada comeÃ§a a questionar seus prÃ³prios valores. A missÃ£o Ã© arriscada, porÃ©m, a cada descoberta, Cristina entra em contato com um lado sombrio de si mesma que nÃ£o imaginava ter.', 'Irmandade', 'irmandade.jpg', 'Pedro Morelli', 2019, 1, 1),
(9, 1, 'A sÃ©rie documental Elize Matsunaga: Era uma Vez um Crime revisita o crime que chocou o paÃ­s: o assassinato e esquartejamento do presidente da empresa Yoki, Marcos Matsunaga, por sua esposa, Elize Matsunaga. Da infÃ¢ncia em Chopinzinho, pequena cidade do ParanÃ¡, atÃ© o conturbado relacionamento com o empresÃ¡rio antes do assassinato, acompanhamos os detalhes que sucederam o fato, desde tentativas de acobertamento do crime, passando pela confissÃ£o, prisÃ£o, julgamento em 2016 e tambÃ©m saÃ­das temporÃ¡rias.', 'Elize Matsunaga: Era uma vez um crime', 'elizematsunaga.jpg', 'Eliza Capai ', 2021, 1, 1),
(10, 1, 'Em Olhar Indiscreto, Miranda (Debora Nascimento) Ã© uma hacker talentosa e voyer incontrolÃ¡vel que passa seus dias observando o cotidiano de ClÃ©o (Emanuelle AraÃºjo), sua vizinha e acompanhante de luxo. Um dia, ClÃ©o pede a Miranda um simples favor: cuidar de seu cachorro enquanto passa uns dias fora em viagem. A partir desse momento, a vida da hacker vira de cabeÃ§a para baixo ao adentrar o universo complexo e obscuro da acompanhante. Mas ao mesmo tempo que teme esse novo e perigoso mundo, Miranda se permite viver seus mais Ã­ntimos desejos e comeÃ§a um intenso triÃ¢ngulo amoroso que pode nÃ£o acabar nada bem. AlÃ©m disso, um de seus novos clientes a contrata para investigar um possÃ­vel esquema de trÃ¡fico de mulheres e ela desconfia que a vizinha esteja conectada a isso. Enquanto questiona suas novas escolhas, a hacker se vÃª cada vez mais envolvida com o universo de ClÃ©o e passa reviver seu passado', 'Olhar Indiscreto', 'olharindiscreto.jpg', 'Luciana Oliveira', 2023, 1, 1),
(11, 1, 'JoÃ£o de Deus: Crime e Cura, sÃ©rie documental original da Netflix, acompanha a trajetÃ³ria do idolatrado mÃ©dium JoÃ£o Teixeira de Faria, conhecido como JoÃ£o de Deus, que se tornou protagonista de um dos maiores casos de assÃ©dio do Brasil. Depois de conquistar fama internacional com suas supostas curas, o lider espiritual foi preso por estar envolvido em inÃºmeros casos de violÃªncia sexual contra suas ex-seguidoras.', 'JoÃ£o de Deus: Cura e Crime', 'joaodedeus.jpg', 'MaurÃ­cio Dias, Tatiana Villela ', 2021, 1, 1),
(12, 1, 'Nada Suspeitos, nova sÃ©rie brasileira de comÃ©dia da Netflix, contarÃ¡ a histÃ³ria de um crime ocorrido em uma mansÃ£o. Depois de serem enganadas pelo mesmo ricaÃ§o mau-carÃ¡ter, PatrÃ­cia (Fernada Paes Leme), Bete (MaÃ­ra Azevedo) e Thyellen (Thati Lopes) vÃ£o atÃ© a casa de MaurÃ­cia (RÃ´mulo Arantes Neto) para tirar satisfaÃ§Ã£o acompanhadas de seus familiares. Mas quando o playboy aparece morto, elas percebem que estÃ£o envolvidas em uma confusÃ£o pior do que imaginavam. Com a ajuda de um atrapalhado detetive, eles tentam descobrir o que realmente aconteceu, mas agora, todo mundo Ã© um provÃ¡vel suspeito. A tentativa de descobrir quem matou o milionÃ¡rio, e a disputa por sua heranÃ§a, fazem com que algumas gananciosas famÃ­lias tenham que conviver sob o mesmo teto.', 'Nada Suspeitos ', 'nadasuspeitos.jpg', 'CÃ©sar Rodrigues, Eduardo Vaisman ', 2022, 1, 1),
(13, 1, 'Na sÃ©rie brasileira da Netflix, A Sogra que te Pariu, quando a pandemia comeÃ§a, Dona Isadir (Rodrigo Santâ€™Anna) nÃ£o pensa duas vezes antes de colocar para alugar seu apartamento no Cachambi, no Rio de Janeiro, com o intuito de ficar mais perto da famÃ­lia. A decisÃ£o de se mudar para a mansÃ£o de seu filho Carlos (Rafael Zulu), na Barra da Tijuca, Ã© tomada de maneira unilateral e sem aviso prÃ©vio, para desespero de sua nora, Alice (Lidi Lisboa). Enquanto os netos MÃ¡rcia (BÃ¡rbara Sut) e Jonas (Pedro Ottoni) se veem no meio do fogo cruzado, Marinez (Daniela Fontan), que trabalha hÃ¡ anos na casa, assiste a toda a confusÃ£o de um lugar privilegiado. Carlos tenta apaziguar as tensÃµes dentro de casa, mas Alice nÃ£o consegue conviver com a sogra de forma pacifica, pois a mesma segue criticando o tempo inteiro sua forma de gerenciar o lar. A pandemia, que eles acharam que duraria apenas algumas semaninhas, se torna uma vida inteira e Isadir segue tornando a vida de Alice um inferno. Mas mesmo diante de brigas e conflitos, no fim do dia a famÃ­lia consegue encontrar afeto uns nos outros.', 'A sogra que te pariu', 'asograquetepariu.jpg', 'Alex Cabral ', 2022, 1, 1),
(14, 1, 'A histÃ³ria real de Wallace Souza, um apresentador de televisÃ£o acusado de planejar os assassinatos que abordava e investigava em seu programa. Durante dez anos ele comandou o â€œCanal Livreâ€, que teve sucesso nacionalmente, chegando a atÃ© ultrapassar a audiÃªncia de grandes emissoras do paÃ­s em algumas cidades.', 'Bandidos na TV', 'bandidosnatv.jpg', 'Daniel Bogado', 2019, 1, 1),
(15, 1, 'Ã‰ noite de eliminaÃ§Ã£o no reality show Olimpo, mais conhecido como a Casa dos Deuses. O programa segue seu ritmo normal, atÃ© que os participantes recebem a seguinte notÃ­cia: o Rio de Janeiro vive um apocalipse zumbi, as ruas tomadas pelo caos e pelo pÃ¢nico. O estÃºdio da emissora se torna entÃ£o um dos Ãºnicos lugares seguros da cidade, e o grupo de confinados vai precisar agir com muito cuidado se quiser sobreviver ao ataque.', 'Reality Z', 'realityz.jpg', 'ClÃ¡udio Torres', 2020, 1, 1),
(16, 1, 'Silas Campello (Guilherme Fontes) Ã© um ambicioso apresentador de um programa policial e um dos nomes mais poderosos de BelÃ©m do ParÃ¡. Sua carreira, no entanto, foi marcada por uma jornada tortuosa para alcanÃ§ar a fama. Capaz de tudo pela audiÃªncia, o jornalista ia contra os princÃ­pios Ã©ticos e encomendava assassinatos para poder exibi-los na televisÃ£o.', 'Pacto de Sangue', 'pactodesangue.jpg', 'Tomas Portella, AdriÃ¡n Caetano ', 2018, 1, 1),
(17, 1, 'Em Boca a Boca, quando uma doenÃ§a contagiosa transmitida pelo beijo se espalha por uma cidade pecuarista do interior, os adolescentes locais entram em pÃ¢nico. AlÃ©m de deixar os habitantes desconfiados uns dos outros, a infecÃ§Ã£o altera todo o cotidiano da comunidade.', 'Boca a Boca', 'bocaaboca.jpg', 'Esmir Filho', 2020, 1, 1),
(18, 1, 'Em um futuro prÃ³ximo, cada cidadÃ£o Ã© seguido e monitorado por um pequeno drone e as taxas de criminalidade sÃ£o mÃ­nimas. O Sistema Onisciente parece funcionar perfeitamente, atÃ© que uma jovem chamada Nina descobre um assassinato que nÃ£o foi relatado por ele. A moÃ§a entÃ£o inicia uma jornada em busca da verdade por trÃ¡s dessa suposta negligÃªncia.', 'Onisciente', 'onisciente.jpg', 'Pedro Aguilera', 2020, 1, 1),
(19, 1, 'Bairro da Liberdade, SÃ£o Paulo. Um grupo de cinco adolescentes Ã© acidentalmente atraÃ­do para uma realidade sobrenatural que nÃ£o pode ser compreendida, mas que se conecta ao mesmo local da cidade em 1908. Conforme os acontecimentos vÃ£o ficando mais estranhos, os jovens descobrem que alguÃ©m estÃ¡ trazendo a morte de volta, e os espÃ­ritos querem vinganÃ§a.', 'Spectros', 'spectros.jpg', 'Doug Petrie ', 2020, 1, 1),
(20, 1, 'Em Maldivas, a jovem goiana Liz (Bruna Marquezine) se muda para o Rio com o intuito de reencontrar sua mÃ£e, que morre num misterioso incÃªndio. Determinada a obter respostas para essa tragÃ©dia, Liz precisa se esconder do investigador Denilson (Romani) e acaba se infiltrando num luxuoso condomÃ­nio da Barra da Tijuca. Entre os peculiares moradores do Maldivas, estÃ£o Milene (Manu Gavassi), uma verdadeira rainha que leva uma vida aparentemente perfeita ao lado do marido, o cirurgiÃ£o plÃ¡stico Victor Hugo (Klebber Toledo); e Rayssa (Sheron Menezzes), uma ex-cantora de axÃ© que se tornou uma executiva de sucesso, casada com o ex-vocalista de sua banda, CauÃ£ (Samuel Melo). JÃ¡ a mÃ£ezona Kat (Carol Castro) precisa encarar o fato de que seu marido Gustavo (Guilherme Winter) cumpre prisÃ£o domiciliar. VerÃ´nica (Natalia Klein), por sua vez, Ã© uma outsider que destoa completamente de suas vizinhas. Para completar, surge ainda Miguel (Danilo Mesquita), o noivo interiorano de Liz.', 'Maldivas', 'maldivas.jpg', 'JosÃ© Alvarenga JÃºnior ', 2022, 1, 1),
(21, 1, 'Enviados a um vilarejo isolado do Pantanal, trÃªs jovens mÃ©dicos recebem a missÃ£o de vacinar os moradores de lÃ¡ contra uma nova mutaÃ§Ã£o do vÃ­rus da Zika. Mas a populaÃ§Ã£o recusa o tratamento, e o trio se descobre preso em uma comunidade guiada por um lÃ­der enigmÃ¡tico que diz ter o poder de curar doenÃ§as sem fazer uso da medicina.', 'O Escolhido', 'oescolhido.jpg', 'Michel Tikhomiroff', 2019, 1, 1),
(22, 1, 'Temporada de VerÃ£o acompanha quatro jovens diferentes que se conhecem enquanto trabalham no Hotel Maresia, um resort de luxo localizado numa ilha paradisÃ­aca. LÃ¡, a destemida Catarina (Giovanna Lancellotti), a irreverente Yasmin (Gabz), o sonhador Diego (Jorge LÃ³pez) e o veterano do staff, Miguel (AndrÃ© Luiz Frambach), se unem para enfrentar os desafios do dia a dia, fazendo descobertas sobre o mundo e sobre si mesmos. E, se antes eram desconhecidos, logo se transformam numa verdadeira famÃ­lia. Catarina precisa lidar com a sÃºbita prisÃ£o de sua mÃ£e, acusada de lavagem de dinheiro e corrupÃ§Ã£o ativa, mas encontra nos outros membros do hotel Maresia um conforto para essa situaÃ§Ã£o complicada. No meio de tudo isso, ainda se envolve em um intenso triÃ¢ngulo amoroso com Diego e MarÃ­lia (Cynthia Senek). JÃ¡ Yasmin se vÃª completamente envolvida quando inicia um romance com Miguel e percebe que os dois tem mais em comum do poderia imaginar.', 'Temporada de VerÃ£o', 'temporadadeverao.jpg', 'Isabel Valiante', 2022, 1, 1),
(23, 1, 'Uli Ã© um anjo da guarda cheio de personalidade que, insatisfeito com o quÃ£o arbitrÃ¡rias sÃ£o as ordens que ele recebe diariamente, decide se rebelar contra o sistema. Questionando conceitos complexos como a relatividade do bem e do mal, a sÃ©rie usa um humor Ã¡cido para subverter ideias prÃ© concebidas.', 'NinguÃ©m tÃ¡ olhando ', 'ninguemtaolhando.jpg', 'Daniel Rezende', 2019, 1, 1),
(24, 1, 'Me Chama de Bruna acompanha Raquel (Maria Bopp), uma jovem de classe mÃ©dia que decide virar garota de programa, adotando o apelido de \"Bruna Surfistinha\"\". Stella (Carla Ribas), uma cafetina experiente, abriga a jovem em sua casa, onde ela nÃ£o demora para se destacar e gerar inveja nas colegas Georgette (Stella Rabelo), MÃ´nica (Luciana Paes) e JÃ©ssica (Nash Laila). Bruna descobre, no novo trabalho, uma soma de vocaÃ§Ã£o e prazer, virando a favorita da clientela. Mas nem tudo sÃ£o flores, pois ela se vÃª confrontada com a dura realidade do ramo da prostituiÃ§Ã£o: meninas que precisam trabalhar desde cedo pra sustentar a famÃ­lia, clientes agressivos que objetificam as acompanhantes, e sua famÃ­lia, que nÃ£o se conforma com a sua profissÃ£o. AlÃ©m de tudo, ela precisa lidar com Nancy (Suzana Kruger), a assistente de Stella, que sente inveja dela e acha que a nova contratada tem segundas intenÃ§Ãµes. Bruna supera todos esses desafios, se fortalecendo a cada obstÃ¡culo superado e se tornando mais e mais satisfeita com o lugar que ocupa. Em pouco tempo, ela se torna a prostituta mais requisitada de SÃ£o Paulo.\"', 'Me chama de Bruna', 'mechamadebruna.jpg', 'MÃ¡rcia Faria', 2016, 1, 1),
(25, 1, 'Os bastidores das investigaÃ§Ãµes dos crimes que mais chocaram o Brasil. Todos os fatos e elementos desconhecidos de seus respectivos inquÃ©ritos sÃ£o apresentados e ordenados com precisÃ£o por meio de entrevistas com peritos criminais, legistas, delegados e outros profissionais envolvidos nos casos.', 'InvestigaÃ§Ã£o Criminal', 'investigaÃ§aocriminal.jpg', 'Beto Ribeiro, Carla Albuquerque', 2012, 1, 1),
(26, 1, 'A histÃ³ria de seis amigas que acreditam no poder do amor, independentemente do sexo e da cor.', 'Pink - Amor de verÃ£o', 'pinkamordeverao.jpg', 'Alexandre Cobra', 2019, 1, 1),
(27, 1, 'Rio de Janeiro, anos 90. Em Impuros, Evandro do DendÃª (Raphael Logam) Ã© um jovem da favela carioca cujo principal objetivo ao fazer 18 anos Ã© ganhar o prÃ³prio dinheiro de forma honesta. Mas tudo muda quando seu irmÃ£o traficante Ã© morto por policiais. Evandro decide se vingar e mata os responsÃ¡veis pelo tal assassinato, ganhando notoriedade dentro da hierarquia do comando. Enquanto isso, o policial alcoÃ³latra Victor Morello nÃ£o economiza esforÃ§os para colocar Evandro atrÃ¡s das grades.', 'Impuros', 'impuros.jpg', 'Tomas Portalla', 2018, 1, 1),
(28, 1, '1 Contra Todos acompanha Cadu (Julio Andrade), um advogado dedicado que preza pela verdade e pela justiÃ§a acima de tudo. Com uma esposa grÃ¡vida do seu segundo filho e recentemente desempregado, ele vÃª sua vida mudar completamente quando Ã© acusado e condenado Ã  prisÃ£o apÃ³s ser confundido com o maior traficante de drogas do Brasil. Na cadeia, Cadu adota uma nova postura para poder sobreviver e decide se comportar como o criminoso que todos jÃ¡ acreditam que ele seja. No entanto, alÃ©m de colecionar inimigos, sua decisÃ£o afeta drasticamente as vidas das pessoas que ele ama.', 'Um contra todos', 'umcontratodos.jpg', 'Breno Silveira', 2015, 1, 1),
(29, 1, 'Depois de morrer de modo trÃ¡gico, Daniel misteriosamente retorna Ã  vida. Primeiro, pensa que estÃ¡ enlouquecendo. Segundo, acredita estar vivendo num pesadelo. Daniel comeÃ§a a ouvir vozes e uma delas, identificada como NÃ´made, coloca seus hÃ¡bitos e crenÃ§as em xeque.', 'NÃ´made 7', 'nomade7.jpg', 'FlÃ¡vio Langoni', 2020, 1, 1),
(30, 1, 'Sob PressÃ£o acompanha o dia-a-dia dos funcionÃ¡rios de um hospital pÃºblico no subÃºbio do Rio de Janeiro. A vida dos profissionais nÃ£o Ã© nada fÃ¡cil, especialmente para o Dr. Evandro (JÃºlio Andrade), o cirurgiÃ£o-chefe da equipe mÃ©dica. CÃ©tico, ele encontra alÃ­vio para os seus problemas na companhia da doutora Carolina (Marjoire Estiano), sua colega de trabalho que, diferente dele, encontra na fÃ© o refÃºgio para seus problemas. Os dois podem atÃ© ser diferentes, mas vÃ£o encontrar um no outro uma maneira de sobreviver entre as emergÃªncias do hospital e o caos de suas prÃ³prias vidas. Diante de constantes desafios, eles fazem o impossÃ­vel pela vida de seus pacientes, indo ao limite para exercer sua profissÃ£o com Ã©tica e eficiÃªncia, mas sem nunca perder o lado humano da medicina. Mesmo com enormes faltas e problemas na saÃºde pÃºblica, os dois e seus outros companheiros lutam diariamente para oferecer a melhor assistÃªncia possÃ­vel a todos que atravessam as portas do hospital.', 'Sob PressÃ£o', 'sobpressao.jpg', 'Anducha Waddington', 2017, 1, 1),
(31, 2, 'Em um dia atÃ­pico, uma sÃ©rie de coincidÃªncias levam Eduardo a conhecer MÃ´nica em uma festa. Uma curiosidade Ã© despertada entre os dois e, apesar de nÃ£o serem parecidos, eles se apaixonam perdidamente. Em BrasÃ­lia, na dÃ©cada de 1980, esse amor precisa amadurecer e aprender a superar as diferenÃ§as.', 'Eduardo e MÃ´nica', 'eduardomonica.jpeg', 'RenÃ© Sampaio', 2022, 1, 1),
(32, 2, 'Nascimento, capitÃ£o da Tropa de Elite do Rio de Janeiro, Ã© designado para chefiar uma das equipes que tem como missÃ£o apaziguar o Morro do Turano. Ele precisa cumprir as ordens enquanto procura por um substituto para ficar em seu lugar. Em meio a um tiroteio, Nascimento e sua equipe resgatam Neto eÂ Matias, dois aspirantes a oficiais da PM. Ansiosos para entrar em aÃ§Ã£o e impressionados com a eficiÃªncia de seus salvadores, os dois se candidatam ao curso de formaÃ§Ã£o da Tropa de Elite.', 'Tropa de Elite', 'tropaelite.jpeg', 'JosÃ© Padilha', 2007, 1, 1),
(33, 2, 'Em 2002, um crime cometido em SÃ£o Paulo chocou o Brasil. A jovem Suzane Von Richthofen, junto ao seu namorado Daniel Cravinhos e seu irmÃ£o Cristian Cravinhos, assassinaram seu pai Manfred von Richthofen e sua mÃ£e MarÃ­sia. Dezoito anos depois, o caso Ã© revisitado sob o ponto de vista de Daniel, que revela seus motivos para participar do assassinato.', 'A Menina que Matou os Pais', 'carladiaspais.jpeg', 'Mauricio EÃ§a', 2020, 1, 1),
(34, 2, 'Em 2002, Suzane Von Richthofen e Daniel Cravinhos chocaram o Brasil por serem os responsÃ¡veis pelo brutal assassinato dos pais de Richthofen. Acompanhando o julgamento dos dois, o famoso caso Ã© recontado, buscando respostas sobre o que levou os jovens a cometerem esse crime.', 'O Menino que Matou Meus Pais', 'meninomatoupais.jpg', 'Mauricio EÃ§a', 2020, 1, 1),
(35, 2, 'Baseado na mÃºsica escrita por Renato Russo, o longa acompanha a histÃ³ria de JoÃ£o do Santo Cristo, que deixa Salvador, sua cidade natal, e se muda para a BrasÃ­lia em busca de uma vida melhor. LÃ¡, ele encontra a misÃ©ria e o crime, mas tambÃ©m descobre o amor nos braÃ§os de Maria LÃºcia, por quem se apaixona e com quem gostaria de viver uma vida feliz. PorÃ©m, o envolvimento com o trÃ¡fico de drogas e com Jeremias, um traficante rival, coloca tudo a perder.', 'Faroeste Caboclo: O Filme', 'faroestecab.jpeg', 'RenÃ© Sampaio', 2013, 1, 1),
(36, 2, 'MÃ´nica, Cebolinha, Magali e CascÃ£o se esquecem de fazer o dever de casa e fogem da escola. Mas nem tudo sai como o esperado, e os pais de MÃ´nica decidem mudÃ¡-la de colÃ©gio. Mesmo fazendo novos amigos, a turminha sente saudade de estar sempre junta. Cebolinha entÃ£o resolve bolar um plano infalÃ­vel com Magali e CascÃ£o para trazer a dona da rua de volta, mesmo que para isso precise recuperar o coelhinho SansÃ£o para a amiga.', 'Turma da MÃ´nica - LiÃ§Ãµes', 'monicalicoes.jpeg', 'Daniel Rezende', 2021, 1, 1),
(37, 2, 'Tino Ã© um pai de famÃ­lia que tem sua rotina transformada ao ganhar na loteria. Em dez anos, o fanfarrÃ£o e sua mulher Jane gastam todo o dinheiro com uma vida de ostentaÃ§Ã£o. Quando descobre que estÃ¡ falido, ele Ã© obrigado a aceitar a ajuda de seu vizinho Amauri, um consultor financeiro nada divertidoÂ e extremamente econÃ´mico. Jane engravida do terceiro filho e Tino faz de tudo para esconder da esposa que estÃ£o na pior, pois a recomendaÃ§Ã£o mÃ©dica Ã© que a grÃ¡vida evite fortes emoÃ§Ãµes.', 'AtÃ© que a Sorte Nos Separe', 'sortesepare1.jpeg', 'Roberto Santucci', 2012, 1, 1),
(38, 2, 'Tino e Jane sÃ£o salvos da falÃªncia pela inesperada heranÃ§a do Tio Olavinho. O problema Ã© que o testamento traz um pedido incomum: o ricaÃ§o deseja que suas cinzas sejam lanÃ§adas no Grand Canyon. Aproveitando a viagem, o casal resolve dar uma esticadinha em Las Vegas. Entretanto, Tino se empolga com aÂ jogatina de um cassino e perde todo o dinheiro da heranÃ§a na mesa de pÃ´quer. Para piorar, ainda fica devendo US$ 10 milhÃµes a um capanga da mÃ¡fia mexicana, que deseja receber o dinheiro a todo custo.', 'AtÃ© que a Sorte Nos Separe 2', 'sortesepare2.jpg', 'Roberto Santucci', 2013, 1, 1),
(39, 2, 'Depois de perder a heranÃ§a da famÃ­lia em Las Vegas, Tino precisa se virar para conseguir dinheiro. Ele comeÃ§a a vender biscoitos na rua atÃ© ser atropelado pelo filho de um milionÃ¡rio, que se apaixona por sua filha TetÃ©. O pai do rapaz lhe oferece um trabalho na corretora para que ele possa pagar pelo casamento da filha. No exercÃ­cio de suas novas funÃ§Ãµes, Tino leva Ã  falÃªncia a maior empresa do Brasil, mergulhando o paÃ­s em uma grande crise financeira.', 'AtÃ© que a Sorte Nos Separe 3', 'sortesepare3.jpg', 'Roberto Santucci,Â Marcelo Antunez', 2015, 1, 1),
(40, 2, 'Dona HermÃ­nia Ã© uma mulher de meia idade, divorciada do marido, que a trocou por uma mais jovem. Hiperativa, ela nÃ£o larga o pÃ© de seus filhos Marcelina e Juliano, que jÃ¡ estÃ£o bem grandinhos. Um dia, apÃ³s descobrir que eles a consideram uma chata, resolve sair de casa sem avisar ninguÃ©m, deixando todos, de alguma forma, preocupados com o que teria acontecido. Mal sabem eles que a mÃ£e foi visitar a querida tia ZÃ©lia para desabafar suas tristezas do presente e recordar os bons tempos do passado.', 'Minha MÃ£e Ã‰ uma PeÃ§a', 'maepeca1.jpeg', 'AndrÃ© Pellenz', 2013, 1, 1),
(41, 2, 'Dona HermÃ­nia passa a apresentar um bem-sucedido programa de TV e fica rica. PorÃ©m, ela agora precisa lidar com um lar vazio, pois Juliano e Marcelina resolveram sair de casa. Para balancear, Garib, o primogÃªnito, chega com o neto. AlÃ©m disso, tambÃ©m recebe uma longa visita da irmÃ£ Lucia Helena, a ovelha negra da famÃ­lia, que mora hÃ¡ anos em Nova York.', 'Minha MÃ£e Ã‰ uma PeÃ§a 2', 'maepeca2.jpeg', 'CÃ©sar Rodrigues', 2016, 1, 1),
(42, 2, 'Dona HermÃ­nia precisa se redescobrir e se reinventar porque seus filhos estÃ£o formando novas famÃ­lias. Marcelina estÃ¡ grÃ¡vida e Juliano vai casar. Dona HermÃ­nia estÃ¡ mais ansiosa do que nunca. Para completar as confusÃµes, Carlos Alberto, seu ex-marido, que esteve sempre por perto, agora resolve se mudar para o apartamento ao lado.', 'Minha MÃ£e Ã‰ uma PeÃ§a 3', 'maepeca3.jpeg', 'Susana Garcia', 2019, 1, 1),
(43, 2, 'Em 1973, o jovem Renato se muda com a famÃ­lia para a BrasÃ­lia. Aos poucos, passa a se interessar por mÃºsica e comeÃ§a a se envolver com o cenÃ¡rio musical, formando com amigos a banda Aborto ElÃ©trico. Em 1982, apesar da rejeiÃ§Ã£o a suas novas canÃ§Ãµes, consegue despertar a atenÃ§Ã£o em outros cÃ­rculos e retoma seu sonho de criar uma grande banda, convidando Marcelo BonfÃ¡ e Dado Villa-Lobos para formar a LegiÃ£o Urbana, iniciando a trajetÃ³ria que a tornaria umas das maiores bandas do rock brasileiro.', 'Somos TÃ£o Jovens', 'somostaojovens.jpeg', 'Antonio Carlos da Fontoura', 2013, 1, 1),
(44, 2, 'Rubens, um poderoso bandido do interior paulista, decide dar um Ãºltimo grande golpe com a ajuda da sua filha adotiva LeÃ´nia, que fugiu da Bahia depois de ser estuprada pelo seu verdadeiro pai. A dupla resolve assaltar os cofres particulares de um banco na Avenida Paulista, no coraÃ§Ã£o de SÃ£o Paulo, mas nem tudo sai conforme o planejado.', 'Assalto na Paulista', 'assaltopaulista.jpeg', 'FlÃ¡vio Frederico', 2022, 1, 1),
(45, 2, 'Num futuro nÃ£o muito longÃ­nquo, uma povoaÃ§Ã£o de nome Bacurau, em pleno sertÃ£o brasileiro, some misteriosamente do mapa. Quando uma sÃ©rie de assassinatos inexplicÃ¡veis comeÃ§am a acontecer, os moradores da cidade tentam reagir. Mas como se podem defender de um inimigo desconhecido e implacÃ¡vel?', 'Bacurau', 'bacurau.jpeg', 'Kleber MendonÃ§a Filho, Juliano Dornelles', 2019, 1, 1),
(46, 2, 'Cidade de Deus Ã© um filme de aÃ§Ã£o brasileiro de 2002 produzido por O2 Filmes, Globo Filmes e Videofilmes e distribuÃ­do por LumiÃ¨re Brasil. Ã‰ uma adaptaÃ§Ã£o roteirizada por BrÃ¡ulio Mantovani a partir do livro de mesmo nome escrito por Paulo Lins.', 'Cidade de Deus', 'cidadedeus.jpeg', 'Fernando Meirelles, KÃ¡tia Lund', 2002, 1, 1),
(47, 2, 'Quatro colegas de trabalho se programam para curtir o feriado prolongado em uma casa de praia. LÃ¡, eles descobrem que se meteram em uma tremenda roubada.', 'Os Farofeiros', 'farofeiros.jpeg', 'Roberto Santucci', 2018, 1, 1),
(48, 2, 'Juliano e Joaquim sÃ£o grandes amigos que deixam SÃ£o Paulo com destino Ã  Serra Pelada, o maior garimpo a cÃ©u aberto do mundo, localizado no estado do ParÃ¡. Sonhando com a riqueza, a vida dos dois muda por conta de violÃªncia e ganÃ¢ncia.', 'Serra Pelada', 'serrapelada.jpeg', 'Heitor Dhalia', 2013, 1, 1),
(49, 2, 'Em uma iniciativa de reparaÃ§Ã£o pelo passado escravocrata, o governo brasileiro decreta uma medida provisÃ³ria e provoca uma reaÃ§Ã£o imediata no Congresso Nacional. Os parlamentares aprovam uma medida que obriga os cidadÃ£os negros a se mudar para a Ãfrica na intenÃ§Ã£o de retomar as suas origens. A aprovaÃ§Ã£o afeta diretamente a vida do casal formado pela mÃ©dica CapitÃº e pelo advogado Antonio, alÃ©m de seu primo, o jornalista AndrÃ©, que mora com eles no mesmo apartamento.', 'Medida ProvisÃ³ria', 'medidaprov.jpeg', 'LÃ¡zaro Ramos', 2022, 1, 1),
(50, 2, 'FÃ¡bio e MiÃ¡ fazem um cruzeiro do Rio de Janeiro atÃ© a Europa de lua de mel, onde ela reencontra seu ex-namorado Beto, que estÃ¡ casado com Laura, antiga paixÃ£o de FÃ¡bio. Atrapalhados com essa coincidÃªncia, o casal vive situaÃ§Ãµes cÃ´micas e embaraÃ§osas.', 'Meu Passado Me Condena', 'passadocondena.jpeg', 'JÃºlia Rezende', 2013, 1, 1),
(51, 2, 'ClÃ³vis Ã© um salafrÃ¡rio que acaba de ser descoberto apÃ³s dar um golpe em um grupo de japoneses e estÃ¡ sendo perseguido pela polÃ­cia. Lohane Ã© uma empreendedora do ramo alimentÃ­cio que viu seus sonhos desabarem quando a prefeitura rebocou seu trailer de sanduÃ­ches por falta de alvarÃ¡. Agora, os irmÃ£os postiÃ§os precisam conviver novamente. Muito contrariado, ClÃ³vis aprende a lidar com a espontaneidade excessiva da irmÃ£, alÃ©m de ensinÃ¡-la um truquezinho ou outro pra garantir a subsistÃªncia da dupla.', 'Os SalafrÃ¡rios', 'salafrarios.jpeg', 'Pedro AntÃ´nio Paes', 2021, 1, 1),
(52, 2, 'No Rio de Janeiro, cinco policiais se infiltram no Complexo do AlemÃ£o para um trabalho, mas acabam sendo desmascarados pelos criminosos locais. Agora, eles estÃ£o presos e precisam encontrar uma maneira de escapar.', 'AlemÃ£o', 'alemao.jpeg', 'JosÃ© Eduardo Belmonte', 2014, 1, 1),
(53, 2, 'Marina volta de uma viagem com cinco milhÃµes de reais em sua conta. Agora, ela sÃ³ quer seguir em frente sem olhar para trÃ¡s e encarar o que fez. Contudo, os encontros constantes entre Marina, Maria EugÃªnia, Henrique e o filho do casal nÃ£o podem ser apenas uma coincidÃªncia. As duas mulheres descobrem que estÃ£o unidas por laÃ§os de amor e amizade que remontam para alÃ©m dessa vida.', 'Nada Ã‰ Por Acaso', 'nadaporacaso.jpeg', 'MÃ¡rcio Trigo', 2022, 1, 1),
(54, 2, 'No final dos anos 1950, os jovens CÃ©lia e Tony Campello se apaixonam pelo rock. O ritmo era praticamente novo para o grade pÃºblico, mas os dois lutam para fazer uma carreira na mÃºsica, desbravando um campo totalmente novo.', 'Um Broto Legal', 'brotolegal.jpeg', 'Luiz Alberto Pereira', 2022, 1, 1),
(55, 2, 'Adriana Ã© abandonada por Eduardo, seu esposo. Desiludida com a separaÃ§Ã£o, ela resolve reconquistar o ex-marido, embarcando no mesmo cruzeiro onde ele estÃ¡ com a nova namorada, Beatriz, uma estrela da TV. Adriana embarca no navio com a irmÃ£, Luiza, e a empregada, Dialinda. Decididas a arruinar a viagem de Eduardo e de sua namorada, essas trÃªs mulheres acabam descobrindo novos e inesperados caminhos para suas vidas.', 'S.O.S. Mulheres ao Mar!', 'mulheresmar.jpeg', 'Cris D\'Amato', 2014, 1, 1),
(56, 2, 'O anel Tatu Tatuado de TopÃ¡zio, da socialite Gracinha de Medeiros, estÃ¡ em exposiÃ§Ã£o em um museu. Ela, entÃ£o, contrata os atrapalhados seguranÃ§as PedrÃ£o e Jorginho para vigiarem a joia, uma heranÃ§a de famÃ­lia. O anel Ã© roubado e a dupla acusada de furto. Para provar que sÃ£o inocentes, eles terÃ£o que enfrentar mafiosos portugueses e uma quadrilha de ninjas.', 'Os Caras de Pau em O Misterioso Roubo do Anel', 'carasdepau.jpeg', 'Felipe Joffily', 2014, 1, 1),
(57, 2, 'A famÃ­lia Terra CambarÃ¡ e sua principal opositora, a famÃ­lia Amaral, viveram em conflito durante 150 anos, comeÃ§ando nas MissÃµes atÃ© o final do sÃ©culo XIX. A luta entre essas duas famÃ­lias atravessa a formaÃ§Ã£o do Rio Grande do Sul, a povoaÃ§Ã£o do territÃ³rio brasileiro e a demarcaÃ§Ã£o de suas fronteiras, forjada a ferro e espada pelas lutas entre as coroas portuguesa e espanhola. Um dia, o sobrado dos Terra-CambarÃ¡ Ã© cercado pelos Amaral, e eles sÃ£o obrigados a se defenderem.', 'O Tempo e o Vento', 'tempoevento.jpeg', 'Jayme Monjardim', 2013, 1, 1),
(58, 2, 'ApÃ³s ser abandonada pelo seu marido JoÃ£o e demitida de seu emprego, Alice fecha uma parceria com Marcela, sua vizinha e dona de uma loja de artigos erÃ³ticos.', 'De Pernas Pro Ar', 'pernaspar1.jpeg', 'Roberto Santucci', 2010, 1, 1),
(59, 2, 'Alice sofre um colapso nervoso de tanto trabalhar e se interna em um spa para se livrar do estresse. PorÃ©m o momento nÃ£o poderia ser mais inoportuno, pois a rede de sex shop estÃ¡ para abrir sua primeira loja no exterior e Alice vai tentar de tudo para voltar ao trabalho e salvar seu casamento.', 'De Pernas Pro Ar 2', 'pernaspar2.jpg', 'Roberto Santucci', 2012, 1, 1),
(60, 2, 'O sucesso da rede de lojas Sexy DelÃ­cia leva Alice Segretto a fazer uma viagem pelo mundo. Trabalhando sem parar, Alice percebe que nÃ£o tem conseguido acompanhar sua famÃ­lia, que tambÃ©m cresceu. Impetuosa, ela toma uma decisÃ£o inusitada: decide se aposentar e entregar o comando dos negÃ³cios para sua mÃ£e.', 'De Pernas Pro Ar 3', 'pernaspar3.jpeg', 'JÃºlia Rezende', 2019, 1, 1),
(61, 2, 'Um humilde operador de copiadora se apaixona pela vizinha e, para conseguir se aproximar da jovem, se transforma num falsificador de dinheiro.', 'O Homem que Copiava', 'homemcopiava.jpeg', 'Jorge Furtado', 2003, 1, 1),
(62, 2, 'MÃ©dico sanitarista se oferece para realizar o trabalho de prevenÃ§Ã£o ao vÃ­rus HIV no Carandiru, maior presÃ­dio da AmÃ©rica Latina, durante a dÃ©cada de 1990. Convivendo diariamente com a dura realidade dos detentos, ele presencia a violÃªncia agravada pela superlotaÃ§Ã£o, a precariedade dos serviÃ§os prestados e a animalizaÃ§Ã£o dos presos. Paradoxalmente, ele conhece o sistema de organizaÃ§Ã£o interna e o lado frÃ¡gil, romÃ¢ntico e sonhador dos homens cumprindo pena.', 'Carandiru: O Filme', 'carandiru.jpeg', 'HÃ©ctor Babenco', 2003, 1, 1),
(63, 2, 'ZezÃ© Ã© um garoto de oito anos que, apesar de levado, tem um bom coraÃ§Ã£o. Ele leva uma vida bem modesta, devido ao fato de seu pai estar desempregado hÃ¡ bastante tempo, e tem o costume de ter longas conversas com um pÃ© de laranja lima que fica no quintal de sua casa. AtÃ© que, um dia, conhece Portuga, um senhor que passa a ajudÃ¡-lo e logo se torna seu melhor amigo.', 'Meu PÃ© de Laranja Lima', 'laranjalima.jpeg', 'Marcos Bernstein', 2013, 1, 1),
(64, 2, 'As aventuras de JoÃ£o Grilo e ChicÃ³, dois nordestinos pobres que vivem de golpes para sobreviver. Eles estÃ£o sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela regiÃ£o.', 'O Auto da Compadecida', 'compadecida.jpeg', 'Guel Arraes', 2000, 1, 1),
(65, 2, 'Uma sÃ©rie de assassinatos abala a rotina da cidade de JoinlÃ¢ndia, e o subdelegado Claudio recebe a ajuda da destemida e experiente investigadora Keyla. No entanto, a diferenÃ§a de ritmo e a falta de quÃ­mica dos dois sÃ³ atrapalha a soluÃ§Ã£o do caso.', 'Uma Quase Dupla', 'quasedupla.jpeg', 'Marcus Baldini', 2018, 1, 1),
(66, 2, 'ClÃ¡udio e Helena sÃ£o casados hÃ¡ muitos anos e enfrentam a rotina do casamento. Um dia eles sÃ£o atingidos por um fenÃ´meno inexplicÃ¡vel e trocam de corpos. Apavorados, eles tentam lidar com a situaÃ§Ã£o atÃ© encontrar uma soluÃ§Ã£o para reverter o acontecimento bizarro. Mas Ã  medida que vÃ£o enfrentando obstÃ¡culos, eles passam a aprender e a entender mais sobre o outro.', 'Se Eu Fosse VocÃª', 'fossevoce.jpeg', 'Daniel Filho', 2006, 1, 1),
(67, 2, 'Jorge sofre um acidente na vÃ©spera do Natal e acorda um ano depois, sem lembranÃ§as do que ocorreu nesse perÃ­odo de tempo.', 'Tudo Bem no Natal Que Vem', 'tudobemnatalvem.jpeg', 'Roberto Santucci', 2020, 1, 1),
(68, 2, 'Policarpo Ã© um patriota chauvinista; ele tenta encontrar soluÃ§Ãµes para os problemas brasileiros, utilizando apenas os recursos de seu prÃ³prio paÃ­s. Seu temperamento visionÃ¡rio e idealista estÃ¡ por trÃ¡s de suas ideias estranhas sobre como construir uma grande naÃ§Ã£o.', 'Policarpo Quaresma, HerÃ³i do Brasil', 'policarpo.jpeg', 'Paulo Thiago', 1998, 1, 1),
(69, 2, 'Comandando um grupo de jovens guerrilheiros, Carlos Marighella tenta divulgar sua luta contra a ditadura para o povo brasileiro, mas a censura descredita a revoluÃ§Ã£o. Seu principal opositor Ã© LÃºcio, policial que o rotula como inimigo pÃºblico do paÃ­s.', 'Marighella', 'marighella.jpeg', 'Wagner Moura', 2021, 1, 1),
(70, 2, 'As irmÃ£s Tina, Bianca, Alice e Karina estÃ£o em plena adolescÃªncia. Em meio aos conflitos que antecedem a fase adulta, elas ainda precisam ajudar o pai, que estÃ¡ passando por dificuldades financeiras depois que anunciaram um novo aumento no aluguel. Baseado no livro homÃ´nimo de Maria Mariana, que tambÃ©m originou a peÃ§a de teatro e a sÃ©rie televisiva.', 'ConfissÃµes de Adolescente', 'confissaoadolescente.jpeg', 'Daniel Filho', 2014, 1, 1),
(71, 2, 'TrÃªs amigos passam por fases em seus relacionamentos. Fernando tenta lidar com um divÃ³rcio, enquanto HonÃ³rio desconfia da traiÃ§Ã£o de sua mulher e Afonsinho quer vencer seu bloqueio com namoros.', 'E AÃ­... Comeu?', 'eaicomeu.jpeg', 'Felipe Joffily', 2012, 1, 1),
(72, 2, 'A comunidade do AlemÃ£o no Rio de Janeiro Ã© conhecida pela sua alta taxa de criminalidade. Mais uma vez, uma equipe enfrenta o trÃ¡fico de drogas para tentar realizar as missÃµes necessÃ¡rias dentro do complexo.', 'AlemÃ£o 2', 'alemao2.jpeg', 'JosÃ© Eduardo Belmonte', 2022, 1, 1),
(73, 2, 'Desprezado pela ex-namorada, Beto tenta o suicÃ­dio e Ã© salvo pelo vigarista Marco Polo, que promete ajudar seu novo amigo a reatar com a amada. Mas quando Marco Polo conhecer esta mulher, os planos mudam.', 'Os Penetras', 'ospenetras.jpeg', 'Andrucha Waddington', 2012, 1, 1),
(74, 2, 'ApÃ³s herdar a fortuna de Tereza Cristina, CrÃ´ estÃ¡ cansado da vida de milionÃ¡rio. Decidido a encontrar uma nova musa a quem possa dedicar sua vida, ele inicia uma busca pessoal que faz com que entreviste diversas peruas. Seu objetivo Ã© encontrar aquela que seja melhor qualificada para que ele prÃ³prio possa servir como mordomo, assim como fez com sua antiga patroa. Entretanto, apÃ³s muito avaliar, acaba percebendo que sua musa ideal Ã© justamente aquela que jamais havia imaginado.', 'CrÃ´ - O Filme', 'cro.jpeg', 'Bruno Barreto', 2013, 1, 1),
(75, 2, 'Cinco amigos de adolescÃªncia se reencontram e compartilham a frustraÃ§Ã£o de estarem sem dinheiro. Para recuperar o tempo perdido, eles decidem assaltar uma transportadora de valores, mas nem tudo sai como planejaram.', 'Vai que DÃ¡ Certo', 'vaiquedacerto.jpeg', 'MaurÃ­cio Farias', 2013, 1, 1),
(76, 2, 'Neide se separou do marido recentemente e deseja aproveitar ao mÃ¡ximo a vida de solteira. Atrapalhada pelo filho mais novo, ela decide juntar o rapaz com uma de suas funcionÃ¡rias a todo custo.', 'A Sogra Perfeita', 'sograperfeita.jpeg', 'Cris D\'Amato', 2020, 1, 1),
(77, 2, 'AtravÃ©s do espÃ­rito do Dr. Fritz, mÃ©dico alemÃ£o falecido durante a Primeira Guerra Mundial, JosÃ© ArigÃ³ se tornou uma esperanÃ§a de cura para milhÃµes de pessoas ao redor do mundo. Ele foi alvo de crÃ­ticas por parte dos mais cÃ©ticos, mas com o apoio de sua esposa, conseguiu salvar inÃºmeras vidas por intermÃ©dio da cirurgia espiritual.', 'Predestinado: ArigÃ³ e o EspÃ­rito do Dr. Fri', 'predestinado.jpeg', 'Gustavo Fernandez', 2022, 1, 1),
(78, 2, 'Deco vive jogado no sofÃ¡ de sua casa, apesar de ter talento musical. Um dia, ele encontra dois grandes amores: a radialista ZoÃ© e o cachorro Guto, que desmaia toda vez que fica muito animado. NÃ£o demora muito e o trio comeÃ§a a viver junto. Mas dois anos depois, ZoÃ© termina o namoro, fica com a guarda de Guto e arranja um novo namorado. Motivos mais do que suficientes para que Deco fique revoltado e prepare uma vinganÃ§a: sequestrar Guto. Para isso, ele conta com a ajuda de seu primo LelÃ©o.', 'Mato Sem Cachorro', 'matocachorro.jpeg', 'Pedro Amorim', 2013, 1, 1),
(79, 2, 'O sonho de PÃ©rola Ã© ser uma chef de cozinha. Seu desejo fica perto de se tornar realidade quando Ã© chamada para ser assistente de um renomado chef em um programa de TV.', 'Uma Pitada de Sorte', 'pitadasorte.jpeg', 'Pedro AntÃ´nio Paes', 2022, 1, 1),
(80, 2, 'JoÃ£o Guilherme Estrella Ã© um jovem da classe mÃ©dia que se torna o rei do trÃ¡fico de drogas da zona sul do Rio de Janeiro. O rapaz inteligente e adorado pelos pais passa a ser investigado pela polÃ­cia e enfrenta a dura realidade de um criminoso.', 'Meu Nome NÃ£o Ã© Johnny', 'nomejohnny.jpeg', 'Mauro Lima ', 2008, 1, 1),
(81, 2, 'Continuando uma tradiÃ§Ã£o de famÃ­lia, Quinzinho quer levar o filho Neco para assistir a um filme de Mazzaropi. Sem fazer ideia de onde achar um cinema que ainda exiba Mazzoropi, ele e a famÃ­lia caem na estrada, sem saber da jornada que os aguarda.', 'Tapete Vermelho', 'tapetevermelho.jpeg', 'Luiz Alberto Pereira ', 2005, 1, 1),
(82, 2, 'A trajetÃ³ria profissional e pessoal de Cazuza, do inÃ­cio da carreira, em 1981, atÃ© a morte em 1990, aos 32 anos. O sucesso com o BarÃ£o Vermelho, a carreira solo, as mÃºsicas que falavam dos anseios de uma geraÃ§Ã£o, o comportamento transgressor e a coragem de continuar a carreira mesmo debilitado pela aids.', 'Cazuza - O Tempo NÃ£o PÃ¡ra', 'cazuza.jpeg', 'Sandra Werneck e Walter Carvalho ', 2004, 1, 1),
(83, 2, 'Darlene, mÃ£e solteira, volta Ã  terra natal e se casa com um homem bem mais velho, Osias Linhares. O casamento tem certa estabilidade, mas Darlene continua insatisfeita. Ela se envolve com o primo de Osias, Zezinho, que acaba se tornando seu amante. Um terceiro homem, o jovem e atraente Ciro, completa a trinca de maridos que, junto com filhos de todos eles e de alguns outros homens, formam um inusitado arranjo familiar.', 'Eu, Tu, Eles', 'eutueles.jpeg', 'Andrucha Waddington ', 2000, 1, 1),
(84, 2, 'Baby vive sozinha no apartamento que herdou da mÃ£e e dÃ¡ aulas de violÃ£o para alguns alunos. Max se muda para a unidade vizinho, e ela, apaixonada, se dispÃµe a enfrentar seu vÃ­cio compulsivo por cigarro.', 'Ã‰ Proibido Fumar', 'proibidofumar.jpeg', 'Anna Muylaert ', 2009, 1, 1),
(85, 3, 'Alexia, Luna e Kyra precisam ingressar no Programa de ProteÃ§Ã£o Ã  Testemunha e mudar de vida apÃ³s presenciarem um crime. Elas alteram o nome, a aparÃªncia, o estilo de vida e vÃ£o morar em Judas do Norte depois que sÃ£o dadas como mortas.', 'Salve-se Quem Puder', 'salvesequempuder.jpeg', 'Marcelo Travesso; Fred Mayrink', 2020, 1, 1),
(86, 3, 'JosÃ© LeÃ´ncio, fazendeiro do Pantanal, viaja para o Rio de Janeiro e engravida uma jovem. Ela se muda para o Centro-Oeste, mas fica infeliz e resolve voltar para o Rio com o filho. Vinte anos depois, o garoto volta ao Pantanal para reencontrar o pai.', 'Pantanal', 'pantanal.jpeg', 'Gustavo Fernandez.', 2022, 1, 1),
(87, 3, 'Ari Ã© um arquiteto maranhense que se dedica Ã  defesa de patrimÃ´nios histÃ³ricos. Ele e Brisa, seu amor de infÃ¢ncia, tÃªm seus destinos desencontrados quando ele vai investigar uma construtora, e ela Ã© confundida com uma sequestradora de crianÃ§as.', 'Travessia ', 'travessia.jpeg', 'Mauro MendonÃ§a Filho', 2022, 1, 1),
(88, 3, 'Lurdes, Thelma e VitÃ³ria sÃ£o mulheres que exercem a maternidade em toda sua plenitude, cada uma Ã  sua maneira. Apesar de viverem em realidades diferentes, com trajetÃ³rias distintas, elas descobrem um elo que liga suas vidas para sempre.', 'Amor de MÃ£e ', 'amordemae.jpeg', 'JosÃ© Luiz Villamarim', 2019, 1, 1),
(89, 3, 'Sol Ã© vendedora de marmitas e tambÃ©m canta no coral da igreja desde a infÃ¢ncia, mas esconde um segredo dos pais: nos anos 2000, era um fenÃ´meno dos bailes funks. Enfrentando dificuldades financeiras com a famÃ­lia, ela acaba voltando aos palcos.', 'Vai na FÃ©', 'vainafe.jpeg', 'Paulo Silvestrini Cristiano Marques', 2023, 1, 1),
(90, 3, 'Durante a primeira metade do sÃ©culo 20, Dona Lola luta para manter os integrantes de sua famÃ­lia unidos frente Ã s dificuldades financeiras que atravessam. Casada com JÃºlio e mÃ£e de quatro filhos, Lola Ã© uma mulher forte e Ã  frente de seu tempo.', 'Eramos Seis', 'eramosseis.jpeg', 'Pedro Peregrino; Carlos AraÃºjo', 2019, 1, 1),
(91, 3, 'NenÃ©m, Paula, Guilherme e FlÃ¡via nÃ£o se conheciam atÃ© o dia em que o destino os coloca dentro do mesmo aviÃ£o. ApÃ³s passarem juntos pela experiÃªncia de encarar a Morte, eles ganham uma segunda chance.', 'Quanto Mais Vida Melhor', 'quantomaisvidamelhor.jpeg', 'Pedro Brenelli Allan Fiterman', 2021, 1, 1),
(92, 3, 'Davi faz do ilusionismo sua arte e seu meio de sobreviver. Isadora tem os pÃ©s no chÃ£o e mira horizontes mais promissores. Eles precisam enfrentar grandes obstÃ¡culos, como as diferenÃ§as sociais para ficarem juntos.', 'Alem da IlusÃ£o', 'alemdailusao.jpeg', 'LuÃ­s Felipe SÃ¡', 2022, 1, 1),
(93, 3, 'Haja CoraÃ§Ã£o Ã© uma telenovela brasileira produzida pela TV Globo e exibida originalmente de 31 de maio a 8 de novembro de 2016, em 138 capÃ­tulos. Substituiu Totalmente Demais e foi substituÃ­da por Rock Story, sendo a 88Âª \"novela das sete\"\" exibida pela emissora\"', 'Haja CoraÃ§Ã£o', 'hajacoraÃ§Ã£o.jpeg', 'Teresa Lampreia', 2016, 1, 1),
(94, 3, 'A jovem e sonhadora Paloma tem o seu mundo virado do avesso quando recebe um exame errado e acredita ter sÃ³ mais seis meses de vida. Ela decide viver intensamente, atÃ© descobrir que o exame foi trocado e conhecer o homem que possui a doenÃ§a terminal.', 'Bom Sucesso', 'bomsucesso.jpeg', 'Luiz Henrique Rios', 2019, 1, 1),
(95, 3, 'Separados desde pequenos, os gÃªmeos Christian e Christofer crescem em realidades opostas. Quando finalmente se encontram, uma reviravolta muda a vida de Christian e de todos ao seu redor.', 'Um Lugar ao Sol', 'umlugaraosol.jpeg', 'MaurÃ­cio Farias', 2021, 1, 1),
(96, 3, 'Nascidas e criadas na favela de ParaisÃ³polis, as amigas-irmÃ£s Mari e Danda sonham alto e querem uma vida melhor. Contrariando os pais, o arquiteto Benjamin, namorado e sÃ³cio de Margot, quer reurbanizar a comunidade, mas acaba se apaixonando por Mari.', 'I Love Paraisopolis', 'iloveparaisopolis.jpeg', 'Wolf Maya; Carlos AraÃºjo\n', 2015, 1, 1),
(97, 3, 'Abandonada pelo marido, Carolina se muda para SÃ£o Paulo com a filha Arlete, uma linda jovem que sonha em ser modelo. PorÃ©m, por trÃ¡s do glamour do mundo da moda, estÃ¡ o tentador e perigoso submundo da prostituiÃ§Ã£o de luxo.', 'Verdades Secretas ', 'verdadessecretas.jpeg', 'Mauro MendonÃ§a Filho, Amora Mautner', 2015, 1, 1),
(98, 3, 'Duas vidas sÃ£o unidas pelos mais fortes laÃ§os, o amor e a famÃ­lia, e tambÃ©m marcadas pelos duros sentimentos de ciÃºme, culpa e inveja. Laerte Ã© consumido pelo amor Ã  prima Helena e sua obsessÃ£o cresce cada vez que o amigo VirgÃ­lio se aproxima dela.', 'Em Familia', 'emfamilia.jpeg', 'Jayme MonjardimLeonardo Nogueira', 2014, 1, 1),
(99, 3, 'Dividida entre o amor de Jonatas e Arthur, Eliza, apesar das armaÃ§Ãµes de Carolina, luta para se tornar modelo e vencer o concurso Garota Totalmente Demais.', 'Totalmente Demais', 'totalmentedemais.jpeg', 'Luis Henrique Rios', 2015, 1, 1),
(100, 3, 'Bruno tem um romance com Luana, ambos descendentes de duas famÃ­lias de imigrantes italianos rivais, os Mezengas e os Berdinazi, que fizeram fortuna no Brasil com criaÃ§Ã£o de gado e plantaÃ§Ãµes de cafÃ©, respectivamente.\n', 'O Rei do Gado', 'oreidogado.jpeg', 'Luiz Fernando Carvalho', 1996, 1, 1),
(101, 3, 'A novela aborda um problema cada vez mais grave: o trÃ¡fico de pessoas. A protagonista Ã© uma das vÃ­timas e conquistarÃ¡ o coraÃ§Ã£o de Theo (Rodrigo Lombardi), chefe da UPP de um Complexo do AlemÃ£o fictÃ­cio. Parte da novela Ã© ambientada na Turquia (Istambul e CapadÃ³cia, onde SÃ£o Jorge nasceu) e a outra parte, no Rio de Janeiro. FlÃ¡via Alessandra Ã© a tenente Ã‰rica, uma veterinÃ¡ria militar. A novela aborda tambÃ©m a fÃ© em SÃ£o Jorge da CapadÃ³cia, que representa a forÃ§a que todos precisam ter para matar os dragÃµes da vida.', 'Salve Jorge', 'salvejorge.jpeg', ' Marcos Schechtman', 2012, 1, 1);
INSERT INTO `obra` (`ID_OBRA`, `VALOR_OBRA`, `DESC_OBRA`, `NOME_OBRA`, `FOTO_OBRA`, `AU_DI_OBRA`, `ANO_OBRA`, `perfil_ID_PERFIL`, `perfil_usuario_ID_USUARIO`) VALUES
(102, 3, 'A atriz Cris ValÃªncia vai Ã  terra natal de seu namorado para protagonizar um filme dirigido por ele. Enquanto pesquisa para interpretar a personagem, Cris vive uma experiÃªncia de viagem no tempo, em que se depara com uma de suas vidas passadas.', 'Espelho da Vida', 'espelhodavida.jpeg', 'ClÃ¡udio Boeckel; Pedro Vasconcelos', 2018, 1, 1),
(103, 3, 'JosÃ© Alfredo, dono de uma rede internacional de joalherias, Ã© capaz de tudo para manter o seu poder. PorÃ©m, alguns parentes querem se apropriar de sua fortuna. Em meio a essa luta pelo poder, ela tambÃ©m enfrenta uma crise conjugal.', 'Imperio', 'imperio.jpeg', 'RogÃ©rio Gomes', 2014, 1, 1),
(104, 3, '\"Sol Nascente\"\" conta a histÃ³ria do amor improvÃ¡vel dos grandes amigos Alice e MÃ¡rio e de suas famÃ­lias imigrantes. Ã‰ passada em \"\"Arraial\"\", que alÃ©m das belas praias, Ã© uma cidade acolhedora e de fortes agitos.\"', 'Sol Nascente', 'solnascente.jpeg', 'Leonardo Nogueira', 2016, 1, 1),
(105, 3, 'Uma pequena cidade possui uma fonte com propriedades curativas e rejuvenescedoras, protegida por sete guardiÃ£es que garantem sua seguranÃ§a. Quando o poderoso gato LÃ©on desaparece, todos temem que ele tenha ido atrÃ¡s de um substituto do guardiÃ£o-mor.', 'O Setimo GuardiÃ£o ', 'osetimoguardiao.jpeg', 'Allan Fiterman', 2018, 1, 1),
(106, 3, 'JÃºlia Ã© uma paleontÃ³loga que precisa reconstruir seu trabalho e, ao encontrar Abner, um fazendeiro caipira, vive um improvÃ¡vel amor. Enquanto isso, o cientista Ãcaro tenta criar um robÃ´ que reproduza sua falecida mulher amada.', 'Morde e Assopra', 'mordeeassopra.jpeg', 'Pedro Vasconcelos', 2011, 1, 1),
(107, 3, 'Em uma sociedade onde o casamento Ã© visto como o Ãºnico futuro possÃ­vel para uma mulher de boa famÃ­lia, Elisabeta Ã© uma jovem libertÃ¡ria e cheia de sonhos que tem uma ousadia natural em sua personalidade e enfrenta os conflitos sociais e de conduta.', 'Orgulho e PaixÃ£o', 'orgulhoepaixao.jpeg', ' Fred Mayrink', 2018, 1, 1),
(108, 3, 'Seis jovens lutam para conseguir o que querem, principalmente a felicidade, um sentimento que nÃ£o se compra. Alguns demoram para entender isso, outros nunca entenderÃ£o. Mas hÃ¡ tambÃ©m aqueles que serÃ£o felizes mesmo nas circunstÃ¢ncias mais adversas.', 'Sangue Bom', 'sanguebom.jpeg', 'Dennis Carvalho', 2013, 1, 1),
(109, 3, 'Para evitar uma guerra entre os reinos de Montemor e Artena, o prÃ­ncipe Afonso deixa de lado seu amor por uma doce plebeia para casar com uma princesa mimada e malvada', 'Deus Salve o Rei', 'deussalve.jpeg', 'FabrÃ­cio Mamberti', 2018, 1, 1),
(110, 3, 'O famoso cantor de axÃ© Beto FalcÃ£o estÃ¡ em plena decadÃªncia no final dos anos 1990 em Salvador, atÃ© que um aviÃ£o em que ele deveria estar cai e ele Ã© dado como morto. Beto vÃª sua imagem ser ovacionada e precisa deixar a cidade para continuar assim.\n', 'Segundo Sol', 'segundosol.jpeg', 'Maria de MÃ©dicis,Dennis Carvalho', 2018, 1, 1),
(111, 3, 'Candinho foi separado da mÃ£e logo apÃ³s seu nascimento e acolhido por um casal dono de uma fazenda. Mas quando cresce, Candinho Ã© expulso por se apaixonar pela primogÃªnita, Filomena. Candinho segue para a capital em busca da mÃ£e biolÃ³gica.', 'ÃŠta Mundo Bom!', 'etamundo.jpeg', 'Jorge Fernando\n', 2016, 1, 1),
(112, 3, 'A novela tem como eixo central o romance inter-racial vivido pelo botÃ¢nico rico Paco e a feirante pobre Preta. Os dois se apaixonam, mas enfrentam grandes desafios em nome do amor.', 'A Cor do Pecado', 'acor.jpeg', 'Denise Saraceni', 2004, 1, 1),
(113, 3, 'Poliana precisa enfrentar os dilemas tÃ­picos da adolescÃªncia, como os dramas escolares, os planos para o futuro e a descoberta do amor entre o ex-valentÃ£o, Eric, e seu melhor amigo, JoÃ£o, encontrando em Helena uma rival no coraÃ§Ã£o dos dois.', 'Poliana MoÃ§a', 'polianamoÃ§a.jpeg', 'Ricardo Mantoanelli', 2022, 1, 1),
(114, 3, 'Poliana Ã© uma menina amorosa que fica sozinha no mundo apÃ³s a morte de seu pai. Uma assistente social a envia para a casa de uma tia distante, uma matriarca autoritÃ¡ria.', 'As Aventuras de Poliana', 'aventuraspoliana.jpeg', 'Reynaldo Boury', 2018, 1, 1),
(115, 3, 'Manuela e Isabela, irmÃ£s gÃªmeas, foram separadas apÃ³s o nascimento e se reencontram somente apÃ³s 12 anos. Elas decidem trocar de lugar, mas o plano nÃ£o funciona tÃ£o bem quando uma competiÃ§Ã£o musical comeÃ§a e as duas tentam manter a farsa.', 'CÃºmplices de um Resgate', 'cumplices.jpeg', 'Reynaldo Boury', 2015, 1, 1),
(116, 3, 'Esmeralda Ã© uma moÃ§a cega que nasce aparentemente morta numa famÃ­lia rica. A parteira e a governanta resolvem trocar a menina por um menino, filho de uma camponesa que morreu no parto.', 'Esmeralda', 'esmeralda.jpeg', 'Henrique Martins', 2004, 1, 1),
(117, 3, 'No orfanato Raio de Luz, Mili e suas amigos enfrentam juntos os desafios da vida.', 'Chiquititas', 'chiquititas.jpeg', 'Reynaldo Boury', 2013, 1, 1),
(118, 3, 'PÃ©rola Negra Ã© uma telenovela brasileira produzida pelo Sistema Brasileiro de TelevisÃ£o e exibida de 9 de novembro de 1998 a 18 de junho de 1999 em 197 capÃ­tulos. Substituiu FascinaÃ§Ã£o e foi substituÃ­da por A Usurpadora, encerrando a dramaturgia da emissora naquele momento.', 'PÃ©rola Negra', 'perolanegra.jpeg', 'Antonino Seabra', 1998, 1, 1),
(119, 3, 'Dulce Maria Ã© filha Ãºnica de Gustavo e Tereza e tem 5 anos. Mas ao perder a mÃ£e, passa a viver no colÃ©gio Doce Horizonte, internato religioso da zona rural, sem contato com o pai.', 'Carinha de Anjo', 'carinhaanjo.jpeg', 'Ricardo Mantoanelli', 2016, 1, 1),
(120, 3, 'A saga de MoisÃ©s, desde seu nascimento atÃ© a chegada de seu povo Ã  Terra Prometida.', 'Os Dez Mandamentos', 'dezmandamentos.jpeg', '', 2015, 1, 1),
(121, 3, 'A histÃ³ria de grandes eventos dos primeiros 2300 anos da humanidade. A criaÃ§Ã£o do mundo, AdÃ£o e Eva, o grande dilÃºvio, a Torre de Babel e a jornada de AbraÃ£o, chegando atÃ© o perÃ­odo de escravidÃ£o do povo hebreu no Egito.', 'GÃªnesis', 'genesis.jpeg', 'Edgard Miranda', 2021, 1, 1),
(122, 3, 'A Escrava Isaura Ã© uma telenovela brasileira produzida e exibida pela RecordTV entre 18 de outubro de 2004 a 29 de abril de 2005 em 167 capÃ­tulos, substituindo parte do horÃ¡rio ocupado pelo Cidade Alerta e sendo substituÃ­da por Essas Mulheres.', 'A Escrava Isaura', 'escravaisaura.jpeg', 'Herval Rossano', 2004, 1, 1),
(123, 3, 'A novela aborda as consequÃªncias do poder do dinheiro na vida das pessoas. O BolÃ£o da Amizade Ã© um grupo de dez amigos de origem humilde que toda semana se reÃºne para apostar na loteria. ApÃ³s dois anos de tentativas frustradas, os amigos finalmente ganham um prÃªmio de 200 milhÃµes de reais, mas hÃ¡ um pacto: cada um dos vencedores sÃ³ terÃ¡ acesso Ã  sua parte do dinheiro se cumprirem com determinadas missÃµes. A trama mostra as mudanÃ§as que o dinheiro causa na vida dessas pessoas e o cumprimento do pacto firmado entre os vencedores.', 'Vidas em Jogo', 'vidasemjogo.jpeg', ' Alexandre Avancini', 2011, 1, 1),
(124, 3, 'Em tom de comÃ©dia romÃ¢ntica e momentos de grande suspense, confira a histÃ³ria de uma menina que se perdeu dos pais e busca o final feliz com o reencontro de sua famÃ­lia.', 'Prova de Amor', 'provadeamor.jpeg', 'Alexandre Avancini', 2005, 1, 1),
(125, 3, 'Rebeldes foi um grupo musical brasileiro surgido em 2011 na telenovela juvenil Rebelde, produzida pela RecordTV. ', 'Rebeldes', 'rebeldes.jpeg', 'Ivan Zettel', 2011, 1, 1),
(126, 4, 'A primeira, uma viagem de Ã´nibus em que as vozes de doze personagens se confundem e se chocam. A segunda, uma galeria de arte cuja principal exibiÃ§Ã£o nÃ£o Ã© propriamente a arte. E a terceira, uma sÃ©rie de cartas Ã¡cidas e sombrias escritas por uma escritora amargurada. TrÃªs contos que se encontram e se completam.', 'CoraÃ§Ãµes Ruidosos em Queda Livre', 'coracoesruidosos.jfif', 'Alex Sens', 2018, 1, 1),
(127, 4, 'Nas profundezas do sertÃ£o baiano, as irmÃ£s Bibiana e BelonÃ­sia encontram uma velha e misteriosa faca na mala guardada sob a cama da avÃ³. Ocorre entÃ£o um acidente. E para sempre suas vidas estarÃ£o ligadas â€” a ponto de uma precisar ser a voz da outra.', 'Torto Arado ', 'tortoarado.jfif', 'Itamar Viera Junior', 2019, 1, 1),
(128, 4, 'HÃ¡ uma guerra no cÃ©u. O confronto civil entre o arcanjo Miguel e as tropas revolucionÃ¡rias de seu irmÃ£o, Gabriel, devasta as sete camadas do paraÃ­so. Com as legiÃµes divididas, as fortalezas sitiadas, os generais estabeleceram um armistÃ­cio na terra, uma trÃ©gua frÃ¡gil e delicada, que pode desmoronar a qualquer instante.\nEnquanto os querubins se enfrentam num embate de sangue e espadas, dois anjos sÃ£o enviados ao mundo fÃ­sico com a tarefa de resgatar Kaira, uma capitÃ£ dos exÃ©rcitos rebeldes, desaparecida enquanto investigava uma suposta violaÃ§Ã£o do tratado. A missÃ£o revelarÃ¡ as tramas de uma conspiraÃ§Ã£o milenar, um plano que, se concluÃ­do, reverterÃ¡ o equilÃ­brio de forÃ§as no cÃ©u e ameaÃ§arÃ¡ toda vida humana na terra.\nAo lado de Denyel, um ex-espiÃ£o em busca de anistia, os celestiais partirÃ£o em uma jornada atravÃ©s de cidades, selvas e mares, enfrentarÃ£o demÃ´nios e deuses, numa trilha que os levarÃ¡ Ã s ruÃ­nas da maior naÃ§Ã£o terrena anterior ao dilÃºvio â€“ o reino perdido de AtlÃ¢ntida.', 'Filhos do Ã‰den: herdeiros de AtlÃ¢ntica', 'filhosdoeden1.jpg', 'Eduardo Spohr', 2012, 1, 1),
(129, 4, 'Machado de Assis (1839-1908), escrevendo Dom Casmurro, produziu um dos maiores livros da literatura universal. Mas criando Capitu, a espantosa menina de \"olhos oblÃ­quos e dissimulados\"\", de \"\"olhos de ressaca\"\", Machado nos legou um incrÃ­vel mistÃ©rio, um mistÃ©rio atÃ© hoje indecifrado. HÃ¡ quase cem anos os estudiosos e especialistas o esmiuÃ§am, o analisam sob todos os aspectos. Em vÃ£o. Embora o autor se tenha dado ao trabalho de distribuir pelo caminho todas as pistas para quem quisesse decifrar o enigma, ninguÃ©m ainda o desvendou. A alma de Capitu Ã©, na verdade, um labirinto sem saÃ­da, um labirinto que Machado tambÃ©m jÃ¡ explorara em personagens como VirgÃ­lia (MemÃ³rias PÃ³stumas de BrÃ¡s Cubas) e Sofia (Quincas Borba), personagens construÃ­das a partir da ambigÃ¼idade psicolÃ³gica, como Jorge Luis Borges gostaria de ter inventado.\"', 'Dom Casmurro', 'domcasmurro', 'Machado de Assis', 1997, 1, 1),
(130, 4, 'Fazendo meu filme Ã© um livro encantador, daqueles que lemos compulsivamente e, quando terminamos, sentimos saudade. NÃ£o hÃ¡ como nÃ£o se envolver com Fani, suas descobertas e seus anseios, tÃ­picos da adolescÃªncia. Uma histÃ³ria bem-humorada e divertida que conquista o leitor a cada pÃ¡gina.\nSeja a relaÃ§Ã£o com a famÃ­lia, consigo mesma e com o mundo; seja a convivÃªncia com as amigas, na escola e nas festas; seja a relaÃ§Ã£o com seu melhor amigo e confidente. Tudo muda na vida de EstefÃ¢nia quando surge a oportunidade de fazer um intercÃ¢mbio e morar um ano em outro paÃ­s. As reveladoras conversas por telefone ou MSN e os constantes bilhetinhos durante a aula passam a ter outro assunto: a viagem que se aproxima.\n\nÃ‰ sobre isto que trata este livro: o fascinante universo de uma menina cheia de expectativas, que vive a dÃºvida entre continuar sua rotina, com seus amigos, familiares, estudos e seu inesperado novo amor, ou se aventurar em outro paÃ­s e mergulhar num mundo cheio de novas possibilidades. As melhores cenas da vida de Fani podem ainda estar por vir.', 'Fazendo meu Fillme ', 'fazendomeufilme.jpg', 'Paula Pimenta', 2009, 1, 1),
(131, 4, 'Publicado em 1937, pouco depois de implantado o Estado Novo, este livro teve a primeira ediÃ§Ã£o apreendida e exemplares queimados em praÃ§a pÃºblica de Salvador por autoridades da ditadura. Em 1940, marcou Ã©poca na vida literÃ¡ria brasileira, com nova ediÃ§Ã£o, e a partir daÃ­, sucederam-se as ediÃ§Ãµes nacionais e em idiomas estrangeiros. A obra teve tambÃ©m adaptaÃ§Ãµes para o rÃ¡dio, teatro e cinema. Documento sobre a vida dos meninos abandonados nas ruas de Salvador, Jorge Amado a descreve em pÃ¡ginas carregadas de beleza, dramaticidade e lirismo.', 'CapitÃ¢es de Areia ', 'capitraesdeareias.jpg', 'Jorge Amado', 2000, 1, 1),
(132, 4, 'O que impulsiona os personagens Ã© a seca, Ã¡spera e cruel, e paradoxalmente a ligaÃ§Ã£o telÃºrica, afetiva, que expÃµe naqueles seres em retirada, Ã  procura de meios de sobrevivÃªncia e um futuro. Apesar desse sentimento de transbordante solidariedade e compaixÃ£o com que a narrativa acompanha a miÃºda saga do vaqueiro Fabiano e sua gente, o autor contou: \"Procurei auscultar a alma do ser rude e quase primitivo que mora na zona mais recuada do sertÃ£o... os meus personagens sÃ£o quase selvagens... pesquisa que os escritores regionalistas nÃ£o fazem e nem mesmo podem fazer ...porque comumente nÃ£o sÃ£o familiares com o ambiente que descrevem...Fiz o livrinho sem paisagens, sem diÃ¡logos. E sem amor. A minha gente, quase muda, vive numa casa velha de fazenda. As pessoas adultas, preocupadas com o estÃ´mago, nÃ£o tem tempo de abraÃ§ar-se. AtÃ© a cachorra [Baleia] Ã© uma criatura decente, porque na vizinhanÃ§a nÃ£o existem galÃ£s caninos\"\". VIDAS SECAS Ã© o livro em que Graciliano, visto como antipoÃ©tico e anti-sonhador por excelÃªncia, consegue atingir, com o rigor do texto que tanto prezava, um estado maior de poesia.\"', 'Vidas Secas', 'vidassecas.jpg', 'Graciliano Ramo', 2005, 1, 1),
(133, 4, 'O livro que iniciou a sÃ©rie com os Karas. Uma turma de adolescentes enfrenta o mais diabÃ³lico dos crimes. Num clima de muito mistÃ©rio e suspense, cinco estudantes, os Karas, enfrentam uma macabra trama internacional: o sinistro Doutor QI pretende subjugar a humanidade aos seus desÃ­gnios, aplicando na juventude uma perigosa droga. E essa droga jÃ¡ estÃ¡ sendo experimentada em alunos dos melhores colÃ©gios de SÃ£o Paulo. Esse Ã© um trabalho para os Karas: o avesso dos coroas, o contrÃ¡rio dos caretas.', 'A droga da obediÃªncia (Os Karas #1)', 'adrogadaobediencia.jpg', 'Pedro Bandeira ', 2003, 1, 1),
(134, 4, 'O jovem pastor Santiago tem um sonho que se repete. O sonho fala de um tesouro oculto, guardado perto das PirÃ¢mides do Egito. Decidido a seguir seu sonho, o rapaz se depara com os grandes mistÃ©rios que acompanham a raÃ§a humana desde a sua criaÃ§Ã£o; o Amor, os sinais de Deus, o sonho que cada um de nÃ³s precisa seguir na vida.\nA peregrinaÃ§Ã£o de Santiago, narrada pelo escritor Paulo Coelho em O alquimista transformou-se num dos maiores fenÃ´menos literÃ¡rios. Caminhando em uma caravana pelo deserto do Saara, ele entra em contato com pessoas e pressÃ¡gios que lhe indicam o caminho a seguir. Entre eles, um misterioso personagem - um Alquimista.\nÃ‰ quem irÃ¡ ensinÃ¡-lo a penetrar na Alma do Mundo, e a receber todas as pistas necessÃ¡rias para chegar atÃ© o tesouro.', 'O alquimista', 'oalquimista.jpg', 'Paulo Coelho', 2006, 1, 1),
(135, 4, 'Um grupo de jovens deixa uma pequena cidade no ParanÃ¡ para viver no Rio de Janeiro. Eles alugam um apartamento em Copacabana e fazem o possÃ­vel para pagar a faculdade e manter vivos seus sonhos de sucesso na capital fluminense. Mas o dinheiro estÃ¡ curto e o aluguel estÃ¡ vencido. Para sair do buraco e manter o apartamento, os amigos adotam uma estratÃ©gia heterodoxa: arrecadar fundos por meio de jantares secretos, divulgados pela internet para uma clientela exclusiva da elite carioca. No cardÃ¡pio: carne humana. A partir daÃ­, eles se envolvem numa espiral de crimes, descobrem uma rede de contrabando de corpos, matadouros clandestinos, grÃ£-finos excÃªntricos e levam ao limite uma Ã­ndole perversa que jamais imaginaram existir em cada um deles.', 'Jantar Secreto', 'jantarsecreto.jpg', 'Raphael Montes', 2016, 1, 1),
(136, 4, 'Com uma narrativa madura, precisa e ao mesmo tempo delicada e poÃ©tica, o romance narra a histÃ³ria do casal Dalva e VenÃ¢ncio, que tem a vida transformada apÃ³s uma perda trÃ¡gica, resultado do ciÃºme doentio do marido, e de Lucy, a prostituta mais depravada e cobiÃ§ada da cidade, que entra no caminho deles, formando um triÃ¢ngulo amoroso.\n\nNa orelha do livro, Martha Medeiros escreve: â€œTudo Ã© rio Ã© uma obra-prima, e nÃ£o hÃ¡ exagero no que afirmo. Ã‰ daqueles livros que, ao ser terminado, dÃ¡ vontade de comeÃ§ar de novo, no mesmo instante, desta vez para se demorar em cada linha, saborear cada frase, deixar-se abraÃ§ar pela poesia da prosa. Na primeira leitura, essa entrega mais lenta Ã© quase impossÃ­vel, pois a correnteza dos acontecimentos nos leva atÃ© a Ãºltima pÃ¡gina sem nos dar chance para respirar. Ã‰ preciso manter-se Ã  tona ou a gente se afoga.â€\n\nA metÃ¡fora do rio se revela por meio da narrativa que flui â€“ ora intensa, ora mais branda â€“ de forma ininterrupta, mas tambÃ©m por meio do suor, da saliva, do sangue, das lÃ¡grimas, do sÃªmen, e Carla faz isso sem ser apelativa, sem sentimentalismo barato, com a habilidade que sÃ³ os melhores escritores possuem.', 'Tudo Ã© Rio', 'tudoerio.jpg', 'Carla Madeira ', 2021, 1, 1),
(137, 4, 'Felipe estÃ¡ esperando por esse momento desde que as aulas comeÃ§aram: o inÃ­cio das fÃ©rias de julho. Finalmente ele vai poder passar alguns dias longe da escola e dos colegas que o maltratam. Os planos envolvem se afundar nos episÃ³dios atrasados de suas sÃ©ries favoritas, colocar a leitura em dia e aprender com tutoriais no YouTube coisas novas que ele nunca vai colocar em prÃ¡tica.\n\nMas as coisas fogem um pouco do controle quando a mÃ£e de Felipe informa que concordou em hospedar Caio, o vizinho do 57, por longos quinze dias, enquanto os pais dele estÃ£o viajando. Felipe entra em desespero porque a) Caio foi sua primeira paixÃ£ozinha na infÃ¢ncia (e existe uma grande possibilidade dessa paixÃ£o nÃ£o ter passado atÃ© hoje) e b) Felipe coleciona uma lista infinita de inseguranÃ§as e nÃ£o tem a menor ideia de como interagir com o vizinho.\n\nOs dias que prometiam paz, tranquilidade e maratonas Ã©picas de Netflix acabam trazendo um turbilhÃ£o de sentimentos, que obrigarÃ£o Felipe a mergulhar em todas as questÃµes mal resolvidas que ele tem consigo mesmo.', 'Quinze Dias', 'quinzedias.jpg', 'Vitor Martins ', 2017, 1, 1),
(138, 4, 'A vida de uma mulher, dos 8 aos 52, desde as singelezas cotidianas atÃ© as tragÃ©dias que persistem, uma geraÃ§Ã£o apÃ³s a outra. Um livro denso e leve, violento e poÃ©tico. Ã‰ assim O peso do pÃ¡ssaro morto, romance de estreia de Aline Bei, onde acompanhamos uma mulher que, com todas as forÃ§as, tenta nÃ£o coincidir apenas com a dor de que Ã© feita.\n', 'O peso do pÃ¡ssaro morto', 'passaromorto.jpg', 'Aline Bei ', 2017, 1, 1),
(139, 4, 'Jonas nÃ£o sabe muito bem o que fazer da vida. Entre suas leituras e ideias para livros anotadas em um caderninho de bolso, ele precisa dar conta de seus turnos no Rocket CafÃ© e ainda lidar com o conservadorismo de seus pais, sua mÃ£e alimenta a esperanÃ§a de que ele volte a frequentar a igreja, e seu pai nÃ£o faz muito por ele alÃ©m de trazer problemas.\nMas Ã© quando ele conhece Arthur, um belo garoto de barba ruiva, que Jonas passa a questionar por quanto tempo conseguirÃ¡ viver sob as expectativas de seus pais, fingindo ser uma pessoa diferente de quem Ã© de verdade. Buscando conforto em seus amigos (e na sua histÃ³ria sobre dois piratas bonitÃµes que se parecem muito com ele e Arthur), Jonas entenderÃ¡ o verdadeiro significado de famÃ­lia e amizade, e descobrirÃ¡ o poder de uma boa histÃ³ria.', 'Um MilhÃ£o de Finais Felizes ', 'finaisfelizes.jpg', 'Vitor Martins ', 2018, 1, 1),
(140, 4, 'A vida de Luna estÃ¡ uma bagunÃ§a! O namorado a traiu com a vizinha, seu carro passa mais tempo na oficina do que com ela e seu chefe vive trocando seu nome.\nRecÃ©m-formada em jornalismo, ela trabalha como recepcionista na renomada Fatos&Furos. Mas, em tempos de internet e notÃ­cias instantÃ¢neas, a revista enfrenta problemas e o quadro de jornalistas diminuiu drasticamente. Ã‰ assim que a coluna do horÃ³scopo semanal cai no colo dela. Embora nÃ£o tenha a menor ideia de como fazer um mapa astral e nÃ£o acredite em nenhum tipo de magia, Luna aceita o desafio sem pestanejar. Afinal, quÃ£o complicado pode ser criar um texto em que ninguÃ©m presta atenÃ§Ã£o?\nMas a garota nem desconfia dos perigos que a aguardam e, entre muitas confusÃµes, surge uma indesejada, porÃ©m irresistÃ­vel paixÃ£o que vai abalar o seu mundo. O romance perfeito nÃ£o fosse com o homem errado. Sem saÃ­da, Luna terÃ¡ que lutar com todas as forÃ§as contra a magia mais poderosa de todas, que atÃ© entÃ£o ela desconhecia: o amor.\nCom seu estilo Ã¡gil e fluido, Carina Rissi criou em No mundo da Luna uma leitura viciante, permeada de humor, magia e paixÃ£o, que vai conquistar vocÃª do inÃ­cio ao fim.', 'No mundo da Luna ', 'mundoluna.jpg', 'Craina Rissi ', 2015, 1, 1),
(141, 4, 'Do diÃ¡rio da catadora de papel Carolina Maria de Jesus surgiu este autÃªntico exemplo de literatura-verdade, que relata o cotidiano triste e cruel da vida na favela. Com uma linguagem simples, mas contundente e original, a autora comove o leitor pelo realismo e pela sensibilidade na maneira de contar o que viu, viveu e sentiu durante os anos em que morou na comunidade do CanindÃ©, em SÃ£o Paulo, com seus trÃªs filhos.\n\nAo ler este relato-verdadeiro best-seller no Brasil e no exterior- vocÃª vai acompanhar o duro dia a dia de quem nÃ£o tem amanhÃ£. E vai perceber que, mesmo tendo sido escrito na dÃ©cada de 1950, este livro jamais perdeu sua atualidade.', 'Quarto de Despejo', 'quartodedespejo.jpg', 'Carolina Maria de Jesus ', 2014, 1, 1),
(142, 4, 'Em Olhos dâ€™Ã¡gua ConceiÃ§Ã£o Evaristo ajusta o foco de seu interesse na populaÃ§Ã£o afro-brasileira abordando, sem meias palavras, a pobreza e a violÃªncia urbana que a acometem.\n\nSem sentimentalismos, mas sempre incorporando a tessitura poÃ©tica Ã  ficÃ§Ã£o, seus contos apresentam uma significativa galeria de mulheres: Ana Davenga, a mendiga Duzu-QuerenÃ§a, Natalina, Luamanda, Cida, a menina ZaÃ­ta. Ou serÃ£o todas a mesma mulher, captada e recriada no caleidoscÃ³pio da literatura em variados instantÃ¢neos da vida? Elas diferem em idade e em conjunturas de experiÃªncias, mas compartilham da mesma vida de ferro, equilibrando-se na frÃ¡gil vara que, lemos no conto O cooper de Cida, Ã© a corda bamba do tempo.\n\nEm Olhos dâ€™Ã¡gua estÃ£o presentes mÃ£es, muitas mÃ£es. E tambÃ©m filhas, avÃ³s, amantes, homens e mulheres â€“ todos evocados em seus vÃ­nculos e dilemas sociais, sexuais, existenciais, numa pluralidade e vulnerabilidade que constituem a humana condiÃ§Ã£o. Sem quaisquer idealizaÃ§Ãµes, sÃ£o aqui recriadas com firmeza e talento as duras condiÃ§Ãµes enfrentadas pela comunidade afro-brasileira.\n\nConceiÃ§Ã£o Evaristo Ã© mestra em Literatura Brasileira pela PUC-Rio, e doutora em Literatura Comparada pela Universidade Federal Fluminense. Suas obras, em especial o romance PonciÃ¡ VicÃªncio, de 2003, abordam temas como a discriminaÃ§Ã£o racial de gÃªnero e de classe. A obra foi traduzida para o inglÃªs e publicada nos Estados Unidos em 2007.', 'Olhos d\'Ãgua', 'olhosdagua.jpg', 'ConceiÃ§Ã£o Evaristo', 2014, 1, 1),
(143, 4, 'Em seu livro de estreia, Pedro Rhuas traz uma histÃ³ria sobre amor Ã  primeira vista, encontros e desencontros, cultura nordestina, mÃºsica pop e drag queens.\n\nNenhum encontro Ã© por acaso.\n\nA vida tem sido boa para Lucas. Ele passou no Enem para estudar publicidade; se mudou com Eric, seu melhor amigo, do interior do Rio Grande do Norte para a capital; e conseguiu sua tÃ£o aguardada liberdade. Mas, no amor, Lucas Ã© um desastre. O maior fÃ£ de Katy Perry no Nordeste tem certeza de que nem toda a sorte do mundo poderia fazer com que ele finalmente se apaixonasse pela primeira vez.\n\nAtÃ© que, em uma despretensiosa noite de sÃ¡bado em 2015, tudo muda. Quando Lucas e Eric vÃ£o na inauguraÃ§Ã£o do Titanic, a mais nova balada da cidade, Lucas esbarra (literalmente!) em Pierre, um lindo garoto francÃªs que parece ter saÃ­do dos seus sonhos. Em meio a drinques, segredos e sonhos partilhados, Lucas e Pierre se conectam instantaneamente. Eles vivem o encontro mais especial de suas vidas, mas o Universo tem outros planos para o futuroâ€¦ AtÃ© a noite acabar, o que serÃ¡ que vai acontecer com eles?\n\nCom uma voz original e divertida, repleta de referÃªncias pop e Ã  cultura do Rio Grande do Norte, o livro de estreia de Pedro Rhuas vai te fazer rir alto e se apaixonar.', 'Enquanto Eu NÃ£o te Encontro', 'enquantoeunaoteencontro.jpg', 'Pedro Rhuas ', 2021, 1, 1),
(144, 4, 'Julia Ã© filha de pais separados: sua mÃ£e nÃ£o suporta a ideia de ter sido abandonada pelo marido, enquanto seu pai nÃ£o suporta a ideia de ter sido casado. Sufocada por uma atmosfera de brigas constantes e falta de afeto, a jovem escritora tenta reconhecer sua individualidade e dar sentido Ã  sua histÃ³ria, tentando se desvencilhar dos traumas familiares.\n\nEntre lembranÃ§as da infÃ¢ncia e da adolescÃªncia, e sonhos para o futuro, Julia encontra personagens essenciais para enfrentar a solidÃ£o ao mesmo tempo que ensaia sua prÃ³pria coreografia, numa sequÃªncia de movimentos de aproximaÃ§Ã£o e afastamento de seus pais que lhe traz marcas indelÃ©veis.', 'Pequena Coreografia do Adeus ', 'coreodoadeus.jpg', 'Aline Bei ', 2021, 1, 1),
(145, 4, 'O avesso da pele Ã© a histÃ³ria de Pedro, que, apÃ³s a morte do pai, assassinado numa desastrosa abordagem policial, sai em busca de resgatar o passado da famÃ­lia e refazer os caminhos paternos. Com uma narrativa sensÃ­vel e por vezes brutal, Jeferson TenÃ³rio traz Ã  superfÃ­cie um paÃ­s marcado pelo racismo e por um sistema educacional falido, e um denso relato sobre as relaÃ§Ãµes entre pais e filhos.\n\nO que estÃ¡ em jogo Ã© a vida de um homem abalado pelas inevitÃ¡veis fraturas existenciais da sua condiÃ§Ã£o de negro em um paÃ­s racista, um processo de dor, de acerto de contas, mas tambÃ©m de redenÃ§Ã£o, superaÃ§Ã£o e liberdade. Com habilidade incomum para conceber e estruturar personagens e de lidar com as complexidades e pequenas tragÃ©dias das relaÃ§Ãµes familiares, Jeferson TenÃ³rio se consolida como uma das vozes mais potentes e estilisticamente corajosas da literatura brasileira contemporÃ¢nea.\n', 'O Avesso da Pele ', 'avessodapele.jpg', 'Jefferson TenÃ³rio ', 2020, 1, 1),
(146, 4, 'Amizade Ã© tudo na vida! Disso Malu sabe muito bem, afinal, viveu as mais variadas experiÃªncias com cada uma delas rindo, chorando, brigando, brincando, curtindo e fofocando muito. Em Fala sÃ©rio, amiga!, tÃ­tulo que fecha a sÃ©rie da divertida personagem Malu precedida pelos best-sellers Fala sÃ©rio, mÃ£e!, Fala sÃ©rio, professor! e Fala sÃ©rio, amor! , a carioca Thalita RebouÃ§as dÃ¡ voz Ã  protagonista, que puxa, da memÃ³ria e do coraÃ§Ã£o, tudo o que vivenciou com suas melhores amigas, como Alice, da infÃ¢ncia atÃ© o fim da adolescÃªncia.', 'Fala SÃ©rio, Amiga!', 'falaserioamg.jpg', 'Talita RebouÃ§as ', 2008, 1, 1),
(147, 4, 'Aos dezesseis anos, Brianna Hamilton fugiu da Inglaterra para a EscÃ³cia, abandonando sua famÃ­lia e as obrigaÃ§Ãµes como herdeira de um duque. Em meio aos prados escoceses, a jovem encontrou refÃºgio e descobriu mais sobre a mulher que desejava ser. Mas, onze anos apÃ³s a fuga, uma dolorosa verdade farÃ¡ com que ela deseje nunca ter partido.\n\nVoltar serÃ¡ como relembrar o passado, a fuga, o medo e as escolhas que precisou fazer. E, enquanto luta para reconquistar seu lugar junto Ã  famÃ­lia, Brianna precisarÃ¡ superar Desmond Hunter, melhor amigo e primeiro amor, que anos atrÃ¡s ela escolheu deixar para trÃ¡s.\n\nVolte para mim Ã© um romance arrebatador sobre recomeÃ§os, sentir-se inteira e, acima de tudo, confiar no amor.', 'Volte Para Mim', 'voltepmim.jpg', 'Paola Aleksandra', 2018, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `ID_PERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_PERFIL` varchar(45) CHARACTER SET utf8 NOT NULL,
  `USERNAME_PERFIL` varchar(30) CHARACTER SET utf8 NOT NULL,
  `FOTO_PERFIL` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `FOTOCAPA_PERFIL` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `BIO` text CHARACTER SET utf8,
  `usuario_ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERFIL`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_PERFIL_UNIQUE` (`ID_PERFIL`),
  UNIQUE KEY `USERNAME_PERFIL_UNIQUE` (`USERNAME_PERFIL`),
  KEY `fk_perfil_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`ID_PERFIL`, `NOME_PERFIL`, `USERNAME_PERFIL`, `FOTO_PERFIL`, `FOTOCAPA_PERFIL`, `BIO`, `usuario_ID_USUARIO`) VALUES
(11, 'Flavia', 'ahmad', '', '', '', 12),
(12, 'Fabi Souza', 'rooo', '', '', '', 14),
(13, 'Brunna Saraiva Oliveira', 'brwnia', 'hm.png', '', 'iiooo', 15),
(14, 'Roberta Oliveira', 'BETA', '', '', '', 16),
(16, 'Brunna Saraiveca', 'brwniaaaaa', '', '', '', 21),
(17, 'Ivan', 'Ivan', '', '', '', 24),
(18, 'Brunna', 'BRUBS', '', '', '', 25),
(19, 'Dalva da Silva', 'Dalvinha456', 'fotos_perfilbrubs.jfif', '', 'Amo gatos e o outono.', 26),
(20, 'Dalva Oliveira Silva', 'dalvahh', 'fotos_perfilbrubs.jfif', '', 'Louca por livros', 27);

-- --------------------------------------------------------

--
-- Table structure for table `resenhas`
--

DROP TABLE IF EXISTS `resenhas`;
CREATE TABLE IF NOT EXISTS `resenhas` (
  `ID_RESENHA` int(11) NOT NULL AUTO_INCREMENT,
  `TXT_RESENHA` text NOT NULL,
  `DATA_RESENHA` datetime NOT NULL,
  `usuarios_ID_USUARIO` int(11) NOT NULL,
  `obra_ID_OBRA` int(11) NOT NULL,
  PRIMARY KEY (`ID_RESENHA`),
  UNIQUE KEY `ID_RESENHA_UNIQUE` (`ID_RESENHA`),
  KEY `fk_resenha_obra_idx` (`obra_ID_OBRA`),
  KEY `fk_resenha_usuarios_idx` (`usuarios_ID_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resenhas`
--

INSERT INTO `resenhas` (`ID_RESENHA`, `TXT_RESENHA`, `DATA_RESENHA`, `usuarios_ID_USUARIO`, `obra_ID_OBRA`) VALUES
(1, 'Muito bom!!!\r\n', '2023-06-17 18:54:07', 15, 3),
(2, 'FODAAAAA', '2023-06-17 18:55:14', 15, 2),
(3, 'AMEIIIIII', '2023-06-17 18:57:18', 15, 3),
(4, 'FODAA', '2023-06-17 19:01:38', 15, 2),
(5, 'mt bomom\r\n', '2023-06-17 19:04:12', 15, 2),
(6, 'MUITITO BOM\r\n', '2023-06-17 19:18:45', 15, 10),
(7, 'GOSTEI', '2023-06-17 19:27:22', 16, 2),
(8, 'csca', '2023-06-17 20:55:46', 21, 29),
(9, 'Muito bom! Eu amei muito!!!', '2023-06-18 12:19:16', 15, 3),
(10, 'Mano, que issoooooo!!!!\r\n', '2023-06-18 12:52:40', 15, 5),
(11, 'AMEI\r\n', '2023-06-18 13:23:16', 15, 2),
(12, 'shooow', '2023-06-18 15:01:51', 24, 31),
(13, 'muitonommm', '2023-06-18 15:02:38', 24, 31),
(14, 'Dei umas boas gargalhadas\r\n', '2023-06-18 15:21:02', 24, 12),
(15, 'sinistro demais, manÃ©', '2023-06-18 16:06:25', 24, 15),
(16, ' h h h', '2023-06-18 18:02:56', 24, 3),
(17, 'traiu sim safada', '2023-06-18 18:08:17', 24, 129),
(18, 'quem eh o DoUm meu deus do ceu eu so quero saber isoooooo a aaaaaAAAA', '2023-06-18 20:06:57', 24, 4),
(19, 'MUITO BOM MEU DEUS DO CEU', '2023-06-18 21:28:48', 25, 4),
(20, 'SÃ©rie muito divertida. Gargalhei horrores.', '2023-06-19 11:00:33', 26, 7),
(21, 'Muita aÃ§Ã£o! Loucura demais essa sÃ©rie. ', '2023-06-19 11:11:42', 27, 5);

-- --------------------------------------------------------

--
-- Table structure for table `seguir`
--

DROP TABLE IF EXISTS `seguir`;
CREATE TABLE IF NOT EXISTS `seguir` (
  `ID_SEGUIR` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_SEGUIR` datetime NOT NULL,
  `ID_SEGUINDO_SEGUIR` int(11) NOT NULL,
  `perfil_ID_PERFIL` int(11) NOT NULL,
  PRIMARY KEY (`ID_SEGUIR`,`perfil_ID_PERFIL`),
  UNIQUE KEY `ID_SEGUIR_UNIQUE` (`ID_SEGUIR`),
  KEY `fk_seguir_perfil_idx` (`perfil_ID_PERFIL`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seguir`
--

INSERT INTO `seguir` (`ID_SEGUIR`, `DATA_SEGUIR`, `ID_SEGUINDO_SEGUIR`, `perfil_ID_PERFIL`) VALUES
(34, '2023-06-18 21:56:22', 15, 25);

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `ID_SERIE` int(11) NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int(11) NOT NULL,
  `obra_perfil_ID_PERFIL` int(11) NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int(11) NOT NULL,
  `VALOR_OBRA` int(11) NOT NULL,
  `PRODUTORA_SERIE` text,
  `DISTRIBUIDORA_SERIE` text,
  `TEMPORADAS_SERIE` int(11) DEFAULT NULL,
  `C_IND_SERIE` int(11) DEFAULT NULL,
  `ELENCO_SERIE` text,
  PRIMARY KEY (`ID_SERIE`),
  KEY `fk_series_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`ID_SERIE`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`, `VALOR_OBRA`, `PRODUTORA_SERIE`, `DISTRIBUIDORA_SERIE`, `TEMPORADAS_SERIE`, `C_IND_SERIE`, `ELENCO_SERIE`) VALUES
(1, 1, 1, 1, 1, 'Pródigo Filmes', 'Netflix', 2, 16, 'Marco Pigossi, Alessandra Negrini, Fábio Lago'),
(2, 1, 1, 1, 1, 'PrÃ³digo Filmes', 'Netflix', 2, 14, 'Marco Pigossi, Alessandra Negrini, FÃ¡bio Lago'),
(3, 1, 1, 1, 1, 'Boutique Filmes', 'Netflix ', 4, 16, 'Bianca Comparato, Vaneza Oliveira, Rodolfo Valente'),
(4, 1, 1, 1, 1, 'PrÃ³digo Filmes', 'Netflix', 2, 16, 'Maria Casadevall, Pathy Dejesus, Fernanda Vasconcellos'),
(5, 1, 1, 1, 1, 'Zola Filmes', 'Netflix', 2, 18, 'TainÃ¡ MÃ¼ller, Reynaldo Gianecchini, Klara Castanho'),
(6, 1, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Amazon Prime Video', 2, 18, 'Gabriel Leone, Flavio Tolezani, Isabella Santoni'),
(7, 1, 1, 1, 1, 'Los Bragas ', 'Netflix', 3, 16, 'Christian Malheiros, JoÃ£o Pedro Carvalho, Bruna Mascarenhas'),
(8, 1, 1, 1, 1, 'A FÃ¡brica', 'Netflix ', 1, 12, 'Ademara Barros, FlÃ¡via Reis, Mel Maia'),
(9, 1, 1, 1, 1, 'O2 Filmes ', 'Netflix', 2, 16, 'Naruna Costa, Seu Jorge, Hermila Guedes'),
(10, 1, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, ''),
(11, 1, 1, 1, 1, 'Mixer Filmes', 'Netflix', 1, 18, 'DÃ©bora Nascimento, Emanuelle AraÃºjo, Nikolas Antunes'),
(12, 1, 1, 1, 1, 'Grifa Filmes', 'Netflix', 1, 18, 'Dalva Teixeira de Sousa, Gabriela Manssur'),
(13, 1, 1, 1, 1, 'Glaz Entretenimento', 'Netflix', 1, 14, 'Fernanda Paes Leme, MaÃ­ra Azevedo, Thati Lopes'),
(14, 1, 1, 1, 1, 'Suburbanos ProduÃ§Ãµes', 'Netflix', 2, 14, 'Rodrigo Santâ€™anna, Rafael Zulu, Lidi Lisboa'),
(15, 1, 1, 1, 1, 'Caravan Media, Quicksilver Media ', 'Netflix', 1, 16, ''),
(16, 1, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Netflix', 1, 18, 'Luellem de Castro, Ana Hartmann, Guilherme Weber, Sabrina Sato'),
(17, 1, 1, 1, 1, 'Space, Intro Pictures', 'Netflix', 1, 16, 'Enzo Barone, Guilherme Fontes, Mel Lisboa'),
(18, 1, 1, 1, 1, 'Fetiche Features, Gullane Entretenimento', 'Netflix', 1, 16, 'Denise Fraga, Caio Horowicz, Michel Joelsas'),
(19, 1, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, 'Carla Salle, Sandra Corveloni, Jonathan Haagensen'),
(20, 1, 1, 1, 1, 'Moonshot Pictures', 'Netflix', 1, 14, 'Claudia Okuno, Danilo Mesquita, Mariana Sena'),
(21, 1, 1, 1, 1, 'O2 Filmes ', 'Netflix', 1, 16, 'Bruna Marquezine, NatÃ¡lia Klein, Klebber Toledo, Manu Gavassi'),
(22, 1, 1, 1, 1, 'Mixer Filmes', 'Netflix', 2, 14, 'Paloma Bernardi, Pedro Caetano, Allison Willow'),
(23, 1, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, 'Giovanna Lancellotti, Gabz, Jorge Lopez'),
(24, 1, 1, 1, 1, 'Gullane Entretenimento', 'Netflix', 1, 14, 'Victor Lamoglia, JÃºlia Rabello, Danilo de Moura, KÃ©fera Buchmann'),
(25, 1, 1, 1, 1, 'Fox Premium', 'Amazon Prime Video, Star Plus', 4, 18, 'Maria Bopp, Simone Mazzer, Ariclenes Barroso'),
(26, 1, 1, 1, 1, 'Medialand', 'Amazon Prime Video', 10, 16, 'Ellen Pompeo, Chandra Wilson, James Pickens'),
(27, 1, 1, 1, 1, 'Produtora KN', 'Amazon Prime Video ', 3, 18, 'Bianca Palheiras, Camilla Taublib, Camilla Luna'),
(28, 1, 1, 1, 1, 'Fox Networks Group', 'Amazon Prime Video e Star+', 3, 16, 'Raphael Logam, Lorena Comparato, Rui Ricardo Diaz'),
(29, 1, 1, 1, 1, 'FIC e ConspiraÃ§Ã£o Filmes', 'Amazon Prime Video', 4, 16, 'JÃºlio Andrade, Julia Ianina, Silvio Guindane'),
(30, 1, 1, 1, 1, '', 'Amazon Prime Video', 1, 18, 'Renata Ricci, Victor Soares, Yuri Esteves, Felipe Dutra, Paulo MilÃ©o'),
(31, 1, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Globoplay', 5, 14, 'Marjorie Estiano, JÃºlio Andrade, Marco Nanini');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_USUARIO` varchar(45) NOT NULL,
  `SENHA_USUARIO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `ID_USUARIO_UNIQUE` (`ID_USUARIO`),
  UNIQUE KEY `EMAIL_USUARIO_UNIQUE` (`EMAIL_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `EMAIL_USUARIO`, `SENHA_USUARIO`) VALUES
(1, 'brunnasrv1@gmail.com', 'BRUbs10oi'),
(12, 'FLAVINHA@gmail.com', 'FLAvia5980'),
(14, 'FLAVIA@gmail.com', 'FLAvia5980'),
(15, 'br0@gmail.com', 'BRUbs10oi'),
(16, 'ROBERTAOLIVER.CLARO@GMAIL.COM', 'sENHA1981'),
(17, 'brunnasr@gmail.com', 'cndvnvnoOIII09'),
(19, 'fbwuvbw@mkqcnkcf.com', ' cja OIOI0'),
(20, 'asvca@kasnc.com', 'BRUBio09'),
(21, 'asv@kasnc.com', 'BRUBio09'),
(23, 'br0nna@gmail.com', 'BRUbs10oi'),
(24, 'ivan.talentos74@gmail.com', 'Senha1821'),
(25, 'br0NINHAHH@gmail.com', 'BRUbs10oi'),
(26, 'dalva@gmail.com', 'DALva567'),
(27, 'dalva2@gmail.com', 'DALva567');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_resenha1` FOREIGN KEY (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`) REFERENCES `resenha` (`ID_RESENHA`, `usuario_ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
