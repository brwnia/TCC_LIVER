-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 22-Jul-2023 às 07:21
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_liver`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `DESC_CATEGORIA` varchar(45) NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_categoria_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `citacoes`
--

DROP TABLE IF EXISTS `citacoes`;
CREATE TABLE IF NOT EXISTS `citacoes` (
  `ID_CITACOES` int NOT NULL AUTO_INCREMENT,
  `DESC_CITACAO` varchar(255) NOT NULL,
  `obra_NOME_OBRA` varchar(255) NOT NULL,
  `perfil_ID_PERFIL` varchar(255) NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_CITACOES`),
  UNIQUE KEY `ID_CITACOES_UNIQUE` (`ID_CITACOES`),
  KEY `fk_citacoes_obra_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_citacoes_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `citacoes`
--

INSERT INTO `citacoes` (`ID_CITACOES`, `DESC_CITACAO`, `obra_NOME_OBRA`, `perfil_ID_PERFIL`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`, `usuario_ID_USUARIO`) VALUES
(1, '“Se contar o acontecido já é uma traição com o vivido, pois muitas vezes, se trata de uma reconstrução malfeita de lembranças, recontar o que ouvimos pode ser dupla traição.”', 'Canção para ninar meninos grandes', '21', 0, 1, 1, 29),
(2, '“As vezes a morte é leve como a poeira. E a vida se confunde com um pó branco qualquer.”', 'Olhos D’Água', '22', 0, 1, 1, 30),
(3, '“Você só precisa tomar cuidado para não ir de um extremo a outro”, o dr. Max disse. “O excesso de amor é tão perigoso quanto a falta.”', 'Uma mulher no escuro', '23', 0, 1, 1, 31),
(4, '\"reencarnar numa mosca deve ser coisa breve e por isso boa\"', 'O peso do pássaro morto', '24', 138, 1, 1, 32),
(5, '“Se o ar não se movimenta, não tem vento, se a gente não se movimenta, não tem vida.”', 'Torto Arado', '13', 127, 1, 1, 15),
(6, '\"Porque agora sabe que ela brilhará para ele entre mil estrelas no céu sem igual da cidade negra.“', 'Capitães de Areia', '24', 131, 1, 1, 32),
(7, '“… Lavei todas as roupas. Jurei nunca mais matar porco na favela. Eu estou tão nervosa que recordei o meu proverbio: não há coisa pior na vida do que a propria vida.”', 'Quarto de Despejo', '24', 129, 1, 1, 32),
(8, '\"A imaginação foi a companheira de toda a minha existência, viva, rápida, inquieta, alguma vez tímida e amiga de empacar, as mais delas, capaz de engolir campanhas e campanhas, correndo.\"', 'Dom Casmurro', '19', 141, 1, 1, 26),
(9, '“Sou seu termômetro de criminalidade, seu espelho de morbidez, sua bússola de loucura. Mas a verdade é que, se estivesse no meu lugar, você teria feito o mesmo.”', 'Jantar Secreto', '21', 135, 1, 1, 29),
(10, '“Um dia você aprende a gostar mais de quem você é, e isso vai refletir em como as outras pessoas vão te enxergar. Gente babaca vai existir para sempre, mas a gente aprende a resistir.”', 'Quinze Dias', '22', 137, 1, 1, 30),
(11, '“Nem sempre a família que nasce com a gente vai nos entender. Nem sempre eles vão ficar do nosso lado para sempre. Mas isso nunca vai te impedir de escolher uma família nova.”', 'Um Milhão de Finais Felizes', '23', 139, 1, 1, 31),
(12, '“Percebo que esse é o meu ideal de felicidade. Estar junto sem medo de que alguma coisa ruim vá acontecer a qualquer momento.”', 'Um Milhão de Finais Felizes', '19', 139, 1, 1, 26),
(13, '\"falar cansa, ouvir então nem se fale\"', 'O peso do pássaro morto', '13', 138, 1, 1, 15),
(14, '“Certa vez, em um banheiro público, havia um poema: A Carne mais barata do mercado. É a carne negra.”', 'Jantar Secreto', '23', 135, 1, 1, 31),
(15, '“Mas e o amor? O que é senão um monte de gostar? Gostar de falar, gostar de tocar, gostar de cheirar, gostar de ouvir, gostar de olhar. Gostar de se abandonar no outro. O amor não passa de um gostar de muitos verbos ao mesmo tempo.”', 'Tudo é Rio', '13', 136, 1, 1, 15),
(16, '“É preciso uma coincidência qualquer para que o amor se instale. Existe um certo milagre nos encontros. Não é tolo dizer que o amor é sagrado.”', 'Tudo é Rio', '21', 136, 1, 1, 29),
(17, '\"Pobres homens. Tolos, surdos, ignorantes, arraigados a uma tradição, incapazes de escutar o que transcendia a ela, impossibilitados de alcançar a verdade.\"', 'Filhos do Éden: Paraíso Perdido', '23', 0, 1, 1, 31);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classificar`
--

DROP TABLE IF EXISTS `classificar`;
CREATE TABLE IF NOT EXISTS `classificar` (
  `ID_CLASSIFICAR` int NOT NULL AUTO_INCREMENT,
  `NOTA_CLASSIFICAR` decimal(2,1) NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_CLASSIFICAR`),
  UNIQUE KEY `ID_CLASSIFICAR_UNIQUE` (`ID_CLASSIFICAR`),
  KEY `fk_classificar_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_classificar_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `ID_COMENTARIO` int NOT NULL AUTO_INCREMENT,
  `TXT_COMENTARIO` mediumtext NOT NULL,
  `resenha_ID_RESENHA` int NOT NULL,
  `resenha_usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  UNIQUE KEY `ID_COMENTARIO_UNIQUE` (`ID_COMENTARIO`),
  KEY `fk_comentarios_resenha1_idx` (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtir`
--

DROP TABLE IF EXISTS `curtir`;
CREATE TABLE IF NOT EXISTS `curtir` (
  `ID_CURTIR` int NOT NULL AUTO_INCREMENT,
  `TIME_CURTIR` datetime NOT NULL,
  `resenha_ID_RESENHA` int NOT NULL,
  `resenha_usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_CURTIR`,`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`),
  UNIQUE KEY `ID_CURTIR_UNIQUE` (`ID_CURTIR`),
  KEY `fk_curtir_resenha1_idx` (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `depois`
--

DROP TABLE IF EXISTS `depois`;
CREATE TABLE IF NOT EXISTS `depois` (
  `ID_DEPOIS` int NOT NULL AUTO_INCREMENT,
  `MARCAR_DEPOIS` int NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_DEPOIS`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_DEPOIS_UNIQUE` (`ID_DEPOIS`),
  KEY `fk_depois_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_depois_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `ID_FAVORITOS` int NOT NULL AUTO_INCREMENT,
  `MARCAR_FAVORITO` int NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_FAVORITOS`,`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_FAVORITOS_UNIQUE` (`ID_FAVORITOS`),
  KEY `fk_favoritos_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`),
  KEY `fk_favoritos_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmes`
--

DROP TABLE IF EXISTS `filmes`;
CREATE TABLE IF NOT EXISTS `filmes` (
  `ID_FILME` int NOT NULL AUTO_INCREMENT,
  `VALOR_OBRA` int NOT NULL,
  `PRODUTORA_FILME` varchar(45) NOT NULL,
  `DISTRIBUIDORA_FILME` varchar(45) NOT NULL,
  `C_IND_FILME` int NOT NULL,
  `DURACAO` varchar(10) NOT NULL,
  `ELENCO` varchar(225) NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_FILME`),
  KEY `fk_filmes_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `filmes`
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
(36, 2, 'Africa Filmes, Dezenove Som e Imagem', 'Grupo PlayArte', 16, '89 min', 'Paulo Miklos, GlÃ³ria Pires, Marisa Orth', 84, 1, 1),
(37, 2, 'Barry Company, Globo Filmes', 'Paris Filmes, Downtown Filmes', 14, '114 min', 'Alice Braga, Gabriel Leone', 31, 1, 1),
(38, 2, 'Zazen Produções', ' Universal Studios', 16, '115 min', 'Wagner Moura, André Ramiro, Caio Junqueira, Maria Ribeiro', 32, 1, 1),
(39, 2, 'Cinemascópio, SBS (FR), Globo Filmes, Telecin', ' Vitrine Filmes', 16, '132 min', 'Sonia Braga, Udo Kier, Bárbara Colen, Thomás Aquino', 45, 1, 1),
(40, 2, 'Camisa Listrada, Downtown Filmes, Globo Filme', ' Downtown Filmes, 20th Century Studios', 12, '99 min', 'Aline Campos, Melissa Nobrega, Danielle Winits, Maurício Manfrini', 47, 1, 1),
(41, 2, 'Paranoid Filmes, Lanterna de Pedra Filmes, Gl', 'Warner Bros. Entertainment', 14, '120 min', 'Wagner Moura, Juliano Cazarré, Silvero Pereira, Sophie Charlotte', 48, 1, 1),
(42, 2, 'Orange, ANCINE/Ministério da Cultura, Fundo S', ' Imagem Filmes', 14, '106 min', 'Giovanna Lancellotti, Rafael Cardoso, Ed Canedo', 53, 1, 1),
(43, 2, 'Globo Filmes, United Artists, Metro-Goldwyn-M', 'Sony Pictures Motion Picture Group', 14, '123 min', 'Lázaro Ramos, Leandra Leal, Pedro Cardoso', 61, 1, 1),
(44, 2, 'Globo Filmes, Lereby, Columbia TriStar Filmes', 'Sony Pictures Classics', 16, '145 min', 'Wagner Moura, Caio Blat, Rodrigo Santoro', 62, 1, 1),
(45, 2, 'Katia Machado', 'Imovision', 0, '99 min', 'Eduardo Dascar, João Guilherme Ávila, Julia De Victa', 63, 1, 1),
(46, 2, 'Globo Filmes, Paramount Pictures, Paramount P', 'Paris Filmes, Downtown Filmes', 12, '150 min', 'Tatá Werneck, Cauã Reymond', 65, 1, 1),
(47, 2, 'Globo Filmes, Lereby, Total Entertainment Fil', '20th Century Studios', 10, '108 min', 'Glória Pires, Daniel Filho, Tony Ramos', 66, 1, 1),
(48, 2, 'Vitória Produções Cinematográficas Filmark, R', 'Severiano Ribeiro Distribuidora', 14, '120 min', 'Ilya São Paulo, Antônio Pedro, Aracy Balabanian', 68, 1, 1),
(49, 2, 'Simba Content Paris Filmes', 'Downtown Filmes, Paramount Pictures', 12, '95 min', 'Polliana Aleixo, Luís Navarro, Cacau Protásio', 76, 1, 1),
(50, 2, 'Paramount Pictues, Camisa Listrada', 'Imagem Filmes', 14, '105 min', 'Danton Mello, Juliana Paes, James Faulkner, Marcos Caruso', 77, 1, 1),
(51, 2, 'Conspiração Filmes, Columbia Pictures, Columb', 'Columbia Pictures', 12, '107 min', 'Lima Duarte, Stênio Garcia, Regina Casé', 83, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

DROP TABLE IF EXISTS `livros`;
CREATE TABLE IF NOT EXISTS `livros` (
  `ID_LIVRO` int NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `VALOR_OBRA` int NOT NULL,
  `EDITORA_LIVRO` mediumtext NOT NULL,
  `PAGINAS_LIVRO` int NOT NULL,
  `C_IND_LIVRO` int DEFAULT NULL,
  PRIMARY KEY (`ID_LIVRO`),
  KEY `fk_livros_obra4_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `livros`
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
-- Estrutura da tabela `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
CREATE TABLE IF NOT EXISTS `notificacao` (
  `ID_NOTIFICACAO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `ID_CURTIR` int DEFAULT NULL,
  `ID_COMENTARIO` int DEFAULT NULL,
  `ID_SEGUIR` int DEFAULT NULL,
  `ID_PERFIL_AUTOR` int NOT NULL,
  PRIMARY KEY (`ID_NOTIFICACAO`),
  UNIQUE KEY `ID_NOTIFICACAO_UNIQUE` (`ID_NOTIFICACAO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_CURTIR` (`ID_CURTIR`),
  KEY `ID_COMENTARIO` (`ID_COMENTARIO`),
  KEY `ID_SEGUIR` (`ID_SEGUIR`),
  KEY `ID_PERFIL_AUTOR` (`ID_PERFIL_AUTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `novelas`
--

DROP TABLE IF EXISTS `novelas`;
CREATE TABLE IF NOT EXISTS `novelas` (
  `ID_NOVELA` int NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `VALOR_OBRA` int NOT NULL,
  `EMISSORA_NOVELA` mediumtext NOT NULL,
  `EPISODIOS_NOVELA` mediumtext NOT NULL,
  `ELENCO_NOVELA` mediumtext NOT NULL,
  `C_IND_NOVELA` int NOT NULL,
  PRIMARY KEY (`ID_NOVELA`),
  KEY `fk_novelas_obra3_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `novelas`
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
-- Estrutura da tabela `obra`
--

DROP TABLE IF EXISTS `obra`;
CREATE TABLE IF NOT EXISTS `obra` (
  `ID_OBRA` int NOT NULL AUTO_INCREMENT,
  `VALOR_OBRA` int NOT NULL,
  `DESC_OBRA` text NOT NULL,
  `NOME_OBRA` varchar(45) NOT NULL,
  `FOTO_OBRA` varchar(225) NOT NULL,
  `AU_DI_OBRA` varchar(45) NOT NULL,
  `ANO_OBRA` int NOT NULL,
  `perfil_ID_PERFIL` int NOT NULL,
  `perfil_usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_OBRA`,`perfil_ID_PERFIL`,`perfil_usuario_ID_USUARIO`),
  UNIQUE KEY `ID_OBRA_UNIQUE` (`ID_OBRA`),
  KEY `fk_obra_perfil1_idx` (`perfil_ID_PERFIL`,`perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `obra`
--

INSERT INTO `obra` (`ID_OBRA`, `VALOR_OBRA`, `DESC_OBRA`, `NOME_OBRA`, `FOTO_OBRA`, `AU_DI_OBRA`, `ANO_OBRA`, `perfil_ID_PERFIL`, `perfil_usuario_ID_USUARIO`) VALUES
(1, 1, 'Na série Cidade Invisível, Eric (Marco Pigossi) é um detetive da Polícia Ambiental que, após encontrar um boto-cor-de-rosa morto em uma praia do Rio de Janeiro, se envolve em uma investigação de assassinato. A partir desse caso, Eric esbarra em um mundo habitado por entidades míticas que costumam passar despercebidas pelos humanos, ao mesmo tempo em que investiga mortes estranhas que, de forma bizarra, refletem a de sua própria esposa, Gabriela (Julia Konrad). A procura de novas pistas, Eric descobre o passado do pai e desvenda sua verdadeira identidade como meio humano e meio entidade. As coisas complicam para Eric e seus companheiros quando Corpo Seco, um espírito fugitivo de um antiambientalista, possui sua pequena filha (Manu Dieguez). Por vingança, o espírito está matando outras entidades da floresta e é o grande responsável pela morte de Gabriela. Agora, cabe a Eric e as entidades encontrarem uma maneira de parar Corpo Seco.', 'Cidade Invisível', 'cidadeinvisivel.jpg', 'Carlos Saldanha', 2021, 1, 1),
(2, 1, 'Em um futuro pós-apocalíptico não muito distante, o planeta é um lugar devastado. O Continente é uma região do Brasil miserável, decadente e escassa de recursos. Aos 20 anos de idade, todo cidadão recebe a chance de passar pelo Processo, uma rigorosa seleção de provas físicas, morais e psicológicas que oferece a chance de ascender ao Mar Alto, uma região onde tudo é abundante e as oportunidades de vida são extensas. Entretanto, somente 3% dos inscritos chegarão até lá.', '3%', '3porcento.jpg', 'Cesar Charlone, Pedro Aguilera', 2016, 1, 1),
(3, 1, 'Coisa Mais Linda é ambientada em São Paulo, no final da década de 50, onde Maria Luiza Carone (Maria Casadevall), uma moça conservadora e completamente dependente de dois homens: seu pai, Ademar (João Bourbonnais) e o marido, Pedro (Kiko Bertholini). Sua vida toma um rumo completamente diferente quando Pedro desaparece ao viajar para o Rio de Janeiro a fim de montar um restaurante. Maria Luiza, claro, segue os rastros do marido e descobre que ele transformou o sofisticado negócio numa casa noturna. Em terras cariocas, a jovem descobre então um novo mundo na companhia de mulheres feministas e liberais e ao som da Bossa Nova. Ela conhece Chico (Leandro Lima), um talentoso cantor tentando ganhar a vida com sua arte, e Adélia (Pathy DeJesus), uma jovem negra moradora de uma favela que precisa enfrentar o racismo da elite carioca diariamente. Juntos, os três tentam abrir um clube de Bossa Nova para tentar realizar seus sonhos.', 'Coisa mais linda', 'coisamaislinda.jpg', 'Heather Roth, Giuliano Cedroni', 2019, 1, 1),
(4, 1, 'Verônica Torres (Tainá Müller) trabalha como escrivã na Delegacia de Homicídios de São Paulo e tem uma rotina bastante entediante. Após presenciar um suicídio, ela precisa lutar contra os traumas de seu passado e acaba tomando uma arriscada decisão: usar toda a sua habilidade investigativa para ajudar duas mulheres desconhecidas. A primeira é uma jovem que se vê enganada por um golpista na internet. Já a segunda, Janete (Camila Morgado), é a esposa submissa de Brandão (Eduardo Moscovis), um policial de alta patente que a maltrata e leva uma vida dupla.', 'Bom Dia, Verônica', 'bomdiaveronica.jpg', 'José Henrique Fonseca, Raphael Montes', 2020, 1, 1),
(5, 1, 'DOM conta a história real de Pedro Dom (Gabriel Leone), um atraente rapaz da classe média carioca que é apresentado à cocaína muito cedo, evoluindo para se tornar o líder de uma gangue criminosa que estampa os tablóides no início dos anos 2000. Do outro lado está o pai de Pedro, Victor Dantas (Flavio Tolezani), que acabou entrando no serviço de inteligência policial por ter feito, ainda na adolescência, uma importante descoberta no fundo do mar e tê-la denunciado às autoridades. Ao longo da década de 70, Victor se engaja no combate às drogas, sem imaginar que, anos depois, precisaria lutar para retirar o próprio filho do mundo criminoso. São jornadas opostas que, por vezes, se espelham e se complementam, enquanto ambos enfrentam situações que confundem os limites entre o certo e o errado.', 'Dom', 'dom.jpg', 'Gonzaga', 2021, 1, 1),
(6, 1, 'Sintonia, série brasileira original da Netflix, traz as histórias de Doni (Christian Malheiros), Nando (MC Jottapê) e Rita (Bruna Mascarenhas), todos moradores da mesma favela em São Paulo. Crescendo juntos pelas ruas da comunidade, eles descobriram aos poucos o mundo do tráfico de drogas, da religião e também da música. No entanto, as experiências da infância os levaram a trilhar caminhos bem diferentes, e agora esse trio sabe que quem pode salvá-los dos problemas com os quais se envolveram são eles mesmos. A série apresenta a dinâmica das organizações criminosas nas periferias dos centros urbanos. E, além dos problemas sociais referentes à favela, a trama também traz um olhar intimista sobre os jovens músicos que ascendem no funk e conquistam a fama.', 'Sintonia', 'sintonia.jpg', 'KondZilla', 2019, 1, 1),
(7, 1, 'Na série brasileira Sem Filtro, Marcely Menezes, vivida pela humorista pernambucana Ademara Barros, fica frustrada com os estudos e larga a faculdade para se lançar na, aparentemente, próspera e fácil carreira de influenciadora digital, mas nem tudo são flores. Por mais que seu jeito espontâneo e - realmente - sem filtro de ser atraia muitos seguidores, curtidas e compartilhamentos, tanta sinceridade acaba atraindo muitas confusões no pacote. Apesar da empolgação e das vantagens que vieram, de uma hora para a outra, junto com a fama, a jovem acaba descobrindo o lado não tão radiante do estrelato, incluindo notícias desagradáveis e tretas. Agora, Marcely precisará lidar com os dilemas do mundo digital e, também, com as questões da vida real, já que o restante da família Menezes, junto com seus amigos acabam se envolvendo nas desventuras digitais da mais nova influencer.', 'Sem filtro', 'semfiltro.jpg', 'Cris DAmato', 2023, 1, 1),
(8, 1, 'Ambientada na cidade de São Paulo em meados dos anos 90, Irmandade é uma série que acompanha a história de Cristina (Naruna Costa). Ela é uma advogada honesta e dedicada que descobre o envolvimento do irmão Edson (Seu Jorge) com uma facção criminosa em ascensão, mais conhecida como a Irmandade. Edson é o líder do grupo e está preso, fazendo com que Cristina seja pressionada pela polícia para ser uma informante e ir contra o seu irmão, alguém que ela não encontra há muito tempo. Edson esteve desaparecido por anos e na prisão enfrenta torturas que o aproximam da morte. Cristina acredita que a única chance de salvá-lo será trabalhando em comum acordo com a polícia. No entanto, conforme Cristina se infiltra na facção, a advogada começa a questionar seus próprios valores. A missão é arriscada, porém, a cada descoberta, Cristina entra em contato com um lado sombrio de si mesma que não imaginava ter.', 'Irmandade', 'irmandade.jpg', 'Pedro Morelli', 2019, 1, 1),
(9, 1, 'A série documental Elize Matsunaga: Era uma Vez um Crime revisita o crime que chocou o país: o assassinato e esquartejamento do presidente da empresa Yoki, Marcos Matsunaga, por sua esposa, Elize Matsunaga. Da infância em Chopinzinho, pequena cidade do Paraná, até o conturbado relacionamento com o empresário antes do assassinato, acompanhamos os detalhes que sucederam o fato, desde tentativas de acobertamento do crime, passando pela confissão, prisão, julgamento em 2016 e também saídas temporárias.', 'Elize Matsunaga: Era uma vez um crime', 'elizematsunaga.jpg', 'Eliza Capai', 2021, 1, 1),
(10, 1, 'Em Olhar Indiscreto, Miranda (Debora Nascimento) é uma hacker talentosa e voyer incontrolável que passa seus dias observando o cotidiano de Cléo (Emanuelle Araújo), sua vizinha e acompanhante de luxo. Um dia, Cléo pede a Miranda um simples favor: cuidar de seu cachorro enquanto passa uns dias fora em viagem. A partir desse momento, a vida da hacker vira de cabeça para baixo ao adentrar o universo complexo e obscuro da acompanhante. Mas ao mesmo tempo que teme esse novo e perigoso mundo, Miranda se permite viver seus mais íntimos desejos e começa um intenso triângulo amoroso que pode não acabar nada bem. Além disso, um de seus novos clientes a contrata para investigar um possível esquema de tráfico de mulheres e ela desconfia que a vizinha esteja conectada a isso. Enquanto questiona suas novas escolhas, a hacker se vê cada vez mais envolvida com o universo de Cléo e passa reviver seu passado', 'Olhar Indiscreto', 'olharindiscreto.jpg', 'Luciana Oliveira', 2023, 1, 1),
(11, 1, 'João de Deus: Crime e Cura, série documental original da Netflix, acompanha a trajetória do idolatrado médium João Teixeira de Faria, conhecido como João de Deus, que se tornou protagonista de um dos maiores casos de assédio do Brasil. Depois de conquistar fama internacional com suas supostas curas, o líder espiritual foi preso por estar envolvido em inúmeros casos de violência sexual contra suas ex-seguidoras.', 'João de Deus: Cura e Crime', 'joaodedeus.jpg', 'Maurício Dias, Tatiana Villela', 2021, 1, 1),
(12, 1, 'Nada Suspeitos, nova série brasileira de comédia da Netflix, contará a história de um crime ocorrido em uma mansão. Depois de serem enganadas pelo mesmo ricaço mau-caráter, Patrícia (Fernanda Paes Leme), Bete (Maíra Azevedo) e Thyellen (Thati Lopes) vão até a casa de Maurícia (Rômulo Arantes Neto) para tirar satisfação acompanhadas de seus familiares. Mas quando o playboy aparece morto, elas percebem que estão envolvidas em uma confusão pior do que imaginavam. Com a ajuda de um atrapalhado detetive, eles tentam descobrir o que realmente aconteceu, mas agora, todo mundo é um provável suspeito. A tentativa de descobrir quem matou o milionário, e a disputa por sua herança, fazem com que algumas gananciosas famílias tenham que conviver sob o mesmo teto.', 'Nada Suspeitos', 'nadasuspeitos.jpg', 'César Rodrigues, Eduardo Vaisman', 2022, 1, 1),
(13, 1, 'Na série brasileira da Netflix, A Sogra que te Pariu, quando a pandemia começa, Dona Isadir (Rodrigo SantAnna) não pensa duas vezes antes de colocar para alugar seu apartamento no Cachambi, no Rio de Janeiro, com o intuito de ficar mais perto da família. A decisão de se mudar para a mansão de seu filho Carlos (Rafael Zulu), na Barra da Tijuca, é tomada de maneira unilateral e sem aviso prévio, para desespero de sua nora, Alice (Lidi Lisboa). Enquanto os netos Márcia (Bárbara Sut) e Jonas (Pedro Ottoni) se veem no meio do fogo cruzado, Marinez (Daniela Fontan), que trabalha há anos na casa, assiste a toda a confusão de um lugar privilegiado. Carlos tenta apaziguar as tensões dentro de casa, mas Alice não consegue conviver com a sogra de forma pacífica, pois a mesma segue criticando o tempo inteiro sua forma de gerenciar o lar. A pandemia, que eles acharam que duraria apenas algumas semaninhas, se torna uma vida inteira e Isadir segue tornando a vida de Alice um inferno. Mas mesmo diante de brigas e conflitos, no fim do dia a família consegue encontrar afeto uns nos outros.', 'A sogra que te pariu', 'asograquetepariu.jpg', 'Alex Cabral', 2022, 1, 1),
(14, 1, 'A história real de Wallace Souza, um apresentador de televisão acusado de planejar os assassinatos que abordava e investigava em seu programa. Durante dez anos ele comandou o \"Canal Livre\", que teve sucesso nacionalmente, chegando a ultrapassar a audiência de grandes emissoras do país em algumas cidades.', 'Bandidos na TV', 'bandidosnatv.jpg', 'Daniel Bogado', 2019, 1, 1),
(15, 1, 'É noite de eliminação no reality show Olimpo, mais conhecido como a Casa dos Deuses. O programa segue seu ritmo normal, até que os participantes recebem a seguinte notícia: o Rio de Janeiro vive um apocalipse zumbi, as ruas tomadas pelo caos e pelo pânico. O estúdio da emissora se torna então um dos únicos lugares seguros da cidade, e o grupo de confinados vai precisar agir com muito cuidado se quiser sobreviver ao ataque.', 'Reality Z', 'realityz.jpg', 'Cláudio Torres', 2020, 1, 1),
(16, 1, 'Silas Campello (Guilherme Fontes) é um ambicioso apresentador de um programa policial e um dos nomes mais poderosos de Belém do Pará. Sua carreira, no entanto, foi marcada por uma jornada tortuosa para alcançar a fama. Capaz de tudo pela audiência, o jornalista ia contra os princípios éticos e encomendava assassinatos para poder exibi-los na televisão.', 'Pacto de Sangue', 'pactodesangue.jpg', 'Tomás Portella, Adrián Caetano', 2018, 1, 1),
(17, 1, 'Em Boca a Boca, quando uma doença contagiosa transmitida pelo beijo se espalha por uma cidade pecuarista do interior, os adolescentes locais entram em pânico. Além de deixar os habitantes desconfiados uns dos outros, a infecção altera todo o cotidiano da comunidade.', 'Boca a Boca', 'bocaaboca.jpg', 'Esmir Filho', 2020, 1, 1),
(18, 1, 'Em um futuro próximo, cada cidadão é seguido e monitorado por um pequeno drone e as taxas de criminalidade são mínimas. O Sistema Onisciente parece funcionar perfeitamente, até que uma jovem chamada Nina descobre um assassinato que não foi relatado por ele. A moça então inicia uma jornada em busca da verdade por trás dessa suposta negligência.', 'Onisciente', 'onisciente.jpg', 'Pedro Aguilera', 2020, 1, 1),
(19, 1, 'Bairro da Liberdade, São Paulo. Um grupo de cinco adolescentes é acidentalmente atraído para uma realidade sobrenatural que não pode ser compreendida, mas que se conecta ao mesmo local da cidade em 1908. Conforme os acontecimentos vão ficando mais estranhos, os jovens descobrem que alguém está trazendo a morte de volta, e os espíritos querem vingança.', 'Spectros', 'spectros.jpg', 'Doug Petrie', 2020, 1, 1),
(20, 1, 'Em Maldivas, a jovem goiana Liz (Bruna Marquezine) se muda para o Rio com o intuito de reencontrar sua mãe, que morre num misterioso incêndio. Determinada a obter respostas para essa tragédia, Liz precisa se esconder do investigador Denilson (Romani) e acaba se infiltrando num luxuoso condomínio da Barra da Tijuca. Entre os peculiares moradores do Maldivas, estão Milene (Manu Gavassi), uma verdadeira rainha que leva uma vida aparentemente perfeita ao lado do marido, o cirurgião plástico Victor Hugo (Klebber Toledo); e Rayssa (Sheron Menezzes), uma ex-cantora de axé que se tornou uma executiva de sucesso, casada com o ex-vocalista de sua banda, Cauã (Samuel Melo). Já a mãezona Kat (Carol Castro) precisa encarar o fato de que seu marido Gustavo (Guilherme Winter) cumpre prisão domiciliar. Verônica (Natalia Klein), por sua vez, é uma outsider que destoa completamente de suas vizinhas. Para completar, surge ainda Miguel (Danilo Mesquita), o noivo interiorano de Liz.', 'Maldivas', 'maldivas.jpg', 'José Alvarenga Júnior', 2022, 1, 1),
(21, 1, 'Enviados a um vilarejo isolado do Pantanal, três jovens médicos recebem a missão de vacinar os moradores de lá contra uma nova mutação do vírus da Zika. Mas a população recusa o tratamento, e o trio se descobre preso em uma comunidade guiada por um líder enigmático que diz ter o poder de curar doenças sem fazer uso da medicina.', 'O Escolhido', 'oescolhido.jpg', 'Michel Tikhomiroff', 2019, 1, 1),
(22, 1, 'Temporada de Verão acompanha quatro jovens diferentes que se conhecem enquanto trabalham no Hotel Maresia, um resort de luxo localizado numa ilha paradisíaca. Lá, a destemida Catarina (Giovanna Lancellotti), a irreverente Yasmin (Gabz), o sonhador Diego (Jorge López) e o veterano do staff, Miguel (André Luiz Frambach), se unem para enfrentar os desafios do dia a dia, fazendo descobertas sobre o mundo e sobre si mesmos. E, se antes eram desconhecidos, logo se transformam numa verdadeira família. Catarina precisa lidar com a súbita prisão de sua mãe, acusada de lavagem de dinheiro e corrupção ativa, mas encontra nos outros membros do hotel Maresia um conforto para essa situação complicada. No meio de tudo isso, ainda se envolve em um intenso triângulo amoroso com Diego e Marília (Cynthia Senek). Já Yasmin se vê completamente envolvida quando inicia um romance com Miguel e percebe que os dois têm mais em comum do que poderia imaginar.', 'Temporada de Verão', 'temporadadeverao.jpg', 'Isabel Valiante', 2022, 1, 1),
(23, 1, 'Uli é um anjo da guarda cheio de personalidade que, insatisfeito com o quão arbitrárias são as ordens que ele recebe diariamente, decide se rebelar contra o sistema. Questionando conceitos complexos como a relatividade do bem e do mal, a série usa um humor ácido para subverter ideias pré-concebidas.', 'Ninguém tá olhando', 'ninguemtaolhando.jpg', 'Daniel Rezende', 2019, 1, 1),
(24, 1, 'Me Chama de Bruna acompanha Raquel (Maria Bopp), uma jovem de classe média que decide virar garota de programa, adotando o apelido de \"Bruna Surfistinha\". Stella (Carla Ribas), uma cafetina experiente, abriga a jovem em sua casa, onde ela não demora para se destacar e gerar inveja nas colegas Georgette (Stella Rabelo), Mônica (Luciana Paes) e Jéssica (Nash Laila). Bruna descobre, no novo trabalho, uma soma de vocação e prazer, virando a favorita da clientela. Mas nem tudo são flores, pois ela se vê confrontada com a dura realidade do ramo da prostituição: meninas que precisam trabalhar desde cedo para sustentar a família, clientes agressivos que objetificam as acompanhantes, e sua família, que não se conforma com a sua profissão. Além de tudo, ela precisa lidar com Nancy (Suzana Kruger), a assistente de Stella, que sente inveja dela e acha que a nova contratada tem segundas intenções. Bruna supera todos esses desafios, se fortalecendo a cada obstáculo superado e se tornando mais e mais satisfeita com o lugar que ocupa. Em pouco tempo, ela se torna a prostituta mais requisitada de São Paulo.\"', 'Me chama de Bruna', 'mechamadebruna.jpg', 'Márcia Faria', 2016, 1, 1),
(25, 1, 'Os bastidores das investigações dos crimes que mais chocaram o Brasil. Todos os fatos e elementos desconhecidos de seus respectivos inquéritos são apresentados e ordenados com precisão por meio de entrevistas com peritos criminais, legistas, delegados e outros profissionais envolvidos nos casos.', 'Investigação Criminal', 'investigacaocriminal.jpg', 'Beto Ribeiro, Carla Albuquerque', 2012, 1, 1),
(26, 1, 'A história de seis amigas que acreditam no poder do amor, independentemente do sexo e da cor.', 'Pink - Amor de verão', 'pinkamordeverao.jpg', 'Alexandre Cobra', 2019, 1, 1),
(27, 1, 'Rio de Janeiro, anos 90. Em Impuros, Evandro do Dendê (Raphael Logam) é um jovem da favela carioca cujo principal objetivo ao fazer 18 anos é ganhar o próprio dinheiro de forma honesta. Mas tudo muda quando seu irmão traficante é morto por policiais. Evandro decide se vingar e mata os responsáveis pelo tal assassinato, ganhando notoriedade dentro da hierarquia do comando. Enquanto isso, o policial alcoólatra Victor Morello não economiza esforços para colocar Evandro atrás das grades.', 'Impuros', 'impuros.jpg', 'Tomas Portalla', 2018, 1, 1),
(28, 1, '1 Contra Todos acompanha Cadu (Julio Andrade), um advogado dedicado que preza pela verdade e pela justiça acima de tudo. Com uma esposa grávida do seu segundo filho e recentemente desempregado, ele vê sua vida mudar completamente quando é acusado e condenado à prisão após ser confundido com o maior traficante de drogas do Brasil. Na cadeia, Cadu adota uma nova postura para poder sobreviver e decide se comportar como o criminoso que todos já acreditam que ele seja. No entanto, além de colecionar inimigos, sua decisão afeta drasticamente as vidas das pessoas que ele ama.', 'Um contra todos', 'umcontratodos.jpg', 'Breno Silveira', 2015, 1, 1),
(29, 1, 'Depois de morrer de modo trágico, Daniel misteriosamente retorna à vida. Primeiro, pensa que está enlouquecendo. Segundo, acredita estar vivendo num pesadelo. Daniel começa a ouvir vozes e uma delas, identificada como Nômade, coloca seus hábitos e crenças em xeque.', 'Nômade 7', 'nomade7.jpg', 'Flávio Langoni', 2020, 1, 1),
(30, 1, 'Sob Pressão acompanha o dia-a-dia dos funcionários de um hospital público no subúrbio do Rio de Janeiro. A vida dos profissionais não é nada fácil, especialmente para o Dr. Evandro (Júlio Andrade), o cirurgião-chefe da equipe médica. Cético, ele encontra alívio para os seus problemas na companhia da doutora Carolina (Marjoire Estiano), sua colega de trabalho que, diferente dele, encontra na fé o refúgio para seus problemas. Os dois podem até ser diferentes, mas vão encontrar um no outro uma maneira de sobreviver entre as emergências do hospital e o caos de suas próprias vidas. Diante de constantes desafios, eles fazem o impossível pela vida de seus pacientes, indo ao limite para exercer sua profissão com ética e eficiência, mas sem nunca perder o lado humano da medicina. Mesmo com enormes faltas e problemas na saúde pública, os dois e seus outros companheiros lutam diariamente para oferecer a melhor assistência possível a todos que atravessam as portas do hospital.', 'Sob Pressão', 'sobpressao.jpg', 'Andrucha Waddington', 2017, 1, 1),
(31, 2, 'Em um dia atípico, uma série de coincidências levam Eduardo a conhecer Mônica em uma festa. Uma curiosidade é despertada entre os dois e, apesar de não serem parecidos, eles se apaixonam perdidamente. Em Brasília, na década de 1980, esse amor precisa amadurecer e aprender a superar as diferenças.', 'Eduardo e Mônica', 'eduardomonica.jpeg', 'René Sampaio', 2022, 1, 1),
(32, 2, 'Nascimento, capitão da Tropa de Elite do Rio de Janeiro, é designado para chefiar uma das equipes que tem como missão apaziguar o Morro do Turano. Ele precisa cumprir as ordens enquanto procura por um substituto para ficar em seu lugar. Em meio a um tiroteio, Nascimento e sua equipe resgatam Neto e Matias, dois aspirantes a oficiais da PM. Ansiosos para entrar em ação e impressionados com a eficiência de seus salvadores, os dois se candidatam ao curso de formação da Tropa de Elite.', 'Tropa de Elite', 'tropaelite.jpeg', 'José Padilha', 2007, 1, 1),
(33, 2, 'Em 2002, um crime cometido em São Paulo chocou o Brasil. A jovem Suzane Von Richthofen, junto ao seu namorado Daniel Cravinhos e seu irmão Cristian Cravinhos, assassinaram seu pai Manfred von Richthofen e sua mãe Marísia. Dezoito anos depois, o caso é revisitado sob o ponto de vista de Daniel, que revela seus motivos para participar do assassinato.', 'A Menina que Matou os Pais', 'carladiaspais.jpeg', 'Mauricio Eça', 2020, 1, 1),
(34, 2, 'Em 2002, Suzane Von Richthofen e Daniel Cravinhos chocaram o Brasil por serem os responsáveis pelo brutal assassinato dos pais de Richthofen. Acompanhando o julgamento dos dois, o famoso caso é recontado, buscando respostas sobre o que levou os jovens a cometerem esse crime.', 'O Menino que Matou Meus Pais', 'meninomatoupais.jpg', 'Mauricio Eça', 2020, 1, 1),
(35, 2, 'Baseado na música escrita por Renato Russo, o longa acompanha a história de João do Santo Cristo, que deixa Salvador, sua cidade natal, e se muda para a Brasília em busca de uma vida melhor. Lá, ele encontra a miséria e o crime, mas também descobre o amor nos braços de Maria Lúcia, por quem se apaixona e com quem gostaria de viver uma vida feliz. Porém, o envolvimento com o tráfico de drogas e com Jeremias, um traficante rival, coloca tudo a perder.', 'Faroeste Caboclo: O Filme', 'faroestecab.jpeg', 'René Sampaio', 2013, 1, 1),
(36, 2, 'Mônica, Cebolinha, Magali e Cascão se esquecem de fazer o dever de casa e fogem da escola. Mas nem tudo sai como o esperado, e os pais de Mônica decidem mudá-la de colégio. Mesmo fazendo novos amigos, a turminha sente saudade de estar sempre junta. Cebolinha então resolve bolar um plano infalível com Magali e Cascão para trazer a dona da rua de volta, mesmo que para isso precise recuperar o coelhinho Sansão para a amiga.', 'Turma da Mônica - Lições', 'monicalicoes.jpeg', 'Daniel Rezende', 2021, 1, 1),
(37, 2, 'Tino é um pai de família que tem sua rotina transformada ao ganhar na loteria. Em dez anos, o fanfarrão e sua mulher Jane gastam todo o dinheiro com uma vida de ostentação. Quando descobre que está falido, ele é obrigado a aceitar a ajuda de seu vizinho Amauri, um consultor financeiro nada divertido e extremamente econômico. Jane engravida do terceiro filho e Tino faz de tudo para esconder da esposa que estão na pior, pois a recomendação médica é que a grávida evite fortes emoções.', 'Até que a Sorte Nos Separe', 'sortesepare1.jpeg', 'Roberto Santucci', 2012, 1, 1),
(38, 2, 'Tino e Jane são salvos da falência pela inesperada herança do Tio Olavinho. O problema é que o testamento traz um pedido incomum: o ricaço deseja que suas cinzas sejam lançadas no Grand Canyon. Aproveitando a viagem, o casal resolve dar uma esticadinha em Las Vegas. Entretanto, Tino se empolga com a jogatina de um cassino e perde todo o dinheiro da herança na mesa de pôquer. Para piorar, ainda fica devendo US$ 10 milhões a um capanga da máfia mexicana, que deseja receber o dinheiro a todo custo.', 'Até que a Sorte Nos Separe 2', 'sortesepare2.jpg', 'Roberto Santucci', 2013, 1, 1),
(39, 2, 'Depois de perder a herança da família em Las Vegas, Tino precisa se virar para conseguir dinheiro. Ele começa a vender biscoitos na rua até ser atropelado pelo filho de um milionário, que se apaixona por sua filha Teté. O pai do rapaz lhe oferece um trabalho na corretora para que ele possa pagar pelo casamento da filha. No exercício de suas novas funções, Tino leva à falência a maior empresa do Brasil, mergulhando o país em uma grande crise financeira.', 'Até que a Sorte Nos Separe 3', 'sortesepare3.jpg', 'Roberto Santucci, Marcelo Antunez', 2015, 1, 1),
(40, 2, 'Dona Hermínia é uma mulher de meia idade, divorciada do marido, que a trocou por uma mais jovem. Hiperativa, ela não larga o pé de seus filhos Marcelina e Juliano, que já estão bem grandinhos. Um dia, após descobrir que eles a consideram uma chata, resolve sair de casa sem avisar ninguém, deixando todos, de alguma forma, preocupados com o que teria acontecido. Mal sabem eles que a mãe foi visitar a querida tia Zélia para desabafar suas tristezas do presente e recordar os bons tempos do passado.', 'Minha Mãe É uma Peça', 'maepeca1.jpeg', 'André Pellenz', 2013, 1, 1),
(41, 2, 'Dona Hermínia passa a apresentar um bem-sucedido programa de TV e fica rica. Porém, ela agora precisa lidar com um lar vazio, pois Juliano e Marcelina resolveram sair de casa. Para balancear, Garib, o primogênito, chega com o neto. Além disso, também recebe uma longa visita da irmã Lucia Helena, a ovelha negra da família, que mora há anos em Nova York.', 'Minha Mãe É uma Peça 2', 'maepeca2.jpeg', 'César Rodrigues', 2016, 1, 1),
(42, 2, 'Dona Hermínia precisa se redescobrir e se reinventar porque seus filhos estão formando novas famílias. Marcelina está grávida e Juliano vai casar. Dona Hermínia está mais ansiosa do que nunca. Para completar as confusões, Carlos Alberto, seu ex-marido, que esteve sempre por perto, agora resolve se mudar para o apartamento ao lado.', 'Minha Mãe É uma Peça 3', 'maepeca3.jpeg', 'Susana Garcia', 2019, 1, 1),
(43, 2, 'Em 1973, o jovem Renato se muda com a família para a Brasília. Aos poucos, passa a se interessar por música e começa a se envolver com o cenário musical, formando com amigos a banda Aborto Elétrico. Em 1982, apesar da rejeição a suas novas canções, consegue despertar a atenção em outros círculos e retoma seu sonho de criar uma grande banda, convidando Marcelo Bonfá e Dado Villa-Lobos para formar a Legião Urbana, iniciando a trajetória que a tornaria umas das maiores bandas do rock brasileiro.', 'Somos Tão Jovens', 'somostaojovens.jpeg', 'Antonio Carlos da Fontoura', 2013, 1, 1),
(44, 2, 'Rubens, um poderoso bandido do interior paulista, decide dar um último grande golpe com a ajuda da sua filha adotiva Leônia, que fugiu da Bahia depois de ser estuprada pelo seu verdadeiro pai. A dupla resolve assaltar os cofres particulares de um banco na Avenida Paulista, no coração de São Paulo, mas nem tudo sai conforme o planejado.', 'Assalto na Paulista', 'assaltopaulista.jpeg', 'Flávio Frederico', 2022, 1, 1),
(45, 2, 'Num futuro não muito longínquo, uma povoação de nome Bacurau, em pleno sertão brasileiro, some misteriosamente do mapa. Quando uma série de assassinatos inexplicáveis começam a acontecer, os moradores da cidade tentam reagir. Mas como se podem defender de um inimigo desconhecido e implacável?', 'Bacurau', 'bacurau.jpeg', 'Kleber Mendonça Filho, Juliano Dornelles', 2019, 1, 1),
(46, 2, 'Cidade de Deus é um filme de ação brasileiro de 2002 produzido por O2 Filmes, Globo Filmes e Videofilmes e distribuído por Lumiére Brasil. É uma adaptação roteirizada por Bráulio Mantovani a partir do livro de mesmo nome escrito por Paulo Lins.', 'Cidade de Deus', 'cidadedeus.jpeg', 'Fernando Meirelles, Kátia Lund', 2002, 1, 1),
(47, 2, 'Quatro colegas de trabalho se programam para curtir o feriado prolongado em uma casa de praia. Lá, eles descobrem que se meteram em uma tremenda roubada.', 'Os Farofeiros', 'farofeiros.jpeg', 'Roberto Santucci', 2018, 1, 1),
(48, 2, 'Juliano e Joaquim são grandes amigos que deixam São Paulo com destino à Serra Pelada, o maior garimpo a céu aberto do mundo, localizado no estado do Pará. Sonhando com a riqueza, a vida dos dois muda por conta de violência e ganância.', 'Serra Pelada', 'serrapelada.jpeg', 'Heitor Dhalia', 2013, 1, 1),
(49, 2, 'Em uma iniciativa de reparação pelo passado escravocrata, o governo brasileiro decreta uma medida provisória e provoca uma reação imediata no Congresso Nacional. Os parlamentares aprovam uma medida que obriga os cidadãos negros a se mudar para a África na intenção de retomar as suas origens. A aprovação afeta diretamente a vida do casal formado pela médica Capitú e pelo advogado Antonio, além de seu primo, o jornalista André, que mora com eles no mesmo apartamento.', 'Medida Provisória', 'medidaprov.jpeg', 'Lázaro Ramos', 2022, 1, 1),
(50, 2, 'Fábio e Miá fazem um cruzeiro do Rio de Janeiro até a Europa de lua de mel, onde ela reencontra seu ex-namorado Beto, que está casado com Laura, antiga paixão de Fábio. Atrapalhados com essa coincidência, o casal vive situações cômicas e embaraçosas.', 'Meu Passado Me Condena', 'passadocondena.jpeg', 'Júlia Rezende', 2013, 1, 1),
(51, 2, 'Clóvis é um salafrário que acaba de ser descoberto após dar um golpe em um grupo de japoneses e está sendo perseguido pela polícia. Lohane é uma empreendedora do ramo alimentício que viu seus sonhos desabarem quando a prefeitura rebocou seu trailer de sanduíches por falta de alvará. Agora, os irmãos postiços precisam conviver novamente. Muito contrariado, Clóvis aprende a lidar com a espontaneidade excessiva da irmã, além de ensiná-la um truquezinho ou outro pra garantir a subsistência da dupla.', 'Os Salafrários', 'salafrarios.jpeg', 'Pedro Antônio Paes', 2021, 1, 1),
(52, 2, 'No Rio de Janeiro, cinco policiais se infiltram no Complexo do Alemão para um trabalho, mas acabam sendo desmascarados pelos criminosos locais. Agora, eles estão presos e precisam encontrar uma maneira de escapar.', 'Alemão', 'alemao.jpeg', 'José Eduardo Belmonte', 2014, 1, 1),
(53, 2, 'Marina volta de uma viagem com cinco milhões de reais em sua conta. Agora, ela só quer seguir em frente sem olhar para trás e encarar o que fez. Contudo, os encontros constantes entre Marina, Maria Eugênia, Henrique e o filho do casal não podem ser apenas uma coincidência. As duas mulheres descobrem que estão unidas por laços de amor e amizade que remontam para além dessa vida.', 'Nada É Por Acaso', 'nadaporacaso.jpeg', 'Márcio Trigo', 2022, 1, 1),
(54, 2, 'No final dos anos 1950, os jovens Célia e Tony Campello se apaixonam pelo rock. O ritmo era praticamente novo para o grande público, mas os dois lutam para fazer uma carreira na música, desbravando um campo totalmente novo.', 'Um Broto Legal', 'brotolegal.jpeg', 'Luiz Alberto Pereira', 2022, 1, 1),
(55, 2, 'Adriana é abandonada por Eduardo, seu esposo. Desiludida com a separação, ela resolve reconquistar o ex-marido, embarcando no mesmo cruzeiro onde ele está com a nova namorada, Beatriz, uma estrela da TV. Adriana embarca no navio com a irmã, Luiza, e a empregada, Dialinda. Decididas a arruinar a viagem de Eduardo e de sua namorada, essas três mulheres acabam descobrindo novos e inesperados caminhos para suas vidas.', 'S.O.S. Mulheres ao Mar!', 'mulheresmar.jpeg', 'Cris DAmato', 2014, 1, 1),
(56, 2, 'O anel Tatu Tatuado de Topázio, da socialite Gracinha de Medeiros, está em exposição em um museu. Ela, então, contrata os atrapalhados seguranças Pedrão e Jorginho para vigiarem a joia, uma herança de família. O anel é roubado e a dupla acusada de furto. Para provar que são inocentes, eles terão que enfrentar mafiosos portugueses e uma quadrilha de ninjas.', 'Os Caras de Pau em O Misterioso Roubo do Anel', 'carasdepau.jpeg', 'Felipe Joffily', 2014, 1, 1),
(57, 2, 'A família Terra Cambará e sua principal opositora, a família Amaral, viveram em conflito durante 150 anos, começando nas Missões até o final do século XIX. A luta entre essas duas famílias atravessa a formação do Rio Grande do Sul, a povoação do território brasileiro e a demarcação de suas fronteiras, forjada a ferro e espada pelas lutas entre as coroas portuguesa e espanhola. Um dia, o sobrado dos Terra-Cambará é cercado pelos Amaral, e eles são obrigados a se defenderem.', 'O Tempo e o Vento', 'tempoevento.jpeg', 'Jayme Monjardim', 2013, 1, 1),
(58, 2, 'Após ser abandonada pelo seu marido João e demitida de seu emprego, Alice fecha uma parceria com Marcela, sua vizinha e dona de uma loja de artigos eróticos.', 'De Pernas Pro Ar', 'pernaspar1.jpeg', 'Roberto Santucci', 2010, 1, 1),
(59, 2, 'Alice sofre um colapso nervoso de tanto trabalhar e se interna em um spa para se livrar do estresse. Porém o momento não poderia ser mais inoportuno, pois a rede de sex shop está para abrir sua primeira loja no exterior e Alice vai tentar de tudo para voltar ao trabalho e salvar seu casamento.', 'De Pernas Pro Ar 2', 'pernaspar2.jpg', 'Roberto Santucci', 2012, 1, 1),
(60, 2, 'O sucesso da rede de lojas Sexy Delícia leva Alice Segretto a fazer uma viagem pelo mundo. Trabalhando sem parar, Alice percebe que não tem conseguido acompanhar sua família, que também cresceu. Impetuosa, ela toma uma decisão inusitada: decide se aposentar e entregar o comando dos negócios para sua mãe.', 'De Pernas Pro Ar 3', 'pernaspar3.jpeg', 'Júlia Rezende', 2019, 1, 1),
(61, 2, 'Um humilde operador de copiadora se apaixona pela vizinha e, para conseguir se aproximar da jovem, se transforma num falsificador de dinheiro.', 'O Homem que Copiava', 'homemcopiava.jpeg', 'Jorge Furtado', 2003, 1, 1),
(62, 2, 'Médico sanitarista se oferece para realizar o trabalho de prevenção ao vírus HIV no Carandiru, maior presídio da América Latina, durante a década de 1990. Convivendo diariamente com a dura realidade dos detentos, ele presencia a violência agravada pela superlotação, a precariedade dos serviços prestados e a animalização dos presos. Paradoxalmente, ele conhece o sistema de organização interna e o lado frágil, romântico e sonhador dos homens cumprindo pena.', 'Carandiru: O Filme', 'carandiru.jpeg', 'Héctor Babenco', 2003, 1, 1),
(63, 2, 'Zezé é um garoto de oito anos que, apesar de levado, tem um bom coração. Ele leva uma vida bem modesta, devido ao fato de seu pai estar desempregado há bastante tempo, e tem o costume de ter longas conversas com um pé de laranja lima que fica no quintal de sua casa. Até que, um dia, conhece Portuga, um senhor que passa a ajudá-lo e logo se torna seu melhor amigo.', 'Meu Pé de Laranja Lima', 'laranjalima.jpeg', 'Marcos Bernstein', 2013, 1, 1),
(64, 2, 'As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. Eles estão sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela região.', 'O Auto da Compadecida', 'compadecida.jpeg', 'Guel Arraes', 2000, 1, 1),
(65, 2, 'Uma série de assassinatos abala a rotina da cidade de Joinlândia, e o subdelegado Claudio recebe a ajuda da destemida e experiente investigadora Keyla. No entanto, a diferença de ritmo e a falta de química dos dois só atrapalha a solução do caso.', 'Uma Quase Dupla', 'quasedupla.jpeg', 'Marcus Baldini', 2018, 1, 1),
(66, 2, 'Cláudio e Helena são casados há muitos anos e enfrentam a rotina do casamento. Um dia eles são atingidos por um fenômeno inexplicável e trocam de corpos. Apavorados, eles tentam lidar com a situação até encontrar uma solução para reverter o acontecimento bizarro. Mas à medida que vão enfrentando obstáculos, eles passam a aprender e a entender mais sobre o outro.', 'Se Eu Fosse Você', 'fossevoce.jpeg', 'Daniel Filho', 2006, 1, 1),
(67, 2, 'Jorge sofre um acidente na véspera do Natal e acorda um ano depois, sem lembranças do que ocorreu nesse período de tempo.', 'Tudo Bem no Natal Que Vem', 'tudobemnatalvem.jpeg', 'Roberto Santucci', 2020, 1, 1),
(68, 2, 'Policarpo é um patriota chauvinista; ele tenta encontrar soluções para os problemas brasileiros, utilizando apenas os recursos de seu próprio país. Seu temperamento visionário e idealista está por trás de suas ideias estranhas sobre como construir uma grande nação.', 'Policarpo Quaresma, Herói do Brasil', 'policarpo.jpeg', 'Paulo Thiago', 1998, 1, 1),
(69, 2, 'Comandando um grupo de jovens guerrilheiros, Carlos Marighella tenta divulgar sua luta contra a ditadura para o povo brasileiro, mas a censura descredita a revolução. Seu principal opositor é Lúcio, policial que o rotula como inimigo público do país.', 'Marighella', 'marighella.jpeg', 'Wagner Moura', 2021, 1, 1),
(70, 2, 'As irmãs Tina, Bianca, Alice e Karina estão em plena adolescência. Em meio aos conflitos que antecedem a fase adulta, elas ainda precisam ajudar o pai, que está passando por dificuldades financeiras depois que anunciaram um novo aumento no aluguel. Baseado no livro homônimo de Maria Mariana, que também originou a peça de teatro e a série televisiva.', 'Confissões de Adolescente', 'confissaoadolescente.jpeg', 'Daniel Filho', 2014, 1, 1),
(71, 2, 'Três amigos passam por fases em seus relacionamentos. Fernando tenta lidar com um divórcio, enquanto Honório desconfia da traição de sua mulher e Afonsinho quer vencer seu bloqueio com namoros.', 'E Aí... Comeu?', 'eaicomeu.jpeg', 'Felipe Joffily', 2012, 1, 1),
(72, 2, 'A comunidade do Alemão no Rio de Janeiro é conhecida pela sua alta taxa de criminalidade. Mais uma vez, uma equipe enfrenta o tráfico de drogas para tentar realizar as missões necessárias dentro do complexo.', 'Alemão 2', 'alemao2.jpeg', 'José Eduardo Belmonte', 2022, 1, 1),
(73, 2, 'Desprezado pela ex-namorada, Beto tenta o suicídio e é salvo pelo vigarista Marco Polo, que promete ajudar seu novo amigo a reatar com a amada. Mas quando Marco Polo conhecer esta mulher, os planos mudam.', 'Os Penetras', 'ospenetras.jpeg', 'Andrucha Waddington', 2012, 1, 1),
(74, 2, 'Após herdar a fortuna de Tereza Cristina, Crô está cansado da vida de milionário. Decidido a encontrar uma nova musa a quem possa dedicar sua vida, ele inicia uma busca pessoal que faz com que entreviste diversas peruas. Seu objetivo é encontrar aquela que seja melhor qualificada para que ele próprio possa servir como mordomo, assim como fez com sua antiga patroa. Entretanto, após muito avaliar, acaba percebendo que sua musa ideal é justamente aquela que jamais havia imaginado.', 'Crô - O Filme', 'cro.jpeg', 'Bruno Barreto', 2013, 1, 1),
(75, 2, 'Cinco amigos de adolescência se reencontram e compartilham a frustração de estarem sem dinheiro. Para recuperar o tempo perdido, eles decidem assaltar uma transportadora de valores, mas nem tudo sai como planejaram.', 'Vai que Dá Certo', 'vaiquedacerto.jpeg', 'Maurício Farias', 2013, 1, 1),
(76, 2, 'Neide se separou do marido recentemente e deseja aproveitar ao máximo a vida de solteira. Atrapalhada pelo filho mais novo, ela decide juntar o rapaz com uma de suas funcionárias a todo custo.', 'A Sogra Perfeita', 'sograperfeita.jpeg', 'Cris DAmato', 2020, 1, 1),
(77, 2, 'Através do espírito do Dr. Fritz, médico alemão falecido durante a Primeira Guerra Mundial, José Arigó se tornou uma esperança de cura para milhões de pessoas ao redor do mundo. Ele foi alvo de críticas por parte dos mais céticos, mas com o apoio de sua esposa, conseguiu salvar inúmeras vidas por intermédio da cirurgia espiritual.', 'Predestinado: Arigó e o Espírito do Dr. Fri', 'predestinado.jpeg', 'Gustavo Fernandez', 2022, 1, 1),
(78, 2, 'Deco vive jogado no sofá de sua casa, apesar de ter talento musical. Um dia, ele encontra dois grandes amores: a radialista Zoé e o cachorro Guto, que desmaia toda vez que fica muito animado. Não demora muito e o trio começa a viver junto. Mas dois anos depois, Zoé termina o namoro, fica com a guarda de Guto e arranja um novo namorado. Motivos mais do que suficientes para que Deco fique revoltado e prepare uma vingança: sequestrar Guto. Para isso, ele conta com a ajuda de seu primo Leléo.', 'Mato Sem Cachorro', 'matocachorro.jpeg', 'Pedro Amorim', 2013, 1, 1),
(79, 2, 'O sonho de Pérola é ser uma chef de cozinha. Seu desejo fica perto de se tornar realidade quando é chamada para ser assistente de um renomado chef em um programa de TV.', 'Uma Pitada de Sorte', 'pitadasorte.jpeg', 'Pedro Antônio Paes', 2022, 1, 1),
(80, 2, 'João Guilherme Estrella é um jovem da classe média que se torna o rei do tráfico de drogas da zona sul do Rio de Janeiro. O rapaz inteligente e adorado pelos pais passa a ser investigado pela polícia e enfrenta a dura realidade de um criminoso.', 'Meu Nome Não é Johnny', 'nomejohnny.jpeg', 'Mauro Lima', 2008, 1, 1),
(81, 2, 'Continuando uma tradição de família, Quinzinho quer levar o filho Neco para assistir a um filme de Mazzaropi. Sem fazer ideia de onde achar um cinema que ainda exiba Mazzoropi, ele e a família caem na estrada, sem saber da jornada que os aguarda.', 'Tapete Vermelho', 'tapetevermelho.jpeg', 'Luiz Alberto Pereira', 2005, 1, 1),
(82, 2, 'A trajetória profissional e pessoal de Cazuza, do início da carreira, em 1981, até a morte em 1990, aos 32 anos. O sucesso com o Barão Vermelho, a carreira solo, as músicas que falavam dos anseios de uma geração, o comportamento transgressor e a coragem de continuar a carreira mesmo debilitado pela aids.', 'Cazuza - O Tempo Não Pára', 'cazuza.jpeg', 'Sandra Werneck e Walter Carvalho', 2004, 1, 1),
(83, 2, 'Darlene, mãe solteira, volta à terra natal e se casa com um homem bem mais velho, Osias Linhares. O casamento tem certa estabilidade, mas Darlene continua insatisfeita. Ela se envolve com o primo de Osias, Zezinho, que acaba se tornando seu amante. Um terceiro homem, o jovem e atraente Ciro, completa a trinca de maridos que, junto com filhos de todos eles e de alguns outros homens, formam um inusitado arranjo familiar.', 'Eu, Tu, Eles', 'eutueles.jpeg', 'Andrucha Waddington', 2000, 1, 1),
(84, 2, 'Baby vive sozinha no apartamento que herdou da mãe e dá aulas de violão para alguns alunos. Max se muda para a unidade vizinho, e ela, apaixonada, se dispõe a enfrentar seu vício compulsivo por cigarro.', 'É Proibido Fumar', 'proibidofumar.jpeg', 'Anna Muylaert', 2009, 1, 1),
(85, 3, 'Alexia, Luna e Kyra precisam ingressar no Programa de Proteção à Testemunha e mudar de vida após presenciarem um crime. Elas alteram o nome, a aparência, o estilo de vida e vão morar em Judas do Norte depois que são dadas como mortas.', 'Salve-se Quem Puder', 'salvesequempuder.jpeg', 'Marcelo Travesso; Fred Mayrink', 2020, 1, 1),
(86, 3, 'José Leôncio, fazendeiro do Pantanal, viaja para o Rio de Janeiro e engravida uma jovem. Ela se muda para o Centro-Oeste, mas fica infeliz e resolve voltar para o Rio com o filho. Vinte anos depois, o garoto volta ao Pantanal para reencontrar o pai.', 'Pantanal', 'pantanal.jpeg', 'Gustavo Fernandez', 2022, 1, 1),
(87, 3, 'Ari é um arquiteto maranhense que se dedica à defesa de patrimônios históricos. Ele e Brisa, seu amor de infância, têm seus destinos desencontrados quando ele vai investigar uma construtora, e ela é confundida com uma sequestradora de crianças.', 'Travessia', 'travessia.jpeg', 'Mauro Mendonça Filho', 2022, 1, 1),
(88, 3, 'Lurdes, Thelma e Vitória são mulheres que exercem a maternidade em toda sua plenitude, cada uma à sua maneira. Apesar de viverem em realidades diferentes, com trajetórias distintas, elas descobrem um elo que liga suas vidas para sempre.', 'Amor de Mãe', 'amordemae.jpeg', 'José Luiz Villamarim', 2019, 1, 1),
(89, 3, 'Sol é vendedora de marmitas e também canta no coral da igreja desde a infância, mas esconde um segredo dos pais: nos anos 2000, era um fenômeno dos bailes funks. Enfrentando dificuldades financeiras com a família, ela acaba voltando aos palcos.', 'Vai na Fé', 'vainafe.jpeg', 'Paulo Silvestrini Cristiano Marques', 2023, 1, 1),
(90, 3, 'Durante a primeira metade do século 20, Dona Lola luta para manter os integrantes de sua família unidos frente às dificuldades financeiras que atravessam. Casada com Júlio e mãe de quatro filhos, Lola é uma mulher forte e à frente de seu tempo.', 'Eramos Seis', 'eramosseis.jpeg', 'Pedro Peregrino; Carlos Araújo', 2019, 1, 1),
(91, 3, 'Neném, Paula, Guilherme e Flávia não se conheciam até o dia em que o destino os coloca dentro do mesmo avião. Após passarem juntos pela experiência de encarar a Morte, eles ganham uma segunda chance.', 'Quanto Mais Vida Melhor', 'quantomaisvidamelhor.jpeg', 'Pedro Brenelli, Allan Fiterman', 2021, 1, 1),
(92, 3, 'Davi faz do ilusionismo sua arte e seu meio de sobreviver. Isadora tem os pés no chão e mira horizontes mais promissores. Eles precisam enfrentar grandes obstáculos, como as diferenças sociais, para ficarem juntos.', 'Além da Ilusão', 'alemdailusao.jpeg', 'Luís Felipe Sá', 2022, 1, 1),
(93, 3, 'Haja Coração é uma telenovela brasileira produzida pela TV Globo e exibida originalmente de 31 de maio a 8 de novembro de 2016, em 138 capítulos. Substituiu Totalmente Demais e foi substituída por Rock Story, sendo a 88ª \"novela das sete\" exibida pela emissora.', 'Haja Coração', 'hajacoração.jpeg', 'Teresa Lampreia', 2016, 1, 1),
(94, 3, 'A jovem e sonhadora Paloma tem o seu mundo virado do avesso quando recebe um exame errado e acredita ter só mais seis meses de vida. Ela decide viver intensamente, até descobrir que o exame foi trocado e conhecer o homem que possui a doença terminal.', 'Bom Sucesso', 'bomsucesso.jpeg', 'Luiz Henrique Rios', 2019, 1, 1),
(95, 3, 'Separados desde pequenos, os gêmeos Christian e Christofer crescem em realidades opostas. Quando finalmente se encontram, uma reviravolta muda a vida de Christian e de todos ao seu redor.', 'Um Lugar ao Sol', 'umlugaraosol.jpeg', 'Maurício Farias', 2021, 1, 1),
(96, 3, 'Nascidas e criadas na favela de Paraisópolis, as amigas-irmãs Mari e Danda sonham alto e querem uma vida melhor. Contrariando os pais, o arquiteto Benjamin, namorado e sócio de Margot, quer reurbanizar a comunidade, mas acaba se apaixonando por Mari.', 'I Love Paraisópolis', 'iloveparaisopolis.jpeg', 'Wolf Maya; Carlos Araújo', 2015, 1, 1),
(97, 3, 'Abandonada pelo marido, Carolina se muda para São Paulo com a filha Arlete, uma linda jovem que sonha em ser modelo. Porém, por trás do glamour do mundo da moda, está o tentador e perigoso submundo da prostituição de luxo.', 'Verdades Secretas', 'verdadessecretas.jpeg', 'Mauro Mendonça Filho, Amora Mautner', 2015, 1, 1),
(98, 3, 'Duas vidas são unidas pelos mais fortes laços, o amor e a família, e também marcadas pelos duros sentimentos de ciúme, culpa e inveja. Laerte é consumido pelo amor à prima Helena e sua obsessão cresce cada vez que o amigo Virgílio se aproxima dela.', 'Em Família', 'emfamilia.jpeg', 'Jayme Monjardim, Leonardo Nogueira', 2014, 1, 1),
(99, 3, 'Dividida entre o amor de Jonatas e Arthur, Eliza, apesar das armações de Carolina, luta para se tornar modelo e vencer o concurso Garota Totalmente Demais.', 'Totalmente Demais', 'totalmentedemais.jpeg', 'Luis Henrique Rios', 2015, 1, 1),
(100, 3, 'Bruno tem um romance com Luana, ambos descendentes de duas famílias de imigrantes italianos rivais, os Mezengas e os Berdinazi, que fizeram fortuna no Brasil com criação de gado e plantações de café, respectivamente.', 'O Rei do Gado', 'oreidogado.jpeg', 'Luiz Fernando Carvalho', 1996, 1, 1),
(101, 3, 'A novela aborda um problema cada vez mais grave: o tráfico de pessoas. A protagonista é uma das vítimas e conquistará o coração de Theo (Rodrigo Lombardi), chefe da UPP de um Complexo do Alemão fictício. Parte da novela é ambientada na Turquia (Istambul e Capadócia, onde São Jorge nasceu) e a outra parte, no Rio de Janeiro. Flávia Alessandra é a tenente Érica, uma veterinária militar. A novela aborda também a fé em São Jorge da Capadócia, que representa a força que todos precisam ter para matar os dragões da vida.', 'Salve Jorge', 'salvejorge.jpeg', 'Marcos Schechtman', 2012, 1, 1),
(102, 3, 'A atriz Cris Valência vai à terra natal de seu namorado para protagonizar um filme dirigido por ele. Enquanto pesquisa para interpretar a personagem, Cris vive uma experiência de viagem no tempo, em que se depara com uma de suas vidas passadas.', 'Espelho da Vida', 'espelhodavida.jpeg', 'Cláudio Boeckel; Pedro Vasconcelos', 2018, 1, 1),
(103, 3, 'José Alfredo, dono de uma rede internacional de joalherias, é capaz de tudo para manter o seu poder. Porém, alguns parentes querem se apropriar de sua fortuna. Em meio a essa luta pelo poder, ela também enfrenta uma crise conjugal.', 'Império', 'imperio.jpeg', 'Rogério Gomes', 2014, 1, 1),
(104, 3, 'Sol Nascente conta a história do amor improvável dos grandes amigos Alice e Mário e de suas famílias imigrantes. É passada em \"Arraial\", que além das belas praias, é uma cidade acolhedora e de fortes agitos.', 'Sol Nascente', 'solnascente.jpeg', 'Leonardo Nogueira', 2016, 1, 1),
(105, 3, 'Uma pequena cidade possui uma fonte com propriedades curativas e rejuvenescedoras, protegida por sete guardiães que garantem sua segurança. Quando o poderoso gato Léon desaparece, todos temem que ele tenha ido atrás de um substituto do guardião-mor.', 'O Sétimo Guardião', 'osetimoguardiao.jpeg', 'Allan Fiterman', 2018, 1, 1);
INSERT INTO `obra` (`ID_OBRA`, `VALOR_OBRA`, `DESC_OBRA`, `NOME_OBRA`, `FOTO_OBRA`, `AU_DI_OBRA`, `ANO_OBRA`, `perfil_ID_PERFIL`, `perfil_usuario_ID_USUARIO`) VALUES
(106, 3, 'Júlia é uma paleontóloga que precisa reconstruir seu trabalho e, ao encontrar Abner, um fazendeiro caipira, vive um improvável amor. Enquanto isso, o cientista Ícaro tenta criar um robô que reproduza sua falecida mulher amada.', 'Morde e Assopra', 'mordeeassopra.jpeg', 'Pedro Vasconcelos', 2011, 1, 1),
(107, 3, 'Em uma sociedade onde o casamento é visto como o único futuro possível para uma mulher de boa família, Elisabeta é uma jovem libertária e cheia de sonhos que tem uma ousadia natural em sua personalidade e enfrenta os conflitos sociais e de conduta.', 'Orgulho e Paixão', 'orgulhoepaixao.jpeg', 'Fred Mayrink', 2018, 1, 1),
(108, 3, 'Seis jovens lutam para conseguir o que querem, principalmente a felicidade, um sentimento que não se compra. Alguns demoram para entender isso, outros nunca entenderão. Mas há também aqueles que serão felizes mesmo nas circunstâncias mais adversas.', 'Sangue Bom', 'sanguebom.jpeg', 'Dennis Carvalho', 2013, 1, 1),
(109, 3, 'Para evitar uma guerra entre os reinos de Montemor e Artena, o príncipe Afonso deixa de lado seu amor por uma doce plebeia para casar com uma princesa mimada e malvada', 'Deus Salve o Rei', 'deussalve.jpeg', 'Fabrício Mamberti', 2018, 1, 1),
(110, 3, 'O famoso cantor de axé Beto Falcão está em plena decadência no final dos anos 1990 em Salvador, até que um avião em que ele deveria estar cai e ele é dado como morto. Beto vê sua imagem ser ovacionada e precisa deixar a cidade para continuar assim. ', 'Segundo Sol', 'segundosol.jpeg', 'Maria de Médicis, Dennis Carvalho', 2018, 1, 1),
(111, 3, 'Candinho foi separado da mãe logo após seu nascimento e acolhido por um casal dono de uma fazenda. Mas quando cresce, Candinho é expulso por se apaixonar pela primogênita, Filomena. Candinho segue para a capital em busca da mãe biológica.', 'Êta Mundo Bom!', 'etamundo.jpeg', 'Jorge Fernando', 2016, 1, 1),
(112, 3, 'A novela tem como eixo central o romance inter-racial vivido pelo botânico rico Paco e a feirante pobre Preta. Os dois se apaixonam, mas enfrentam grandes desafios em nome do amor.', 'A Cor do Pecado', 'acor.jpeg', 'Denise Saraceni', 2004, 1, 1),
(113, 3, 'Poliana precisa enfrentar os dilemas típicos da adolescência, como os dramas escolares, os planos para o futuro e a descoberta do amor entre o ex-valentão, Eric, e seu melhor amigo, João, encontrando em Helena uma rival no coração dos dois.', 'Poliana Moça', 'polianamoca.jpeg', 'Ricardo Mantoanelli', 2022, 1, 1),
(114, 3, 'Poliana é uma menina amorosa que fica sozinha no mundo após a morte de seu pai. Uma assistente social a envia para a casa de uma tia distante, uma matriarca autoritária.', 'As Aventuras de Poliana', 'aventuraspoliana.jpeg', 'Reynaldo Boury', 2018, 1, 1),
(115, 3, 'Manuela e Isabela, irmãs gêmeas, foram separadas após o nascimento e se reencontram somente após 12 anos. Elas decidem trocar de lugar, mas o plano não funciona tão bem quando uma competição musical começa e as duas tentam manter a farsa.', 'Cúmplices de um Resgate', 'cumplices.jpeg', 'Reynaldo Boury', 2015, 1, 1),
(116, 3, 'Esmeralda é uma moça cega que nasce aparentemente morta numa família rica. A parteira e a governanta resolvem trocar a menina por um menino, filho de uma camponesa que morreu no parto.', 'Esmeralda', 'esmeralda.jpeg', 'Henrique Martins', 2004, 1, 1),
(117, 3, 'No orfanato Raio de Luz, Mili e suas amigas enfrentam juntas os desafios da vida.', 'Chiquititas', 'chiquititas.jpeg', 'Reynaldo Boury', 2013, 1, 1),
(118, 3, 'Pérola Negra é uma telenovela brasileira produzida pelo Sistema Brasileiro de Televisão e exibida de 9 de novembro de 1998 a 18 de junho de 1999 em 197 capítulos. Substituiu Fascinação e foi substituída por A Usurpadora, encerrando a dramaturgia da emissora naquele momento.', 'Pérola Negra', 'perolanegra.jpeg', 'Antonino Seabra', 1998, 1, 1),
(119, 3, 'Dulce Maria é filha única de Gustavo e Tereza e tem 5 anos. Mas ao perder a mãe, passa a viver no colégio Doce Horizonte, internato religioso da zona rural, sem contato com o pai.', 'Carinha de Anjo', 'carinhaanjo.jpeg', 'Ricardo Mantoanelli', 2016, 1, 1),
(120, 3, 'A saga de Moisés, desde seu nascimento até a chegada de seu povo à Terra Prometida.', 'Os Dez Mandamentos', 'dezmandamentos.jpeg', '', 2015, 1, 1),
(121, 3, 'A história de grandes eventos dos primeiros 2300 anos da humanidade. A criação do mundo, Adão e Eva, o grande dilúvio, a Torre de Babel e a jornada de Abraão, chegando até o período de escravidão do povo hebreu no Egito.', 'Gênesis', 'genesis.jpeg', 'Edgard Miranda', 2021, 1, 1),
(122, 3, 'A Escrava Isaura é uma telenovela brasileira produzida e exibida pela RecordTV entre 18 de outubro de 2004 a 29 de abril de 2005 em 167 capítulos, substituindo parte do horário ocupado pelo Cidade Alerta e sendo substituída por Essas Mulheres.', 'A Escrava Isaura', 'escravaisaura.jpeg', 'Herval Rossano', 2004, 1, 1),
(123, 3, 'A novela aborda as consequências do poder do dinheiro na vida das pessoas. O Bolão da Amizade é um grupo de dez amigos de origem humilde que toda semana se reúne para apostar na loteria. Após dois anos de tentativas frustradas, os amigos finalmente ganham um prêmio de 200 milhões de reais, mas há um pacto: cada um dos vencedores só terá acesso à sua parte do dinheiro se cumprirem com determinadas missões. A trama mostra as mudanças que o dinheiro causa na vida dessas pessoas e o cumprimento do pacto firmado entre os vencedores.', 'Vidas em Jogo', 'vidasemjogo.jpeg', 'Alexandre Avancini', 2011, 1, 1),
(124, 3, 'Em tom de comédia romântica e momentos de grande suspense, confira a história de uma menina que se perdeu dos pais e busca o final feliz com o reencontro de sua família.', 'Prova de Amor', 'provadeamor.jpeg', 'Alexandre Avancini', 2005, 1, 1),
(125, 3, 'Rebeldes foi um grupo musical brasileiro surgido em 2011 na telenovela juvenil Rebelde, produzida pela RecordTV.', 'Rebeldes', 'rebeldes.jpeg', 'Ivan Zettel', 2011, 1, 1),
(126, 4, 'A primeira, uma viagem de ônibus em que as vozes de doze personagens se confundem e se chocam. A segunda, uma galeria de arte cuja principal exibição não é propriamente a arte. E a terceira, uma série de cartas ácidas e sombrias escritas por uma escritora amargurada. Três contos que se encontram e se completam.', 'Corações Ruidosos em Queda Livre', 'coracoesruidosos.jfif', 'Alex Sens', 2018, 1, 1),
(127, 4, 'Nas profundezas do sertão baiano, as irmãs Bibiana e Belonísia encontram uma velha e misteriosa faca na mala guardada sob a cama da avó. Ocorre então um acidente. E para sempre suas vidas estarão ligadas — a ponto de uma precisar ser a voz da outra.', 'Torto Arado', 'tortoarado.jfif', 'Itamar Viera Junior', 2019, 1, 1),
(128, 4, 'Há uma guerra no céu. O confronto civil entre o arcanjo Miguel e as tropas revolucionárias de seu irmão, Gabriel, devasta as sete camadas do paraíso. Com as legiões divididas, as fortalezas sitiadas, os generais estabeleceram um armistício na terra, uma trégua frágil e delicada, que pode desmoronar a qualquer instante. Enquanto os querubins se enfrentam num embate de sangue e espadas, dois anjos são enviados ao mundo físico com a tarefa de resgatar Kaira, uma capitã dos exércitos rebeldes, desaparecida enquanto investigava uma suposta violação do tratado. A missão revelará as tramas de uma conspiração milenar, um plano que, se concluído, reverterá o equilíbrio de forças no céu e ameaçará toda vida humana na terra. Ao lado de Denyel, um ex-espião em busca de anistia, os celestiais partirão em uma jornada através de cidades, selvas e mares, enfrentarão demônios e deuses, numa trilha que os levará às ruínas da maior nação terrena anterior ao dilúvio — o reino perdido de Atlântida.', 'Filhos do Éden: herdeiros de Atlântica', 'filhosdoeden1.jpg', 'Eduardo Spohr', 2012, 1, 1),
(129, 4, 'Machado de Assis (1839-1908), escrevendo Dom Casmurro, produziu um dos maiores livros da literatura universal. Mas criando Capitu, a espantosa menina de \"olhos oblíquos e dissimulados\", de \"olhos de ressaca\", Machado nos legou um incrível mistério, um mistério até hoje indecifrado. Há quase cem anos os estudiosos e especialistas o esmiuçam, o analisam sob todos os aspectos. Em vão. Embora o autor se tenha dado ao trabalho de distribuir pelo caminho todas as pistas para quem quisesse decifrar o enigma, ninguém ainda o desvendou. A alma de Capitu é, na verdade, um labirinto sem saída, um labirinto que Machado também já explorara em personagens como Virgília (Memórias Póstumas de Brás Cubas) e Sofia (Quincas Borba), personagens construídas a partir da ambigüidade psicológica, como Jorge Luis Borges gostaria de ter inventado.\"', 'Dom Casmurro', 'domcasmurro', 'Machado de Assis', 1997, 1, 1),
(130, 4, 'Fazendo meu filme é um livro encantador, daqueles que lemos compulsivamente e, quando terminamos, sentimos saudade. Não há como não se envolver com Fani, suas descobertas e seus anseios, típicos da adolescência. Uma história bem-humorada e divertida que conquista o leitor a cada página. Seja a relação com a família, consigo mesma e com o mundo; seja a convivência com as amigas, na escola e nas festas; seja a relação com seu melhor amigo e confidente. Tudo muda na vida de Estefânia quando surge a oportunidade de fazer um intercâmbio e morar um ano em outro país. As reveladoras conversas por telefone ou MSN e os constantes bilhetinhos durante a aula passam a ter outro assunto: a viagem que se aproxima. É sobre isto que trata este livro: o fascinante universo de uma menina cheia de expectativas, que vive a dúvida entre continuar sua rotina, com seus amigos, familiares, estudos e seu inesperado novo amor, ou se aventurar em outro país e mergulhar num mundo cheio de novas possibilidades. As melhores cenas da vida de Fani podem ainda estar por vir.', 'Fazendo meu Filme', 'fazendomeufilme.jpg', 'Paula Pimenta', 2009, 1, 1),
(131, 4, 'Publicado em 1937, pouco depois de implantado o Estado Novo, este livro teve a primeira edição apreendida e exemplares queimados em praça pública de Salvador por autoridades da ditadura. Em 1940, marcou época na vida literária brasileira, com nova edição, e a partir daí, sucederam-se as edições nacionais e em idiomas estrangeiros. A obra teve também adaptações para o rádio, teatro e cinema. Documento sobre a vida dos meninos abandonados nas ruas de Salvador, Jorge Amado a descreve em páginas carregadas de beleza, dramaticidade e lirismo.', 'Capitães de Areia', 'capitaesdeareias.jpg', 'Jorge Amado', 2000, 1, 1),
(132, 4, 'O que impulsiona os personagens é a seca, áspera e cruel, e paradoxalmente a ligação telúrica, afetiva, que expõe naqueles seres em retirada, à procura de meios de sobrevivência e um futuro. Apesar desse sentimento de transbordante solidariedade e compaixão com que a narrativa acompanha a miúda saga do vaqueiro Fabiano e sua gente, o autor contou: \"Procurei auscultar a alma do ser rude e quase primitivo que mora na zona mais recuada do sertão... os meus personagens são quase selvagens... pesquisa que os escritores regionalistas não fazem e nem mesmo podem fazer... porque comumente não são familiares com o ambiente que descrevem... Fiz o livrinho sem paisagens, sem diálogos. E sem amor. A minha gente, quase muda, vive numa casa velha de fazenda. As pessoas adultas, preocupadas com o estômago, não têm tempo de abraçar-se. Até a cachorra [Baleia] é uma criatura decente, porque na vizinhança não existem galãs caninos\". VIDAS SECAS é o livro em que Graciliano, visto como antipoético e anti-sonhador por excelência, consegue atingir, com o rigor do texto que tanto prezava, um estado maior de poesia.\"', 'Vidas Secas', 'vidassecas.jpg', 'Graciliano Ramos', 2005, 1, 1),
(133, 4, 'O livro que iniciou a série com os Karas. Uma turma de adolescentes enfrenta o mais diabólico dos crimes. Num clima de muito mistério e suspense, cinco estudantes, os Karas, enfrentam uma macabra trama internacional: o sinistro Doutor QI pretende subjugar a humanidade aos seus desígnios, aplicando na juventude uma perigosa droga. E essa droga já está sendo experimentada em alunos dos melhores colégios de São Paulo. Esse é um trabalho para os Karas: o avesso dos coroas, o contrário dos caretas.', 'A droga da obediência (Os Karas #1)', 'adrogadaobediencia.jpg', 'Pedro Bandeira', 2003, 1, 1),
(134, 4, 'O jovem pastor Santiago tem um sonho que se repete. O sonho fala de um tesouro oculto, guardado perto das Pirâmides do Egito. Decidido a seguir seu sonho, o rapaz se depara com os grandes mistérios que acompanham a raça humana desde a sua criação; o Amor, os sinais de Deus, o sonho que cada um de nós precisa seguir na vida. A peregrinação de Santiago, narrada pelo escritor Paulo Coelho em O alquimista, transformou-se num dos maiores fenômenos literários. Caminhando em uma caravana pelo deserto do Saara, ele entra em contato com pessoas e presságios que lhe indicam o caminho a seguir. Entre eles, um misterioso personagem - um Alquimista. É quem irá ensiná-lo a penetrar na Alma do Mundo e a receber todas as pistas necessárias para chegar até o tesouro.', 'O alquimista', 'oalquimista.jpg', 'Paulo Coelho', 2006, 1, 1),
(135, 4, 'Um grupo de jovens deixa uma pequena cidade no Paraná para viver no Rio de Janeiro. Eles alugam um apartamento em Copacabana e fazem o possível para pagar a faculdade e manter vivos seus sonhos de sucesso na capital fluminense. Mas o dinheiro está curto e o aluguel está vencido. Para sair do buraco e manter o apartamento, os amigos adotam uma estratégia heterodoxa: arrecadar fundos por meio de jantares secretos, divulgados pela internet para uma clientela exclusiva da elite carioca. No cardápio: carne humana. A partir daí, eles se envolvem numa espiral de crimes, descobrem uma rede de contrabando de corpos, matadouros clandestinos, grã-finos excêntricos e levam ao limite uma índole perversa que jamais imaginaram existir em cada um deles.', 'Jantar Secreto', 'jantarsecreto.jpg', 'Raphael Montes', 2016, 1, 1),
(136, 4, 'Com uma narrativa madura, precisa e ao mesmo tempo delicada e poética, o romance narra a história do casal Dalva e Venâncio, que tem a vida transformada após uma perda trágica, resultado do ciúme doentio do marido, e de Lucy, a prostituta mais depravada e cobiçada da cidade, que entra no caminho deles, formando um triângulo amoroso. Na orelha do livro, Martha Medeiros escreve: \"Tudo é rio é uma obra-prima, e não há exagero no que afirmo. É daqueles livros que, ao ser terminado, dá vontade de começar de novo, no mesmo instante, desta vez para se demorar em cada linha, saborear cada frase, deixar-se abraçar pela poesia da prosa. Na primeira leitura, essa entrega mais lenta é quase impossível, pois a correnteza dos acontecimentos nos leva até a última página sem nos dar chance para respirar. É preciso manter-se à tona ou a gente se afoga.\" A metáfora do rio se revela por meio da narrativa que flui - ora intensa, ora mais branda - de forma ininterrupta, mas também por meio do suor, da saliva, do sangue, das lágrimas, do sêmen, e Carla faz isso sem ser apelativa, sem sentimentalismo barato, com a habilidade que só os melhores escritores possuem.', 'Tudo é Rio', 'tudoerio.jpg', 'Carla Madeira', 2021, 1, 1),
(137, 4, 'Felipe está esperando por esse momento desde que as aulas começaram: o início das férias de julho. Finalmente ele vai poder passar alguns dias longe da escola e dos colegas que o maltratam. Os planos envolvem se afundar nos episódios atrasados de suas séries favoritas, colocar a leitura em dia e aprender com tutoriais no YouTube coisas novas que ele nunca vai colocar em prática.  Mas as coisas fogem um pouco do controle quando a mãe de Felipe informa que concordou em hospedar Caio, o vizinho do 57, por longos quinze dias, enquanto os pais dele estão viajando. Felipe entra em desespero porque a) Caio foi sua primeira paixãozinha na infância (e existe uma grande possibilidade dessa paixão não ter passado até hoje) e b) Felipe coleciona uma lista infinita de inseguranças e não tem a menor ideia de como interagir com o vizinho. Os dias que prometiam paz, tranquilidade e maratonas épicas de Netflix acabam trazendo um turbilhão de sentimentos, que obrigam Felipe a mergulhar em todas as questões mal resolvidas que ele tem consigo mesmo.', 'Quinze Dias', 'quinzedias.jpg', 'Vitor Martins', 2017, 1, 1),
(138, 4, 'A vida de uma mulher, dos 8 aos 52, desde as singelezas cotidianas até as tragédias que persistem, uma geração após a outra. Um livro denso e leve, violento e poético. É assim O peso do pássaro morto, romance de estreia de Aline Bei, onde acompanhamos uma mulher que, com todas as forças, tenta não coincidir apenas com a dor de que é feita. ', 'O peso do pássaro morto', 'passaromorto.jpg', 'Aline Bei', 2017, 1, 1),
(139, 4, 'Jonas não sabe muito bem o que fazer da vida. Entre suas leituras e ideias para livros anotadas em um caderninho de bolso, ele precisa dar conta de seus turnos no Rocket Café e ainda lidar com o conservadorismo de seus pais, sua mãe alimenta a esperança de que ele volte a frequentar a igreja, e seu pai não faz muito por ele além de trazer problemas. Mas é quando ele conhece Arthur, um belo garoto de barba ruiva, que Jonas passa a questionar por quanto tempo conseguirá viver sob as expectativas de seus pais, fingindo ser uma pessoa diferente de quem é de verdade. Buscando conforto em seus amigos (e na sua história sobre dois piratas bonitões que se parecem muito com ele e Arthur), Jonas entenderá o verdadeiro significado de família e amizade, e descobrirá o poder de uma boa história.', 'Um Milhão de Finais Felizes', 'finaisfelizes.jpg', 'Vitor Martins', 2018, 1, 1),
(140, 4, 'A vida de Luna está uma bagunça! O namorado a traiu com a vizinha, seu carro passa mais tempo na oficina do que com ela e seu chefe vive trocando seu nome. Recém-formada em jornalismo, ela trabalha como recepcionista na renomada Fatos&Furos. Mas, em tempos de internet e notícias instantâneas, a revista enfrenta problemas e o quadro de jornalistas diminuiu drasticamente. É assim que a coluna do horóscopo semanal cai no colo dela. Embora não tenha a menor ideia de como fazer um mapa astral e não acredite em nenhum tipo de magia, Luna aceita o desafio sem pestanejar. Afinal, quão complicado pode ser criar um texto em que ninguém presta atenção? Mas a garota nem desconfia dos perigos que a aguardam e, entre muitas confusões, surge uma indesejada, porém irresistível paixão que vai abalar o seu mundo. O romance perfeito não fosse com o homem errado. Sem saída, Luna terá que lutar com todas as forças contra a magia mais poderosa de todas, que até então ela desconhecia: o amor. Com seu estilo ágil e fluido, Carina Rissi criou em No mundo da Luna uma leitura viciante, permeada de humor, magia e paixão, que vai conquistar você do início ao fim.', 'No mundo da Luna', 'mundoluna.jpg', 'Carina Rissi', 2015, 1, 1),
(141, 4, 'Do diário da catadora de papel Carolina Maria de Jesus surgiu este autêntico exemplo de literatura-verdade, que relata o cotidiano triste e cruel da vida na favela. Com uma linguagem simples, mas contundente e original, a autora comove o leitor pelo realismo e pela sensibilidade na maneira de contar o que viu, viveu e sentiu durante os anos em que morou na comunidade do Canindé, em São Paulo, com seus três filhos. Ao ler este relato-verdadeiro best-seller no Brasil e no exterior, você vai acompanhar o duro dia a dia de quem não tem amanhã. E vai perceber que, mesmo tendo sido escrito na década de 1950, este livro jamais perdeu sua atualidade.', 'Quarto de Despejo', 'quartodedespejo.jpg', 'Carolina Maria de Jesus', 2014, 1, 1),
(142, 4, 'Em Olhos dágua Conceição Evaristo ajusta o foco de seu interesse na população afro-brasileira abordando, sem meias palavras, a pobreza e a violência urbana que a acometem. Sem sentimentalismos, mas sempre incorporando a tessitura poética à ficção, seus contos apresentam uma significativa galeria de mulheres: Ana Davenga, a mendiga Duzu-Querença, Natalina, Luamanda, Cida, a menina Zaíta. Ou serão todas a mesma mulher, captada e recriada no caleidoscópio da literatura em variados instantâneos da vida? Elas diferem em idade e em conjunturas de experiências, mas compartilham da mesma vida de ferro, equilibrando-se na frágil vara que, lemos no conto \"O cooper de Cida\", é a corda bamba do tempo. Em Olhos d água estão presentes mães, muitas mães. E também filhas, avós, amantes, homens e mulheres – todos evocados em seus vínculos e dilemas sociais, sexuais, existenciais, numa pluralidade e vulnerabilidade que constituem a humana condição. Sem quaisquer idealizações, são aqui recriadas com firmeza e talento as duras condições enfrentadas pela comunidade afro-brasileira. Conceição Evaristo é mestra em Literatura Brasileira pela PUC-Rio, e doutora em Literatura Comparada pela Universidade Federal Fluminense. Suas obras, em especial o romance Ponciá Vicêncio, de 2003, abordam temas como a discriminação racial de gênero e de classe. A obra foi traduzida para o inglês e publicada nos Estados Unidos em 2007.', 'Olhos dÁgua', 'olhosdagua.jpg', 'Conceição Evaristo', 2014, 1, 1),
(143, 4, 'Em seu livro de estreia, Pedro Rhuas traz uma história sobre amor à primeira vista, encontros e desencontros, cultura nordestina, música pop e drag queens. Nenhum encontro é por acaso. A vida tem sido boa para Lucas. Ele passou no Enem para estudar publicidade; se mudou com Eric, seu melhor amigo, do interior do Rio Grande do Norte para a capital; e conseguiu sua tão aguardada liberdade. Mas, no amor, Lucas é um desastre. O maior fã de Katy Perry no Nordeste tem certeza de que nem toda a sorte do mundo poderia fazer com que ele finalmente se apaixonasse pela primeira vez. Até que, em uma despretensiosa noite de sábado em 2015, tudo muda. Quando Lucas e Eric vão na inauguração do Titanic, a mais nova balada da cidade, Lucas esbarra (literalmente!) em Pierre, um lindo garoto francês que parece ter saído dos seus sonhos. Em meio a drinques, segredos e sonhos partilhados, Lucas e Pierre se conectam instantaneamente. Eles vivem o encontro mais especial de suas vidas, mas o Universo tem outros planos para o futuro... Até a noite acabar, o que será que vai acontecer com eles? Com uma voz original e divertida, repleta de referências pop e à cultura do Rio Grande do Norte, o livro de estreia de Pedro Rhuas vai te fazer rir alto e se apaixonar.', 'Enquanto Eu Não te Encontro', 'enquantoeunaoteencontro.jpg', 'Pedro Rhuas', 2021, 1, 1),
(144, 4, 'Júlia é filha de pais separados: sua mãe não suporta a ideia de ter sido abandonada pelo marido, enquanto seu pai não suporta a ideia de ter sido casado. Sufocada por uma atmosfera de brigas constantes e falta de afeto, a jovem escritora tenta reconhecer sua individualidade e dar sentido à sua história, tentando se desvencilhar dos traumas familiares. Entre lembranças da infância e da adolescência, e sonhos para o futuro, Júlia encontra personagens essenciais para enfrentar a solidão ao mesmo tempo que ensaia sua própria coreografia, numa sequência de movimentos de aproximação e afastamento de seus pais que lhe traz marcas indeléveis.', 'Pequena Coreografia do Adeus', 'coreodoadeus.jpg', 'Aline Bei', 2021, 1, 1),
(145, 4, 'O avesso da pele é a história de Pedro, que, após a morte do pai, assassinado numa desastrosa abordagem policial, sai em busca de resgatar o passado da família e refazer os caminhos paternos. Com uma narrativa sensível e por vezes brutal, Jeferson Tenório traz à superfície um país marcado pelo racismo e por um sistema educacional falido, e um denso relato sobre as relações entre pais e filhos. O que está em jogo é a vida de um homem abalado pelas inevitáveis fraturas existenciais da sua condição de negro em um país racista, um processo de dor, de acerto de contas, mas também de redenção, superação e liberdade. Com habilidade incomum para conceber e estruturar personagens e de lidar com as complexidades e pequenas tragédias das relações familiares, Jeferson Tenório se consolida como uma das vozes mais potentes e estilisticamente corajosas da literatura brasileira contemporânea.', 'O Avesso da Pele', 'avessodapele.jpg', 'Jeferson Tenório', 2020, 1, 1),
(146, 4, 'Amizade é tudo na vida! Disso Malu sabe muito bem, afinal, viveu as mais variadas experiências com cada uma delas rindo, chorando, brigando, brincando, curtindo e fofocando muito. Em Fala sério, amiga!, título que fecha a série da divertida personagem Malu precedida pelos best-sellers Fala sério, mãe!, Fala sério, professor! e Fala sério, amor!, a carioca Thalita Rebouças dá voz à protagonista, que puxa, da memória e do coração, tudo o que vivenciou com suas melhores amigas, como Alice, da infância até o fim da adolescência.', 'Fala Sério, Amiga!', 'falaserioamg.jpg', 'Thalita Rebouças', 2008, 1, 1),
(147, 4, 'Aos dezesseis anos, Brianna Hamilton fugiu da Inglaterra para a Escócia, abandonando sua família e as obrigações como herdeira de um duque. Em meio aos prados escoceses, a jovem encontrou refúgio e descobriu mais sobre a mulher que desejava ser. Mas, onze anos após a fuga, uma dolorosa verdade fará com que ela deseje nunca ter partido. Voltar será como relembrar o passado, a fuga, o medo e as escolhas que precisou fazer. E, enquanto luta para reconquistar seu lugar junto à família, Brianna precisará superar Desmond Hunter, melhor amigo e primeiro amor, que anos atrás ela escolheu deixar para trás. Volte para mim é um romance arrebatador sobre recomeços, sentir-se inteira e, acima de tudo, confiar no amor.', 'Volte Para Mim', 'voltepmim.jpg', 'Paola Aleksandra', 2018, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `ID_PERFIL` int NOT NULL AUTO_INCREMENT,
  `NOME_PERFIL` varchar(45) NOT NULL,
  `USERNAME_PERFIL` varchar(30) NOT NULL,
  `FOTO_PERFIL` varchar(225) DEFAULT NULL,
  `FOTOCAPA_PERFIL` varchar(225) DEFAULT NULL,
  `BIO` text,
  `usuario_ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_PERFIL`,`usuario_ID_USUARIO`),
  UNIQUE KEY `ID_PERFIL_UNIQUE` (`ID_PERFIL`),
  UNIQUE KEY `USERNAME_PERFIL_UNIQUE` (`USERNAME_PERFIL`),
  KEY `fk_perfil_usuario1_idx` (`usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `perfil`
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
(20, 'Dalva Oliveira da Silva', 'dalva_silva', 'fotos_perfilbrubs.jfif', '', 'Louca por livros!!!', 27),
(21, 'Letícia', 'dos_santos', '', '', '@corinthians', 29),
(22, 'Murillo', 'murillo_ordonho11', '', '', 'amo lol e meu namorado', 30),
(23, 'Nikolas', 'nik_b4bolim', '', '', 'kayblack meu ídolo', 31),
(24, 'Giovana', 'giovana.rib_', '', '', 'adoro a cultura brasileira', 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resenhas`
--

DROP TABLE IF EXISTS `resenhas`;
CREATE TABLE IF NOT EXISTS `resenhas` (
  `ID_RESENHA` int NOT NULL AUTO_INCREMENT,
  `TXT_RESENHA` mediumtext NOT NULL,
  `DATA_RESENHA` datetime NOT NULL,
  `usuarios_ID_USUARIO` int NOT NULL,
  `obra_ID_OBRA` int NOT NULL,
  PRIMARY KEY (`ID_RESENHA`),
  UNIQUE KEY `ID_RESENHA_UNIQUE` (`ID_RESENHA`),
  KEY `fk_resenha_obra_idx` (`obra_ID_OBRA`),
  KEY `fk_resenha_usuarios_idx` (`usuarios_ID_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `resenhas`
--

INSERT INTO `resenhas` (`ID_RESENHA`, `TXT_RESENHA`, `DATA_RESENHA`, `usuarios_ID_USUARIO`, `obra_ID_OBRA`) VALUES
(4, 'FODAA', '2023-06-17 19:01:38', 15, 2),
(9, 'Muito bom! Eu amei muito!!!', '2023-06-18 12:19:16', 15, 3),
(10, 'Mano, que issoooooo!!!!\r\n', '2023-06-18 12:52:40', 15, 5),
(14, 'Dei umas boas gargalhadas\r\n', '2023-06-18 15:21:02', 24, 12),
(17, 'traiu sim safada', '2023-06-18 18:08:17', 24, 129),
(19, 'MUITO BOM MEU DEUS DO CEU', '2023-06-18 21:28:48', 25, 4),
(23, 'Os livros do Rafael Montes sempre superam minhas expectativas. Se você acertar qual é a reviravolta final da história, você pode se considerar um gênio. O livro é bem escrito e a história é ótima. \r\nUm ponto negativo foi que ele focou apenas no personagem principal e esqueceu de contar como os outros personagens estavam se sentindo na época, mas mesmo assim eu gostei muito desse livro, recomendo!!.', '2023-07-10 12:08:39', 14, 135),
(31, '“Tudo é Rio” conta a história de um casal cujas vidas mudam após uma perda trágica, o livro apresenta uma narrativa madura e precisa, mas sutil e poética ao mesmo tempo. A história dos personagens é construída como um rio cujas águas começam a impulsionar o desenvolvimento deles. \r\nÉ costume na literatura retratar a realidade como nua e crua. Na tentativa de expor, o que em muitos casos é um tabu, mas é um importante tema de discussão na sociedade. Essa obra de Carla Madeira está longe de ser sutil, tendo um grande poder de lançar luz sobre questões polêmicas de forma poderosa e impactante. Este livro é na verdade como um rio que corre no tempo, que pode mudar e tomar outro contorno. E como a água, ele é sobre tudo que não podemos controlar, como amor, ódio e raiva. Outro grande insight do autor é que essa história não descreve o ano ou a época em que ocorreu. \r\nAcho compreensível que os problemas retratados nesta trama sejam, infelizmente, eternos. Aconteceu no passado, aconteceu no presente e provavelmente acontecerá com frequências diferentes no futuro, mas com a mesma força destrutiva. E de todas as questões difíceis, o perdão é o mais importante. Como espectador da história, é fácil julgar. Mas a verdade é que nem sabemos para que lado nosso rio interior pode ir. É possível perdoar a pessoa mais dolorosa da sua vida? Precisamos pensar sobre.\r\nEste livro é poderoso, fluido e cheio de gatilhos poéticos. Gostei e já quero ler os outros livros da autora. Espero que você goste também!', '2023-07-10 15:32:24', 26, 136),
(24, 'Cada vez gosto mais do Vitor Martins. O livro tem um bom senso de humor, e todas as referências à cultura pop me deixaram ainda mais entusiasmada pra ler. Ele fala sobre assuntos religiosos de uma forma direta. Cada detalhe especificamente pensado me fez apaixonar ainda mais por essa história. É um livro que faz rir em um momento e chorar no próximo, fiquei surpresa demaissss e tão absorta na história que li num piscar de olhos', '2023-07-02 17:24:18', 14, 139),
(8, 'Como filme, Eduardo e Mônica se destaca de forma positiva, apresentando uma típica história de amor, mas optando por uma abordagem mais realista e dramática, ao invés de seguir o padrão das comédias românticas brasileiras. A fotografia deslumbrante, especialmente nas cenas noturnas em Brasília, contribui para tornar a cidade quase um personagem, contrastando sua frieza urbana com a vida romântica e artística de Mônica. Diferentemente de Faroeste Caboclo, cuja origem é uma canção estilo poema épico, Eduardo e Mônica se baseia em uma história mais simples, centrada nas contradições do amor e na improvável conexão entre duas pessoas muito diferentes. Essa simplicidade na trama torna a adaptação mais fiel e dispensa o trabalho extenso de reorganizar e ajustar a narrativa, como aconteceu com Faroeste Caboclo. Assim, Eduardo e Mônica consegue manter-se fiel à sua essência e ao mesmo tempo cativar o espectador com essa história de amor, ainda que improvável, mas profundamente humana. O roteiro, embora menos complexo, enfrentou o desafio de tornar essa conexão improvável crível e emocionalmente envolvente para o público.', '2023-07-21 08:21:09', 24, 31),
(11, 'A série brasileira \"Coisa Mais Linda\" foi uma grata surpresa neste ano caótico. Confesso que tinha algumas dúvidas antes de começar a assistir, mas fui positivamente surpreendido, e agora estou ansioso pela segunda temporada. Embora apresente situações machistas que podem despertar indignação a ponto de querer desligar a TV, recomendo que não desistam, pois a forma como a trama se desenvolve é encantadora e, arrisco dizer, pode inspirar você a perseguir seus próprios sonhos. Sem dar spoilers, gostaria de enfatizar que é importante dar uma chance a essa produção brasileira, pois ela realmente vale a pena. Antes de concluir, devo aplaudir incessantemente o roteiro, a direção, a fotografia e, especialmente, a trilha sonora, que nos transporta para diferentes momentos. Se eu tivesse que resumir \"Coisa Mais Linda\" em uma palavra, seria: inspiradora.', '2023-07-12 12:42:38', 27, 3),
(13, 'Dessa vez, o autor Alex Sens nos presenteia com a obra \"Corações Ruidosos em Queda Livre\", composta por três contos longos: \"Corações Ruidosos\", \"Em Queda\" e \"Livre\". Cada conto possui um enredo envolvente e, ao mesmo tempo, se conectam para formar o objetivo maior do livro. O primeiro conto, \"Corações Ruidosos\", apresenta uma narrativa criativa e cativante, envolvendo 12 passageiros em uma misteriosa viagem de ônibus entre duas cidades. As histórias pessoais de cada um se entrelaçam, revelando as complexidades da vida moderna e suas incertezas. Em \"Em Queda\", o autor retorna ao estilo do realismo mágico, onde elementos fantásticos são vistos como parte da normalidade pelos personagens. Nessa história, uma galeria de arte se torna palco de uma série de suicídios inexplicáveis durante as apresentações de um pianista. A trama provoca reflexões sobre a busca incessante pelo espetáculo e pela miséria alheia. Por fim, em \"Livre\", temos uma sequência de cartas escritas por uma mulher chamada Leonor, que enfrenta um câncer de pulmão e uma proximidade crescente com a morte. Suas revelações surpreendentes abordam a vida e a morte, levantando questões sobre os amores egoístas, ciúmes e a busca pelo prazer a qualquer custo. Alex Sens apresenta uma visão estética da vida em seus contos, explorando as dores e incertezas humanas de forma intensa e impactante. Seu talento narrativo nos leva a meditar sobre temas profundos e atuais, como a busca desenfreada pelo prazer, a destruição de si mesmo e a falta de perspectivas de futuro. Enquanto a consciência da vida é ignorada por muitos, somos confrontados com \"corações ruidosos em queda livre\", mergulhando em um mundo triste e complexo, onde o mal parece ser a condição comum dos homens. A obra nos convida a refletir sobre a existência e a importância de valorizar a vida e suas conexões mais profundas.', '2023-07-17 07:11:28', 16, 126),
(1, 'O enredo desse filme é muito envolvente! Durante a narrativa, somos apresentados à realidade cruel e brutal das favelas cariocas, onde traficantes e milicianos exercem controle absoluto sobre as comunidades, e os moradores são frequentemente vítimas da violência e da corrupção policial. A obra não hesita em expor as práticas questionáveis da polícia, revelando abusos de poder, violência indiscriminada e a corrupção endêmica que infesta a instituição. O filme também mostra como a linha tênue entre o certo e o errado pode ser facilmente cruzada em nome de um suposto bem maior. Além da trama densa e envolvente, \"Tropa de Elite\" é notável por sua estética. A fotografia é sombria e realista, reforçando a atmosfera de tensão e caos das cenas. A trilha sonora também desempenha um papel fundamental, destacando-se pela escolha de músicas que se encaixam perfeitamente nas cenas de ação e tensão, aumentando ainda mais o impacto emocional do filme. Não me surpreende que \"Tropa de Elite\" foi amplamente aclamado pela crítica e pelo público, e se tornou um marco no cinema brasileiro contemporâneo, ele é um filme visceral, que provoca reflexões profundas sobre a realidade do Brasil e suas instituições policiais. Com uma atuação memorável de Wagner Moura e uma direção habilidosa de José Padilha, o filme oferece uma visão dura e necessária sobre a violência urbana e a complexidade das questões sociais no país. É uma obra que com certeza merece o reconhecimento.', '2023-07-21 08:21:09', 26, 32),
(5, 'A história da série gira em torno do Processo, um rigoroso exame seletivo que acontece apenas uma vez por ano e oferece a chance de 3% dos jovens do Continente ingressarem em Maralto. Essa oportunidade é considerada a única forma de escapar da pobreza, da falta de recursos e da desesperança em que vivem. A narrativa se concentra principalmente em cinco personagens: Michele (Bianca Comparato), um espírito determinado do Continente que sonha com uma vida melhor em Maralto; Joana (Vaneza Oliveira), uma mulher forte e misteriosa, com um passado obscuro; Fernando (Michel Gomes), um rapaz inteligente e carismático; Rafael (Rodolfo Valente), filho de uma das autoridades do Continente, mas com ideais questionadores; e Ezequiel (João Miguel), o líder autoritário do Processo em Maralto. Ao longo dos episódios, os candidatos enfrentam desafios físicos, mentais e emocionais para provar sua competência e merecimento de uma vida melhor. Essa competição revela o pior e o melhor de cada personagem, e os laços de amizade e rivalidade são constantemente testados. Conforme o enredo avança, segredos e traições são desvendados, revelando uma rede complexa de conspirações e interesses por trás do Processo. Um dos pontos fortes da série é a construção detalhada do mundo distópico, que envolve questões sociais relevantes, como a desigualdade, a falta de oportunidades e a luta pela sobrevivência. Os cenários são bem concebidos, contribuindo para a nossa imersão na realidade precária do Continente e no contraste com a beleza tecnológica de Maralto. Além disso, \"3%\" se destaca pela sua trama repleta de reviravoltas, que assim como aconteceu comigo, vai te manter intrigado e ansioso por mais. Os episódios são habilmente escritos, combinando suspense, ação e momentos emocionantes. O elenco também merece destaque, entregando atuações convincentes que dão vida aos complexos personagens. No entanto, achei que, em determinados momentos, a série se tornou previsível em suas fórmulas narrativas e, em algumas temporadas, perdeu um pouco de seu ritmo inicial. Mesmo assim, gostei muito do enredo e dos dilemas morais dos personagens, mantendo meu interesse até o final da série. \"3%\" é uma série brasileira que merece ser apreciada por sua originalidade e sua abordagem inteligente da ficção científica e da distopia. Com personagens cativantes, uma trama intrigante e uma atmosfera distópica bem construída, a série se tornou uma referência na produção nacional e ganhou seu lugar entre as produções internacionais de sucesso. Para mim, essa série é uma viagem emocionante por um mundo futurista sombrio e cheio de desafios, espero que ela te faça pensar o mesmo!!', '2023-07-22 17:11:56', 16, 2),
(6, 'Uma das melhores novelas da minha vida!!!! A trama se inicia quando o protagonista José Leôncio (interpretado por Cláudio Marzo e posteriormente por Antônio Petrin) decide abandonar sua vida no Rio de Janeiro e retornar à Fazenda Pantanal, localizada em uma das áreas mais remotas do Pantanal mato-grossense. Ao chegar, ele se apaixona pela bela e misteriosa Juma Marruá, vivida por Cristiana Oliveira, uma mulher com traços de onça-pintada, criada na região selvagem por seu avô Tenório (interpretado por Cláudio Cavalcanti). A relação entre José Leôncio e Juma Marruá é o ponto central da novela, envolvendo paixão, mistério e elementos místicos presentes na cultura local. A força da natureza e a convivência com os animais selvagens são retratadas com maestria, mostrando a profunda conexão da protagonista com o ambiente ao seu redor. \"Pantanal\" não se limita apenas a um romance, mas também aborda questões relevantes sobre o meio ambiente e a preservação da natureza. A novela mostra o contraste entre a sabedoria dos habitantes locais, que respeitam e preservam o equilíbrio natural, com a ganância e a destruição causada por forasteiros em busca de lucro, interessados em desmatar a região para a criação de gado. Além do cenário deslumbrante e da história de amor cativante, a novela tem uma trilha sonora perfeita, composta por músicas regionais que enriqueciam muito a experiência audiovisual.', '2023-07-19 23:14:52', 24, 86),
(7, 'É muito gratificante presenciar o crescimento dos autores brasileiros no cenário literário nacional, e Itamar Vieira Junior, sem dúvida alguma, conquistou seu merecido destaque. Sua prosa é delicada e honra a memória e a herança cultural de um povo que enfrentou inúmeras adversidades e ainda encara diversos desafios. Os personagens, cenários e eventos são retratados com vigor e uma minúcia excepcional. Torto Arado recebeu com justiça as honrarias que lhe foram concedidas e, certamente, deveria ser considerado uma leitura indispensável para todos os brasileiros.', '2023-07-16 14:51:03', 27, 127);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguir`
--

DROP TABLE IF EXISTS `seguir`;
CREATE TABLE IF NOT EXISTS `seguir` (
  `ID_SEGUIR` int NOT NULL AUTO_INCREMENT,
  `DATA_SEGUIR` datetime NOT NULL,
  `ID_SEGUINDO_SEGUIR` int NOT NULL,
  `perfil_ID_PERFIL` int NOT NULL,
  PRIMARY KEY (`ID_SEGUIR`,`perfil_ID_PERFIL`),
  UNIQUE KEY `ID_SEGUIR_UNIQUE` (`ID_SEGUIR`),
  KEY `fk_seguir_perfil_idx` (`perfil_ID_PERFIL`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `seguir`
--

INSERT INTO `seguir` (`ID_SEGUIR`, `DATA_SEGUIR`, `ID_SEGUINDO_SEGUIR`, `perfil_ID_PERFIL`) VALUES
(34, '2023-06-18 21:56:22', 15, 25),
(35, '2023-07-06 08:49:00', 15, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `ID_SERIE` int NOT NULL AUTO_INCREMENT,
  `obra_ID_OBRA` int NOT NULL,
  `obra_perfil_ID_PERFIL` int NOT NULL,
  `obra_perfil_usuario_ID_USUARIO` int NOT NULL,
  `VALOR_OBRA` int NOT NULL,
  `PRODUTORA_SERIE` mediumtext,
  `DISTRIBUIDORA_SERIE` mediumtext,
  `TEMPORADAS_SERIE` int DEFAULT NULL,
  `C_IND_SERIE` int DEFAULT NULL,
  `ELENCO_SERIE` mediumtext,
  PRIMARY KEY (`ID_SERIE`),
  KEY `fk_series_obra1_idx` (`obra_ID_OBRA`,`obra_perfil_ID_PERFIL`,`obra_perfil_usuario_ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `series`
--

INSERT INTO `series` (`ID_SERIE`, `obra_ID_OBRA`, `obra_perfil_ID_PERFIL`, `obra_perfil_usuario_ID_USUARIO`, `VALOR_OBRA`, `PRODUTORA_SERIE`, `DISTRIBUIDORA_SERIE`, `TEMPORADAS_SERIE`, `C_IND_SERIE`, `ELENCO_SERIE`) VALUES
(1, 1, 1, 1, 1, 'Pródigo Filmes', 'Netflix', 2, 16, 'Marco Pigossi, Alessandra Negrini, Fábio Lago'),
(2, 2, 1, 1, 1, 'PrÃ³digo Filmes', 'Netflix', 2, 14, 'Marco Pigossi, Alessandra Negrini, FÃ¡bio Lago'),
(3, 3, 1, 1, 1, 'Boutique Filmes', 'Netflix ', 4, 16, 'Bianca Comparato, Vaneza Oliveira, Rodolfo Valente'),
(4, 4, 1, 1, 1, 'PrÃ³digo Filmes', 'Netflix', 2, 16, 'Maria Casadevall, Pathy Dejesus, Fernanda Vasconcellos'),
(5, 5, 1, 1, 1, 'Zola Filmes', 'Netflix', 2, 18, 'TainÃ¡ MÃ¼ller, Reynaldo Gianecchini, Klara Castanho'),
(6, 6, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Amazon Prime Video', 2, 18, 'Gabriel Leone, Flavio Tolezani, Isabella Santoni'),
(7, 7, 1, 1, 1, 'Los Bragas ', 'Netflix', 3, 16, 'Christian Malheiros, JoÃ£o Pedro Carvalho, Bruna Mascarenhas'),
(8, 8, 1, 1, 1, 'A FÃ¡brica', 'Netflix ', 1, 12, 'Ademara Barros, FlÃ¡via Reis, Mel Maia'),
(9, 9, 1, 1, 1, 'O2 Filmes ', 'Netflix', 2, 16, 'Naruna Costa, Seu Jorge, Hermila Guedes'),
(10, 10, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, ''),
(11, 11, 1, 1, 1, 'Mixer Filmes', 'Netflix', 1, 18, 'DÃ©bora Nascimento, Emanuelle AraÃºjo, Nikolas Antunes'),
(12, 12, 1, 1, 1, 'Grifa Filmes', 'Netflix', 1, 18, 'Dalva Teixeira de Sousa, Gabriela Manssur'),
(13, 13, 1, 1, 1, 'Glaz Entretenimento', 'Netflix', 1, 14, 'Fernanda Paes Leme, MaÃ­ra Azevedo, Thati Lopes'),
(14, 14, 1, 1, 1, 'Suburbanos ProduÃ§Ãµes', 'Netflix', 2, 14, 'Rodrigo Santâ€™anna, Rafael Zulu, Lidi Lisboa'),
(15, 15, 1, 1, 1, 'Caravan Media, Quicksilver Media ', 'Netflix', 1, 16, ''),
(16, 16, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Netflix', 1, 18, 'Luellem de Castro, Ana Hartmann, Guilherme Weber, Sabrina Sato'),
(17, 17, 1, 1, 1, 'Space, Intro Pictures', 'Netflix', 1, 16, 'Enzo Barone, Guilherme Fontes, Mel Lisboa'),
(18, 18, 1, 1, 1, 'Fetiche Features, Gullane Entretenimento', 'Netflix', 1, 16, 'Denise Fraga, Caio Horowicz, Michel Joelsas'),
(19, 19, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, 'Carla Salle, Sandra Corveloni, Jonathan Haagensen'),
(20, 20, 1, 1, 1, 'Moonshot Pictures', 'Netflix', 1, 14, 'Claudia Okuno, Danilo Mesquita, Mariana Sena'),
(21, 21, 1, 1, 1, 'O2 Filmes ', 'Netflix', 1, 16, 'Bruna Marquezine, NatÃ¡lia Klein, Klebber Toledo, Manu Gavassi'),
(22, 22, 1, 1, 1, 'Mixer Filmes', 'Netflix', 2, 14, 'Paloma Bernardi, Pedro Caetano, Allison Willow'),
(23, 23, 1, 1, 1, 'Boutique Filmes', 'Netflix', 1, 16, 'Giovanna Lancellotti, Gabz, Jorge Lopez'),
(24, 24, 1, 1, 1, 'Gullane Entretenimento', 'Netflix', 1, 14, 'Victor Lamoglia, JÃºlia Rabello, Danilo de Moura, KÃ©fera Buchmann'),
(25, 25, 1, 1, 1, 'Fox Premium', 'Amazon Prime Video, Star Plus', 4, 18, 'Maria Bopp, Simone Mazzer, Ariclenes Barroso'),
(26, 26, 1, 1, 1, 'Medialand', 'Amazon Prime Video', 10, 16, 'Ellen Pompeo, Chandra Wilson, James Pickens'),
(27, 27, 1, 1, 1, 'Produtora KN', 'Amazon Prime Video ', 3, 18, 'Bianca Palheiras, Camilla Taublib, Camilla Luna'),
(28, 28, 1, 1, 1, 'Fox Networks Group', 'Amazon Prime Video e Star+', 3, 16, 'Raphael Logam, Lorena Comparato, Rui Ricardo Diaz'),
(29, 29, 1, 1, 1, 'FIC e ConspiraÃ§Ã£o Filmes', 'Amazon Prime Video', 4, 16, 'JÃºlio Andrade, Julia Ianina, Silvio Guindane'),
(30, 30, 1, 1, 1, '', 'Amazon Prime Video', 1, 18, 'Renata Ricci, Victor Soares, Yuri Esteves, Felipe Dutra, Paulo MilÃ©o'),
(31, 31, 1, 1, 1, 'ConspiraÃ§Ã£o Filmes', 'Globoplay', 5, 14, 'Marjorie Estiano, JÃºlio Andrade, Marco Nanini');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `EMAIL_USUARIO` varchar(45) NOT NULL,
  `SENHA_USUARIO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `ID_USUARIO_UNIQUE` (`ID_USUARIO`),
  UNIQUE KEY `EMAIL_USUARIO_UNIQUE` (`EMAIL_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `EMAIL_USUARIO`, `SENHA_USUARIO`) VALUES
(1, 'brunnasrv1@gmail.com', 'BRUbs10oi'),
(12, 'FLAVINHA@gmail.com', 'FLAvia5980'),
(14, 'FLAVIA@gmail.com', 'FLAvia5980'),
(15, 'br0@gmail.com', 'BRUbs10oi'),
(16, 'ROBERTAOLIVER.CLARO@GMAIL.COM', 'sENHA1981'),
(17, 'brunnasr@gmail.com', 'cndvnvnoOIII09'),
(20, 'asvca@kasnc.com', 'BRUBio09'),
(23, 'br0nna@gmail.com', 'BRUbs10oi'),
(24, 'ivan.talentos74@gmail.com', 'Senha1821'),
(25, 'br0NINHAHH@gmail.com', 'BRUbs10oi'),
(26, 'dalva@gmail.com', 'DALva567'),
(27, 'dalva2@gmail.com', 'DALva567'),
(29, 'dosantosle18@gmail.com', 'L0verLeti'),
(30, 'muliro11@gmail.com', 'R3putationMu'),
(31, 'nikolasb4abs@gmail.com', 'Fe4arlessNik'),
(32, 'giovanarib2@gmail.com', 'Folk0re!');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_resenha1` FOREIGN KEY (`resenha_ID_RESENHA`,`resenha_usuario_ID_USUARIO`) REFERENCES `resenha` (`ID_RESENHA`, `usuario_ID_USUARIO`);

--
-- Limitadores para a tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD CONSTRAINT `ID_COMENTARIO` FOREIGN KEY (`ID_COMENTARIO`) REFERENCES `comentarios` (`ID_COMENTARIO`),
  ADD CONSTRAINT `ID_CURTIR` FOREIGN KEY (`ID_CURTIR`) REFERENCES `curtir` (`ID_CURTIR`),
  ADD CONSTRAINT `ID_PERFIL_AUTOR` FOREIGN KEY (`ID_PERFIL_AUTOR`) REFERENCES `perfil` (`ID_PERFIL`),
  ADD CONSTRAINT `ID_SEGUIR` FOREIGN KEY (`ID_SEGUIR`) REFERENCES `seguir` (`ID_SEGUIR`),
  ADD CONSTRAINT `ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
