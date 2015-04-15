-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "petsystem" -----------------------------
CREATE DATABASE IF NOT EXISTS `petsystem` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `petsystem`;
-- ---------------------------------------------------------


-- CREATE TABLE "cidades" ----------------------------------
CREATE TABLE `cidades` ( 
	`id` Int( 4 ) UNSIGNED ZEROFILL AUTO_INCREMENT NOT NULL, 
	`estado_id` Int( 2 ) UNSIGNED ZEROFILL NOT NULL DEFAULT '00', 
	`nome` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
, 
	CONSTRAINT `id` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9715;
-- ---------------------------------------------------------


-- CREATE TABLE "clientes" ---------------------------------
CREATE TABLE `clientes` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`tipo_pessoa` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`nome` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`apelido` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`rgie` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`cpfcnpj` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`sexo` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`aniversario` Timestamp NULL, 
	`email` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`rede_social` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`tel_residencia` VarChar( 16 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`tel_comercial` VarChar( 16 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`celular` VarChar( 16 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`cep` VarChar( 10 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`bairro` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`cidade` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`endereco` VarChar( 150 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`numero_endereco` VarChar( 15 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`complemento` VarChar( 150 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`id_endereco` Int( 11 ) NULL, 
	`id_telefone` Int( 11 ) NULL, 
	`created` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00', 
	`updated` DateTime NOT NULL DEFAULT '0000-00-00 00:00:00', 
	`ativo` Int( 1 ) NOT NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- ---------------------------------------------------------


-- CREATE TABLE "especies" ---------------------------------
CREATE TABLE `especies` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`descricao` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`comentarios` MediumText CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`created` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	`modified` Timestamp NOT NULL DEFAULT '0000-00-00 00:00:00', 
	`ativo` TinyInt( 1 ) NOT NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- CREATE TABLE "estados" ----------------------------------
CREATE TABLE `estados` ( 
	`id` Int( 2 ) UNSIGNED ZEROFILL AUTO_INCREMENT NOT NULL, 
	`uf` VarChar( 10 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`nome` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 28;
-- ---------------------------------------------------------


-- CREATE TABLE "estoque" ----------------------------------
CREATE TABLE `estoque` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`produto_id` Int( 11 ) NOT NULL, 
	`valormovimento` Int( 11 ) NOT NULL, 
	`tipomovimento` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'S => saida E=> entrada => D =>devolucao', 
	`origem` Char( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'E' COMMENT 'E => ESTOQUE V => VENDA', 
	`observacao` Text CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`user_id` Int( 11 ) NULL, 
	`created` DateTime NULL,
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB
AUTO_INCREMENT = 15;
-- ---------------------------------------------------------


-- CREATE TABLE "filas_atendimento" ------------------------
CREATE TABLE `filas_atendimento` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`cliente_id` Int( 11 ) NOT NULL, 
	`pet_id` Int( 11 ) NOT NULL, 
	`atendimento_tipo` Int( 11 ) NOT NULL, 
	`prioridade_tipo` Int( 11 ) NOT NULL COMMENT 'baixa, media, alta', 
	`observacoes` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`datahora_chegada` DateTime NOT NULL, 
	`ordem_chegada` Int( 11 ) NULL COMMENT 'Ordem de Chegada na fila de atendimento', 
	`fila_id` Int( 11 ) NULL COMMENT 'Id da Fila de Atendimento', 
	`created` DateTime NOT NULL, 
	`modified` DateTime NOT NULL, 
	`user_id` Int( 11 ) NULL, 
	`ativo` Int( 1 ) NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT 'Tabela destinada ao gerenciamento de chegada para as filas de atendimento.
Toda solicitacao de cliente para atendimento na clinica ou banho e tosa deve ser cadastrado e gerado um
cartao para fila.'
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- ---------------------------------------------------------


-- CREATE TABLE "grupo_racas" ------------------------------
CREATE TABLE `grupo_racas` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`nome` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- ---------------------------------------------------------


-- CREATE TABLE "pets" -------------------------------------
CREATE TABLE `pets` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`nome` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`idade` VarChar( 11 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`nascimento` Date NULL, 
	`rg` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`apelido` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`cor` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`especie_id` Int( 11 ) NOT NULL, 
	`raca_id` Int( 11 ) NOT NULL, 
	`cliente_id` Int( 11 ) NULL, 
	`carteirinha_id` Int( 11 ) NULL, 
	`peso` Int( 1 ) NULL, 
	`tamanho` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`sexo` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`nome_pai` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`nome_mae` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`observacoes` Blob NULL, 
	`created` DateTime NOT NULL, 
	`modified` DateTime NOT NULL, 
	`ativo` Int( 1 ) NOT NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 15;
-- ---------------------------------------------------------


-- CREATE TABLE "produtos" ---------------------------------
CREATE TABLE `produtos` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`codinterno` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
	`descricao` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
	`referencia` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`codbarras` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`codnfe` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`codean` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`codncm` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`modelo` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`origem` Int( 11 ) NULL, 
	`categoria_id` Int( 11 ) NULL, 
	`unidade_medida` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'Id da tabela de medidas', 
	`peso` Float( 10, 3 ) NULL, 
	`valor_compra` Float( 10, 2 ) NULL, 
	`margem_lucro` Float( 10, 2 ) NULL, 
	`valor_venda` Float( 10, 2 ) NULL, 
	`valor_promocao` Float( 10, 2 ) NULL DEFAULT '0.00', 
	`valor_promocao2` Float( 10, 2 ) NULL, 
	`valor_promocao3` Float( 10, 2 ) NULL, 
	`observacoes` Text CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`estoqueminimo` Float( 10, 3 ) NULL, 
	`estoquemaximo` Float( 10, 3 ) NULL, 
	`user_id_modified` Int( 11 ) NULL COMMENT 'id user que fez a ultima alteração', 
	`created` DateTime NOT NULL, 
	`modified` DateTime NOT NULL, 
	`ativo` Int( 1 ) NOT NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "racas" ------------------------------------
CREATE TABLE `racas` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`descricao` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`especie_id` Int( 11 ) NOT NULL, 
	`grupo_id` Int( 11 ) NOT NULL, 
	`observacao` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`created` DateTime NOT NULL, 
	`updated` DateTime NULL, 
	`ativo` TinyInt( 1 ) NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 37;
-- ---------------------------------------------------------


-- CREATE TABLE "role" -------------------------------------
CREATE TABLE `role` ( 
	`id` Int( 11 ) AUTO_INCREMENT NULL, 
	`role` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`alias` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
, 
	CONSTRAINT `roleUnique` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "servicos" ---------------------------------
CREATE TABLE `servicos` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`codinterno` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`descricao` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`valor_venda` Decimal( 10, 4 ) NULL, 
	`valor_promocao` Decimal( 10, 4 ) NULL, 
	`valor_promocao2` Decimal( 10, 4 ) NULL, 
	`valor_promocao3` Decimal( 10, 4 ) NULL, 
	`categoria_id` Int( 11 ) NULL, 
	`observacoes` Blob NULL, 
	`user_id_modified` Int( 11 ) NULL, 
	`modified` DateTime NOT NULL, 
	`created` DateTime NOT NULL, 
	`ativo` Int( 1 ) NOT NULL DEFAULT '1',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- ---------------------------------------------------------


-- CREATE TABLE "system_menus" -----------------------------
CREATE TABLE `system_menus` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`menuname` VarChar( 80 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menulink` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`hassub` Smallint( 1 ) NULL, 
	`menuimage` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuimageclass` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuposition` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`modulename` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'ALL',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- ---------------------------------------------------------


-- CREATE TABLE "system_submenus" --------------------------
CREATE TABLE `system_submenus` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`menuname` VarChar( 80 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menulink` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`hassub` Smallint( 1 ) NULL, 
	`menuimage` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuimageclass` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuposition` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`fathermenu` Int( 11 ) NULL, 
	`menu_id` Int( 11 ) NULL,
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB
AUTO_INCREMENT = 22;
-- ---------------------------------------------------------


-- CREATE TABLE "system_subsubmenus" -----------------------
CREATE TABLE `system_subsubmenus` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`menuname` VarChar( 80 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menulink` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`hassub` Smallint( 1 ) NULL, 
	`menuimage` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuimageclass` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`menuposition` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NULL, 
	`fathermenu` Int( 11 ) NULL, 
	`menu_id` Int( 11 ) NULL,
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB
AUTO_INCREMENT = 110;
-- ---------------------------------------------------------


-- CREATE TABLE "tabelas_auxiliares" -----------------------
CREATE TABLE `tabelas_auxiliares` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`auxiliar` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Tabela auxiliar', 
	`codigo` VarChar( 11 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Codigo/Id para identificacao do campo auxiliar', 
	`valor` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'valor do campo auxiliar',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "users" ------------------------------------
CREATE TABLE `users` ( 
	`id` Int( 20 ) AUTO_INCREMENT NOT NULL, 
	`role_id` Int( 11 ) NOT NULL DEFAULT '0', 
	`username` VarChar( 60 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL, 
	`password` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL, 
	`ativo` TinyInt( 1 ) NOT NULL DEFAULT '0',
	 PRIMARY KEY ( `id` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- ---------------------------------------------------------


-- Dump data of "cidades" ----------------------------------
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0001', '01', 'Acrelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0002', '01', 'Assis Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0003', '01', 'Brasileia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0004', '01', 'Bujari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0005', '01', 'Capixaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0006', '01', 'Cruzeiro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0007', '01', 'Epitaciolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0008', '01', 'Feijo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0009', '01', 'Jordao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0010', '01', 'Mancio Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0011', '01', 'Manoel Urbano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0012', '01', 'Marechal Thaumaturgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0013', '01', 'Placido de Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0014', '01', 'Porto Acre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0015', '01', 'Porto Walter' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0016', '01', 'Rio Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0017', '01', 'Rodrigues Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0018', '01', 'Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0019', '01', 'Sena Madureira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0020', '01', 'Senador Guiomard' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0021', '01', 'Tarauaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0022', '01', 'Xapuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0023', '02', 'Agua Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0024', '02', 'Alazao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0025', '02', 'Alecrim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0026', '02', 'Anadia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0027', '02', 'Anel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0028', '02', 'Anum Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0029', '02', 'Anum Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0030', '02', 'Arapiraca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0031', '02', 'Atalaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0032', '02', 'Baixa da Onca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0033', '02', 'Baixa do Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0034', '02', 'Balsamo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0035', '02', 'Bananeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0036', '02', 'Barra de Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0037', '02', 'Barra de Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0038', '02', 'Barra do Bonifacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0039', '02', 'Barra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0040', '02', 'Batalha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0041', '02', 'Batingas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0042', '02', 'Belem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0043', '02', 'Belo Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0044', '02', 'Boa Sorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0045', '02', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0046', '02', 'Boca da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0047', '02', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0048', '02', 'Bonifacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0049', '02', 'Branquinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0050', '02', 'Cacimbinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0051', '02', 'Cajarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0052', '02', 'Cajueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0053', '02', 'Caldeiroes de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0054', '02', 'Camadanta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0055', '02', 'Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0056', '02', 'Campo Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0057', '02', 'Campo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0058', '02', 'Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0059', '02', 'Canafistula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0060', '02', 'Canapi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0061', '02', 'Canastra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0062', '02', 'Cangandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0063', '02', 'Capela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0064', '02', 'Carneiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0065', '02', 'Carrasco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0066', '02', 'Cha Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0067', '02', 'Coite do Noia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0068', '02', 'Colonia Leopoldina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0069', '02', 'Coqueiro Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0070', '02', 'Coruripe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0071', '02', 'Coruripe da Cal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0072', '02', 'Craibas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0073', '02', 'Delmiro Gouveia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0074', '02', 'Dois Riachos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0075', '02', 'Entremontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0076', '02', 'Estrela de Alagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0077', '02', 'Feira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0078', '02', 'Feliz Deserto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0079', '02', 'Fernao Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0080', '02', 'Flexeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0081', '02', 'Floriano Peixoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0082', '02', 'Gaspar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0083', '02', 'Girau do Ponciano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0084', '02', 'Ibateguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0085', '02', 'Igaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0086', '02', 'Igreja Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0087', '02', 'Inhapi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0088', '02', 'Jacare dos Homens' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0089', '02', 'Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0090', '02', 'Japaratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0091', '02', 'Jaramataia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0092', '02', 'Jenipapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0093', '02', 'Joaquim Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0094', '02', 'Jundia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0095', '02', 'Junqueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0096', '02', 'Lagoa da Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0097', '02', 'Lagoa da Canoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0098', '02', 'Lagoa da Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0099', '02', 'Lagoa Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0100', '02', 'Lagoa do Caldeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0101', '02', 'Lagoa do Canto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0102', '02', 'Lagoa do Exu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0103', '02', 'Lagoa do Rancho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0104', '02', 'Lajes do Caldeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0105', '02', 'Laranjal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0106', '02', 'Limoeiro de Anadia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0107', '02', 'Maceio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0108', '02', 'Major Isidoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0109', '02', 'Mar Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0110', '02', 'Maragogi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0111', '02', 'Maravilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0112', '02', 'Marechal Deodoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0113', '02', 'Maribondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0114', '02', 'Massaranduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0115', '02', 'Mata Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0116', '02', 'Matriz de Camaragibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0117', '02', 'Messias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0118', '02', 'Minador do Negrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0119', '02', 'Monteiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0120', '02', 'Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0121', '02', 'Munguba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0122', '02', 'Murici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0123', '02', 'Novo Lino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0124', '02', 'Olho D Agua Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0125', '02', 'Olho D\'agua Das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0126', '02', 'Olho D\'agua De Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0127', '02', 'Olho D\'agua Do Casado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0128', '02', 'Olho D\'agua Dos Dandanhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0129', '02', 'Olivenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0130', '02', 'Ouro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0131', '02', 'Palestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0132', '02', 'Palmeira de Fora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0133', '02', 'Palmeira dos Indios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0134', '02', 'Pao de Acucar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0135', '02', 'Pariconha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0136', '02', 'Paripueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0137', '02', 'Passo de Camaragibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0138', '02', 'Pau D\'arco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0139', '02', 'Pau Ferro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0140', '02', 'Paulo Jacinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0141', '02', 'Penedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0142', '02', 'Piacabucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0143', '02', 'Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0144', '02', 'Pindoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0145', '02', 'Piranhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0146', '02', 'Pocao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0147', '02', 'Poco da Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0148', '02', 'Poco das Trincheiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0149', '02', 'Porto Calvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0150', '02', 'Porto de Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0151', '02', 'Porto Real do Colegio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0152', '02', 'Poxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0153', '02', 'Quebrangulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0154', '02', 'Riacho do Sertao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0155', '02', 'Riacho Fundo de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0156', '02', 'Rio Largo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0157', '02', 'Rocha Cavalcante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0158', '02', 'Roteiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0159', '02', 'Santa Efigenia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0160', '02', 'Santa Luzia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0161', '02', 'Santana do Ipanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0162', '02', 'Santana do Mundau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0163', '02', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0164', '02', 'Sao Bras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0165', '02', 'Sao Jose da Laje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0166', '02', 'Sao Jose da Tapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0167', '02', 'Sao Luis do Quitunde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0168', '02', 'Sao Miguel dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0169', '02', 'Sao Miguel dos Milagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0170', '02', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0171', '02', 'Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0172', '02', 'Satuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0173', '02', 'Senador Rui Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0174', '02', 'Serra da Mandioca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0175', '02', 'Serra do Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0176', '02', 'Taboleiro do Pinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0177', '02', 'Taboquinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0178', '02', 'Tanque D\'arca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0179', '02', 'Taquarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0180', '02', 'Tatuamunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0181', '02', 'Teotonio Vilela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0182', '02', 'Traipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0183', '02', 'Uniao dos Palmares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0184', '02', 'Usina Camacari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0185', '02', 'Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0186', '02', 'Vila Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0187', '02', 'Vila Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0188', '03', 'Alvaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0189', '03', 'Amatari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0190', '03', 'Amatura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0191', '03', 'Anama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0192', '03', 'Anori' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0193', '03', 'Apui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0194', '03', 'Ariau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0195', '03', 'Atalaia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0196', '03', 'Augusto Montenegro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0197', '03', 'Autazes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0198', '03', 'Axinim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0199', '03', 'Badajos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0200', '03', 'Balbina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0201', '03', 'Barcelos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0202', '03', 'Barreirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0203', '03', 'Benjamin Constant' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0204', '03', 'Beruri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0205', '03', 'Boa Vista do Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0206', '03', 'Boca do Acre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0207', '03', 'Borba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0208', '03', 'Caapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0209', '03', 'Cameta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0210', '03', 'Canuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0211', '03', 'Canutama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0212', '03', 'Carauari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0213', '03', 'Careiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0214', '03', 'Careiro da Varzea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0215', '03', 'Carvoeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0216', '03', 'Coari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0217', '03', 'Codajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0218', '03', 'Cucui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0219', '03', 'Eirunepe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0220', '03', 'Envira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0221', '03', 'Floriano Peixoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0222', '03', 'Fonte Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0223', '03', 'Freguesia do Andira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0224', '03', 'Guajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0225', '03', 'Humaita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0226', '03', 'Iauarete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0227', '03', 'Icana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0228', '03', 'Ipixuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0229', '03', 'Iranduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0230', '03', 'Itacoatiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0231', '03', 'Itamarati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0232', '03', 'Itapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0233', '03', 'Japura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0234', '03', 'Jurua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0235', '03', 'Jutai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0236', '03', 'Labrea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0237', '03', 'Lago Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0238', '03', 'Manacapuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0239', '03', 'Manaquiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0240', '03', 'Manaus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0241', '03', 'Manicore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0242', '03', 'Maraa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0243', '03', 'Massauari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0244', '03', 'Maues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0245', '03', 'Mocambo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0246', '03', 'Moura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0247', '03', 'Murutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0248', '03', 'Nhamunda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0249', '03', 'Nova Olinda do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0250', '03', 'Novo Airao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0251', '03', 'Novo Aripuana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0252', '03', 'Osorio da Fonseca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0253', '03', 'Parintins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0254', '03', 'Pauini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0255', '03', 'Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0256', '03', 'Presidente Figueiredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0257', '03', 'Repartimento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0258', '03', 'Rio Preto da Eva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0259', '03', 'Santa Isabel do Rio Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0260', '03', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0261', '03', 'Santo Antonio do Ica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0262', '03', 'Sao Felipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0263', '03', 'Sao Gabriel da Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0264', '03', 'Sao Paulo de Olivenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0265', '03', 'Sao Sebastiao do Uatuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0266', '03', 'Silves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0267', '03', 'Tabatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0268', '03', 'Tapaua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0269', '03', 'Tefe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0270', '03', 'Tonantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0271', '03', 'Uarini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0272', '03', 'Urucara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0273', '03', 'Urucurituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0274', '03', 'Vila Pitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0275', '04', 'Abacate da Pedreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0276', '04', 'Agua Branca do Amapari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0277', '04', 'Amapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0278', '04', 'Amapari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0279', '04', 'Ambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0280', '04', 'Aporema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0281', '04', 'Ariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0282', '04', 'Bailique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0283', '04', 'Boca do Jari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0284', '04', 'Calcoene' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0285', '04', 'Cantanzal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0286', '04', 'Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0287', '04', 'Clevelandia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0288', '04', 'Corre Agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0289', '04', 'Cunani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0290', '04', 'Curiau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0291', '04', 'Cutias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0292', '04', 'Fazendinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0293', '04', 'Ferreira Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0294', '04', 'Fortaleza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0295', '04', 'Gaivota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0296', '04', 'Gurupora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0297', '04', 'Igarape do Lago' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0298', '04', 'Ilha de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0299', '04', 'Inaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0300', '04', 'Itaubal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0301', '04', 'Laranjal do Jari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0302', '04', 'Livramento do Pacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0303', '04', 'Lourenco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0304', '04', 'Macapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0305', '04', 'Mazagao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0306', '04', 'Mazagao Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0307', '04', 'Oiapoque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0308', '04', 'Paredao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0309', '04', 'Porto Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0310', '04', 'Pracuuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0311', '04', 'Santa Luzia do Pacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0312', '04', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0313', '04', 'Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0314', '04', 'Sao Joaquim do Pacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0315', '04', 'Sao Sebastiao do Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0316', '04', 'Sao Tome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0317', '04', 'Serra do Navio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0318', '04', 'Sucuriju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0319', '04', 'Tartarugalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0320', '04', 'Vila Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0321', '04', 'Vitoria do Jari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0322', '05', 'Abadia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0323', '05', 'Abaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0324', '05', 'Abare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0325', '05', 'Abelhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0326', '05', 'Abobora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0327', '05', 'Abrantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0328', '05', 'Acajutiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0329', '05', 'Acu da Torre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0330', '05', 'Acudina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0331', '05', 'Acupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0332', '05', 'Adustina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0333', '05', 'Afligidos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0334', '05', 'Afranio Peixoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0335', '05', 'Agua Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0336', '05', 'Agua Fria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0337', '05', 'Aguas do Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0338', '05', 'Aiquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0339', '05', 'Alagoinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0340', '05', 'Alcobaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0341', '05', 'Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0342', '05', 'Algodao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0343', '05', 'Algodoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0344', '05', 'Almadina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0345', '05', 'Alto Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0346', '05', 'Amado Bahia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0347', '05', 'Amaniu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0348', '05', 'Amargosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0349', '05', 'Amelia Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0350', '05', 'America Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0351', '05', 'Americo Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0352', '05', 'Anage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0353', '05', 'Andarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0354', '05', 'Andorinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0355', '05', 'Angical' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0356', '05', 'Angico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0357', '05', 'Anguera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0358', '05', 'Antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0359', '05', 'Antonio Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0360', '05', 'Antonio Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0361', '05', 'Apora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0362', '05', 'Apuarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0363', '05', 'Aracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0364', '05', 'Aracatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0365', '05', 'Araci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0366', '05', 'Aramari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0367', '05', 'Arapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0368', '05', 'Arataca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0369', '05', 'Aratuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0370', '05', 'Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0371', '05', 'Arembepe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0372', '05', 'Argoim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0373', '05', 'Argolo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0374', '05', 'Aribice' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0375', '05', 'Aritagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0376', '05', 'Aurelino Leal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0377', '05', 'Baianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0378', '05', 'Baixa do Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0379', '05', 'Baixa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0380', '05', 'Baixao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0381', '05', 'Baixinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0382', '05', 'Baluarte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0383', '05', 'Banco Central' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0384', '05', 'Banco da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0385', '05', 'Bandeira do Almada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0386', '05', 'Bandeira do Colonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0387', '05', 'Bandiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0388', '05', 'Banzae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0389', '05', 'Baraunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0390', '05', 'Barcelos do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0391', '05', 'Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0392', '05', 'Barra da Estiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0393', '05', 'Barra do Choca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0394', '05', 'Barra do Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0395', '05', 'Barra do Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0396', '05', 'Barra do Pojuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0397', '05', 'Barra do Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0398', '05', 'Barra do Tarrachil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0399', '05', 'Barracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0400', '05', 'Barreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0401', '05', 'Barro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0402', '05', 'Barro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0403', '05', 'Barro Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0404', '05', 'Barrocas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0405', '05', 'Bastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0406', '05', 'Bate Pe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0407', '05', 'Batinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0408', '05', 'Bela Flor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0409', '05', 'Belem da Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0410', '05', 'Belmonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0411', '05', 'Belo Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0412', '05', 'Bem-bom' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0413', '05', 'Bendego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0414', '05', 'Bento Simoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0415', '05', 'Biritinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0416', '05', 'Boa Espera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0417', '05', 'Boa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0418', '05', 'Boa Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0419', '05', 'Boa Vista do Lagamar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0420', '05', 'Boa Vista do Tupim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0421', '05', 'Boacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0422', '05', 'Boca do Corrego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0423', '05', 'Bom Jesus da Lapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0424', '05', 'Bom Jesus da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0425', '05', 'Bom Sossego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0426', '05', 'Bonfim da Feira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0427', '05', 'Boninal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0428', '05', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0429', '05', 'Boquira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0430', '05', 'Botupora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0431', '05', 'Botuquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0432', '05', 'Brejinho das Ametistas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0433', '05', 'Brejo da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0434', '05', 'Brejo Luiza de Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0435', '05', 'Brejo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0436', '05', 'Brejoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0437', '05', 'Brejolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0438', '05', 'Brotas de Macaubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0439', '05', 'Brumado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0440', '05', 'Bucuituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0441', '05', 'Buerarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0442', '05', 'Buracica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0443', '05', 'Buranhem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0444', '05', 'Buril' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0445', '05', 'Buris de Abrantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0446', '05', 'Buritirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0447', '05', 'Caatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0448', '05', 'Cabaceiras do Paraguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0449', '05', 'Cabralia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0450', '05', 'Cacha Pregos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0451', '05', 'Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0452', '05', 'Cachoeira do Mato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0453', '05', 'Cacule' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0454', '05', 'Caem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0455', '05', 'Caetanos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0456', '05', 'Caete-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0457', '05', 'Caetite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0458', '05', 'Cafarnaum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0459', '05', 'Caicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0460', '05', 'Caimbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0461', '05', 'Cairu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0462', '05', 'Caiubi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0463', '05', 'Cajui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0464', '05', 'Caldas do Jorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0465', '05', 'Caldeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0466', '05', 'Caldeirao Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0467', '05', 'Caldeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0468', '05', 'Camacan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0469', '05', 'Camacari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0470', '05', 'Camamu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0471', '05', 'Camassandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0472', '05', 'Camirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0473', '05', 'Campinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0474', '05', 'Campo Alegre de Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0475', '05', 'Campo Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0476', '05', 'Camurugi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0477', '05', 'Canabravinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0478', '05', 'Canapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0479', '05', 'Canarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0480', '05', 'Canatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0481', '05', 'Canavieiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0482', '05', 'Canche' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0483', '05', 'Candeal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0484', '05', 'Candeias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0485', '05', 'Candiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0486', '05', 'Candido Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0487', '05', 'Canoao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0488', '05', 'Cansancao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0489', '05', 'Canto do Sol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0490', '05', 'Canudos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0491', '05', 'Capao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0492', '05', 'Capela do Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0493', '05', 'Capim Grosso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0494', '05', 'Caraguatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0495', '05', 'Caraibas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0496', '05', 'Caraibuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0497', '05', 'Caraipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0498', '05', 'Caraiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0499', '05', 'Caravelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0500', '05', 'Cardeal da Silva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0501', '05', 'Carinhanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0502', '05', 'Caripare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0503', '05', 'Carnaiba do Sertao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0504', '05', 'Carrapichel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0505', '05', 'Casa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0506', '05', 'Castelo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0507', '05', 'Castro Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0508', '05', 'Catinga do Moura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0509', '05', 'Catingal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0510', '05', 'Catolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0511', '05', 'Catoles' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0512', '05', 'Catolezinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0513', '05', 'Catu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0514', '05', 'Catu de Abrantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0515', '05', 'Caturama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0516', '05', 'Cavunge' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0517', '05', 'Central' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0518', '05', 'Ceraima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0519', '05', 'Chorrocho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0520', '05', 'Cicero Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0521', '05', 'Cinco Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0522', '05', 'Cipo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0523', '05', 'Coaraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0524', '05', 'Cocos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0525', '05', 'Colonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0526', '05', 'Comercio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0527', '05', 'Conceicao da Feira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0528', '05', 'Conceicao do Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0529', '05', 'Conceicao do Coite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0530', '05', 'Conceicao do Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0531', '05', 'Conde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0532', '05', 'Condeuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0533', '05', 'Contendas do Sincora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0534', '05', 'Copixaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0535', '05', 'Coqueiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0536', '05', 'Coquinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0537', '05', 'Coracao de Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0538', '05', 'Cordeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0539', '05', 'Coribe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0540', '05', 'Coronel Joao Sa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0541', '05', 'Correntina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0542', '05', 'Corta Mao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0543', '05', 'Cotegipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0544', '05', 'Coutos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0545', '05', 'Cravolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0546', '05', 'Crisopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0547', '05', 'Cristalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0548', '05', 'Cristopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0549', '05', 'Crussai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0550', '05', 'Cruz das Almas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0551', '05', 'Cumuruxatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0552', '05', 'Cunhangi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0553', '05', 'Curaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0554', '05', 'Curral Falso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0555', '05', 'Dario Meira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0556', '05', 'Delfino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0557', '05', 'Descoberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0558', '05', 'Dias Coelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0559', '05', 'Dias D Avila' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0560', '05', 'Diogenes Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0561', '05', 'Dom Basilio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0562', '05', 'Dom Macedo Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0563', '05', 'Dona Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0564', '05', 'Duas Barras do Morro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0565', '05', 'Elisio Medrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0566', '05', 'Encruzilhada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0567', '05', 'Engenheiro Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0568', '05', 'Engenheiro Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0569', '05', 'Entre Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0570', '05', 'Erico Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0571', '05', 'Esplanada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0572', '05', 'Euclides da Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0573', '05', 'Eunapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0574', '05', 'Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0575', '05', 'Feira da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0576', '05', 'Feira de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0577', '05', 'Ferradas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0578', '05', 'Filadelfia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0579', '05', 'Filanesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0580', '05', 'Firmino Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0581', '05', 'Floresta Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0582', '05', 'Formosa do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0583', '05', 'Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0584', '05', 'Gabiarra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0585', '05', 'Galeao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0586', '05', 'Gamboa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0587', '05', 'Gameleira da Lapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0588', '05', 'Gameleira do Assurua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0589', '05', 'Gandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0590', '05', 'Gaviao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0591', '05', 'Gentio do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0592', '05', 'Geolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0593', '05', 'Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0594', '05', 'Gongogi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0595', '05', 'Governador Joao Durval Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0596', '05', 'Governador Mangabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0597', '05', 'Guagirus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0598', '05', 'Guai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0599', '05', 'Guajeru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0600', '05', 'Guanambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0601', '05', 'Guapira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0602', '05', 'Guarajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0603', '05', 'Guaratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0604', '05', 'Guerem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0605', '05', 'Guine' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0606', '05', 'Guirapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0607', '05', 'Gurupa Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0608', '05', 'Heliopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0609', '05', 'Helvecia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0610', '05', 'Hidrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0611', '05', 'Humildes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0612', '05', 'Iacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0613', '05', 'Ibatui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0614', '05', 'Ibiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0615', '05', 'Ibiajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0616', '05', 'Ibiapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0617', '05', 'Ibiassuce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0618', '05', 'Ibicarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0619', '05', 'Ibicoara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0620', '05', 'Ibicui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0621', '05', 'Ibipeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0622', '05', 'Ibipetum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0623', '05', 'Ibipitanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0624', '05', 'Ibiquera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0625', '05', 'Ibiraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0626', '05', 'Ibiraja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0627', '05', 'Ibiranhem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0628', '05', 'Ibirapitanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0629', '05', 'Ibirapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0630', '05', 'Ibirataia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0631', '05', 'Ibitiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0632', '05', 'Ibitiguira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0633', '05', 'Ibitira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0634', '05', 'Ibitita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0635', '05', 'Ibitunane' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0636', '05', 'Ibitupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0637', '05', 'Ibo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0638', '05', 'Ibotirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0639', '05', 'Ichu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0640', '05', 'Ico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0641', '05', 'Igapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0642', '05', 'Igara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0643', '05', 'Igarite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0644', '05', 'Igatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0645', '05', 'Igrapiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0646', '05', 'Igua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0647', '05', 'Iguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0648', '05', 'Iguaibi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0649', '05', 'Iguatemi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0650', '05', 'Iguira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0651', '05', 'Iguitu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0652', '05', 'Ilha de Mare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0653', '05', 'Ilheus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0654', '05', 'Indai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0655', '05', 'Inema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0656', '05', 'Inhambupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0657', '05', 'Inhata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0658', '05', 'Inhaumas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0659', '05', 'Inhobim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0660', '05', 'Inubia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0661', '05', 'Ipecaeta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0662', '05', 'Ipiau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0663', '05', 'Ipira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0664', '05', 'Ipiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0665', '05', 'Ipucaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0666', '05', 'Ipupiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0667', '05', 'Irajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0668', '05', 'Iramaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0669', '05', 'Iraporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0670', '05', 'Iraquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0671', '05', 'Irara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0672', '05', 'Irece' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0673', '05', 'Irundiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0674', '05', 'Ita-azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0675', '05', 'Itabela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0676', '05', 'Itaberaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0677', '05', 'Itabuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0678', '05', 'Itacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0679', '05', 'Itacava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0680', '05', 'Itachama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0681', '05', 'Itacimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0682', '05', 'Itaete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0683', '05', 'Itagi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0684', '05', 'Itagiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0685', '05', 'Itagimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0686', '05', 'Itaguacu da Bahia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0687', '05', 'Itaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0688', '05', 'Itaibo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0689', '05', 'Itaipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0690', '05', 'Itaitu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0691', '05', 'Itajai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0692', '05', 'Itaju do Colonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0693', '05', 'Itajubaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0694', '05', 'Itajuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0695', '05', 'Itajuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0696', '05', 'Itamaraju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0697', '05', 'Itamari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0698', '05', 'Itambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0699', '05', 'Itamira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0700', '05', 'Itamotinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0701', '05', 'Itanage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0702', '05', 'Itanagra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0703', '05', 'Itanhem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0704', '05', 'Itanhi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0705', '05', 'Itaparica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0706', '05', 'Itape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0707', '05', 'Itapebi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0708', '05', 'Itapeipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0709', '05', 'Itapetinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0710', '05', 'Itapicuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0711', '05', 'Itapirema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0712', '05', 'Itapitanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0713', '05', 'Itapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0714', '05', 'Itapura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0715', '05', 'Itaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0716', '05', 'Itaquarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0717', '05', 'Itarantim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0718', '05', 'Itati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0719', '05', 'Itatim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0720', '05', 'Itatingui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0721', '05', 'Itirucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0722', '05', 'Itiuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0723', '05', 'Itororo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0724', '05', 'Ituacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0725', '05', 'Itubera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0726', '05', 'Itupeva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0727', '05', 'Iuiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0728', '05', 'Jaborandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0729', '05', 'Jacaraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0730', '05', 'Jacobina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0731', '05', 'Jacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0732', '05', 'Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0733', '05', 'Jacuruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0734', '05', 'Jaguaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0735', '05', 'Jaguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0736', '05', 'Jaguarari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0737', '05', 'Jaguaripe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0738', '05', 'Jaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0739', '05', 'Jandaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0740', '05', 'Japomirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0741', '05', 'Japu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0742', '05', 'Jaua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0743', '05', 'Jequie' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0744', '05', 'Jequirica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0745', '05', 'Jeremoabo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0746', '05', 'Jiribatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0747', '05', 'Jitauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0748', '05', 'Joao Amaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0749', '05', 'Joao Correia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0750', '05', 'Joao Dourado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0751', '05', 'Jose Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0752', '05', 'Juacema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0753', '05', 'Juazeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0754', '05', 'Jucurucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0755', '05', 'Juerana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0756', '05', 'Junco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0757', '05', 'Jupagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0758', '05', 'Juraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0759', '05', 'Juremal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0760', '05', 'Jussara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0761', '05', 'Jussari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0762', '05', 'Jussiape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0763', '05', 'Km Sete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0764', '05', 'Lafaiete Coutinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0765', '05', 'Lagoa Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0766', '05', 'Lagoa de Melquiades' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0767', '05', 'Lagoa do Boi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0768', '05', 'Lagoa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0769', '05', 'Lagoa Jose Luis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0770', '05', 'Lagoa Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0771', '05', 'Lagoa Real' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0772', '05', 'Laje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0773', '05', 'Laje do Banco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0774', '05', 'Lajedao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0775', '05', 'Lajedinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0776', '05', 'Lajedo Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0777', '05', 'Lajedo do Tabocal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0778', '05', 'Lamarao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0779', '05', 'Lamarao do Passe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0780', '05', 'Lapao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0781', '05', 'Largo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0782', '05', 'Lauro de Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0783', '05', 'Lencois' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0784', '05', 'Licinio de Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0785', '05', 'Limoeiro do Bom Viver' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0786', '05', 'Livramento do Brumado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0787', '05', 'Lucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0788', '05', 'Luis Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0789', '05', 'Lustosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0790', '05', 'Macajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0791', '05', 'Macarani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0792', '05', 'Macaubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0793', '05', 'Macurure' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0794', '05', 'Madre de Deus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0795', '05', 'Maetinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0796', '05', 'Maiquinique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0797', '05', 'Mairi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0798', '05', 'Malhada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0799', '05', 'Malhada de Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0800', '05', 'Mandiroba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0801', '05', 'Mangue Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0802', '05', 'Maniacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0803', '05', 'Manoel Vitorino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0804', '05', 'Mansidao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0805', '05', 'Mantiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0806', '05', 'Mar Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0807', '05', 'Maracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0808', '05', 'Maragogipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0809', '05', 'Maragogipinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0810', '05', 'Marau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0811', '05', 'Marcionilio Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0812', '05', 'Marcolino Moura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0813', '05', 'Maria Quiteria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0814', '05', 'Maricoabo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0815', '05', 'Mariquita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0816', '05', 'Mascote' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0817', '05', 'Massacara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0818', '05', 'Massaroca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0819', '05', 'Mata da Alianca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0820', '05', 'Mata de Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0821', '05', 'Mataripe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0822', '05', 'Matina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0823', '05', 'Matinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0824', '05', 'Medeiros Neto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0825', '05', 'Miguel Calmon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0826', '05', 'Milagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0827', '05', 'Mimoso do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0828', '05', 'Minas do Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0829', '05', 'Minas do Mimoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0830', '05', 'Mirandela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0831', '05', 'Miranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0832', '05', 'Mirangaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0833', '05', 'Mirante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0834', '05', 'Mocambo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0835', '05', 'Mogiquicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0836', '05', 'Monte Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0837', '05', 'Monte Gordo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0838', '05', 'Monte Reconcavo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0839', '05', 'Monte Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0840', '05', 'Morpara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0841', '05', 'Morrinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0842', '05', 'Morro das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0843', '05', 'Morro de Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0844', '05', 'Morro do Chapeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0845', '05', 'Mortugaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0846', '05', 'Mucuge' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0847', '05', 'Mucuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0848', '05', 'Mulungu do Morro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0849', '05', 'Mundo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0850', '05', 'Muniz Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0851', '05', 'Muquem do Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0852', '05', 'Muritiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0853', '05', 'Mutas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0854', '05', 'Mutuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0855', '05', 'Nage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0856', '05', 'Narandiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0857', '05', 'Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0858', '05', 'Nilo Pecanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0859', '05', 'Nordestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0860', '05', 'Nova Alegria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0861', '05', 'Nova Brasilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0862', '05', 'Nova Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0863', '05', 'Nova Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0864', '05', 'Nova Ibia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0865', '05', 'Nova Itaipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0866', '05', 'Nova Itarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0867', '05', 'Nova Lidice' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0868', '05', 'Nova Redencao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0869', '05', 'Nova Soure' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0870', '05', 'Nova Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0871', '05', 'Novo Acre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0872', '05', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0873', '05', 'Novo Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0874', '05', 'Nucleo Residencial Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0875', '05', 'Nuguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0876', '05', 'Olhos D\'agua Do Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0877', '05', 'Olhos D\'agua Do Serafim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0878', '05', 'Olindina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0879', '05', 'Oliveira dos Brejinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0880', '05', 'Olivenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0881', '05', 'Onha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0882', '05', 'Oriente Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0883', '05', 'Ouricana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0884', '05', 'Ouricangas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0885', '05', 'Ouricuri do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0886', '05', 'Ourolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0887', '05', 'Outeiro Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0888', '05', 'Paiol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0889', '05', 'Pajeu do Vento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0890', '05', 'Palame' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0891', '05', 'Palmas de Monte Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0892', '05', 'Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0893', '05', 'Parafuso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0894', '05', 'Paramirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0895', '05', 'Parateca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0896', '05', 'Paratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0897', '05', 'Paripiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0898', '05', 'Pataiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0899', '05', 'Patamute' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0900', '05', 'Pau A Pique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0901', '05', 'Pau Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0902', '05', 'Paulo Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0903', '05', 'Pe de Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0904', '05', 'Pedrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0905', '05', 'Pedras Altas do Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0906', '05', 'Pedro Alexandre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0907', '05', 'Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0908', '05', 'Petim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0909', '05', 'Piabanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0910', '05', 'Piata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0911', '05', 'Picarrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0912', '05', 'Pilao Arcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0913', '05', 'Pimenteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0914', '05', 'Pindai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0915', '05', 'Pindobacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0916', '05', 'Pinhoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0917', '05', 'Pintadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0918', '05', 'Piragi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0919', '05', 'Pirai do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0920', '05', 'Piraja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0921', '05', 'Pirajuia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0922', '05', 'Piri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0923', '05', 'Piripa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0924', '05', 'Piritiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0925', '05', 'Pituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0926', '05', 'Planaltino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0927', '05', 'Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0928', '05', 'Poco Central' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0929', '05', 'Poco de Fora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0930', '05', 'Pocoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0931', '05', 'Pocos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0932', '05', 'Pojuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0933', '05', 'Polo Petroquimico de Camacari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0934', '05', 'Ponta da Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0935', '05', 'Ponto Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0936', '05', 'Porto Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0937', '05', 'Porto Seguro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0938', '05', 'Posto da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0939', '05', 'Potiragua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0940', '05', 'Poxim do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0941', '05', 'Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0942', '05', 'Presidente Dutra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0943', '05', 'Presidente Janio Quadros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0944', '05', 'Presidente Tancredo Neves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0945', '05', 'Prevenido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0946', '05', 'Quaracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0947', '05', 'Queimadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0948', '05', 'Quijingue' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0949', '05', 'Quixaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0950', '05', 'Quixabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0951', '05', 'Rafael Jambeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0952', '05', 'Recife' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0953', '05', 'Remanso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0954', '05', 'Remedios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0955', '05', 'Retirolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0956', '05', 'Riachao das Neves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0957', '05', 'Riachao do Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0958', '05', 'Riachao do Utinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0959', '05', 'Riacho da Guia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0960', '05', 'Riacho de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0961', '05', 'Riacho Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0962', '05', 'Ribeira do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0963', '05', 'Ribeira do Pombal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0964', '05', 'Ribeirao do Largo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0965', '05', 'Ribeirao do Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0966', '05', 'Rio da Dona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0967', '05', 'Rio de Contas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0968', '05', 'Rio do Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0969', '05', 'Rio do Braco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0970', '05', 'Rio do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0971', '05', 'Rio do Pires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0972', '05', 'Rio Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0973', '05', 'Rio Real' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0974', '05', 'Rodelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0975', '05', 'Ruy Barbosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0976', '05', 'Saldanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0977', '05', 'Salgadalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0978', '05', 'Salinas da Margarida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0979', '05', 'Salobrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0980', '05', 'Salobro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0981', '05', 'Salvador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0982', '05', 'Sambaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0983', '05', 'Santa Barbara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0984', '05', 'Santa Brigida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0985', '05', 'Santa Cruz Cabralia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0986', '05', 'Santa Cruz da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0987', '05', 'Santa Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0988', '05', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0989', '05', 'Santa Maria da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0990', '05', 'Santa Rita de Cassia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0991', '05', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0992', '05', 'Santaluz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0993', '05', 'Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0994', '05', 'Santana do Sobrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0995', '05', 'Santanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0996', '05', 'Santiago do Iguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0997', '05', 'Santo Amaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0998', '05', 'Santo Antonio de Barcelona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '0999', '05', 'Santo Antonio de Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1000', '05', 'Santo Estevao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1001', '05', 'Santo Inacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1002', '05', 'Sao Desiderio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1003', '05', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1004', '05', 'Sao Felipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1005', '05', 'Sao Felix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1006', '05', 'Sao Felix do Coribe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1007', '05', 'Sao Francisco do Conde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1008', '05', 'Sao Gabriel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1009', '05', 'Sao Goncalo dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1010', '05', 'Sao Joao da Fortaleza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1011', '05', 'Sao Joao da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1012', '05', 'Sao Jose da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1013', '05', 'Sao Jose do Colonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1014', '05', 'Sao Jose do Jacuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1015', '05', 'Sao Jose do Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1016', '05', 'Sao Jose do Rio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1017', '05', 'Sao Miguel das Matas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1018', '05', 'Sao Paulinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1019', '05', 'Sao Roque do Paraguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1020', '05', 'Sao Sebastiao do Passe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1021', '05', 'Sao Timoteo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1022', '05', 'Sapeacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1023', '05', 'Satiro Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1024', '05', 'Saubara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1025', '05', 'Saudavel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1026', '05', 'Saude' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1027', '05', 'Seabra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1028', '05', 'Sebastiao Laranjeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1029', '05', 'Senhor do Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1030', '05', 'Sento Se' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1031', '05', 'Sergi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1032', '05', 'Serra da Canabrava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1033', '05', 'Serra do Ramalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1034', '05', 'Serra Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1035', '05', 'Serra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1036', '05', 'Serra Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1037', '05', 'Serrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1038', '05', 'Serrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1039', '05', 'Simoes Filho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1040', '05', 'Sitio da Barauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1041', '05', 'Sitio do Mato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1042', '05', 'Sitio do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1043', '05', 'Sitio do Quinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1044', '05', 'Sitio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1045', '05', 'Sitio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1046', '05', 'Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1047', '05', 'Sobradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1048', '05', 'Souto Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1049', '05', 'Subauma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1050', '05', 'Sussuarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1051', '05', 'Tabocas do Brejo Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1052', '05', 'Taboleiro do Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1053', '05', 'Taboquinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1054', '05', 'Tagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1055', '05', 'Tamburil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1056', '05', 'Tanhacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1057', '05', 'Tanque Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1058', '05', 'Tanquinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1059', '05', 'Tanquinho do Poco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1060', '05', 'Taperoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1061', '05', 'Tapiraipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1062', '05', 'Tapirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1063', '05', 'Tapiramuta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1064', '05', 'Tapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1065', '05', 'Tapuia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1066', '05', 'Taquarendi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1067', '05', 'Taquarinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1068', '05', 'Tartaruga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1069', '05', 'Tauape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1070', '05', 'Teixeira de Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1071', '05', 'Teodoro Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1072', '05', 'Teofilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1073', '05', 'Teolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1074', '05', 'Terra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1075', '05', 'Tijuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1076', '05', 'Tiquarucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1077', '05', 'Tremedal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1078', '05', 'Triunfo do Sincora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1079', '05', 'Tucano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1080', '05', 'Uaua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1081', '05', 'Ubaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1082', '05', 'Ubaitaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1083', '05', 'Ubata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1084', '05', 'Ubiracaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1085', '05', 'Ubiraita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1086', '05', 'Uibai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1087', '05', 'Umburanas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1088', '05', 'Umbuzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1089', '05', 'Una' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1090', '05', 'Urandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1091', '05', 'Urucuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1092', '05', 'Utinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1093', '05', 'Vale Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1094', '05', 'Valenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1095', '05', 'Valente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1096', '05', 'Varzea da Roca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1097', '05', 'Varzea do Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1098', '05', 'Varzea do Cerco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1099', '05', 'Varzea do Poco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1100', '05', 'Varzea Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1101', '05', 'Varzeas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1102', '05', 'Varzedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1103', '05', 'Velha Boipeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1104', '05', 'Ventura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1105', '05', 'Vera Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1106', '05', 'Vereda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1107', '05', 'Vila do Cafe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1108', '05', 'Vitoria da Conquista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1109', '05', 'Volta Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1110', '05', 'Wagner' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1111', '05', 'Wanderley' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1112', '05', 'Wenceslau Guimaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1113', '05', 'Xique-xique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1114', '06', 'Abaiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1115', '06', 'Abilio Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1116', '06', 'Acarape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1117', '06', 'Acarau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1118', '06', 'Acopiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1119', '06', 'Adrianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1120', '06', 'Agua Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1121', '06', 'Aguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1122', '06', 'Aiua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1123', '06', 'Aiuaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1124', '06', 'Alagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1125', '06', 'Alcantaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1126', '06', 'Algodoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1127', '06', 'Almofala' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1128', '06', 'Altaneira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1129', '06', 'Alto Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1130', '06', 'Amanaiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1131', '06', 'Amanari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1132', '06', 'Amaniutuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1133', '06', 'Amarelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1134', '06', 'Amaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1135', '06', 'America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1136', '06', 'Amontada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1137', '06', 'Anaua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1138', '06', 'Aningas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1139', '06', 'Anjinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1140', '06', 'Antonina do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1141', '06', 'Antonio Bezerra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1142', '06', 'Antonio Diogo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1143', '06', 'Antonio Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1144', '06', 'Aprazivel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1145', '06', 'Apuiares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1146', '06', 'Aquinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1147', '06', 'Aquiraz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1148', '06', 'Aracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1149', '06', 'Aracati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1150', '06', 'Aracatiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1151', '06', 'Aracatiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1152', '06', 'Aracoiaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1153', '06', 'Arajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1154', '06', 'Aranau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1155', '06', 'Arapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1156', '06', 'Arapari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1157', '06', 'Araporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1158', '06', 'Araquem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1159', '06', 'Ararenda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1160', '06', 'Araripe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1161', '06', 'Ararius' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1162', '06', 'Aratama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1163', '06', 'Araticum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1164', '06', 'Aratuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1165', '06', 'Areial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1166', '06', 'Ariscos dos Marianos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1167', '06', 'Arneiroz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1168', '06', 'Aroeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1169', '06', 'Arrojado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1170', '06', 'Aruaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1171', '06', 'Assare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1172', '06', 'Assuncao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1173', '06', 'Aurora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1174', '06', 'Baixa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1175', '06', 'Baixio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1176', '06', 'Baixio da Donana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1177', '06', 'Banabuiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1178', '06', 'Bandeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1179', '06', 'Barao de Aquiraz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1180', '06', 'Barbalha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1181', '06', 'Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1182', '06', 'Barra do Sotero' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1183', '06', 'Barra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1184', '06', 'Barreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1185', '06', 'Barreira dos Vianas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1186', '06', 'Barreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1187', '06', 'Barreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1188', '06', 'Barrento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1189', '06', 'Barro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1190', '06', 'Barro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1191', '06', 'Barroquinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1192', '06', 'Baturite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1193', '06', 'Bau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1194', '06', 'Beberibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1195', '06', 'Bela Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1196', '06', 'Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1197', '06', 'Betania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1198', '06', 'Bitupita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1199', '06', 'Bixopa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1200', '06', 'Boa Agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1201', '06', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1202', '06', 'Boa Viagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1203', '06', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1204', '06', 'Boa Vista do Caxitore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1205', '06', 'Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1206', '06', 'Bonhu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1207', '06', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1208', '06', 'Borges' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1209', '06', 'Brejinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1210', '06', 'Brejo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1211', '06', 'Brejo Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1212', '06', 'Brotas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1213', '06', 'Buritizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1214', '06', 'Buritizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1215', '06', 'Cabreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1216', '06', 'Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1217', '06', 'Cachoeira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1218', '06', 'Caicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1219', '06', 'Caicarinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1220', '06', 'Caio Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1221', '06', 'Caioca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1222', '06', 'Caipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1223', '06', 'Calabaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1224', '06', 'Caldeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1225', '06', 'California' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1226', '06', 'Camara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1227', '06', 'Camboas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1228', '06', 'Camilos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1229', '06', 'Camocim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1230', '06', 'Campanario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1231', '06', 'Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1232', '06', 'Campos Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1233', '06', 'Canaan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1234', '06', 'Canafistula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1235', '06', 'Cangati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1236', '06', 'Caninde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1237', '06', 'Canindezinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1238', '06', 'Capistrano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1239', '06', 'Caponga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1240', '06', 'Caponga da Bernarda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1241', '06', 'Caracara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1242', '06', 'Caridade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1243', '06', 'Carire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1244', '06', 'Caririacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1245', '06', 'Carius' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1246', '06', 'Cariutaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1247', '06', 'Carmelopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1248', '06', 'Carnaubal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1249', '06', 'Carnaubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1250', '06', 'Carnaubinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1251', '06', 'Carquejo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1252', '06', 'Carrapateiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1253', '06', 'Caruatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1254', '06', 'Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1255', '06', 'Carvoeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1256', '06', 'Cascavel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1257', '06', 'Castanhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1258', '06', 'Catarina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1259', '06', 'Catole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1260', '06', 'Catuana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1261', '06', 'Catunda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1262', '06', 'Caucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1263', '06', 'Caxitore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1264', '06', 'Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1265', '06', 'Cemoaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1266', '06', 'Chaval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1267', '06', 'Choro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1268', '06', 'Chorozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1269', '06', 'Cipo dos Anjos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1270', '06', 'Cococi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1271', '06', 'Codia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1272', '06', 'Coite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1273', '06', 'Colina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1274', '06', 'Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1275', '06', 'Coreau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1276', '06', 'Corrego dos Fernandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1277', '06', 'Crateus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1278', '06', 'Crato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1279', '06', 'Crioulos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1280', '06', 'Cristais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1281', '06', 'Croata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1282', '06', 'Cruxati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1283', '06', 'Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1284', '06', 'Cruz de Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1285', '06', 'Cruzeirinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1286', '06', 'Cuncas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1287', '06', 'Curatis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1288', '06', 'Curupira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1289', '06', 'Custodio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1290', '06', 'Daniel de Queiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1291', '06', 'Delmiro Gouveia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1292', '06', 'Deputado Irapuan Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1293', '06', 'Deserto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1294', '06', 'Dom Leme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1295', '06', 'Dom Mauricio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1296', '06', 'Dom Quintino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1297', '06', 'Domingos da Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1298', '06', 'Donato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1299', '06', 'Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1300', '06', 'Ebron' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1301', '06', 'Ema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1302', '06', 'Ematuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1303', '06', 'Encantado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1304', '06', 'Engenheiro Joao Tome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1305', '06', 'Engenheiro Jose Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1306', '06', 'Engenho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1307', '06', 'Erere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1308', '06', 'Espacinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1309', '06', 'Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1310', '06', 'Espinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1311', '06', 'Eusebio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1312', '06', 'Farias Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1313', '06', 'Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1314', '06', 'Feiticeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1315', '06', 'Feitosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1316', '06', 'Felizardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1317', '06', 'Flamengo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1318', '06', 'Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1319', '06', 'Forquilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1320', '06', 'Fortaleza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1321', '06', 'Fortim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1322', '06', 'Frecheirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1323', '06', 'Gado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1324', '06', 'Gado dos Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1325', '06', 'Gameleira de Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1326', '06', 'Garcas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1327', '06', 'Gazea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1328', '06', 'General Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1329', '06', 'General Tiburcio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1330', '06', 'Genipapeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1331', '06', 'Gererau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1332', '06', 'Giqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1333', '06', 'Girau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1334', '06', 'Graca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1335', '06', 'Granja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1336', '06', 'Granjeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1337', '06', 'Groairas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1338', '06', 'Guaiuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1339', '06', 'Guajiru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1340', '06', 'Guanaces' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1341', '06', 'Guaraciaba do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1342', '06', 'Guaramiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1343', '06', 'Guararu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1344', '06', 'Guassi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1345', '06', 'Guassosse' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1346', '06', 'Guia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1347', '06', 'Guriu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1348', '06', 'Hidrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1349', '06', 'Holanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1350', '06', 'Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1351', '06', 'Iapi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1352', '06', 'Iara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1353', '06', 'Ibaretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1354', '06', 'Ibiapaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1355', '06', 'Ibiapina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1356', '06', 'Ibicatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1357', '06', 'Ibicua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1358', '06', 'Ibicuitaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1359', '06', 'Ibicuitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1360', '06', 'Iborepi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1361', '06', 'Ibuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1362', '06', 'Ibuguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1363', '06', 'Icapui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1364', '06', 'Icarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1365', '06', 'Ico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1366', '06', 'Icozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1367', '06', 'Ideal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1368', '06', 'Igaroi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1369', '06', 'Iguatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1370', '06', 'Independencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1371', '06', 'Ingazeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1372', '06', 'Inhamuns' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1373', '06', 'Inhucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1374', '06', 'Inhuporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1375', '06', 'Ipaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1376', '06', 'Ipaumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1377', '06', 'Ipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1378', '06', 'Ipueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1379', '06', 'Ipueiras dos Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1380', '06', 'Iracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1381', '06', 'Iraja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1382', '06', 'Irapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1383', '06', 'Iratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1384', '06', 'Iraucuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1385', '06', 'Isidoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1386', '06', 'Itacima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1387', '06', 'Itagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1388', '06', 'Itaicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1389', '06', 'Itaipaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1390', '06', 'Itaitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1391', '06', 'Itans' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1392', '06', 'Itapage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1393', '06', 'Itapebussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1394', '06', 'Itapeim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1395', '06', 'Itapipoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1396', '06', 'Itapiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1397', '06', 'Itapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1398', '06', 'Itarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1399', '06', 'Itatira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1400', '06', 'Jaburuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1401', '06', 'Jacampari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1402', '06', 'Jacarecoara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1403', '06', 'Jacauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1404', '06', 'Jaguarao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1405', '06', 'Jaguaretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1406', '06', 'Jaguaribara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1407', '06', 'Jaguaribe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1408', '06', 'Jaguaruana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1409', '06', 'Jaibaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1410', '06', 'Jamacaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1411', '06', 'Jandrangoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1412', '06', 'Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1413', '06', 'Jardimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1414', '06', 'Jati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1415', '06', 'Jijoca de Jericoacoara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1416', '06', 'Joao Cordeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1417', '06', 'Jordao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1418', '06', 'Jose de Alencar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1419', '06', 'Jua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1420', '06', 'Juatama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1421', '06', 'Juazeiro de Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1422', '06', 'Juazeiro do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1423', '06', 'Jubaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1424', '06', 'Jucas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1425', '06', 'Jurema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1426', '06', 'Justiniano Serpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1427', '06', 'Lacerda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1428', '06', 'Ladeira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1429', '06', 'Lagoa de Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1430', '06', 'Lagoa do Juvenal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1431', '06', 'Lagoa do Mato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1432', '06', 'Lagoa dos Crioulos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1433', '06', 'Lagoa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1434', '06', 'Lagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1435', '06', 'Lambedouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1436', '06', 'Lameiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1437', '06', 'Lavras da Mangabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1438', '06', 'Lima Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1439', '06', 'Limoeiro do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1440', '06', 'Lisieux' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1441', '06', 'Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1442', '06', 'Logradouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1443', '06', 'Macambira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1444', '06', 'Macaoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1445', '06', 'Macarau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1446', '06', 'Maceio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1447', '06', 'Madalena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1448', '06', 'Major Simplicio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1449', '06', 'Majorlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1450', '06', 'Malhada Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1451', '06', 'Mangabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1452', '06', 'Manibu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1453', '06', 'Manituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1454', '06', 'Mapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1455', '06', 'Maracanau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1456', '06', 'Maragua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1457', '06', 'Maranguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1458', '06', 'Mararupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1459', '06', 'Marco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1460', '06', 'Marinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1461', '06', 'Marrecas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1462', '06', 'Marrocos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1463', '06', 'Marruas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1464', '06', 'Martinopole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1465', '06', 'Massape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1466', '06', 'Mata Fresca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1467', '06', 'Matias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1468', '06', 'Matriz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1469', '06', 'Mauriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1470', '06', 'Mel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1471', '06', 'Meruoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1472', '06', 'Messejana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1473', '06', 'Miguel Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1474', '06', 'Milagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1475', '06', 'Milha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1476', '06', 'Milton Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1477', '06', 'Mineirolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1478', '06', 'Miragem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1479', '06', 'Miraima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1480', '06', 'Mirambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1481', '06', 'Missao Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1482', '06', 'Missao Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1483', '06', 'Missi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1484', '06', 'Moitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1485', '06', 'Mombaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1486', '06', 'Mondubim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1487', '06', 'Monguba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1488', '06', 'Monsenhor Tabosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1489', '06', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1490', '06', 'Monte Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1491', '06', 'Monte Grave' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1492', '06', 'Monte Sion' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1493', '06', 'Montenebo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1494', '06', 'Morada Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1495', '06', 'Moraujo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1496', '06', 'Morrinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1497', '06', 'Morrinhos Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1498', '06', 'Morro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1499', '06', 'Mucambo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1500', '06', 'Mulungu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1501', '06', 'Mumbaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1502', '06', 'Mundau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1503', '06', 'Muribeca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1504', '06', 'Muriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1505', '06', 'Mutambeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1506', '06', 'Naraniu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1507', '06', 'Nascente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1508', '06', 'Nenenlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1509', '06', 'Nossa Senhora do Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1510', '06', 'Nova Betania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1511', '06', 'Nova Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1512', '06', 'Nova Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1513', '06', 'Nova Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1514', '06', 'Nova Russas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1515', '06', 'Nova Vida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1516', '06', 'Novo Assis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1517', '06', 'Novo Oriente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1518', '06', 'Ocara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1519', '06', 'Oiticica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1520', '06', 'Olho-d\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1521', '06', 'Olho-d\'agua Da Bica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1522', '06', 'Oliveiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1523', '06', 'Oros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1524', '06', 'Pacajus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1525', '06', 'Pacatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1526', '06', 'Pacoti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1527', '06', 'Pacuja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1528', '06', 'Padre Cicero' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1529', '06', 'Padre Linhares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1530', '06', 'Padre Vieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1531', '06', 'Pajeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1532', '06', 'Pajucara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1533', '06', 'Palestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1534', '06', 'Palestina do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1535', '06', 'Palhano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1536', '06', 'Palmacia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1537', '06', 'Palmatoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1538', '06', 'Panacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1539', '06', 'Paracua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1540', '06', 'Paracuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1541', '06', 'Paraipaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1542', '06', 'Parajuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1543', '06', 'Parambu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1544', '06', 'Paramoti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1545', '06', 'Parangaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1546', '06', 'Parapui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1547', '06', 'Parazinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1548', '06', 'Paripueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1549', '06', 'Passagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1550', '06', 'Passagem Funda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1551', '06', 'Pasta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1552', '06', 'Patacas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1553', '06', 'Patriarca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1554', '06', 'Pavuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1555', '06', 'Pecem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1556', '06', 'Pedra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1557', '06', 'Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1558', '06', 'Pedrinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1559', '06', 'Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1560', '06', 'Peixe Gordo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1561', '06', 'Penaforte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1562', '06', 'Pentecoste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1563', '06', 'Pereiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1564', '06', 'Pernambuquinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1565', '06', 'Pessoa Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1566', '06', 'Pindoguaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1567', '06', 'Pindoretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1568', '06', 'Pio X' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1569', '06', 'Piquet Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1570', '06', 'Pirabibu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1571', '06', 'Pirangi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1572', '06', 'Pires Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1573', '06', 'Pitombeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1574', '06', 'Pitombeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1575', '06', 'Placido Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1576', '06', 'Poco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1577', '06', 'Poco Comprido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1578', '06', 'Poco Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1579', '06', 'Podimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1580', '06', 'Ponta da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1581', '06', 'Poranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1582', '06', 'Porfirio Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1583', '06', 'Porteiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1584', '06', 'Potengi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1585', '06', 'Poti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1586', '06', 'Potiretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1587', '06', 'Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1588', '06', 'Prudente de Morais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1589', '06', 'Quatiguaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1590', '06', 'Queimadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1591', '06', 'Quimami' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1592', '06', 'Quincoe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1593', '06', 'Quincunca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1594', '06', 'Quitaius' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1595', '06', 'Quiterianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1596', '06', 'Quixada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1597', '06', 'Quixariu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1598', '06', 'Quixelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1599', '06', 'Quixeramobim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1600', '06', 'Quixere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1601', '06', 'Quixoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1602', '06', 'Raimundo Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1603', '06', 'Redencao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1604', '06', 'Reriutaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1605', '06', 'Riachao do Banabuiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1606', '06', 'Riacho Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1607', '06', 'Riacho Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1608', '06', 'Riacho Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1609', '06', 'Rinare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1610', '06', 'Roldao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1611', '06', 'Russas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1612', '06', 'Sabiaguaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1613', '06', 'Saboeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1614', '06', 'Sacramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1615', '06', 'Salao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1616', '06', 'Salitre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1617', '06', 'Sambaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1618', '06', 'Santa Ana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1619', '06', 'Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1620', '06', 'Santa Felicia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1621', '06', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1622', '06', 'Santa Quiteria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1623', '06', 'Santa Tereza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1624', '06', 'Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1625', '06', 'Santana do Acarau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1626', '06', 'Santana do Cariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1627', '06', 'Santarem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1628', '06', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1629', '06', 'Santo Antonio da Pindoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1630', '06', 'Santo Antonio dos Fernandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1631', '06', 'Sao Bartolomeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1632', '06', 'Sao Benedito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1633', '06', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1634', '06', 'Sao Felipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1635', '06', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1636', '06', 'Sao Gerardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1637', '06', 'Sao Goncalo do Amarante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1638', '06', 'Sao Goncalo do Umari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1639', '06', 'Sao Joao de Deus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1640', '06', 'Sao Joao do Jaguaribe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1641', '06', 'Sao Joao dos Queiroz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1642', '06', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1643', '06', 'Sao Joaquim do Salgado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1644', '06', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1645', '06', 'Sao Jose das Lontras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1646', '06', 'Sao Jose de Solonopole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1647', '06', 'Sao Jose do Torto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1648', '06', 'Sao Luis do Curu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1649', '06', 'Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1650', '06', 'Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1651', '06', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1652', '06', 'Sao Romao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1653', '06', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1654', '06', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1655', '06', 'Sapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1656', '06', 'Sapupara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1657', '06', 'Sebastiao de Abreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1658', '06', 'Senador Carlos Jereissati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1659', '06', 'Senador Pompeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1660', '06', 'Senador Sa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1661', '06', 'Sereno de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1662', '06', 'Serra do Felix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1663', '06', 'Serragem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1664', '06', 'Serrota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1665', '06', 'Serrote' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1666', '06', 'Sitia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1667', '06', 'Sitios Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1668', '06', 'Siupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1669', '06', 'Sobral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1670', '06', 'Soledade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1671', '06', 'Solonopole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1672', '06', 'Suassurana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1673', '06', 'Sucatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1674', '06', 'Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1675', '06', 'Sussuanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1676', '06', 'Tabainha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1677', '06', 'Taboleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1678', '06', 'Tabuleiro do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1679', '06', 'Taiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1680', '06', 'Tamboril' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1681', '06', 'Tanques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1682', '06', 'Tapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1683', '06', 'Taperuaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1684', '06', 'Tapuiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1685', '06', 'Targinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1686', '06', 'Tarrafas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1687', '06', 'Taua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1688', '06', 'Tejucuoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1689', '06', 'Tiangua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1690', '06', 'Timonha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1691', '06', 'Tipi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1692', '06', 'Tome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1693', '06', 'Trairi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1694', '06', 'Trapia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1695', '06', 'Trici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1696', '06', 'Troia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1697', '06', 'Trussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1698', '06', 'Tucunduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1699', '06', 'Tucuns' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1700', '06', 'Tuina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1701', '06', 'Tururu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1702', '06', 'Ubajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1703', '06', 'Ubauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1704', '06', 'Ubiracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1705', '06', 'Uiraponga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1706', '06', 'Umari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1707', '06', 'Umarituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1708', '06', 'Umburanas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1709', '06', 'Umirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1710', '06', 'Uruburetama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1711', '06', 'Uruoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1712', '06', 'Uruque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1713', '06', 'Varjota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1714', '06', 'Varzea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1715', '06', 'Varzea Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1716', '06', 'Varzea da Volta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1717', '06', 'Varzea do Gilo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1718', '06', 'Vazantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1719', '06', 'Ventura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1720', '06', 'Vertentes do Lagedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1721', '06', 'Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1722', '06', 'Vicosa do Ceara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1723', '06', 'Vila Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1724', '07', 'Brasilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1725', '07', 'Brazlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1726', '07', 'Candangolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1727', '07', 'Ceilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1728', '07', 'Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1729', '07', 'Gama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1730', '07', 'Guara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1731', '07', 'Lago Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1732', '07', 'Lago Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1733', '07', 'Nucleo Bandeirante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1734', '07', 'Paranoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1735', '07', 'Planaltina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1736', '07', 'Recanto das Emas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1737', '07', 'Riacho Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1738', '07', 'Samambaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1739', '07', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1740', '07', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1741', '07', 'Sobradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1742', '07', 'Taguatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1743', '08', 'Acioli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1744', '08', 'Afonso Claudio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1745', '08', 'Agha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1746', '08', 'Agua Doce do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1747', '08', 'Aguia Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1748', '08', 'Airituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1749', '08', 'Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1750', '08', 'Alfredo Chaves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1751', '08', 'Alto Calcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1752', '08', 'Alto Caldeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1753', '08', 'Alto Mutum Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1754', '08', 'Alto Rio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1755', '08', 'Alto Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1756', '08', 'Anchieta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1757', '08', 'Angelo Frechiani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1758', '08', 'Anutiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1759', '08', 'Apiaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1760', '08', 'Aracatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1761', '08', 'Arace' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1762', '08', 'Aracruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1763', '08', 'Aracui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1764', '08', 'Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1765', '08', 'Ararai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1766', '08', 'Argolas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1767', '08', 'Atilio Vivacqua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1768', '08', 'Baia Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1769', '08', 'Baixo Guandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1770', '08', 'Barra de Novo Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1771', '08', 'Barra de Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1772', '08', 'Barra do Itapemirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1773', '08', 'Barra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1774', '08', 'Barra Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1775', '08', 'Baunilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1776', '08', 'Bebedouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1777', '08', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1778', '08', 'Boapaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1779', '08', 'Bom Jesus do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1780', '08', 'Bonsucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1781', '08', 'Braco do Rio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1782', '08', 'Brejetuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1783', '08', 'Burarama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1784', '08', 'Cachoeirinha de Itauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1785', '08', 'Cachoeiro de Itapemirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1786', '08', 'Cafe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1787', '08', 'Calogi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1788', '08', 'Camara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1789', '08', 'Carapina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1790', '08', 'Cariacica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1791', '08', 'Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1792', '08', 'Celina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1793', '08', 'Colatina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1794', '08', 'Conceicao da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1795', '08', 'Conceicao do Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1796', '08', 'Conceicao do Muqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1797', '08', 'Conduru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1798', '08', 'Coqueiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1799', '08', 'Corrego dos Monos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1800', '08', 'Cotaxe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1801', '08', 'Cristal do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1802', '08', 'Crubixa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1803', '08', 'Desengano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1804', '08', 'Divino de Sao Lourenco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1805', '08', 'Divino Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1806', '08', 'Djalma Coutinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1807', '08', 'Domingos Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1808', '08', 'Dona America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1809', '08', 'Dores do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1810', '08', 'Duas Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1811', '08', 'Ecoporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1812', '08', 'Estrela do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1813', '08', 'Fartura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1814', '08', 'Fazenda Guandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1815', '08', 'Fundao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1816', '08', 'Garrafao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1817', '08', 'Gironda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1818', '08', 'Goiabeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1819', '08', 'Governador Lacerda de Aguiar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1820', '08', 'Governador Lindenberg' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1821', '08', 'Graca Aranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1822', '08', 'Gruta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1823', '08', 'Guacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1824', '08', 'Guarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1825', '08', 'Guarapari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1826', '08', 'Guararema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1827', '08', 'Ibatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1828', '08', 'Ibes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1829', '08', 'Ibicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1830', '08', 'Ibiracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1831', '08', 'Ibitirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1832', '08', 'Ibitirui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1833', '08', 'Ibituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1834', '08', 'Iconha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1835', '08', 'Imburana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1836', '08', 'Iriritiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1837', '08', 'Irundi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1838', '08', 'Irupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1839', '08', 'Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1840', '08', 'Itabaiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1841', '08', 'Itacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1842', '08', 'Itaguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1843', '08', 'Itaici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1844', '08', 'Itaimbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1845', '08', 'Itaipava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1846', '08', 'Itamira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1847', '08', 'Itaoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1848', '08', 'Itapecoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1849', '08', 'Itapemirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1850', '08', 'Itaperuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1851', '08', 'Itapina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1852', '08', 'Itaquari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1853', '08', 'Itarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1854', '08', 'Itaunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1855', '08', 'Itauninhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1856', '08', 'Iuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1857', '08', 'Jabaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1858', '08', 'Jacaraipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1859', '08', 'Jacigua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1860', '08', 'Jacupemba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1861', '08', 'Jaguare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1862', '08', 'Jeronimo Monteiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1863', '08', 'Joacuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1864', '08', 'Joao Neiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1865', '08', 'Joatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1866', '08', 'Jose Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1867', '08', 'Jucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1868', '08', 'Lajinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1869', '08', 'Laranja da Terra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1870', '08', 'Limoeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1871', '08', 'Linhares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1872', '08', 'Mangarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1873', '08', 'Mantenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1874', '08', 'Marataizes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1875', '08', 'Marechal Floriano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1876', '08', 'Marilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1877', '08', 'Matilde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1878', '08', 'Melgaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1879', '08', 'Menino Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1880', '08', 'Mimoso do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1881', '08', 'Montanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1882', '08', 'Monte Carmelo do Rio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1883', '08', 'Monte Pio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1884', '08', 'Monte Sinai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1885', '08', 'Mucurici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1886', '08', 'Mundo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1887', '08', 'Muniz Freire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1888', '08', 'Muqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1889', '08', 'Nestor Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1890', '08', 'Nova Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1891', '08', 'Nova Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1892', '08', 'Nova Venecia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1893', '08', 'Nova Verona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1894', '08', 'Novo Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1895', '08', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1896', '08', 'Pacotuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1897', '08', 'Paineiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1898', '08', 'Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1899', '08', 'Palmerino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1900', '08', 'Pancas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1901', '08', 'Paraju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1902', '08', 'Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1903', '08', 'Pedro Canario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1904', '08', 'Pendanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1905', '08', 'Pequia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1906', '08', 'Perdicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1907', '08', 'Piacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1908', '08', 'Pinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1909', '08', 'Piracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1910', '08', 'Piuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1911', '08', 'Ponte de Itabapoana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1912', '08', 'Ponto Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1913', '08', 'Pontoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1914', '08', 'Poranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1915', '08', 'Porto Barra do Riacho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1916', '08', 'Praia Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1917', '08', 'Presidente Kennedy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1918', '08', 'Princesa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1919', '08', 'Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1920', '08', 'Quilometro Null do Mutum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1921', '08', 'Regencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1922', '08', 'Riacho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1923', '08', 'Ribeirao do Cristo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1924', '08', 'Rio Bananal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1925', '08', 'Rio Calcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1926', '08', 'Rio Muqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1927', '08', 'Rio Novo do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1928', '08', 'Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1929', '08', 'Rive' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1930', '08', 'Sagrada Familia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1931', '08', 'Santa Angelica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1932', '08', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1933', '08', 'Santa Julia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1934', '08', 'Santa Leopoldina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1935', '08', 'Santa Luzia de Mantenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1936', '08', 'Santa Luzia do Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1937', '08', 'Santa Luzia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1938', '08', 'Santa Maria de Jetiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1939', '08', 'Santa Marta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1940', '08', 'Santa Teresa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1941', '08', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1942', '08', 'Santissima Trindade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1943', '08', 'Santo Agostinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1944', '08', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1945', '08', 'Santo Antonio do Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1946', '08', 'Santo Antonio do Muqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1947', '08', 'Santo Antonio do Pousalegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1948', '08', 'Santo Antonio do Quinze' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1949', '08', 'Sao Domingos do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1950', '08', 'Sao Francisco do Novo Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1951', '08', 'Sao Francisco Xavier do Guandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1952', '08', 'Sao Gabriel da Palha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1953', '08', 'Sao Geraldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1954', '08', 'Sao Jacinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1955', '08', 'Sao Joao de Petropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1956', '08', 'Sao Joao de Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1957', '08', 'Sao Joao do Sobrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1958', '08', 'Sao Jorge da Barra Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1959', '08', 'Sao Jorge do Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1960', '08', 'Sao Jorge do Tiradentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1961', '08', 'Sao Jose das Torres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1962', '08', 'Sao Jose de Mantenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1963', '08', 'Sao Jose do Calcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1964', '08', 'Sao Jose do Sobradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1965', '08', 'Sao Mateus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1966', '08', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1967', '08', 'Sao Pedro de Itabapoana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1968', '08', 'Sao Pedro de Rates' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1969', '08', 'Sao Rafael' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1970', '08', 'Sao Roque do Cannaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1971', '08', 'Sao Tiago' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1972', '08', 'Sao Torquato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1973', '08', 'Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1974', '08', 'Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1975', '08', 'Serra Pelada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1976', '08', 'Sobreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1977', '08', 'Sooretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1978', '08', 'Timbui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1979', '08', 'Todos Os Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1980', '08', 'Urania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1981', '08', 'Vargem Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1982', '08', 'Vargem Grande do Soturno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1983', '08', 'Venda Nova do Imigrante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1984', '08', 'Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1985', '08', 'Vieira Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1986', '08', 'Vila Nelita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1987', '08', 'Vila Nova de Bananal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1988', '08', 'Vila Pavao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1989', '08', 'Vila Valerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1990', '08', 'Vila Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1991', '08', 'Vila Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1992', '08', 'Vinhatico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1993', '08', 'Vinte E Cinco de Julho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1994', '08', 'Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1995', '09', 'Abadia de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1996', '09', 'Abadiania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1997', '09', 'Acreuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1998', '09', 'Adelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '1999', '09', 'Agua Fria de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2000', '09', 'Agua Limpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2001', '09', 'Aguas Lindas de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2002', '09', 'Alexania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2003', '09', 'Aloandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2004', '09', 'Alto Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2005', '09', 'Alto Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2006', '09', 'Alto Paraiso de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2007', '09', 'Alvorada do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2008', '09', 'Amaralina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2009', '09', 'Americano do Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2010', '09', 'Amorinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2011', '09', 'Anapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2012', '09', 'Anhanguera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2013', '09', 'Anicuns' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2014', '09', 'Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2015', '09', 'Aparecida de Goiania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2016', '09', 'Aparecida de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2017', '09', 'Aparecida do Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2018', '09', 'Aparecida do Rio Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2019', '09', 'Apore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2020', '09', 'Aracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2021', '09', 'Aragarcas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2022', '09', 'Aragoiania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2023', '09', 'Araguapaz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2024', '09', 'Arenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2025', '09', 'Aruana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2026', '09', 'Aurilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2027', '09', 'Auriverde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2028', '09', 'Avelinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2029', '09', 'Bacilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2030', '09', 'Baliza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2031', '09', 'Bandeirantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2032', '09', 'Barbosilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2033', '09', 'Barro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2034', '09', 'Bela Vista de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2035', '09', 'Bom Jardim de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2036', '09', 'Bom Jesus de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2037', '09', 'Bonfinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2038', '09', 'Bonopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2039', '09', 'Brazabrantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2040', '09', 'Britania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2041', '09', 'Buenolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2042', '09', 'Buriti Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2043', '09', 'Buriti de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2044', '09', 'Buritinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2045', '09', 'Cabeceiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2046', '09', 'Cachoeira Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2047', '09', 'Cachoeira de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2048', '09', 'Cachoeira Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2049', '09', 'Cacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2050', '09', 'Caiaponia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2051', '09', 'Caicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2052', '09', 'Calcilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2053', '09', 'Caldas Novas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2054', '09', 'Caldazinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2055', '09', 'Calixto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2056', '09', 'Campestre de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2057', '09', 'Campinacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2058', '09', 'Campinorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2059', '09', 'Campo Alegre de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2060', '09', 'Campo Limpo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2061', '09', 'Campolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2062', '09', 'Campos Belos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2063', '09', 'Campos Verdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2064', '09', 'Cana Brava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2065', '09', 'Canada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2066', '09', 'Capelinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2067', '09', 'Caraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2068', '09', 'Carmo do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2069', '09', 'Castelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2070', '09', 'Castrinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2071', '09', 'Catalao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2072', '09', 'Caturai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2073', '09', 'Cavalcante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2074', '09', 'Cavalheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2075', '09', 'Cebrasa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2076', '09', 'Ceres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2077', '09', 'Cezarina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2078', '09', 'Chapadao do Ceu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2079', '09', 'Choupana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2080', '09', 'Cibele' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2081', '09', 'Cidade Ocidental' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2082', '09', 'Cirilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2083', '09', 'Cocalzinho de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2084', '09', 'Colinas do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2085', '09', 'Corrego do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2086', '09', 'Corrego Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2087', '09', 'Corumba de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2088', '09', 'Corumbaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2089', '09', 'Cristalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2090', '09', 'Cristianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2091', '09', 'Crixas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2092', '09', 'Crominia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2093', '09', 'Cruzeiro do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2094', '09', 'Cumari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2095', '09', 'Damianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2096', '09', 'Damolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2097', '09', 'Davidopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2098', '09', 'Davinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2099', '09', 'Diolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2100', '09', 'Diorama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2101', '09', 'Divinopolis de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2102', '09', 'Domiciano Ribeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2103', '09', 'Doverlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2104', '09', 'Edealina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2105', '09', 'Edeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2106', '09', 'Estrela do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2107', '09', 'Faina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2108', '09', 'Fazenda Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2109', '09', 'Firminopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2110', '09', 'Flores de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2111', '09', 'Formosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2112', '09', 'Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2113', '09', 'Forte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2114', '09', 'Gameleira de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2115', '09', 'Geriacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2116', '09', 'Goialandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2117', '09', 'Goianapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2118', '09', 'Goiandira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2119', '09', 'Goianesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2120', '09', 'Goiania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2121', '09', 'Goianira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2122', '09', 'Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2123', '09', 'Goiatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2124', '09', 'Gouvelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2125', '09', 'Guapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2126', '09', 'Guaraita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2127', '09', 'Guarani de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2128', '09', 'Guarinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2129', '09', 'Heitorai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2130', '09', 'Hidrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2131', '09', 'Hidrolina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2132', '09', 'Iaciara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2133', '09', 'Inaciolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2134', '09', 'Indiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2135', '09', 'Inhumas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2136', '09', 'Interlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2137', '09', 'Ipameri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2138', '09', 'Ipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2139', '09', 'Israelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2140', '09', 'Itaberai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2141', '09', 'Itaguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2142', '09', 'Itaguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2143', '09', 'Itaguaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2144', '09', 'Itaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2145', '09', 'Itapaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2146', '09', 'Itapirapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2147', '09', 'Itapuranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2148', '09', 'Itaruma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2149', '09', 'Itaucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2150', '09', 'Itumbiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2151', '09', 'Ivolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2152', '09', 'Jacilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2153', '09', 'Jandaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2154', '09', 'Jaragua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2155', '09', 'Jatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2156', '09', 'Jaupaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2157', '09', 'Jeroaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2158', '09', 'Jesupolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2159', '09', 'Joanapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2160', '09', 'Joviania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2161', '09', 'Juscelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2162', '09', 'Juscelino Kubitschek' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2163', '09', 'Jussara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2164', '09', 'Lagoa do Bauzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2165', '09', 'Lagolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2166', '09', 'Leopoldo de Bulhoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2167', '09', 'Lucilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2168', '09', 'Luziania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2169', '09', 'Mairipotaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2170', '09', 'Mambai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2171', '09', 'Mara Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2172', '09', 'Marcianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2173', '09', 'Marzagao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2174', '09', 'Matrincha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2175', '09', 'Maurilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2176', '09', 'Meia Ponte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2177', '09', 'Messianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2178', '09', 'Mimoso de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2179', '09', 'Minacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2180', '09', 'Mineiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2181', '09', 'Moipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2182', '09', 'Monte Alegre de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2183', '09', 'Montes Claros de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2184', '09', 'Montividiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2185', '09', 'Montividiu do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2186', '09', 'Morrinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2187', '09', 'Morro Agudo de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2188', '09', 'Mossamedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2189', '09', 'Mozarlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2190', '09', 'Mundo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2191', '09', 'Mutunopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2192', '09', 'Natinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2193', '09', 'Nazario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2194', '09', 'Neropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2195', '09', 'Niquelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2196', '09', 'Nova America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2197', '09', 'Nova Aurora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2198', '09', 'Nova Crixas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2199', '09', 'Nova Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2200', '09', 'Nova Iguacu de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2201', '09', 'Nova Roma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2202', '09', 'Nova Veneza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2203', '09', 'Novo Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2204', '09', 'Novo Gama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2205', '09', 'Novo Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2206', '09', 'Olaria do Angico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2207', '09', 'Olhos D\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2208', '09', 'Orizona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2209', '09', 'Ouro Verde de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2210', '09', 'Ouroana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2211', '09', 'Ouvidor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2212', '09', 'Padre Bernardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2213', '09', 'Palestina de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2214', '09', 'Palmeiras de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2215', '09', 'Palmelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2216', '09', 'Palminopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2217', '09', 'Panama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2218', '09', 'Paranaiguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2219', '09', 'Parauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2220', '09', 'Pau-terra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2221', '09', 'Pedra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2222', '09', 'Perolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2223', '09', 'Petrolina de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2224', '09', 'Pilar de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2225', '09', 'Piloandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2226', '09', 'Piracanjuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2227', '09', 'Piranhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2228', '09', 'Pirenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2229', '09', 'Pires Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2230', '09', 'Pires do Rio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2231', '09', 'Planaltina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2232', '09', 'Pontalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2233', '09', 'Porangatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2234', '09', 'Porteirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2235', '09', 'Portelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2236', '09', 'Posse' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2237', '09', 'Posse D\'abadia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2238', '09', 'Professor Jamil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2239', '09', 'Quirinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2240', '09', 'Registro do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2241', '09', 'Rialma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2242', '09', 'Rianapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2243', '09', 'Rio Quente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2244', '09', 'Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2245', '09', 'Riverlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2246', '09', 'Rodrigues Nascimento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2247', '09', 'Rosalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2248', '09', 'Rubiataba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2249', '09', 'Sanclerlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2250', '09', 'Santa Barbara de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2251', '09', 'Santa Cruz das Lajes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2252', '09', 'Santa Cruz de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2253', '09', 'Santa Fe de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2254', '09', 'Santa Helena de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2255', '09', 'Santa Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2256', '09', 'Santa Rita do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2257', '09', 'Santa Rita do Novo Destino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2258', '09', 'Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2259', '09', 'Santa Rosa de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2260', '09', 'Santa Tereza de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2261', '09', 'Santa Terezinha de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2262', '09', 'Santo Antonio da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2263', '09', 'Santo Antonio de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2264', '09', 'Santo Antonio do Descoberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2265', '09', 'Santo Antonio do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2266', '09', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2267', '09', 'Sao Francisco de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2268', '09', 'Sao Gabriel de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2269', '09', 'Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2270', '09', 'Sao Joao D\'alianca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2271', '09', 'Sao Joao da Parauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2272', '09', 'Sao Luis de Montes Belos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2273', '09', 'Sao Luiz do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2274', '09', 'Sao Luiz do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2275', '09', 'Sao Miguel do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2276', '09', 'Sao Miguel do Passa Quatro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2277', '09', 'Sao Patricio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2278', '09', 'Sao Sebastiao do Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2279', '09', 'Sao Simao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2280', '09', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2281', '09', 'Sarandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2282', '09', 'Senador Canedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2283', '09', 'Serra Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2284', '09', 'Serranopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2285', '09', 'Silvania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2286', '09', 'Simolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2287', '09', 'Sitio D\'abadia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2288', '09', 'Sousania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2289', '09', 'Taquaral de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2290', '09', 'Taveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2291', '09', 'Teresina de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2292', '09', 'Terezopolis de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2293', '09', 'Termas do Itaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2294', '09', 'Tres Ranchos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2295', '09', 'Trindade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2296', '09', 'Trombas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2297', '09', 'Tupiracaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2298', '09', 'Turvania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2299', '09', 'Turvelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2300', '09', 'Uirapuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2301', '09', 'Uruacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2302', '09', 'Uruana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2303', '09', 'Uruita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2304', '09', 'Urutai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2305', '09', 'Uva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2306', '09', 'Valdelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2307', '09', 'Valparaiso de Goias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2308', '09', 'Varjao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2309', '09', 'Vianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2310', '09', 'Vicentinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2311', '09', 'Vila Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2312', '09', 'Vila Brasilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2313', '09', 'Vila Propicio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2314', '09', 'Vila Sertaneja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2315', '10', 'Acailandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2316', '10', 'Afonso Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2317', '10', 'Agua Doce do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2318', '10', 'Alcantara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2319', '10', 'Aldeias Altas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2320', '10', 'Altamira do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2321', '10', 'Alto Alegre do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2322', '10', 'Alto Alegre do Pindare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2323', '10', 'Alto Parnaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2324', '10', 'Amapa do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2325', '10', 'Amarante do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2326', '10', 'Anajatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2327', '10', 'Anapurus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2328', '10', 'Anil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2329', '10', 'Apicum-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2330', '10', 'Araguana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2331', '10', 'Araioses' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2332', '10', 'Arame' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2333', '10', 'Arari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2334', '10', 'Aurizona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2335', '10', 'Axixa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2336', '10', 'Bacabal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2337', '10', 'Bacabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2338', '10', 'Bacatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2339', '10', 'Bacuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2340', '10', 'Bacurituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2341', '10', 'Balsas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2342', '10', 'Barao de Grajau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2343', '10', 'Barao de Tromai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2344', '10', 'Barra do Corda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2345', '10', 'Barreirinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2346', '10', 'Barro Duro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2347', '10', 'Bela Vista do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2348', '10', 'Belagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2349', '10', 'Benedito Leite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2350', '10', 'Bequimao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2351', '10', 'Bernardo do Mearim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2352', '10', 'Boa Vista do Gurupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2353', '10', 'Boa Vista do Pindare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2354', '10', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2355', '10', 'Bom Jesus das Selvas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2356', '10', 'Bom Lugar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2357', '10', 'Bonfim do Arari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2358', '10', 'Brejo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2359', '10', 'Brejo de Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2360', '10', 'Brejo de Sao Felix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2361', '10', 'Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2362', '10', 'Buriti Bravo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2363', '10', 'Buriti Cortado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2364', '10', 'Buriticupu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2365', '10', 'Buritirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2366', '10', 'Cachoeira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2367', '10', 'Cajapio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2368', '10', 'Cajari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2369', '10', 'Campestre do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2370', '10', 'Candido Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2371', '10', 'Cantanhede' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2372', '10', 'Capinzal do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2373', '10', 'Caraiba do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2374', '10', 'Carolina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2375', '10', 'Carutapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2376', '10', 'Caxias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2377', '10', 'Cedral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2378', '10', 'Central do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2379', '10', 'Centro do Guilherme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2380', '10', 'Centro Novo do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2381', '10', 'Chapadinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2382', '10', 'Cidelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2383', '10', 'Codo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2384', '10', 'Codozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2385', '10', 'Coelho Neto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2386', '10', 'Colinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2387', '10', 'Conceicao do Lago-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2388', '10', 'Coroata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2389', '10', 'Curupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2390', '10', 'Cururupu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2391', '10', 'Curva Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2392', '10', 'Custodio Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2393', '10', 'Davinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2394', '10', 'Dom Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2395', '10', 'Duque Bacelar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2396', '10', 'Esperantinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2397', '10', 'Estandarte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2398', '10', 'Estreito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2399', '10', 'Feira Nova do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2400', '10', 'Fernando Falcao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2401', '10', 'Formosa da Serra Negra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2402', '10', 'Fortaleza dos Nogueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2403', '10', 'Fortuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2404', '10', 'Frecheiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2405', '10', 'Godofredo Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2406', '10', 'Goncalves Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2407', '10', 'Governador Archer' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2408', '10', 'Governador Edison Lobao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2409', '10', 'Governador Eugenio Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2410', '10', 'Governador Luiz Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2411', '10', 'Governador Newton Bello' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2412', '10', 'Governador Nunes Freire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2413', '10', 'Graca Aranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2414', '10', 'Grajau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2415', '10', 'Guimaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2416', '10', 'Humberto de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2417', '10', 'Ibipira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2418', '10', 'Icatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2419', '10', 'Igarape do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2420', '10', 'Igarape Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2421', '10', 'Imperatriz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2422', '10', 'Itaipava do Grajau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2423', '10', 'Itamatare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2424', '10', 'Itapecuru Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2425', '10', 'Itapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2426', '10', 'Itinga do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2427', '10', 'Jatoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2428', '10', 'Jenipapo dos Vieiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2429', '10', 'Joao Lisboa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2430', '10', 'Joselandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2431', '10', 'Junco do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2432', '10', 'Lago da Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2433', '10', 'Lago do Junco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2434', '10', 'Lago dos Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2435', '10', 'Lago Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2436', '10', 'Lagoa do Mato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2437', '10', 'Lagoa Grande do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2438', '10', 'Lajeado Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2439', '10', 'Lapela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2440', '10', 'Leandro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2441', '10', 'Lima Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2442', '10', 'Loreto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2443', '10', 'Luis Domingues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2444', '10', 'Magalhaes de Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2445', '10', 'Maioba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2446', '10', 'Maracacume' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2447', '10', 'Maraja do Sena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2448', '10', 'Maranhaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2449', '10', 'Marianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2450', '10', 'Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2451', '10', 'Mata Roma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2452', '10', 'Matinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2453', '10', 'Matoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2454', '10', 'Matoes do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2455', '10', 'Milagres do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2456', '10', 'Mirador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2457', '10', 'Miranda do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2458', '10', 'Mirinzal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2459', '10', 'Moncao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2460', '10', 'Montes Altos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2461', '10', 'Morros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2462', '10', 'Nina Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2463', '10', 'Nova Colinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2464', '10', 'Nova Iorque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2465', '10', 'Nova Olinda do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2466', '10', 'Olho D\'agua Das Cunhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2467', '10', 'Olinda Nova do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2468', '10', 'Paco do Lumiar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2469', '10', 'Palmeirandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2470', '10', 'Papagaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2471', '10', 'Paraibano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2472', '10', 'Parnarama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2473', '10', 'Passagem Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2474', '10', 'Pastos Bons' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2475', '10', 'Paulino Neves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2476', '10', 'Paulo Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2477', '10', 'Pedreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2478', '10', 'Pedro do Rosario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2479', '10', 'Penalva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2480', '10', 'Peri Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2481', '10', 'Peritoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2482', '10', 'Pimentel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2483', '10', 'Pindare Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2484', '10', 'Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2485', '10', 'Pio Xii' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2486', '10', 'Pirapemas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2487', '10', 'Pocao de Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2488', '10', 'Porto das Gabarras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2489', '10', 'Porto Franco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2490', '10', 'Porto Rico do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2491', '10', 'Presidente Dutra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2492', '10', 'Presidente Juscelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2493', '10', 'Presidente Medici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2494', '10', 'Presidente Sarney' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2495', '10', 'Presidente Vargas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2496', '10', 'Primeira Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2497', '10', 'Raposa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2498', '10', 'Resplandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2499', '10', 'Riachao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2500', '10', 'Ribamar Fiquene' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2501', '10', 'Ribeirao Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2502', '10', 'Rocado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2503', '10', 'Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2504', '10', 'Rosario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2505', '10', 'Sambaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2506', '10', 'Santa Filomena do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2507', '10', 'Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2508', '10', 'Santa Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2509', '10', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2510', '10', 'Santa Luzia do Parua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2511', '10', 'Santa Quiteria do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2512', '10', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2513', '10', 'Santana do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2514', '10', 'Santo Amaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2515', '10', 'Santo Antonio dos Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2516', '10', 'Sao Benedito do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2517', '10', 'Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2518', '10', 'Sao Bernardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2519', '10', 'Sao Domingos do Azeitao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2520', '10', 'Sao Domingos do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2521', '10', 'Sao Felix de Balsas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2522', '10', 'Sao Francisco do Brejao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2523', '10', 'Sao Francisco do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2524', '10', 'Sao Joao Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2525', '10', 'Sao Joao de Cortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2526', '10', 'Sao Joao do Caru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2527', '10', 'Sao Joao do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2528', '10', 'Sao Joao do Soter' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2529', '10', 'Sao Joao dos Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2530', '10', 'Sao Joaquim dos Melos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2531', '10', 'Sao Jose de Ribamar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2532', '10', 'Sao Jose dos Basilios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2533', '10', 'Sao Luis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2534', '10', 'Sao Luis Gonzaga do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2535', '10', 'Sao Mateus do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2536', '10', 'Sao Pedro da Agua Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2537', '10', 'Sao Pedro dos Crentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2538', '10', 'Sao Raimundo das Mangabeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2539', '10', 'Sao Raimundo de Codo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2540', '10', 'Sao Raimundo do Doca Bezerra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2541', '10', 'Sao Roberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2542', '10', 'Sao Vicente Ferrer' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2543', '10', 'Satubinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2544', '10', 'Senador Alexandre Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2545', '10', 'Senador La Rocque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2546', '10', 'Serrano do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2547', '10', 'Sitio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2548', '10', 'Sucupira do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2549', '10', 'Sucupira do Riachao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2550', '10', 'Tasso Fragoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2551', '10', 'Timbiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2552', '10', 'Timon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2553', '10', 'Trizidela do Vale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2554', '10', 'Tufilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2555', '10', 'Tuntum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2556', '10', 'Turiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2557', '10', 'Turilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2558', '10', 'Tutoia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2559', '10', 'Urbano Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2560', '10', 'Vargem Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2561', '10', 'Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2562', '10', 'Vila Nova dos Martirios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2563', '10', 'Vitoria do Mearim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2564', '10', 'Vitorino Freire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2565', '10', 'Ze Doca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2566', '11', 'Abadia dos Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2567', '11', 'Abaete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2568', '11', 'Abaete dos Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2569', '11', 'Abaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2570', '11', 'Abre Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2571', '11', 'Abreus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2572', '11', 'Acaiaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2573', '11', 'Acucena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2574', '11', 'Acurui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2575', '11', 'Adao Colares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2576', '11', 'Agua Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2577', '11', 'Agua Branca de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2578', '11', 'Agua Comprida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2579', '11', 'Agua Viva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2580', '11', 'Aguanil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2581', '11', 'Aguas de Araxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2582', '11', 'Aguas de Contendas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2583', '11', 'Aguas Ferreas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2584', '11', 'Aguas Formosas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2585', '11', 'Aguas Vermelhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2586', '11', 'Aimores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2587', '11', 'Aiuruoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2588', '11', 'Alagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2589', '11', 'Albertina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2590', '11', 'Alberto Isaacson' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2591', '11', 'Albertos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2592', '11', 'Aldeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2593', '11', 'Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2594', '11', 'Alegria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2595', '11', 'Alem Paraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2596', '11', 'Alexandrita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2597', '11', 'Alfenas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2598', '11', 'Alfredo Vasconcelos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2599', '11', 'Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2600', '11', 'Almenara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2601', '11', 'Alpercata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2602', '11', 'Alpinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2603', '11', 'Alterosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2604', '11', 'Alto Caparao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2605', '11', 'Alto Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2606', '11', 'Alto de Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2607', '11', 'Alto Jequitiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2608', '11', 'Alto Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2609', '11', 'Alto Rio Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2610', '11', 'Altolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2611', '11', 'Alvacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2612', '11', 'Alvarenga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2613', '11', 'Alvinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2614', '11', 'Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2615', '11', 'Alvorada de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2616', '11', 'Amanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2617', '11', 'Amanhece' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2618', '11', 'Amarantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2619', '11', 'Amparo da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2620', '11', 'Andiroba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2621', '11', 'Andradas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2622', '11', 'Andrelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2623', '11', 'Andrequice' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2624', '11', 'Angaturama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2625', '11', 'Angelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2626', '11', 'Angicos de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2627', '11', 'Anguereta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2628', '11', 'Angustura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2629', '11', 'Antonio Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2630', '11', 'Antonio Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2631', '11', 'Antonio dos Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2632', '11', 'Antonio Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2633', '11', 'Antonio Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2634', '11', 'Antonio Prado de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2635', '11', 'Antunes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2636', '11', 'Aparecida de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2637', '11', 'Aracai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2638', '11', 'Aracati de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2639', '11', 'Aracitaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2640', '11', 'Aracuai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2641', '11', 'Araguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2642', '11', 'Aramirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2643', '11', 'Aranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2644', '11', 'Arantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2645', '11', 'Araponga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2646', '11', 'Arapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2647', '11', 'Arapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2648', '11', 'Araujos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2649', '11', 'Arauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2650', '11', 'Araxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2651', '11', 'Arcangelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2652', '11', 'Arceburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2653', '11', 'Arcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2654', '11', 'Areado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2655', '11', 'Argenita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2656', '11', 'Argirita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2657', '11', 'Aricanduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2658', '11', 'Arinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2659', '11', 'Aristides Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2660', '11', 'Ascencao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2661', '11', 'Assarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2662', '11', 'Astolfo Dutra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2663', '11', 'Ataleia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2664', '11', 'Augusto de Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2665', '11', 'Avai do Jacinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2666', '11', 'Azurita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2667', '11', 'Babilonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2668', '11', 'Bacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2669', '11', 'Baependi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2670', '11', 'Baguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2671', '11', 'Baioes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2672', '11', 'Baixa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2673', '11', 'Balbinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2674', '11', 'Baldim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2675', '11', 'Bambui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2676', '11', 'Bandeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2677', '11', 'Bandeira do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2678', '11', 'Bandeirantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2679', '11', 'Barao de Cocais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2680', '11', 'Barao de Monte Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2681', '11', 'Barbacena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2682', '11', 'Barra Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2683', '11', 'Barra da Figueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2684', '11', 'Barra do Ariranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2685', '11', 'Barra do Cuiete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2686', '11', 'Barra Feliz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2687', '11', 'Barra Longa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2688', '11', 'Barranco Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2689', '11', 'Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2690', '11', 'Barreiro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2691', '11', 'Barreiro da Raiz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2692', '11', 'Barreiro do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2693', '11', 'Barretos de Alvinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2694', '11', 'Barrocao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2695', '11', 'Barroso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2696', '11', 'Bau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2697', '11', 'Bela Vista de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2698', '11', 'Belisario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2699', '11', 'Belmiro Braga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2700', '11', 'Belo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2701', '11', 'Belo Oriente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2702', '11', 'Belo Vale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2703', '11', 'Bentopolis de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2704', '11', 'Berilo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2705', '11', 'Berizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2706', '11', 'Bertopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2707', '11', 'Betim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2708', '11', 'Bias Fortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2709', '11', 'Bicas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2710', '11', 'Bicuiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2711', '11', 'Biquinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2712', '11', 'Bituri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2713', '11', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2714', '11', 'Boa Familia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2715', '11', 'Boa Uniao de Itabirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2716', '11', 'Boa Vista de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2717', '11', 'Bocaina de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2718', '11', 'Bocaiuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2719', '11', 'Bom Despacho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2720', '11', 'Bom Jardim de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2721', '11', 'Bom Jesus da Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2722', '11', 'Bom Jesus da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2723', '11', 'Bom Jesus de Cardosos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2724', '11', 'Bom Jesus do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2725', '11', 'Bom Jesus do Divino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2726', '11', 'Bom Jesus do Galho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2727', '11', 'Bom Jesus do Madeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2728', '11', 'Bom Pastor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2729', '11', 'Bom Repouso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2730', '11', 'Bom Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2731', '11', 'Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2732', '11', 'Bom Sucesso de Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2733', '11', 'Bonanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2734', '11', 'Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2735', '11', 'Bonfinopolis de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2736', '11', 'Bonito de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2737', '11', 'Borba Gato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2738', '11', 'Borda da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2739', '11', 'Botelhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2740', '11', 'Botumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2741', '11', 'Bras Pires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2742', '11', 'Brasilandia de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2743', '11', 'Brasilia de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2744', '11', 'Brasopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2745', '11', 'Braunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2746', '11', 'Brejauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2747', '11', 'Brejaubinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2748', '11', 'Brejo Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2749', '11', 'Brejo do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2750', '11', 'Brumadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2751', '11', 'Brumal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2752', '11', 'Buarque de Macedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2753', '11', 'Bueno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2754', '11', 'Bueno Brandao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2755', '11', 'Buenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2756', '11', 'Bugre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2757', '11', 'Buritis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2758', '11', 'Buritizeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2759', '11', 'Caatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2760', '11', 'Cabeceira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2761', '11', 'Cabo Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2762', '11', 'Caburu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2763', '11', 'Cacaratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2764', '11', 'Cacarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2765', '11', 'Cachoeira Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2766', '11', 'Cachoeira da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2767', '11', 'Cachoeira de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2768', '11', 'Cachoeira de Pajeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2769', '11', 'Cachoeira de Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2770', '11', 'Cachoeira do Brumado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2771', '11', 'Cachoeira do Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2772', '11', 'Cachoeira do Manteiga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2773', '11', 'Cachoeira do Vale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2774', '11', 'Cachoeira dos Antunes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2775', '11', 'Cachoeira Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2776', '11', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2777', '11', 'Caetano Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2778', '11', 'Caetanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2779', '11', 'Caete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2780', '11', 'Caiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2781', '11', 'Caiapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2782', '11', 'Cajuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2783', '11', 'Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2784', '11', 'Calixto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2785', '11', 'Camacho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2786', '11', 'Camanducaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2787', '11', 'Camargos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2788', '11', 'Cambui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2789', '11', 'Cambuquira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2790', '11', 'Campanario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2791', '11', 'Campanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2792', '11', 'Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2793', '11', 'Campestrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2794', '11', 'Campina Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2795', '11', 'Campo Alegre de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2796', '11', 'Campo Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2797', '11', 'Campo Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2798', '11', 'Campo do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2799', '11', 'Campo Florido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2800', '11', 'Campo Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2801', '11', 'Campolide' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2802', '11', 'Campos Altos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2803', '11', 'Campos Gerais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2804', '11', 'Cana Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2805', '11', 'Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2806', '11', 'Canabrava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2807', '11', 'Canapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2808', '11', 'Canastrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2809', '11', 'Candeias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2810', '11', 'Canoeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2811', '11', 'Cantagalo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2812', '11', 'Caparao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2813', '11', 'Capela Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2814', '11', 'Capelinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2815', '11', 'Capetinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2816', '11', 'Capim Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2817', '11', 'Capinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2818', '11', 'Capitania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2819', '11', 'Capitao Andrade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2820', '11', 'Capitao Eneas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2821', '11', 'Capitolio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2822', '11', 'Caputira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2823', '11', 'Carai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2824', '11', 'Caranaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2825', '11', 'Carandai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2826', '11', 'Carangola' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2827', '11', 'Caratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2828', '11', 'Carbonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2829', '11', 'Cardeal Mota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2830', '11', 'Careacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2831', '11', 'Carioca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2832', '11', 'Carlos Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2833', '11', 'Carlos Chagas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2834', '11', 'Carmesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2835', '11', 'Carmo da Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2836', '11', 'Carmo da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2837', '11', 'Carmo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2838', '11', 'Carmo do Cajuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2839', '11', 'Carmo do Paranaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2840', '11', 'Carmo do Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2841', '11', 'Carmopolis de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2842', '11', 'Carneirinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2843', '11', 'Carrancas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2844', '11', 'Carvalho de Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2845', '11', 'Carvalhopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2846', '11', 'Carvalhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2847', '11', 'Casa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2848', '11', 'Cascalho Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2849', '11', 'Cassia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2850', '11', 'Cataguarino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2851', '11', 'Cataguases' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2852', '11', 'Catajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2853', '11', 'Catas Altas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2854', '11', 'Catas Altas da Noruega' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2855', '11', 'Catiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2856', '11', 'Catuji' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2857', '11', 'Catune' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2858', '11', 'Catuni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2859', '11', 'Catuti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2860', '11', 'Caxambu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2861', '11', 'Cedro do Abaete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2862', '11', 'Centenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2863', '11', 'Central de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2864', '11', 'Central de Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2865', '11', 'Centralina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2866', '11', 'Cervo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2867', '11', 'Chacara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2868', '11', 'Chale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2869', '11', 'Chapada de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2870', '11', 'Chapada do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2871', '11', 'Chapada Gaucha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2872', '11', 'Chaveslandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2873', '11', 'Chiador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2874', '11', 'Chonim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2875', '11', 'Chumbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2876', '11', 'Cipotanea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2877', '11', 'Cisneiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2878', '11', 'Citrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2879', '11', 'Claraval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2880', '11', 'Claro de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2881', '11', 'Claro dos Pocoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2882', '11', 'Claudio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2883', '11', 'Claudio Manuel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2884', '11', 'Cocais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2885', '11', 'Coco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2886', '11', 'Coimbra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2887', '11', 'Coluna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2888', '11', 'Comendador Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2889', '11', 'Comercinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2890', '11', 'Conceicao da Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2891', '11', 'Conceicao da Barra de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2892', '11', 'Conceicao da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2893', '11', 'Conceicao da Brejauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2894', '11', 'Conceicao da Ibitipoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2895', '11', 'Conceicao das Alagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2896', '11', 'Conceicao das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2897', '11', 'Conceicao de Ipanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2898', '11', 'Conceicao de Itagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2899', '11', 'Conceicao de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2900', '11', 'Conceicao de Piracicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2901', '11', 'Conceicao de Tronqueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2902', '11', 'Conceicao do Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2903', '11', 'Conceicao do Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2904', '11', 'Conceicao do Mato Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2905', '11', 'Conceicao do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2906', '11', 'Conceicao do Rio Acima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2907', '11', 'Conceicao do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2908', '11', 'Conceicao dos Ouros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2909', '11', 'Concordia de Mucuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2910', '11', 'Condado do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2911', '11', 'Conego Joao Pio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2912', '11', 'Conego Marinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2913', '11', 'Confins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2914', '11', 'Congonhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2915', '11', 'Congonhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2916', '11', 'Congonhas do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2917', '11', 'Conquista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2918', '11', 'Conselheiro Lafaiete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2919', '11', 'Conselheiro Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2920', '11', 'Conselheiro Pena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2921', '11', 'Consolacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2922', '11', 'Contagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2923', '11', 'Contrato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2924', '11', 'Contria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2925', '11', 'Coqueiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2926', '11', 'Coracao de Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2927', '11', 'Cordisburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2928', '11', 'Cordislandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2929', '11', 'Corinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2930', '11', 'Coroaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2931', '11', 'Coromandel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2932', '11', 'Coronel Fabriciano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2933', '11', 'Coronel Murta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2934', '11', 'Coronel Pacheco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2935', '11', 'Coronel Xavier Chaves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2936', '11', 'Corrego Danta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2937', '11', 'Corrego do Barro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2938', '11', 'Corrego do Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2939', '11', 'Corrego do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2940', '11', 'Corrego Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2941', '11', 'Corrego Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2942', '11', 'Corregos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2943', '11', 'Correia de Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2944', '11', 'Correntinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2945', '11', 'Costa Sena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2946', '11', 'Costas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2947', '11', 'Costas da Mantiqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2948', '11', 'Couto de Magalhaes de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2949', '11', 'Crisolia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2950', '11', 'Crisolita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2951', '11', 'Crispim Jaques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2952', '11', 'Cristais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2953', '11', 'Cristalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2954', '11', 'Cristiano Otoni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2955', '11', 'Cristina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2956', '11', 'Crucilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2957', '11', 'Cruzeiro da Fortaleza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2958', '11', 'Cruzeiro dos Peixotos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2959', '11', 'Cruzilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2960', '11', 'Cubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2961', '11', 'Cuite Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2962', '11', 'Cuparaque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2963', '11', 'Curimatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2964', '11', 'Curral de Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2965', '11', 'Curvelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2966', '11', 'Datas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2967', '11', 'Delfim Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2968', '11', 'Delfinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2969', '11', 'Delta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2970', '11', 'Deputado Augusto Clementino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2971', '11', 'Derribadinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2972', '11', 'Descoberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2973', '11', 'Desembargador Otoni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2974', '11', 'Desemboque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2975', '11', 'Desterro de Entre Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2976', '11', 'Desterro do Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2977', '11', 'Diamante de Uba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2978', '11', 'Diamantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2979', '11', 'Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2980', '11', 'Dias Tavares/siderurgica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2981', '11', 'Diogo de Vasconcelos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2982', '11', 'Dionisio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2983', '11', 'Divinesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2984', '11', 'Divino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2985', '11', 'Divino das Laranjeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2986', '11', 'Divino de Virgolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2987', '11', 'Divino Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2988', '11', 'Divinolandia de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2989', '11', 'Divinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2990', '11', 'Divisa Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2991', '11', 'Divisa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2992', '11', 'Divisopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2993', '11', 'Dois de Abril' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2994', '11', 'Dom Bosco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2995', '11', 'Dom Cavati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2996', '11', 'Dom Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2997', '11', 'Dom Lara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2998', '11', 'Dom Modesto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '2999', '11', 'Dom Silverio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3000', '11', 'Dom Vicoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3001', '11', 'Dona Euzebia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3002', '11', 'Dores da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3003', '11', 'Dores de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3004', '11', 'Dores de Guanhaes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3005', '11', 'Dores do Indaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3006', '11', 'Dores do Paraibuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3007', '11', 'Dores do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3008', '11', 'Doresopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3009', '11', 'Douradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3010', '11', 'Douradoquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3011', '11', 'Doutor Campolina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3012', '11', 'Doutor Lund' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3013', '11', 'Durande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3014', '11', 'Edgard Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3015', '11', 'Eloi Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3016', '11', 'Emboabas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3017', '11', 'Engenheiro Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3018', '11', 'Engenheiro Correia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3019', '11', 'Engenheiro Navarro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3020', '11', 'Engenheiro Schnoor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3021', '11', 'Engenho do Ribeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3022', '11', 'Engenho Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3023', '11', 'Entre Folhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3024', '11', 'Entre Rios de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3025', '11', 'Epaminondas Otoni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3026', '11', 'Ermidinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3027', '11', 'Ervalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3028', '11', 'Esmeraldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3029', '11', 'Esmeraldas de Ferros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3030', '11', 'Espera Feliz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3031', '11', 'Espinosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3032', '11', 'Espirito Santo do Dourado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3033', '11', 'Esteios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3034', '11', 'Estevao de Araujo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3035', '11', 'Estiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3036', '11', 'Estrela da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3037', '11', 'Estrela Dalva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3038', '11', 'Estrela de Jordania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3039', '11', 'Estrela do Indaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3040', '11', 'Estrela do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3041', '11', 'Eugenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3042', '11', 'Euxenita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3043', '11', 'Ewbank da Camara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3044', '11', 'Expedicionario Alicio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3045', '11', 'Extracao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3046', '11', 'Extrema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3047', '11', 'Fama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3048', '11', 'Faria Lemos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3049', '11', 'Farias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3050', '11', 'Fechados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3051', '11', 'Felicina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3052', '11', 'Felicio dos Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3053', '11', 'Felisburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3054', '11', 'Felixlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3055', '11', 'Fernandes Tourinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3056', '11', 'Fernao Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3057', '11', 'Ferreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3058', '11', 'Ferreiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3059', '11', 'Ferros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3060', '11', 'Ferruginha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3061', '11', 'Fervedouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3062', '11', 'Fidalgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3063', '11', 'Fidelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3064', '11', 'Flor de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3065', '11', 'Floralia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3066', '11', 'Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3067', '11', 'Florestal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3068', '11', 'Florestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3069', '11', 'Fonseca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3070', '11', 'Formiga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3071', '11', 'Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3072', '11', 'Fortaleza de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3073', '11', 'Fortuna de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3074', '11', 'Francisco Badaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3075', '11', 'Francisco Dumont' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3076', '11', 'Francisco Sa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3077', '11', 'Franciscopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3078', '11', 'Frei Eustaquio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3079', '11', 'Frei Gaspar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3080', '11', 'Frei Inocencio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3081', '11', 'Frei Lagonegro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3082', '11', 'Frei Orlando' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3083', '11', 'Frei Serafim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3084', '11', 'Freire Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3085', '11', 'Fronteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3086', '11', 'Fronteira dos Vales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3087', '11', 'Fruta de Leite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3088', '11', 'Frutal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3089', '11', 'Funchal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3090', '11', 'Funilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3091', '11', 'Furnas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3092', '11', 'Furquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3093', '11', 'Galego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3094', '11', 'Galena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3095', '11', 'Galileia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3096', '11', 'Gama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3097', '11', 'Gameleiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3098', '11', 'Garapuava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3099', '11', 'Gaviao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3100', '11', 'Glaucilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3101', '11', 'Glaura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3102', '11', 'Glucinio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3103', '11', 'Goiabeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3104', '11', 'Goiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3105', '11', 'Goianases' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3106', '11', 'Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3107', '11', 'Gonzaga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3108', '11', 'Gororos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3109', '11', 'Gorutuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3110', '11', 'Gouvea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3111', '11', 'Governador Valadares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3112', '11', 'Graminea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3113', '11', 'Granada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3114', '11', 'Grao Mogol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3115', '11', 'Grota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3116', '11', 'Grupiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3117', '11', 'Guacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3118', '11', 'Guaipava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3119', '11', 'Guanhaes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3120', '11', 'Guape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3121', '11', 'Guaraciaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3122', '11', 'Guaraciama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3123', '11', 'Guaranesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3124', '11', 'Guarani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3125', '11', 'Guaranilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3126', '11', 'Guarara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3127', '11', 'Guarataia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3128', '11', 'Guarda dos Ferreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3129', '11', 'Guarda-mor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3130', '11', 'Guardinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3131', '11', 'Guaxima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3132', '11', 'Guaxupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3133', '11', 'Guidoval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3134', '11', 'Guimarania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3135', '11', 'Guinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3136', '11', 'Guiricema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3137', '11', 'Gurinhata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3138', '11', 'Heliodora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3139', '11', 'Hematita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3140', '11', 'Hermilo Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3141', '11', 'Honoropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3142', '11', 'Iapu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3143', '11', 'Ibertioga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3144', '11', 'Ibia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3145', '11', 'Ibiai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3146', '11', 'Ibiracatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3147', '11', 'Ibiraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3148', '11', 'Ibirite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3149', '11', 'Ibitira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3150', '11', 'Ibitiura de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3151', '11', 'Ibituruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3152', '11', 'Icarai de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3153', '11', 'Igarape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3154', '11', 'Igaratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3155', '11', 'Iguatama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3156', '11', 'Ijaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3157', '11', 'Ilheus do Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3158', '11', 'Ilicinea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3159', '11', 'Imbe de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3160', '11', 'Inconfidentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3161', '11', 'Indaiabira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3162', '11', 'Independencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3163', '11', 'Indianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3164', '11', 'Ingai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3165', '11', 'Inhai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3166', '11', 'Inhapim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3167', '11', 'Inhauma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3168', '11', 'Inimutaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3169', '11', 'Ipaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3170', '11', 'Ipanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3171', '11', 'Ipatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3172', '11', 'Ipiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3173', '11', 'Ipoema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3174', '11', 'Ipuiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3175', '11', 'Irai de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3176', '11', 'Itabira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3177', '11', 'Itabirinha de Mantena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3178', '11', 'Itabirito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3179', '11', 'Itaboca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3180', '11', 'Itacambira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3181', '11', 'Itacarambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3182', '11', 'Itaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3183', '11', 'Itacolomi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3184', '11', 'Itaguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3185', '11', 'Itaim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3186', '11', 'Itaipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3187', '11', 'Itajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3188', '11', 'Itajutiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3189', '11', 'Itamarandiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3190', '11', 'Itamarati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3191', '11', 'Itamarati de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3192', '11', 'Itambacuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3193', '11', 'Itambe do Mato Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3194', '11', 'Itamirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3195', '11', 'Itamogi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3196', '11', 'Itamonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3197', '11', 'Itamuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3198', '11', 'Itanhandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3199', '11', 'Itanhomi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3200', '11', 'Itaobim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3201', '11', 'Itapagipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3202', '11', 'Itapanhoacanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3203', '11', 'Itapecerica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3204', '11', 'Itapeva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3205', '11', 'Itapiru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3206', '11', 'Itapirucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3207', '11', 'Itatiaiucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3208', '11', 'Itau de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3209', '11', 'Itauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3210', '11', 'Itauninha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3211', '11', 'Itaverava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3212', '11', 'Iterere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3213', '11', 'Itinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3214', '11', 'Itira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3215', '11', 'Itueta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3216', '11', 'Itui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3217', '11', 'Ituiutaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3218', '11', 'Itumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3219', '11', 'Iturama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3220', '11', 'Itutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3221', '11', 'Jaboticatubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3222', '11', 'Jacarandira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3223', '11', 'Jacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3224', '11', 'Jacinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3225', '11', 'Jacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3226', '11', 'Jacutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3227', '11', 'Jaguaracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3228', '11', 'Jaguarao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3229', '11', 'Jaguaritira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3230', '11', 'Jaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3231', '11', 'Jampruca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3232', '11', 'Janauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3233', '11', 'Januaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3234', '11', 'Japaraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3235', '11', 'Japonvar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3236', '11', 'Jardinesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3237', '11', 'Jeceaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3238', '11', 'Jenipapo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3239', '11', 'Jequeri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3240', '11', 'Jequitai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3241', '11', 'Jequitiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3242', '11', 'Jequitinhonha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3243', '11', 'Jesuania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3244', '11', 'Joaima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3245', '11', 'Joanesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3246', '11', 'Joao Monlevade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3247', '11', 'Joao Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3248', '11', 'Joaquim Felicio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3249', '11', 'Jordania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3250', '11', 'Jose Goncalves de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3251', '11', 'Jose Raydan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3252', '11', 'Joselandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3253', '11', 'Josenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3254', '11', 'Juatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3255', '11', 'Jubai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3256', '11', 'Juiracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3257', '11', 'Juiz de Fora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3258', '11', 'Junco de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3259', '11', 'Juramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3260', '11', 'Jureia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3261', '11', 'Juruaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3262', '11', 'Jurumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3263', '11', 'Justinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3264', '11', 'Juvenilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3265', '11', 'Lacerdinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3266', '11', 'Ladainha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3267', '11', 'Lagamar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3268', '11', 'Lagoa Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3269', '11', 'Lagoa da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3270', '11', 'Lagoa dos Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3271', '11', 'Lagoa Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3272', '11', 'Lagoa Formosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3273', '11', 'Lagoa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3274', '11', 'Lagoa Santa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3275', '11', 'Lajinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3276', '11', 'Lambari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3277', '11', 'Lamim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3278', '11', 'Lamounier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3279', '11', 'Lapinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3280', '11', 'Laranjal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3281', '11', 'Laranjeiras de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3282', '11', 'Lassance' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3283', '11', 'Lavras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3284', '11', 'Leandro Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3285', '11', 'Leme do Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3286', '11', 'Leopoldina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3287', '11', 'Levinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3288', '11', 'Liberdade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3289', '11', 'Lima Duarte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3290', '11', 'Limeira D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3291', '11', 'Limeira de Mantena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3292', '11', 'Lobo Leite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3293', '11', 'Lontra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3294', '11', 'Lourenco Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3295', '11', 'Lufa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3296', '11', 'Luisburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3297', '11', 'Luislandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3298', '11', 'Luiz Pires de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3299', '11', 'Luizlandia do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3300', '11', 'Luminarias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3301', '11', 'Luminosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3302', '11', 'Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3303', '11', 'Macaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3304', '11', 'Machacalis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3305', '11', 'Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3306', '11', 'Macuco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3307', '11', 'Macuco de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3308', '11', 'Madre de Deus de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3309', '11', 'Mae dos Homens' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3310', '11', 'Major Ezequiel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3311', '11', 'Major Porto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3312', '11', 'Malacacheta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3313', '11', 'Mamonas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3314', '11', 'Manga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3315', '11', 'Manhuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3316', '11', 'Manhumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3317', '11', 'Mantena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3318', '11', 'Mantiqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3319', '11', 'Mantiqueira do Palmital' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3320', '11', 'Mar de Espanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3321', '11', 'Marambainha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3322', '11', 'Maravilhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3323', '11', 'Maria da Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3324', '11', 'Mariana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3325', '11', 'Marilac' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3326', '11', 'Marilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3327', '11', 'Mario Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3328', '11', 'Maripa de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3329', '11', 'Marlieria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3330', '11', 'Marmelopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3331', '11', 'Martinesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3332', '11', 'Martinho Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3333', '11', 'Martins Guimaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3334', '11', 'Martins Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3335', '11', 'Mata Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3336', '11', 'Materlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3337', '11', 'Mateus Leme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3338', '11', 'Mathias Lobato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3339', '11', 'Matias Barbosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3340', '11', 'Matias Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3341', '11', 'Matipo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3342', '11', 'Mato Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3343', '11', 'Matozinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3344', '11', 'Matutina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3345', '11', 'Medeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3346', '11', 'Medina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3347', '11', 'Melo Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3348', '11', 'Mendanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3349', '11', 'Mendes Pimentel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3350', '11', 'Mendonca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3351', '11', 'Merces' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3352', '11', 'Merces de Agua Limpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3353', '11', 'Mesquita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3354', '11', 'Mestre Caetano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3355', '11', 'Miguel Burnier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3356', '11', 'Milagre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3357', '11', 'Milho Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3358', '11', 'Minas Novas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3359', '11', 'Minduri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3360', '11', 'Mirabela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3361', '11', 'Miradouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3362', '11', 'Miragaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3363', '11', 'Mirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3364', '11', 'Miralta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3365', '11', 'Mirantao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3366', '11', 'Miraporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3367', '11', 'Miravania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3368', '11', 'Missionario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3369', '11', 'Mocambeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3370', '11', 'Mocambinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3371', '11', 'Moeda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3372', '11', 'Moema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3373', '11', 'Monjolinho de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3374', '11', 'Monjolos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3375', '11', 'Monsenhor Horta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3376', '11', 'Monsenhor Isidro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3377', '11', 'Monsenhor Joao Alexandre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3378', '11', 'Monsenhor Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3379', '11', 'Montalvania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3380', '11', 'Monte Alegre de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3381', '11', 'Monte Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3382', '11', 'Monte Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3383', '11', 'Monte Carmelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3384', '11', 'Monte Celeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3385', '11', 'Monte Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3386', '11', 'Monte Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3387', '11', 'Monte Santo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3388', '11', 'Monte Siao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3389', '11', 'Monte Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3390', '11', 'Montes Claros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3391', '11', 'Montezuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3392', '11', 'Morada Nova de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3393', '11', 'Morro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3394', '11', 'Morro da Garca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3395', '11', 'Morro do Ferro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3396', '11', 'Morro do Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3397', '11', 'Morro Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3398', '11', 'Mucuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3399', '11', 'Mundo Novo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3400', '11', 'Munhoz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3401', '11', 'Muquem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3402', '11', 'Muriae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3403', '11', 'Mutum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3404', '11', 'Muzambinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3405', '11', 'Nacip Raydan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3406', '11', 'Nanuque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3407', '11', 'Naque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3408', '11', 'Naque-nanuque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3409', '11', 'Natalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3410', '11', 'Natercia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3411', '11', 'Nazare de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3412', '11', 'Nazareno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3413', '11', 'Nelson de Sena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3414', '11', 'Neolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3415', '11', 'Nepomuceno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3416', '11', 'Nhandutiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3417', '11', 'Nicolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3418', '11', 'Ninheira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3419', '11', 'Nova Belem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3420', '11', 'Nova Era' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3421', '11', 'Nova Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3422', '11', 'Nova Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3423', '11', 'Nova Minda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3424', '11', 'Nova Modica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3425', '11', 'Nova Ponte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3426', '11', 'Nova Porteirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3427', '11', 'Nova Resende' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3428', '11', 'Nova Serrana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3429', '11', 'Nova Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3430', '11', 'Novilhona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3431', '11', 'Novo Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3432', '11', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3433', '11', 'Novo Oriente de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3434', '11', 'Novorizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3435', '11', 'Ocidente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3436', '11', 'Olaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3437', '11', 'Olegario Maciel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3438', '11', 'Olhos D\'agua Do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3439', '11', 'Olhos-d\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3440', '11', 'Olimpio Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3441', '11', 'Olimpio Noronha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3442', '11', 'Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3443', '11', 'Oliveira Fortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3444', '11', 'Onca de Pitangui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3445', '11', 'Oratorios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3446', '11', 'Orizania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3447', '11', 'Ouro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3448', '11', 'Ouro Fino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3449', '11', 'Ouro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3450', '11', 'Ouro Verde de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3451', '11', 'Paciencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3452', '11', 'Padre Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3453', '11', 'Padre Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3454', '11', 'Padre Felisberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3455', '11', 'Padre Fialho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3456', '11', 'Padre Joao Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3457', '11', 'Padre Julio Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3458', '11', 'Padre Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3459', '11', 'Padre Pinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3460', '11', 'Padre Viegas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3461', '11', 'Pai Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3462', '11', 'Paineiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3463', '11', 'Pains' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3464', '11', 'Paiolinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3465', '11', 'Paiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3466', '11', 'Palma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3467', '11', 'Palmeiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3468', '11', 'Palmeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3469', '11', 'Palmital dos Carvalhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3470', '11', 'Palmopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3471', '11', 'Pantano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3472', '11', 'Papagaios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3473', '11', 'Para de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3474', '11', 'Paracatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3475', '11', 'Paraguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3476', '11', 'Paraguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3477', '11', 'Paraiso Garcia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3478', '11', 'Paraisopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3479', '11', 'Paraopeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3480', '11', 'Paredao de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3481', '11', 'Parque Durval de Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3482', '11', 'Parque Industrial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3483', '11', 'Passa Dez' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3484', '11', 'Passa Quatro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3485', '11', 'Passa Tempo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3486', '11', 'Passa Vinte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3487', '11', 'Passabem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3488', '11', 'Passagem de Mariana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3489', '11', 'Passos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3490', '11', 'Patis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3491', '11', 'Patos de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3492', '11', 'Patrimonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3493', '11', 'Patrocinio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3494', '11', 'Patrocinio do Muriae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3495', '11', 'Paula Candido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3496', '11', 'Paula Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3497', '11', 'Paulistas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3498', '11', 'Pavao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3499', '11', 'Pe do Morro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3500', '11', 'Pecanha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3501', '11', 'Pedra Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3502', '11', 'Pedra Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3503', '11', 'Pedra Corrida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3504', '11', 'Pedra do Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3505', '11', 'Pedra do Indaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3506', '11', 'Pedra do Sino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3507', '11', 'Pedra Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3508', '11', 'Pedra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3509', '11', 'Pedra Menina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3510', '11', 'Pedralva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3511', '11', 'Pedras de Maria da Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3512', '11', 'Pedrinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3513', '11', 'Pedro Leopoldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3514', '11', 'Pedro Lessa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3515', '11', 'Pedro Teixeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3516', '11', 'Pedro Versiani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3517', '11', 'Penedia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3518', '11', 'Penha de Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3519', '11', 'Penha do Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3520', '11', 'Penha do Cassiano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3521', '11', 'Penha do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3522', '11', 'Penha Longa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3523', '11', 'Pequeri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3524', '11', 'Pequi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3525', '11', 'Perdigao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3526', '11', 'Perdilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3527', '11', 'Perdizes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3528', '11', 'Perdoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3529', '11', 'Pereirinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3530', '11', 'Periquito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3531', '11', 'Perpetuo Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3532', '11', 'Pescador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3533', '11', 'Petunia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3534', '11', 'Piacatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3535', '11', 'Piao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3536', '11', 'Piau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3537', '11', 'Pic Sagarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3538', '11', 'Piedade de Caratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3539', '11', 'Piedade de Ponte Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3540', '11', 'Piedade do Paraopeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3541', '11', 'Piedade do Rio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3542', '11', 'Piedade dos Gerais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3543', '11', 'Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3544', '11', 'Pimenta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3545', '11', 'Pindaibas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3546', '11', 'Pingo-d\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3547', '11', 'Pinheirinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3548', '11', 'Pinheiros Altos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3549', '11', 'Pinhotiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3550', '11', 'Pintopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3551', '11', 'Pintos Negreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3552', '11', 'Piracaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3553', '11', 'Piracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3554', '11', 'Pirajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3555', '11', 'Piranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3556', '11', 'Pirangucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3557', '11', 'Piranguinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3558', '11', 'Piranguita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3559', '11', 'Pirapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3560', '11', 'Pirapetinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3561', '11', 'Pirapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3562', '11', 'Pirauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3563', '11', 'Pires E Albuquerque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3564', '11', 'Piscamba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3565', '11', 'Pitangui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3566', '11', 'Pitarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3567', '11', 'Piumhi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3568', '11', 'Planalto de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3569', '11', 'Planura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3570', '11', 'Plautino Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3571', '11', 'Poaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3572', '11', 'Poco Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3573', '11', 'Pocoes de Paineiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3574', '11', 'Pocos de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3575', '11', 'Pocrane' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3576', '11', 'Pompeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3577', '11', 'Poncianos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3578', '11', 'Pontalete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3579', '11', 'Ponte Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3580', '11', 'Ponte Alta de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3581', '11', 'Ponte dos Ciganos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3582', '11', 'Ponte Firme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3583', '11', 'Ponte Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3584', '11', 'Ponte Segura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3585', '11', 'Pontevila' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3586', '11', 'Ponto Chique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3587', '11', 'Ponto Chique do Martelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3588', '11', 'Ponto do Marambaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3589', '11', 'Ponto dos Volantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3590', '11', 'Porteirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3591', '11', 'Porto Agrario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3592', '11', 'Porto das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3593', '11', 'Porto dos Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3594', '11', 'Porto Firme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3595', '11', 'Pote' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3596', '11', 'Pouso Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3597', '11', 'Pouso Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3598', '11', 'Prados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3599', '11', 'Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3600', '11', 'Pratapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3601', '11', 'Pratinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3602', '11', 'Presidente Bernardes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3603', '11', 'Presidente Juscelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3604', '11', 'Presidente Kubitschek' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3605', '11', 'Presidente Olegario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3606', '11', 'Presidente Pena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3607', '11', 'Professor Sperber' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3608', '11', 'Providencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3609', '11', 'Prudente de Morais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3610', '11', 'Quartel de Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3611', '11', 'Quartel do Sacramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3612', '11', 'Quartel Geral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3613', '11', 'Quatituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3614', '11', 'Queixada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3615', '11', 'Queluzita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3616', '11', 'Quem-quem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3617', '11', 'Quilombo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3618', '11', 'Quintinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3619', '11', 'Raposos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3620', '11', 'Raul Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3621', '11', 'Ravena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3622', '11', 'Realeza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3623', '11', 'Recreio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3624', '11', 'Reduto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3625', '11', 'Resende Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3626', '11', 'Resplendor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3627', '11', 'Ressaquinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3628', '11', 'Riachinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3629', '11', 'Riacho da Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3630', '11', 'Riacho dos Machados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3631', '11', 'Ribeirao das Neves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3632', '11', 'Ribeirao de Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3633', '11', 'Ribeirao Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3634', '11', 'Ribeiro Junqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3635', '11', 'Ribeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3636', '11', 'Rio Acima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3637', '11', 'Rio Casca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3638', '11', 'Rio das Mortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3639', '11', 'Rio do Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3640', '11', 'Rio Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3641', '11', 'Rio Espera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3642', '11', 'Rio Manso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3643', '11', 'Rio Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3644', '11', 'Rio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3645', '11', 'Rio Paranaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3646', '11', 'Rio Pardo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3647', '11', 'Rio Piracicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3648', '11', 'Rio Pomba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3649', '11', 'Rio Pretinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3650', '11', 'Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3651', '11', 'Rio Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3652', '11', 'Ritapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3653', '11', 'Roca Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3654', '11', 'Rocas Novas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3655', '11', 'Rochedo de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3656', '11', 'Rodeador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3657', '11', 'Rodeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3658', '11', 'Rodrigo Silva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3659', '11', 'Romaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3660', '11', 'Rosario da Limeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3661', '11', 'Rosario de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3662', '11', 'Rosario do Pontal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3663', '11', 'Roseiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3664', '11', 'Rubelita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3665', '11', 'Rubim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3666', '11', 'Sabara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3667', '11', 'Sabinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3668', '11', 'Sacramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3669', '11', 'Salinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3670', '11', 'Salitre de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3671', '11', 'Salto da Divisa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3672', '11', 'Sanatorio Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3673', '11', 'Santa Barbara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3674', '11', 'Santa Barbara do Leste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3675', '11', 'Santa Barbara do Monte Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3676', '11', 'Santa Barbara do Tugurio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3677', '11', 'Santa Cruz da Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3678', '11', 'Santa Cruz de Botumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3679', '11', 'Santa Cruz de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3680', '11', 'Santa Cruz de Salinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3681', '11', 'Santa Cruz do Escalvado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3682', '11', 'Santa Cruz do Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3683', '11', 'Santa da Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3684', '11', 'Santa Efigenia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3685', '11', 'Santa Efigenia de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3686', '11', 'Santa Fe de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3687', '11', 'Santa Filomena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3688', '11', 'Santa Helena de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3689', '11', 'Santa Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3690', '11', 'Santa Juliana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3691', '11', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3692', '11', 'Santa Luzia da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3693', '11', 'Santa Margarida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3694', '11', 'Santa Maria de Itabira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3695', '11', 'Santa Maria do Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3696', '11', 'Santa Maria do Suacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3697', '11', 'Santa Rita da Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3698', '11', 'Santa Rita de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3699', '11', 'Santa Rita de Jacutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3700', '11', 'Santa Rita de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3701', '11', 'Santa Rita de Ouro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3702', '11', 'Santa Rita do Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3703', '11', 'Santa Rita do Ibitipoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3704', '11', 'Santa Rita do Itueto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3705', '11', 'Santa Rita do Rio do Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3706', '11', 'Santa Rita do Sapucai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3707', '11', 'Santa Rita Durao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3708', '11', 'Santa Rosa da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3709', '11', 'Santa Rosa de Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3710', '11', 'Santa Rosa dos Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3711', '11', 'Santa Teresa do Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3712', '11', 'Santa Terezinha de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3713', '11', 'Santa Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3714', '11', 'Santana da Vargem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3715', '11', 'Santana de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3716', '11', 'Santana de Cataguases' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3717', '11', 'Santana de Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3718', '11', 'Santana de Pirapama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3719', '11', 'Santana do Alfie' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3720', '11', 'Santana do Aracuai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3721', '11', 'Santana do Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3722', '11', 'Santana do Capivari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3723', '11', 'Santana do Deserto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3724', '11', 'Santana do Garambeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3725', '11', 'Santana do Jacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3726', '11', 'Santana do Manhuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3727', '11', 'Santana do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3728', '11', 'Santana do Paraopeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3729', '11', 'Santana do Riacho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3730', '11', 'Santana do Tabuleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3731', '11', 'Santana dos Montes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3732', '11', 'Santo Antonio da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3733', '11', 'Santo Antonio da Fortaleza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3734', '11', 'Santo Antonio da Vargem Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3735', '11', 'Santo Antonio do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3736', '11', 'Santo Antonio do Aventureiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3737', '11', 'Santo Antonio do Boqueirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3738', '11', 'Santo Antonio do Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3739', '11', 'Santo Antonio do Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3740', '11', 'Santo Antonio do Grama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3741', '11', 'Santo Antonio do Itambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3742', '11', 'Santo Antonio do Jacinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3743', '11', 'Santo Antonio do Leite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3744', '11', 'Santo Antonio do Manhuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3745', '11', 'Santo Antonio do Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3746', '11', 'Santo Antonio do Mucuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3747', '11', 'Santo Antonio do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3748', '11', 'Santo Antonio do Pirapetinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3749', '11', 'Santo Antonio do Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3750', '11', 'Santo Antonio do Rio Abaixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3751', '11', 'Santo Antonio dos Araujos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3752', '11', 'Santo Antonio dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3753', '11', 'Santo Hilario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3754', '11', 'Santo Hipolito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3755', '11', 'Santos Dumont' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3756', '11', 'Sao Bartolomeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3757', '11', 'Sao Benedito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3758', '11', 'Sao Bento Abade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3759', '11', 'Sao Bento de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3760', '11', 'Sao Bras do Suacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3761', '11', 'Sao Braz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3762', '11', 'Sao Candido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3763', '11', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3764', '11', 'Sao Domingos da Bocaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3765', '11', 'Sao Domingos das Dores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3766', '11', 'Sao Domingos do Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3767', '11', 'Sao Felix de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3768', '11', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3769', '11', 'Sao Francisco de Paula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3770', '11', 'Sao Francisco de Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3771', '11', 'Sao Francisco do Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3772', '11', 'Sao Francisco do Humaita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3773', '11', 'Sao Geraldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3774', '11', 'Sao Geraldo da Piedade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3775', '11', 'Sao Geraldo de Tumiritinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3776', '11', 'Sao Geraldo do Baguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3777', '11', 'Sao Geraldo do Baixio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3778', '11', 'Sao Goncalo de Botelhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3779', '11', 'Sao Goncalo do Abaete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3780', '11', 'Sao Goncalo do Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3781', '11', 'Sao Goncalo do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3782', '11', 'Sao Goncalo do Rio Abaixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3783', '11', 'Sao Goncalo do Rio das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3784', '11', 'Sao Goncalo do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3785', '11', 'Sao Goncalo do Sapucai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3786', '11', 'Sao Gotardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3787', '11', 'Sao Jeronimo dos Pocoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3788', '11', 'Sao Joao Batista do Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3789', '11', 'Sao Joao da Chapada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3790', '11', 'Sao Joao da Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3791', '11', 'Sao Joao da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3792', '11', 'Sao Joao da Ponte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3793', '11', 'Sao Joao da Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3794', '11', 'Sao Joao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3795', '11', 'Sao Joao da Serra Negra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3796', '11', 'Sao Joao da Vereda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3797', '11', 'Sao Joao das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3798', '11', 'Sao Joao Del Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3799', '11', 'Sao Joao do Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3800', '11', 'Sao Joao do Jacutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3801', '11', 'Sao Joao do Manhuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3802', '11', 'Sao Joao do Manteninha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3803', '11', 'Sao Joao do Oriente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3804', '11', 'Sao Joao do Pacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3805', '11', 'Sao Joao do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3806', '11', 'Sao Joao Evangelista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3807', '11', 'Sao Joao Nepomuceno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3808', '11', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3809', '11', 'Sao Joaquim de Bicas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3810', '11', 'Sao Jose da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3811', '11', 'Sao Jose da Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3812', '11', 'Sao Jose da Lapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3813', '11', 'Sao Jose da Pedra Menina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3814', '11', 'Sao Jose da Safira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3815', '11', 'Sao Jose da Varginha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3816', '11', 'Sao Jose das Tronqueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3817', '11', 'Sao Jose do Acacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3818', '11', 'Sao Jose do Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3819', '11', 'Sao Jose do Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3820', '11', 'Sao Jose do Batatal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3821', '11', 'Sao Jose do Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3822', '11', 'Sao Jose do Divino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3823', '11', 'Sao Jose do Goiabal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3824', '11', 'Sao Jose do Itueto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3825', '11', 'Sao Jose do Jacuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3826', '11', 'Sao Jose do Mantimento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3827', '11', 'Sao Jose do Mato Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3828', '11', 'Sao Jose do Pantano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3829', '11', 'Sao Jose do Paraopeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3830', '11', 'Sao Jose dos Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3831', '11', 'Sao Jose dos Salgados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3832', '11', 'Sao Lourenco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3833', '11', 'Sao Manoel do Guaiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3834', '11', 'Sao Mateus de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3835', '11', 'Sao Miguel do Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3836', '11', 'Sao Pedro da Garca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3837', '11', 'Sao Pedro da Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3838', '11', 'Sao Pedro das Tabocas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3839', '11', 'Sao Pedro de Caldas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3840', '11', 'Sao Pedro do Avai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3841', '11', 'Sao Pedro do Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3842', '11', 'Sao Pedro do Jequitinhonha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3843', '11', 'Sao Pedro do Suacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3844', '11', 'Sao Pedro dos Ferros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3845', '11', 'Sao Roberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3846', '11', 'Sao Romao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3847', '11', 'Sao Roque de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3848', '11', 'Sao Sebastiao da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3849', '11', 'Sao Sebastiao da Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3850', '11', 'Sao Sebastiao da Vala' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3851', '11', 'Sao Sebastiao da Vargem Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3852', '11', 'Sao Sebastiao da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3853', '11', 'Sao Sebastiao de Braunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3854', '11', 'Sao Sebastiao do Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3855', '11', 'Sao Sebastiao do Baixio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3856', '11', 'Sao Sebastiao do Barreado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3857', '11', 'Sao Sebastiao do Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3858', '11', 'Sao Sebastiao do Bonsucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3859', '11', 'Sao Sebastiao do Bugre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3860', '11', 'Sao Sebastiao do Gil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3861', '11', 'Sao Sebastiao do Maranhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3862', '11', 'Sao Sebastiao do Oculo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3863', '11', 'Sao Sebastiao do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3864', '11', 'Sao Sebastiao do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3865', '11', 'Sao Sebastiao do Pontal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3866', '11', 'Sao Sebastiao do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3867', '11', 'Sao Sebastiao do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3868', '11', 'Sao Sebastiao do Sacramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3869', '11', 'Sao Sebastiao do Soberbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3870', '11', 'Sao Sebastiao dos Pocoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3871', '11', 'Sao Sebastiao dos Robertos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3872', '11', 'Sao Sebastiao dos Torres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3873', '11', 'Sao Tiago' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3874', '11', 'Sao Tomas de Aquino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3875', '11', 'Sao Tome das Letras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3876', '11', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3877', '11', 'Sao Vicente da Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3878', '11', 'Sao Vicente de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3879', '11', 'Sao Vicente do Grama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3880', '11', 'Sao Vicente do Rio Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3881', '11', 'Sao Vitor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3882', '11', 'Sapucai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3883', '11', 'Sapucai-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3884', '11', 'Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3885', '11', 'Sapucaia de Guanhaes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3886', '11', 'Sapucaia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3887', '11', 'Sarandira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3888', '11', 'Sardoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3889', '11', 'Sarzedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3890', '11', 'Saudade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3891', '11', 'Sem Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3892', '11', 'Senador Amaral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3893', '11', 'Senador Cortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3894', '11', 'Senador Firmino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3895', '11', 'Senador Jose Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3896', '11', 'Senador Melo Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3897', '11', 'Senador Modestino Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3898', '11', 'Senador Mourao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3899', '11', 'Senhora da Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3900', '11', 'Senhora da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3901', '11', 'Senhora das Dores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3902', '11', 'Senhora de Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3903', '11', 'Senhora do Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3904', '11', 'Senhora do Porto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3905', '11', 'Senhora dos Remedios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3906', '11', 'Sereno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3907', '11', 'Sericita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3908', '11', 'Seritinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3909', '11', 'Serra Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3910', '11', 'Serra Azul de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3911', '11', 'Serra Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3912', '11', 'Serra da Canastra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3913', '11', 'Serra da Saudade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3914', '11', 'Serra das Araras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3915', '11', 'Serra do Camapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3916', '11', 'Serra do Salitre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3917', '11', 'Serra dos Aimores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3918', '11', 'Serra dos Lemes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3919', '11', 'Serra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3920', '11', 'Serrania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3921', '11', 'Serranopolis de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3922', '11', 'Serranos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3923', '11', 'Serro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3924', '11', 'Sertaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3925', '11', 'Sete Cachoeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3926', '11', 'Sete Lagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3927', '11', 'Setubinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3928', '11', 'Silva Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3929', '11', 'Silva Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3930', '11', 'Silvano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3931', '11', 'Silveira Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3932', '11', 'Silveirania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3933', '11', 'Silvestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3934', '11', 'Silvianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3935', '11', 'Simao Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3936', '11', 'Simao Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3937', '11', 'Simonesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3938', '11', 'Sobral Pinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3939', '11', 'Sobralia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3940', '11', 'Soledade de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3941', '11', 'Sopa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3942', '11', 'Tabajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3943', '11', 'Tabauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3944', '11', 'Tabuao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3945', '11', 'Tabuleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3946', '11', 'Taiobeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3947', '11', 'Taparuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3948', '11', 'Tapira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3949', '11', 'Tapirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3950', '11', 'Tapuirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3951', '11', 'Taquaracu de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3952', '11', 'Taruacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3953', '11', 'Tarumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3954', '11', 'Tebas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3955', '11', 'Teixeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3956', '11', 'Tejuco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3957', '11', 'Teofilo Otoni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3958', '11', 'Terra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3959', '11', 'Timoteo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3960', '11', 'Tiradentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3961', '11', 'Tiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3962', '11', 'Tobati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3963', '11', 'Tocandira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3964', '11', 'Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3965', '11', 'Tocos do Moji' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3966', '11', 'Toledo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3967', '11', 'Tomas Gonzaga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3968', '11', 'Tombos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3969', '11', 'Topazio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3970', '11', 'Torneiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3971', '11', 'Torreoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3972', '11', 'Tres Coracoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3973', '11', 'Tres Ilhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3974', '11', 'Tres Marias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3975', '11', 'Tres Pontas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3976', '11', 'Trimonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3977', '11', 'Tuiutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3978', '11', 'Tumiritinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3979', '11', 'Tupaciguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3980', '11', 'Tuparece' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3981', '11', 'Turmalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3982', '11', 'Turvolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3983', '11', 'Uba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3984', '11', 'Ubai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3985', '11', 'Ubaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3986', '11', 'Ubari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3987', '11', 'Uberaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3988', '11', 'Uberlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3989', '11', 'Umburatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3990', '11', 'Umbuzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3991', '11', 'Unai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3992', '11', 'Uniao de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3993', '11', 'Uruana de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3994', '11', 'Urucania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3995', '11', 'Urucuia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3996', '11', 'Usina Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3997', '11', 'Vai-volta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3998', '11', 'Valadares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '3999', '11', 'Valao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4000', '11', 'Vale Verde de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4001', '11', 'Valo Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4002', '11', 'Vargem Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4003', '11', 'Vargem Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4004', '11', 'Vargem Grande do Rio Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4005', '11', 'Vargem Linda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4006', '11', 'Varginha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4007', '11', 'Varjao de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4008', '11', 'Varzea da Palma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4009', '11', 'Varzelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4010', '11', 'Vau-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4011', '11', 'Vazante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4012', '11', 'Vera Cruz de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4013', '11', 'Verdelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4014', '11', 'Vereda do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4015', '11', 'Veredas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4016', '11', 'Veredinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4017', '11', 'Verissimo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4018', '11', 'Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4019', '11', 'Vermelho Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4020', '11', 'Vermelho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4021', '11', 'Vespasiano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4022', '11', 'Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4023', '11', 'Vieiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4024', '11', 'Vila Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4025', '11', 'Vila Costina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4026', '11', 'Vila Nova de Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4027', '11', 'Vila Nova dos Pocoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4028', '11', 'Vila Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4029', '11', 'Vilas Boas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4030', '11', 'Virgem da Lapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4031', '11', 'Virginia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4032', '11', 'Virginopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4033', '11', 'Virgolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4034', '11', 'Visconde do Rio Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4035', '11', 'Vista Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4036', '11', 'Vitorinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4037', '11', 'Volta Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4038', '11', 'Wenceslau Braz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4039', '11', 'Zelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4040', '11', 'Zito Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4041', '12', 'Agua Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4042', '12', 'Agua Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4043', '12', 'Albuquerque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4044', '12', 'Alcinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4045', '12', 'Alto Sucuriu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4046', '12', 'Amambai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4047', '12', 'Amandina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4048', '12', 'Amolar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4049', '12', 'Anastacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4050', '12', 'Anaurilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4051', '12', 'Angelica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4052', '12', 'Anhandui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4053', '12', 'Antonio Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4054', '12', 'Aparecida do Taboado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4055', '12', 'Aquidauana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4056', '12', 'Aral Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4057', '12', 'Arapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4058', '12', 'Areado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4059', '12', 'Arvore Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4060', '12', 'Baianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4061', '12', 'Balsamo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4062', '12', 'Bandeirantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4063', '12', 'Bataguassu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4064', '12', 'Bataipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4065', '12', 'Baus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4066', '12', 'Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4067', '12', 'Bocaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4068', '12', 'Bodoquena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4069', '12', 'Bom Fim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4070', '12', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4071', '12', 'Boqueirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4072', '12', 'Brasilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4073', '12', 'Caarapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4074', '12', 'Cabeceira do Apa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4075', '12', 'Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4076', '12', 'Camapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4077', '12', 'Camisao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4078', '12', 'Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4079', '12', 'Campo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4080', '12', 'Capao Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4081', '12', 'Caracol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4082', '12', 'Carumbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4083', '12', 'Cassilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4084', '12', 'Chapadao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4085', '12', 'Cipolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4086', '12', 'Coimbra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4087', '12', 'Congonha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4088', '12', 'Corguinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4089', '12', 'Coronel Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4090', '12', 'Corumba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4091', '12', 'Costa Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4092', '12', 'Coxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4093', '12', 'Cristalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4094', '12', 'Cruzaltina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4095', '12', 'Culturama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4096', '12', 'Cupins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4097', '12', 'Debrasa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4098', '12', 'Deodapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4099', '12', 'Dois Irmaos do Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4100', '12', 'Douradina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4101', '12', 'Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4102', '12', 'Eldorado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4103', '12', 'Fatima do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4104', '12', 'Figueirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4105', '12', 'Garcias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4106', '12', 'Gloria de Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4107', '12', 'Guacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4108', '12', 'Guaculandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4109', '12', 'Guadalupe do Alto Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4110', '12', 'Guia Lopes da Laguna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4111', '12', 'Iguatemi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4112', '12', 'Ilha Comprida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4113', '12', 'Ilha Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4114', '12', 'Indaia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4115', '12', 'Indaia Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4116', '12', 'Indapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4117', '12', 'Inocencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4118', '12', 'Ipezal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4119', '12', 'Itahum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4120', '12', 'Itapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4121', '12', 'Itaquirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4122', '12', 'Ivinhema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4123', '12', 'Jabuti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4124', '12', 'Jacarei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4125', '12', 'Japora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4126', '12', 'Jaraguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4127', '12', 'Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4128', '12', 'Jatei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4129', '12', 'Jauru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4130', '12', 'Juscelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4131', '12', 'Juti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4132', '12', 'Ladario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4133', '12', 'Lagoa Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4134', '12', 'Laguna Carapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4135', '12', 'Maracaju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4136', '12', 'Miranda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4137', '12', 'Montese' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4138', '12', 'Morangas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4139', '12', 'Morraria do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4140', '12', 'Morumbi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4141', '12', 'Mundo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4142', '12', 'Navirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4143', '12', 'Nhecolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4144', '12', 'Nioaque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4145', '12', 'Nossa Senhora de Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4146', '12', 'Nova Alvorada do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4147', '12', 'Nova America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4148', '12', 'Nova Andradina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4149', '12', 'Nova Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4150', '12', 'Nova Jales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4151', '12', 'Novo Horizonte do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4152', '12', 'Oriente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4153', '12', 'Paiaguas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4154', '12', 'Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4155', '12', 'Panambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4156', '12', 'Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4157', '12', 'Paranaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4158', '12', 'Paranhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4159', '12', 'Pedro Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4160', '12', 'Picadinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4161', '12', 'Pirapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4162', '12', 'Piraputanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4163', '12', 'Ponta Pora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4164', '12', 'Ponte Vermelha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4165', '12', 'Pontinha do Cocho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4166', '12', 'Porto Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4167', '12', 'Porto Murtinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4168', '12', 'Porto Vilma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4169', '12', 'Porto Xv de Novembro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4170', '12', 'Presidente Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4171', '12', 'Prudencio Thomaz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4172', '12', 'Quebra Coco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4173', '12', 'Quebracho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4174', '12', 'Ribas do Rio Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4175', '12', 'Rio Brilhante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4176', '12', 'Rio Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4177', '12', 'Rio Verde de Mato Grosso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4178', '12', 'Rochedinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4179', '12', 'Rochedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4180', '12', 'Sanga Puita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4181', '12', 'Santa Rita do Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4182', '12', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4183', '12', 'Sao Gabriel do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4184', '12', 'Sao Joao do Apore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4185', '12', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4186', '12', 'Sao Jose do Sucuriu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4187', '12', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4188', '12', 'Sao Romao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4189', '12', 'Selviria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4190', '12', 'Sete Quedas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4191', '12', 'Sidrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4192', '12', 'Sonora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4193', '12', 'Tacuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4194', '12', 'Tamandare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4195', '12', 'Taquari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4196', '12', 'Taquarussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4197', '12', 'Taunay' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4198', '12', 'Terenos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4199', '12', 'Tres Lagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4200', '12', 'Velhacaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4201', '12', 'Vicentina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4202', '12', 'Vila Formosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4203', '12', 'Vila Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4204', '12', 'Vila Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4205', '12', 'Vila Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4206', '12', 'Vila Vargas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4207', '12', 'Vista Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4208', '13', 'Acorizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4209', '13', 'Agua Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4210', '13', 'Agua Fria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4211', '13', 'Aguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4212', '13', 'Aguapei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4213', '13', 'Aguas Claras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4214', '13', 'Ainhumas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4215', '13', 'Alcantilado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4216', '13', 'Alta Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4217', '13', 'Alto Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4218', '13', 'Alto Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4219', '13', 'Alto Coite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4220', '13', 'Alto Garcas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4221', '13', 'Alto Juruena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4222', '13', 'Alto Paraguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4223', '13', 'Alto Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4224', '13', 'Alto Taquari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4225', '13', 'Analandia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4226', '13', 'Apiacas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4227', '13', 'Araguaiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4228', '13', 'Araguainha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4229', '13', 'Araputanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4230', '13', 'Arenapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4231', '13', 'Aripuana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4232', '13', 'Arruda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4233', '13', 'Assari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4234', '13', 'Barao de Melgaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4235', '13', 'Barra do Bugres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4236', '13', 'Barra do Garcas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4237', '13', 'Batovi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4238', '13', 'Baus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4239', '13', 'Bauxi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4240', '13', 'Bel Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4241', '13', 'Bezerro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4242', '13', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4243', '13', 'Boa Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4244', '13', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4245', '13', 'Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4246', '13', 'Brasnorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4247', '13', 'Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4248', '13', 'Caceres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4249', '13', 'Caite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4250', '13', 'Campinapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4251', '13', 'Campo Novo do Parecis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4252', '13', 'Campo Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4253', '13', 'Campos de Julio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4254', '13', 'Campos Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4255', '13', 'Canabrava do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4256', '13', 'Canarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4257', '13', 'Cangas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4258', '13', 'Capao Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4259', '13', 'Capao Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4260', '13', 'Caramujo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4261', '13', 'Caravagio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4262', '13', 'Carlinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4263', '13', 'Cassununga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4264', '13', 'Castanheira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4265', '13', 'Catuai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4266', '13', 'Chapada dos Guimaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4267', '13', 'Cidade Morena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4268', '13', 'Claudia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4269', '13', 'Cocalinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4270', '13', 'Colider' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4271', '13', 'Colorado do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4272', '13', 'Comodoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4273', '13', 'Confresa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4274', '13', 'Coronel Ponce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4275', '13', 'Cotrel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4276', '13', 'Cotriguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4277', '13', 'Coxipo Acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4278', '13', 'Coxipo da Ponte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4279', '13', 'Coxipo do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4280', '13', 'Cristinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4281', '13', 'Cristo Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4282', '13', 'Cuiaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4283', '13', 'Curvelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4284', '13', 'Del Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4285', '13', 'Denise' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4286', '13', 'Diamantino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4287', '13', 'Dom Aquino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4288', '13', 'Engenho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4289', '13', 'Engenho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4290', '13', 'Entre Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4291', '13', 'Estrela do Leste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4292', '13', 'Faval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4293', '13', 'Fazenda de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4294', '13', 'Feliz Natal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4295', '13', 'Figueiropolis D Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4296', '13', 'Filadelfia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4297', '13', 'Flor da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4298', '13', 'Fontanilhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4299', '13', 'Gaucha do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4300', '13', 'General Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4301', '13', 'Gloria D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4302', '13', 'Guaranta do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4303', '13', 'Guarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4304', '13', 'Guiratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4305', '13', 'Horizonte do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4306', '13', 'Indianapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4307', '13', 'Indiavai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4308', '13', 'Irenopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4309', '13', 'Itamarati Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4310', '13', 'Itauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4311', '13', 'Itiquira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4312', '13', 'Jaciara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4313', '13', 'Jangada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4314', '13', 'Jarudore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4315', '13', 'Jatoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4316', '13', 'Jauru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4317', '13', 'Joselandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4318', '13', 'Juara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4319', '13', 'Juina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4320', '13', 'Juruena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4321', '13', 'Juscimeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4322', '13', 'Lambari D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4323', '13', 'Lavouras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4324', '13', 'Lucas do Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4325', '13', 'Lucialva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4326', '13', 'Luciara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4327', '13', 'Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4328', '13', 'Marcelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4329', '13', 'Marzagao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4330', '13', 'Mata Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4331', '13', 'Matupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4332', '13', 'Mimoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4333', '13', 'Mirassol D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4334', '13', 'Nobres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4335', '13', 'Nonoai do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4336', '13', 'Nortelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4337', '13', 'Nossa Senhora da Guia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4338', '13', 'Nossa Senhora do Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4339', '13', 'Nova Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4340', '13', 'Nova Bandeirantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4341', '13', 'Nova Brasilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4342', '13', 'Nova Brasilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4343', '13', 'Nova Canaa do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4344', '13', 'Nova Catanduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4345', '13', 'Nova Galileia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4346', '13', 'Nova Guarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4347', '13', 'Nova Lacerda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4348', '13', 'Nova Marilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4349', '13', 'Nova Maringa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4350', '13', 'Nova Monte Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4351', '13', 'Nova Mutum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4352', '13', 'Nova Olimpia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4353', '13', 'Nova Ubirata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4354', '13', 'Nova Xavantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4355', '13', 'Novo Diamantino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4356', '13', 'Novo Eldorado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4357', '13', 'Novo Horizonte do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4358', '13', 'Novo Mundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4359', '13', 'Novo Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4360', '13', 'Novo Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4361', '13', 'Padronal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4362', '13', 'Pai Andre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4363', '13', 'Paraiso do Leste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4364', '13', 'Paranaita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4365', '13', 'Paranatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4366', '13', 'Passagem da Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4367', '13', 'Pedra Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4368', '13', 'Peixoto de Azevedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4369', '13', 'Pirizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4370', '13', 'Placa de Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4371', '13', 'Planalto da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4372', '13', 'Pocone' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4373', '13', 'Pombas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4374', '13', 'Pontal do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4375', '13', 'Ponte Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4376', '13', 'Ponte de Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4377', '13', 'Pontes E Lacerda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4378', '13', 'Pontinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4379', '13', 'Porto Alegre do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4380', '13', 'Porto dos Gauchos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4381', '13', 'Porto Esperidiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4382', '13', 'Porto Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4383', '13', 'Poxoreo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4384', '13', 'Praia Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4385', '13', 'Primavera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4386', '13', 'Primavera do Leste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4387', '13', 'Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4388', '13', 'Querencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4389', '13', 'Rancharia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4390', '13', 'Reserva do Cabacal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4391', '13', 'Ribeirao Cascalheira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4392', '13', 'Ribeirao dos Cocais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4393', '13', 'Ribeiraozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4394', '13', 'Rio Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4395', '13', 'Rio Manso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4396', '13', 'Riolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4397', '13', 'Rondonopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4398', '13', 'Rosario Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4399', '13', 'Salto do Ceu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4400', '13', 'Sangradouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4401', '13', 'Santa Carmem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4402', '13', 'Santa Elvira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4403', '13', 'Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4404', '13', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4405', '13', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4406', '13', 'Santaninha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4407', '13', 'Santo Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4408', '13', 'Santo Antonio do Leverger' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4409', '13', 'Santo Antonio do Rio Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4410', '13', 'Sao Cristovao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4411', '13', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4412', '13', 'Sao Felix do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4413', '13', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4414', '13', 'Sao Jorge' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4415', '13', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4416', '13', 'Sao Jose do Apui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4417', '13', 'Sao Jose do Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4418', '13', 'Sao Jose do Povo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4419', '13', 'Sao Jose do Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4420', '13', 'Sao Jose do Xingu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4421', '13', 'Sao Jose dos Quatro Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4422', '13', 'Sao Lourenco de Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4423', '13', 'Sao Pedro da Cipa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4424', '13', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4425', '13', 'Sapezal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4426', '13', 'Selma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4427', '13', 'Serra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4428', '13', 'Sinop' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4429', '13', 'Sonho Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4430', '13', 'Sorriso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4431', '13', 'Sumidouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4432', '13', 'Tabapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4433', '13', 'Tangara da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4434', '13', 'Tapirapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4435', '13', 'Tapurah' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4436', '13', 'Terra Nova do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4437', '13', 'Terra Roxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4438', '13', 'Tesouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4439', '13', 'Toricueyje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4440', '13', 'Torixoreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4441', '13', 'Tres Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4442', '13', 'Uniao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4443', '13', 'Vale dos Sonhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4444', '13', 'Vale Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4445', '13', 'Varginha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4446', '13', 'Varzea Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4447', '13', 'Vera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4448', '13', 'Vila Atlantica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4449', '13', 'Vila Bela da Santissima Trindade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4450', '13', 'Vila Bueno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4451', '13', 'Vila Mutum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4452', '13', 'Vila Operaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4453', '13', 'Vila Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4454', '13', 'Vila Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4455', '13', 'Vila Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4456', '13', 'Vila Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4457', '14', 'Abaetetuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4458', '14', 'Abel Figueiredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4459', '14', 'Acara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4460', '14', 'Afua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4461', '14', 'Agropolis Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4462', '14', 'Agua Azul do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4463', '14', 'Agua Fria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4464', '14', 'Alenquer' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4465', '14', 'Algodoal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4466', '14', 'Almeirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4467', '14', 'Almoco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4468', '14', 'Alta Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4469', '14', 'Altamira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4470', '14', 'Alter do Chao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4471', '14', 'Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4472', '14', 'Americano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4473', '14', 'Anajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4474', '14', 'Ananindeua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4475', '14', 'Anapu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4476', '14', 'Antonio Lemos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4477', '14', 'Apeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4478', '14', 'Apinages' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4479', '14', 'Arapixuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4480', '14', 'Araquaim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4481', '14', 'Arco-iris' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4482', '14', 'Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4483', '14', 'Arumanduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4484', '14', 'Aruri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4485', '14', 'Aturiai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4486', '14', 'Augusto Correa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4487', '14', 'Aurora do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4488', '14', 'Aveiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4489', '14', 'Bagre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4490', '14', 'Baiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4491', '14', 'Bannach' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4492', '14', 'Barcarena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4493', '14', 'Barreira Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4494', '14', 'Barreira dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4495', '14', 'Barreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4496', '14', 'Baturite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4497', '14', 'Beja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4498', '14', 'Bela Vista do Caracol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4499', '14', 'Belem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4500', '14', 'Belterra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4501', '14', 'Benevides' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4502', '14', 'Benfica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4503', '14', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4504', '14', 'Boa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4505', '14', 'Boa Sorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4506', '14', 'Boa Vista do Iririteua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4507', '14', 'Boim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4508', '14', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4509', '14', 'Bom Jesus do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4510', '14', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4511', '14', 'Braganca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4512', '14', 'Brasil Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4513', '14', 'Brasilia Legal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4514', '14', 'Brejo do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4515', '14', 'Brejo Grande do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4516', '14', 'Breu Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4517', '14', 'Breves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4518', '14', 'Bujaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4519', '14', 'Cachoeira de Piria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4520', '14', 'Cachoeira do Arari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4521', '14', 'Cafezal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4522', '14', 'Cairari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4523', '14', 'Caju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4524', '14', 'Camara do Marajo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4525', '14', 'Cambuquira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4526', '14', 'Cameta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4527', '14', 'Camiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4528', '14', 'Canaa dos Carajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4529', '14', 'Capanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4530', '14', 'Capitao Poco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4531', '14', 'Caracara do Arari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4532', '14', 'Carajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4533', '14', 'Carapajo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4534', '14', 'Caraparu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4535', '14', 'Caratateua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4536', '14', 'Caripi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4537', '14', 'Carrazedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4538', '14', 'Castanhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4539', '14', 'Castelo dos Sonhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4540', '14', 'Chaves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4541', '14', 'Colares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4542', '14', 'Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4543', '14', 'Conceicao do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4544', '14', 'Concordia do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4545', '14', 'Condeixa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4546', '14', 'Coqueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4547', '14', 'Cripurizao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4548', '14', 'Cripurizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4549', '14', 'Cuiu-cuiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4550', '14', 'Cumaru do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4551', '14', 'Curionopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4552', '14', 'Curralinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4553', '14', 'Curua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4554', '14', 'Curuai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4555', '14', 'Curuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4556', '14', 'Curucambaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4557', '14', 'Curumu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4558', '14', 'Dom Eliseu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4559', '14', 'Eldorado dos Carajas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4560', '14', 'Emborai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4561', '14', 'Espirito Santo do Taua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4562', '14', 'Faro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4563', '14', 'Fernandes Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4564', '14', 'Flexal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4565', '14', 'Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4566', '14', 'Floresta do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4567', '14', 'Garrafao do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4568', '14', 'Goianesia do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4569', '14', 'Gradaus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4570', '14', 'Guajara-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4571', '14', 'Guajara-miri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4572', '14', 'Gurupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4573', '14', 'Gurupizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4574', '14', 'Hidreletrica Tucurui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4575', '14', 'Iatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4576', '14', 'Icoraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4577', '14', 'Igarape da Lama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4578', '14', 'Igarape-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4579', '14', 'Igarape-miri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4580', '14', 'Inanu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4581', '14', 'Inhangapi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4582', '14', 'Ipixuna do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4583', '14', 'Irituia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4584', '14', 'Itaituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4585', '14', 'Itapixuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4586', '14', 'Itatupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4587', '14', 'Itupiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4588', '14', 'Jacareacanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4589', '14', 'Jacunda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4590', '14', 'Jaguarari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4591', '14', 'Jamanxinzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4592', '14', 'Jambuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4593', '14', 'Jandiai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4594', '14', 'Japerica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4595', '14', 'Joana Coeli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4596', '14', 'Joana Peres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4597', '14', 'Joanes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4598', '14', 'Juaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4599', '14', 'Jubim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4600', '14', 'Juruti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4601', '14', 'Km Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4602', '14', 'Km Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4603', '14', 'Lauro Sodre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4604', '14', 'Ligacao do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4605', '14', 'Limoeiro do Ajuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4606', '14', 'Mae do Rio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4607', '14', 'Magalhaes Barata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4608', '14', 'Maiauata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4609', '14', 'Manjeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4610', '14', 'Maraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4611', '14', 'Maracana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4612', '14', 'Marajoara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4613', '14', 'Marapanim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4614', '14', 'Marituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4615', '14', 'Maruda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4616', '14', 'Mata Geral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4617', '14', 'Matapiquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4618', '14', 'Medicilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4619', '14', 'Melgaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4620', '14', 'Menino Deus do Anapu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4621', '14', 'Meruu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4622', '14', 'Mirasselvas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4623', '14', 'Miritituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4624', '14', 'Mocajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4625', '14', 'Moiraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4626', '14', 'Moju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4627', '14', 'Monsaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4628', '14', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4629', '14', 'Monte Alegre do Mau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4630', '14', 'Monte Dourado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4631', '14', 'Morada Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4632', '14', 'Mosqueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4633', '14', 'Muana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4634', '14', 'Mujui dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4635', '14', 'Muraja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4636', '14', 'Murucupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4637', '14', 'Murumuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4638', '14', 'Muta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4639', '14', 'Mutucal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4640', '14', 'Nazare de Mocajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4641', '14', 'Nazare dos Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4642', '14', 'Nova Esperanca do Piria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4643', '14', 'Nova Ipixuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4644', '14', 'Nova Mocajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4645', '14', 'Nova Timboteua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4646', '14', 'Novo Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4647', '14', 'Novo Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4648', '14', 'Novo Repartimento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4649', '14', 'Nucleo Urbano Quilometro Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4650', '14', 'Obidos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4651', '14', 'Oeiras do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4652', '14', 'Oriximina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4653', '14', 'Osvaldilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4654', '14', 'Otelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4655', '14', 'Ourem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4656', '14', 'Ourilandia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4657', '14', 'Outeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4658', '14', 'Pacaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4659', '14', 'Pacoval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4660', '14', 'Palestina do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4661', '14', 'Paragominas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4662', '14', 'Paratins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4663', '14', 'Parauapebas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4664', '14', 'Pau D\'arco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4665', '14', 'Pedreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4666', '14', 'Peixe-boi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4667', '14', 'Penhalonga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4668', '14', 'Perseveranca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4669', '14', 'Pesqueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4670', '14', 'Piabas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4671', '14', 'Picarra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4672', '14', 'Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4673', '14', 'Piraquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4674', '14', 'Piria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4675', '14', 'Placas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4676', '14', 'Ponta de Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4677', '14', 'Ponta de Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4678', '14', 'Portel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4679', '14', 'Porto de Moz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4680', '14', 'Porto Salvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4681', '14', 'Porto Trombetas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4682', '14', 'Prainha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4683', '14', 'Primavera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4684', '14', 'Quatipuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4685', '14', 'Quatro Bocas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4686', '14', 'Redencao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4687', '14', 'Remansao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4688', '14', 'Repartimento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4689', '14', 'Rio Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4690', '14', 'Rio Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4691', '14', 'Riozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4692', '14', 'Rondon do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4693', '14', 'Ruropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4694', '14', 'Salinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4695', '14', 'Salvaterra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4696', '14', 'Santa Barbara do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4697', '14', 'Santa Cruz do Arari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4698', '14', 'Santa Isabel do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4699', '14', 'Santa Luzia do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4700', '14', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4701', '14', 'Santa Maria das Barreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4702', '14', 'Santa Maria do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4703', '14', 'Santa Rosa da Vigia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4704', '14', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4705', '14', 'Santana do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4706', '14', 'Santarem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4707', '14', 'Santarem Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4708', '14', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4709', '14', 'Santo Antonio do Taua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4710', '14', 'Sao Caetano de Odivelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4711', '14', 'Sao Domingos do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4712', '14', 'Sao Domingos do Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4713', '14', 'Sao Felix do Xingu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4714', '14', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4715', '14', 'Sao Francisco da Jararaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4716', '14', 'Sao Francisco do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4717', '14', 'Sao Geraldo do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4718', '14', 'Sao Joao da Ponta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4719', '14', 'Sao Joao de Pirabas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4720', '14', 'Sao Joao do Acangata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4721', '14', 'Sao Joao do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4722', '14', 'Sao Joao do Piria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4723', '14', 'Sao Joao dos Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4724', '14', 'Sao Joaquim do Tapara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4725', '14', 'Sao Jorge' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4726', '14', 'Sao Jose do Gurupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4727', '14', 'Sao Jose do Piria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4728', '14', 'Sao Luiz do Tapajos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4729', '14', 'Sao Miguel do Guama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4730', '14', 'Sao Miguel dos Macacos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4731', '14', 'Sao Pedro de Viseu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4732', '14', 'Sao Pedro do Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4733', '14', 'Sao Raimundo de Borralhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4734', '14', 'Sao Raimundo do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4735', '14', 'Sao Raimundo dos Furtados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4736', '14', 'Sao Roberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4737', '14', 'Sao Sebastiao da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4738', '14', 'Sao Sebastiao de Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4739', '14', 'Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4740', '14', 'Senador Jose Porfirio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4741', '14', 'Serra Pelada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4742', '14', 'Soure' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4743', '14', 'Tailandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4744', '14', 'Tatuteua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4745', '14', 'Tauari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4746', '14', 'Tauarizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4747', '14', 'Tentugal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4748', '14', 'Terra Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4749', '14', 'Terra Santa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4750', '14', 'Tijoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4751', '14', 'Timboteua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4752', '14', 'Tome-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4753', '14', 'Tracuateua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4754', '14', 'Trairao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4755', '14', 'Tucuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4756', '14', 'Tucurui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4757', '14', 'Ulianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4758', '14', 'Uruara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4759', '14', 'Urucuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4760', '14', 'Urucuriteua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4761', '14', 'Val-de-caes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4762', '14', 'Veiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4763', '14', 'Vigia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4764', '14', 'Vila do Carmo do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4765', '14', 'Vila dos Cabanos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4766', '14', 'Vila Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4767', '14', 'Vila Goreth' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4768', '14', 'Vila Isol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4769', '14', 'Vila Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4770', '14', 'Vila Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4771', '14', 'Vila Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4772', '14', 'Vila Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4773', '14', 'Vilarinho do Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4774', '14', 'Viseu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4775', '14', 'Vista Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4776', '14', 'Vista Alegre do Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4777', '14', 'Vitoria do Xingu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4778', '14', 'Xinguara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4779', '14', 'Xinguarinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4780', '15', 'Agua Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4781', '15', 'Aguiar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4782', '15', 'Alagoa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4783', '15', 'Alagoa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4784', '15', 'Alagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4785', '15', 'Alcantil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4786', '15', 'Algodao de Jandaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4787', '15', 'Alhandra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4788', '15', 'Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4789', '15', 'Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4790', '15', 'Aracagi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4791', '15', 'Arara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4792', '15', 'Araruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4793', '15', 'Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4794', '15', 'Areia de Baraunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4795', '15', 'Areial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4796', '15', 'Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4797', '15', 'Aroeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4798', '15', 'Assis Chateaubriand' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4799', '15', 'Assuncao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4800', '15', 'Baia da Traicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4801', '15', 'Balancos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4802', '15', 'Bananeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4803', '15', 'Barauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4804', '15', 'Barra de Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4805', '15', 'Barra de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4806', '15', 'Barra de Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4807', '15', 'Barra do Camaratuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4808', '15', 'Bayeux' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4809', '15', 'Belem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4810', '15', 'Belem do Brejo do Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4811', '15', 'Bernardino Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4812', '15', 'Boa Ventura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4813', '15', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4814', '15', 'Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4815', '15', 'Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4816', '15', 'Bonito de Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4817', '15', 'Boqueirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4818', '15', 'Borborema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4819', '15', 'Brejo do Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4820', '15', 'Brejo dos Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4821', '15', 'Caapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4822', '15', 'Cabaceiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4823', '15', 'Cabedelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4824', '15', 'Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4825', '15', 'Cachoeira dos Indios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4826', '15', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4827', '15', 'Cacimba de Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4828', '15', 'Cacimba de Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4829', '15', 'Cacimbas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4830', '15', 'Caicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4831', '15', 'Cajazeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4832', '15', 'Cajazeirinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4833', '15', 'Caldas Brandao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4834', '15', 'Camalau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4835', '15', 'Campina Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4836', '15', 'Campo Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4837', '15', 'Campo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4838', '15', 'Camurupim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4839', '15', 'Capim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4840', '15', 'Caraubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4841', '15', 'Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4842', '15', 'Carrapateira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4843', '15', 'Casinha do Homem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4844', '15', 'Casserengue' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4845', '15', 'Catingueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4846', '15', 'Catole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4847', '15', 'Catole do Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4848', '15', 'Caturite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4849', '15', 'Cepilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4850', '15', 'Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4851', '15', 'Condado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4852', '15', 'Conde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4853', '15', 'Congo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4854', '15', 'Coremas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4855', '15', 'Coronel Maia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4856', '15', 'Coxixola' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4857', '15', 'Cruz do Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4858', '15', 'Cubati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4859', '15', 'Cuite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4860', '15', 'Cuite de Mamanguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4861', '15', 'Cuitegi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4862', '15', 'Cupissura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4863', '15', 'Curral de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4864', '15', 'Curral Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4865', '15', 'Damiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4866', '15', 'Desterro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4867', '15', 'Diamante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4868', '15', 'Dona Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4869', '15', 'Duas Estradas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4870', '15', 'Emas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4871', '15', 'Engenheiro Avidos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4872', '15', 'Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4873', '15', 'Fagundes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4874', '15', 'Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4875', '15', 'Fazenda Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4876', '15', 'Forte Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4877', '15', 'Frei Martinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4878', '15', 'Gado Bravo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4879', '15', 'Galante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4880', '15', 'Guarabira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4881', '15', 'Guarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4882', '15', 'Gurinhem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4883', '15', 'Gurjao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4884', '15', 'Ibiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4885', '15', 'Igaracy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4886', '15', 'Imaculada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4887', '15', 'Inga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4888', '15', 'Itabaiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4889', '15', 'Itajubatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4890', '15', 'Itaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4891', '15', 'Itapororoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4892', '15', 'Itatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4893', '15', 'Jacarau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4894', '15', 'Jerico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4895', '15', 'Joao Pessoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4896', '15', 'Juarez Tavora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4897', '15', 'Juazeirinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4898', '15', 'Junco do Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4899', '15', 'Juripiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4900', '15', 'Juru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4901', '15', 'Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4902', '15', 'Lagoa de Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4903', '15', 'Lagoa Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4904', '15', 'Lastro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4905', '15', 'Lerolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4906', '15', 'Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4907', '15', 'Logradouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4908', '15', 'Lucena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4909', '15', 'Mae D\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4910', '15', 'Maia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4911', '15', 'Malta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4912', '15', 'Mamanguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4913', '15', 'Manaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4914', '15', 'Marcacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4915', '15', 'Mari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4916', '15', 'Marizopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4917', '15', 'Massaranduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4918', '15', 'Mata Limpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4919', '15', 'Mata Virgem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4920', '15', 'Mataraca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4921', '15', 'Matinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4922', '15', 'Mato Grosso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4923', '15', 'Matureia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4924', '15', 'Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4925', '15', 'Mogeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4926', '15', 'Montadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4927', '15', 'Monte Horebe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4928', '15', 'Monteiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4929', '15', 'Montevideo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4930', '15', 'Mulungu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4931', '15', 'Muquem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4932', '15', 'Natuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4933', '15', 'Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4934', '15', 'Nazarezinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4935', '15', 'Nossa Senhora do Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4936', '15', 'Nova Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4937', '15', 'Nova Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4938', '15', 'Nova Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4939', '15', 'Nucleo N Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4940', '15', 'Nucleo N Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4941', '15', 'Odilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4942', '15', 'Olho D\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4943', '15', 'Olivedos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4944', '15', 'Ouro Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4945', '15', 'Parari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4946', '15', 'Passagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4947', '15', 'Patos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4948', '15', 'Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4949', '15', 'Pedra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4950', '15', 'Pedra Lavrada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4951', '15', 'Pedras de Fogo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4952', '15', 'Pedro Regis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4953', '15', 'Pelo Sinal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4954', '15', 'Pereiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4955', '15', 'Pianco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4956', '15', 'Picui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4957', '15', 'Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4958', '15', 'Piloes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4959', '15', 'Piloezinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4960', '15', 'Pindurao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4961', '15', 'Pio X' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4962', '15', 'Piraua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4963', '15', 'Pirpirituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4964', '15', 'Pitanga de Estrada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4965', '15', 'Pitimbu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4966', '15', 'Pocinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4967', '15', 'Poco Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4968', '15', 'Poco de Jose de Moura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4969', '15', 'Pombal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4970', '15', 'Porteirinha de Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4971', '15', 'Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4972', '15', 'Princesa Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4973', '15', 'Puxinana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4974', '15', 'Queimadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4975', '15', 'Quixaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4976', '15', 'Remigio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4977', '15', 'Riachao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4978', '15', 'Riachao do Poco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4979', '15', 'Riacho de Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4980', '15', 'Riacho dos Cavalos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4981', '15', 'Ribeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4982', '15', 'Rio Tinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4983', '15', 'Rua Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4984', '15', 'Salema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4985', '15', 'Salgadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4986', '15', 'Salgado de Sao Felix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4987', '15', 'Santa Cecilia de Umbuzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4988', '15', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4989', '15', 'Santa Gertrudes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4990', '15', 'Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4991', '15', 'Santa Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4992', '15', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4993', '15', 'Santa Luzia do Cariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4994', '15', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4995', '15', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4996', '15', 'Santa Teresinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4997', '15', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4998', '15', 'Santana de Mangueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '4999', '15', 'Santana dos Garrotes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5000', '15', 'Santarem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5001', '15', 'Santo Andre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5002', '15', 'Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5003', '15', 'Sao Bento de Pombal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5004', '15', 'Sao Domingos de Pombal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5005', '15', 'Sao Domingos do Cariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5006', '15', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5007', '15', 'Sao Goncalo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5008', '15', 'Sao Joao Bosco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5009', '15', 'Sao Joao do Cariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5010', '15', 'Sao Joao do Rio do Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5011', '15', 'Sao Joao do Tigre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5012', '15', 'Sao Jose da Lagoa Tapada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5013', '15', 'Sao Jose da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5014', '15', 'Sao Jose de Caiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5015', '15', 'Sao Jose de Espinharas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5016', '15', 'Sao Jose de Marimbas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5017', '15', 'Sao Jose de Piranhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5018', '15', 'Sao Jose de Princesa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5019', '15', 'Sao Jose do Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5020', '15', 'Sao Jose do Brejo do Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5021', '15', 'Sao Jose do Sabugi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5022', '15', 'Sao Jose dos Cordeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5023', '15', 'Sao Jose dos Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5024', '15', 'Sao Mamede' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5025', '15', 'Sao Miguel de Taipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5026', '15', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5027', '15', 'Sao Sebastiao de Lagoa de Roca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5028', '15', 'Sao Sebastiao do Umbuzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5029', '15', 'Sape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5030', '15', 'Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5031', '15', 'Serido/sao Vicente do Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5032', '15', 'Serra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5033', '15', 'Serra da Raiz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5034', '15', 'Serra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5035', '15', 'Serra Redonda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5036', '15', 'Serraria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5037', '15', 'Sertaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5038', '15', 'Sobrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5039', '15', 'Solanea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5040', '15', 'Soledade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5041', '15', 'Sossego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5042', '15', 'Sousa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5043', '15', 'Sucuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5044', '15', 'Sume' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5045', '15', 'Tacima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5046', '15', 'Tambau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5047', '15', 'Tambauzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5048', '15', 'Taperoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5049', '15', 'Tavares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5050', '15', 'Teixeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5051', '15', 'Tenorio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5052', '15', 'Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5053', '15', 'Uirauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5054', '15', 'Umari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5055', '15', 'Umbuzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5056', '15', 'Varzea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5057', '15', 'Varzea Comprida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5058', '15', 'Varzea Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5059', '15', 'Vazante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5060', '15', 'Vieiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5061', '15', 'Vista Serrana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5062', '15', 'Zabele' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5063', '16', 'Abreu E Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5064', '16', 'Afogados da Ingazeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5065', '16', 'Afranio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5066', '16', 'Agrestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5067', '16', 'Agua Fria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5068', '16', 'Agua Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5069', '16', 'Aguas Belas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5070', '16', 'Airi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5071', '16', 'Alagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5072', '16', 'Albuquerque Ne' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5073', '16', 'Algodoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5074', '16', 'Alianca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5075', '16', 'Altinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5076', '16', 'Amaraji' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5077', '16', 'Ameixas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5078', '16', 'Angelim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5079', '16', 'Apoti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5080', '16', 'Aracoiaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5081', '16', 'Araripina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5082', '16', 'Arcoverde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5083', '16', 'Aripibu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5084', '16', 'Arizona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5085', '16', 'Barra de Farias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5086', '16', 'Barra de Guabiraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5087', '16', 'Barra de Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5088', '16', 'Barra do Brejo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5089', '16', 'Barra do Chata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5090', '16', 'Barra do Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5091', '16', 'Barra do Riachao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5092', '16', 'Barra do Sirinhaem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5093', '16', 'Barreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5094', '16', 'Batateira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5095', '16', 'Belem de Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5096', '16', 'Belem de Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5097', '16', 'Belo Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5098', '16', 'Bengalas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5099', '16', 'Bentivi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5100', '16', 'Bernardo Vieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5101', '16', 'Betania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5102', '16', 'Bezerros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5103', '16', 'Bizarra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5104', '16', 'Boas Novas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5105', '16', 'Bodoco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5106', '16', 'Bom Conselho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5107', '16', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5108', '16', 'Bom Nome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5109', '16', 'Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5110', '16', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5111', '16', 'Brejao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5112', '16', 'Brejinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5113', '16', 'Brejo da Madre de Deus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5114', '16', 'Buenos Aires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5115', '16', 'Buique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5116', '16', 'Cabanas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5117', '16', 'Cabo de Santo Agostinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5118', '16', 'Cabrobo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5119', '16', 'Cachoeira do Roberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5120', '16', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5121', '16', 'Caetes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5122', '16', 'Caicarinha da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5123', '16', 'Calcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5124', '16', 'Caldeiroes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5125', '16', 'Calumbi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5126', '16', 'Camaragibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5127', '16', 'Camela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5128', '16', 'Camocim de Sao Felix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5129', '16', 'Camutanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5130', '16', 'Canaa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5131', '16', 'Canhotinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5132', '16', 'Capoeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5133', '16', 'Caraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5134', '16', 'Caraibeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5135', '16', 'Carapotos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5136', '16', 'Carice' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5137', '16', 'Carima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5138', '16', 'Caririmirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5139', '16', 'Carnaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5140', '16', 'Carnaubeira da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5141', '16', 'Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5142', '16', 'Carpina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5143', '16', 'Carqueja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5144', '16', 'Caruaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5145', '16', 'Casinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5146', '16', 'Catende' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5147', '16', 'Catimbau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5148', '16', 'Catole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5149', '16', 'Cavaleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5150', '16', 'Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5151', '16', 'Cha de Alegria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5152', '16', 'Cha do Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5153', '16', 'Cha Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5154', '16', 'Cimbres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5155', '16', 'Clarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5156', '16', 'Cocau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5157', '16', 'Conceicao das Crioulas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5158', '16', 'Condado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5159', '16', 'Correntes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5160', '16', 'Cortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5161', '16', 'Couro D\'antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5162', '16', 'Cristalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5163', '16', 'Cruanji' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5164', '16', 'Cruzes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5165', '16', 'Cuiambuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5166', '16', 'Cumaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5167', '16', 'Cupira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5168', '16', 'Curral Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5169', '16', 'Custodia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5170', '16', 'Dois Leoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5171', '16', 'Dormentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5172', '16', 'Entroncamento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5173', '16', 'Escada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5174', '16', 'Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5175', '16', 'Exu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5176', '16', 'Fazenda Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5177', '16', 'Feira Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5178', '16', 'Feitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5179', '16', 'Fernando de Noronha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5180', '16', 'Ferreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5181', '16', 'Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5182', '16', 'Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5183', '16', 'Frei Miguelinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5184', '16', 'Frexeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5185', '16', 'Gameleira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5186', '16', 'Garanhuns' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5187', '16', 'Gloria do Goita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5188', '16', 'Goiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5189', '16', 'Goncalves Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5190', '16', 'Granito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5191', '16', 'Gravata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5192', '16', 'Gravata do Ibiapina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5193', '16', 'Grotao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5194', '16', 'Guanumbi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5195', '16', 'Henrique Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5196', '16', 'Iateca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5197', '16', 'Iati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5198', '16', 'Ibimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5199', '16', 'Ibirajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5200', '16', 'Ibiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5201', '16', 'Ibiratinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5202', '16', 'Ibitiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5203', '16', 'Ibo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5204', '16', 'Icaicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5205', '16', 'Igapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5206', '16', 'Igarapeassu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5207', '16', 'Igarapeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5208', '16', 'Igarassu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5209', '16', 'Iguaraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5210', '16', 'Inaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5211', '16', 'Ingazeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5212', '16', 'Ipojuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5213', '16', 'Ipubi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5214', '16', 'Ipuera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5215', '16', 'Iraguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5216', '16', 'Irajai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5217', '16', 'Iratama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5218', '16', 'Itacuruba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5219', '16', 'Itaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5220', '16', 'Itamaraca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5221', '16', 'Itambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5222', '16', 'Itapetim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5223', '16', 'Itapissuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5224', '16', 'Itaquitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5225', '16', 'Ituguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5226', '16', 'Iuitepora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5227', '16', 'Jabitaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5228', '16', 'Jaboatao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5229', '16', 'Jaboatao dos Guararapes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5230', '16', 'Japecanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5231', '16', 'Jaqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5232', '16', 'Jatauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5233', '16', 'Jatiuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5234', '16', 'Jatoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5235', '16', 'Jenipapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5236', '16', 'Joao Alfredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5237', '16', 'Joaquim Nabuco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5238', '16', 'Jose da Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5239', '16', 'Jose Mariano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5240', '16', 'Jucaral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5241', '16', 'Jucati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5242', '16', 'Jupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5243', '16', 'Jurema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5244', '16', 'Jutai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5245', '16', 'Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5246', '16', 'Lagoa de Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5247', '16', 'Lagoa do Barro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5248', '16', 'Lagoa do Carro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5249', '16', 'Lagoa do Itaenga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5250', '16', 'Lagoa do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5251', '16', 'Lagoa do Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5252', '16', 'Lagoa dos Gatos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5253', '16', 'Lagoa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5254', '16', 'Laje de Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5255', '16', 'Laje Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5256', '16', 'Lajedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5257', '16', 'Lajedo do Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5258', '16', 'Limoeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5259', '16', 'Livramento do Tiuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5260', '16', 'Luanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5261', '16', 'Macaparana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5262', '16', 'Machados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5263', '16', 'Macuje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5264', '16', 'Manari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5265', '16', 'Mandacaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5266', '16', 'Mandacaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5267', '16', 'Manicoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5268', '16', 'Maraial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5269', '16', 'Maravilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5270', '16', 'Mimoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5271', '16', 'Miracica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5272', '16', 'Mirandiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5273', '16', 'Morais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5274', '16', 'Moreilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5275', '16', 'Moreno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5276', '16', 'Moxoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5277', '16', 'Mulungu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5278', '16', 'Murupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5279', '16', 'Mutuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5280', '16', 'Nascente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5281', '16', 'Navarro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5282', '16', 'Nazare da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5283', '16', 'Negras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5284', '16', 'Nossa Senhora da Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5285', '16', 'Nossa Senhora do Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5286', '16', 'Nossa Senhora do O' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5287', '16', 'Nova Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5288', '16', 'Olho D\'agua De Dentro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5289', '16', 'Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5290', '16', 'Oratorio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5291', '16', 'Ori' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5292', '16', 'Orobo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5293', '16', 'Oroco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5294', '16', 'Ouricuri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5295', '16', 'Pajeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5296', '16', 'Palmares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5297', '16', 'Palmeirina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5298', '16', 'Panelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5299', '16', 'Pao de Acucar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5300', '16', 'Pao de Acucar do Pocao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5301', '16', 'Papagaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5302', '16', 'Paquevira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5303', '16', 'Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5304', '16', 'Paranatama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5305', '16', 'Paratibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5306', '16', 'Parnamirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5307', '16', 'Passagem do To' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5308', '16', 'Passira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5309', '16', 'Pau Ferro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5310', '16', 'Paudalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5311', '16', 'Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5312', '16', 'Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5313', '16', 'Perpetuo Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5314', '16', 'Pesqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5315', '16', 'Petrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5316', '16', 'Petrolina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5317', '16', 'Pirituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5318', '16', 'Pocao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5319', '16', 'Pocao de Afranio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5320', '16', 'Poco Comprido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5321', '16', 'Poco Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5322', '16', 'Pombos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5323', '16', 'Pontas de Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5324', '16', 'Ponte dos Carvalhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5325', '16', 'Praia da Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5326', '16', 'Primavera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5327', '16', 'Quipapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5328', '16', 'Quitimbu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5329', '16', 'Quixaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5330', '16', 'Rainha Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5331', '16', 'Rajada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5332', '16', 'Rancharia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5333', '16', 'Recife' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5334', '16', 'Riacho das Almas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5335', '16', 'Riacho do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5336', '16', 'Riacho Fechado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5337', '16', 'Riacho Pequeno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5338', '16', 'Ribeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5339', '16', 'Rio da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5340', '16', 'Rio Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5341', '16', 'Saire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5342', '16', 'Salgadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5343', '16', 'Salgueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5344', '16', 'Saloa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5345', '16', 'Salobro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5346', '16', 'Sanharo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5347', '16', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5348', '16', 'Santa Cruz da Baixa Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5349', '16', 'Santa Cruz do Capibaribe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5350', '16', 'Santa Filomena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5351', '16', 'Santa Maria da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5352', '16', 'Santa Maria do Cambuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5353', '16', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5354', '16', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5355', '16', 'Santana de Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5356', '16', 'Santo Agostinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5357', '16', 'Santo Antonio das Queimadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5358', '16', 'Santo Antonio dos Palmares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5359', '16', 'Sao Benedito do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5360', '16', 'Sao Bento do Una' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5361', '16', 'Sao Caetano do Navio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5362', '16', 'Sao Caitano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5363', '16', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5364', '16', 'Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5365', '16', 'Sao Joaquim do Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5366', '16', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5367', '16', 'Sao Jose da Coroa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5368', '16', 'Sao Jose do Belmonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5369', '16', 'Sao Jose do Egito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5370', '16', 'Sao Lazaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5371', '16', 'Sao Lourenco da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5372', '16', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5373', '16', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5374', '16', 'Sao Vicente Ferrer' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5375', '16', 'Sapucarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5376', '16', 'Saue' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5377', '16', 'Serra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5378', '16', 'Serra do Vento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5379', '16', 'Serra Talhada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5380', '16', 'Serrita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5381', '16', 'Serrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5382', '16', 'Sertania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5383', '16', 'Sertaozinho de Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5384', '16', 'Siriji' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5385', '16', 'Sirinhaem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5386', '16', 'Sitio dos Nunes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5387', '16', 'Solidao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5388', '16', 'Surubim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5389', '16', 'Tabira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5390', '16', 'Tabocas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5391', '16', 'Tacaimbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5392', '16', 'Tacaratu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5393', '16', 'Tamandare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5394', '16', 'Tamboata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5395', '16', 'Tapiraim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5396', '16', 'Taquaritinga do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5397', '16', 'Tara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5398', '16', 'Tauapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5399', '16', 'Tejucupapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5400', '16', 'Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5401', '16', 'Terra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5402', '16', 'Timbauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5403', '16', 'Timorante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5404', '16', 'Toritama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5405', '16', 'Tracunhaem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5406', '16', 'Trapia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5407', '16', 'Tres Ladeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5408', '16', 'Trindade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5409', '16', 'Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5410', '16', 'Tupanaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5411', '16', 'Tupanatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5412', '16', 'Tupaoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5413', '16', 'Tuparetama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5414', '16', 'Umas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5415', '16', 'Umburetama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5416', '16', 'Upatininga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5417', '16', 'Urimama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5418', '16', 'Urucu-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5419', '16', 'Urucuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5420', '16', 'Vasques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5421', '16', 'Veneza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5422', '16', 'Venturosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5423', '16', 'Verdejante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5424', '16', 'Vertente do Lerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5425', '16', 'Vertentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5426', '16', 'Vicencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5427', '16', 'Vila Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5428', '16', 'Viracao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5429', '16', 'Vitoria de Santo Antao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5430', '16', 'Volta do Moxoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5431', '16', 'Xexeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5432', '16', 'Xucuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5433', '16', 'Ze Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5434', '17', 'Acaua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5435', '17', 'Agricolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5436', '17', 'Agua Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5437', '17', 'Alagoinha do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5438', '17', 'Alegrete do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5439', '17', 'Alto Longa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5440', '17', 'Altos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5441', '17', 'Alvorada do Gurgueia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5442', '17', 'Amarante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5443', '17', 'Angical do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5444', '17', 'Anisio de Abreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5445', '17', 'Antonio Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5446', '17', 'Aroazes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5447', '17', 'Arraial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5448', '17', 'Assuncao do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5449', '17', 'Avelino Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5450', '17', 'Baixa Grande do Ribeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5451', '17', 'Barra D\'alcantara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5452', '17', 'Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5453', '17', 'Barreiras do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5454', '17', 'Barro Duro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5455', '17', 'Batalha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5456', '17', 'Bela Vista do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5457', '17', 'Belem do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5458', '17', 'Beneditinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5459', '17', 'Bertolinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5460', '17', 'Betania do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5461', '17', 'Boa Hora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5462', '17', 'Bocaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5463', '17', 'Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5464', '17', 'Bom Principio do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5465', '17', 'Bonfim do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5466', '17', 'Boqueirao do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5467', '17', 'Brasileira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5468', '17', 'Brejo do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5469', '17', 'Buriti dos Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5470', '17', 'Buriti dos Montes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5471', '17', 'Cabeceiras do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5472', '17', 'Cajazeiras do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5473', '17', 'Cajueiro da Praia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5474', '17', 'Caldeirao Grande do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5475', '17', 'Campinas do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5476', '17', 'Campo Alegre do Fidalgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5477', '17', 'Campo Grande do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5478', '17', 'Campo Largo do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5479', '17', 'Campo Maior' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5480', '17', 'Canavieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5481', '17', 'Canto do Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5482', '17', 'Capitao de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5483', '17', 'Capitao Gervasio Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5484', '17', 'Caracol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5485', '17', 'Caraubas do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5486', '17', 'Caridade do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5487', '17', 'Castelo do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5488', '17', 'Caxingo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5489', '17', 'Cocal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5490', '17', 'Cocal de Telha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5491', '17', 'Cocal dos Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5492', '17', 'Coivaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5493', '17', 'Colonia do Gurgueia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5494', '17', 'Colonia do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5495', '17', 'Conceicao do Caninde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5496', '17', 'Coronel Jose Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5497', '17', 'Corrente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5498', '17', 'Cristalandia do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5499', '17', 'Cristino Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5500', '17', 'Curimata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5501', '17', 'Currais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5502', '17', 'Curral Novo do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5503', '17', 'Curralinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5504', '17', 'Demerval Lobao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5505', '17', 'Dirceu Arcoverde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5506', '17', 'Dom Expedito Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5507', '17', 'Dom Inocencio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5508', '17', 'Domingos Mourao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5509', '17', 'Elesbao Veloso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5510', '17', 'Eliseu Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5511', '17', 'Esperantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5512', '17', 'Fartura do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5513', '17', 'Flores do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5514', '17', 'Floresta do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5515', '17', 'Floriano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5516', '17', 'Francinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5517', '17', 'Francisco Ayres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5518', '17', 'Francisco Macedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5519', '17', 'Francisco Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5520', '17', 'Fronteiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5521', '17', 'Geminiano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5522', '17', 'Gilbues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5523', '17', 'Guadalupe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5524', '17', 'Guaribas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5525', '17', 'Hugo Napoleao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5526', '17', 'Ilha Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5527', '17', 'Inhuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5528', '17', 'Ipiranga do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5529', '17', 'Isaias Coelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5530', '17', 'Itainopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5531', '17', 'Itaueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5532', '17', 'Jacobina do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5533', '17', 'Jaicos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5534', '17', 'Jardim do Mulato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5535', '17', 'Jatoba do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5536', '17', 'Jerumenha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5537', '17', 'Joao Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5538', '17', 'Joaquim Pires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5539', '17', 'Joca Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5540', '17', 'Jose de Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5541', '17', 'Juazeiro do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5542', '17', 'Julio Borges' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5543', '17', 'Jurema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5544', '17', 'Lagoa Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5545', '17', 'Lagoa de Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5546', '17', 'Lagoa do Barro do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5547', '17', 'Lagoa do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5548', '17', 'Lagoa do Sitio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5549', '17', 'Lagoinha do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5550', '17', 'Landri Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5551', '17', 'Luis Correia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5552', '17', 'Luzilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5553', '17', 'Madeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5554', '17', 'Manoel Emidio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5555', '17', 'Marcolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5556', '17', 'Marcos Parente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5557', '17', 'Massape do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5558', '17', 'Matias Olimpio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5559', '17', 'Miguel Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5560', '17', 'Miguel Leao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5561', '17', 'Milton Brandao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5562', '17', 'Monsenhor Gil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5563', '17', 'Monsenhor Hipolito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5564', '17', 'Monte Alegre do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5565', '17', 'Morro Cabeca No Tempo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5566', '17', 'Morro do Chapeu do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5567', '17', 'Murici dos Portelas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5568', '17', 'Nazare do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5569', '17', 'Nossa Senhora de Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5570', '17', 'Nossa Senhora dos Remedios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5571', '17', 'Nova Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5572', '17', 'Novo Nilo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5573', '17', 'Novo Oriente do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5574', '17', 'Novo Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5575', '17', 'Oeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5576', '17', 'Olho D\'agua Do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5577', '17', 'Padre Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5578', '17', 'Paes Landim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5579', '17', 'Pajeu do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5580', '17', 'Palmeira do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5581', '17', 'Palmeirais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5582', '17', 'Paqueta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5583', '17', 'Parnagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5584', '17', 'Parnaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5585', '17', 'Passagem Franca do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5586', '17', 'Patos do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5587', '17', 'Paulistana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5588', '17', 'Pavussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5589', '17', 'Pedro Ii' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5590', '17', 'Pedro Laurentino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5591', '17', 'Picos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5592', '17', 'Pimenteiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5593', '17', 'Pio Ix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5594', '17', 'Piracuruca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5595', '17', 'Piripiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5596', '17', 'Porto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5597', '17', 'Porto Alegre do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5598', '17', 'Prata do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5599', '17', 'Queimada Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5600', '17', 'Redencao do Gurgueia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5601', '17', 'Regeneracao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5602', '17', 'Riacho Frio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5603', '17', 'Ribeira do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5604', '17', 'Ribeiro Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5605', '17', 'Rio Grande do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5606', '17', 'Santa Cruz do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5607', '17', 'Santa Cruz dos Milagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5608', '17', 'Santa Filomena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5609', '17', 'Santa Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5610', '17', 'Santa Rosa do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5611', '17', 'Santana do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5612', '17', 'Santo Antonio de Lisboa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5613', '17', 'Santo Antonio dos Milagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5614', '17', 'Santo Inacio do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5615', '17', 'Sao Braz do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5616', '17', 'Sao Felix do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5617', '17', 'Sao Francisco de Assis do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5618', '17', 'Sao Francisco do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5619', '17', 'Sao Goncalo do Gurgueia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5620', '17', 'Sao Goncalo do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5621', '17', 'Sao Joao da Canabrava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5622', '17', 'Sao Joao da Fronteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5623', '17', 'Sao Joao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5624', '17', 'Sao Joao da Varjota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5625', '17', 'Sao Joao do Arraial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5626', '17', 'Sao Joao do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5627', '17', 'Sao Jose do Divino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5628', '17', 'Sao Jose do Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5629', '17', 'Sao Jose do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5630', '17', 'Sao Juliao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5631', '17', 'Sao Lourenco do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5632', '17', 'Sao Luis do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5633', '17', 'Sao Miguel da Baixa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5634', '17', 'Sao Miguel do Fidalgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5635', '17', 'Sao Miguel do Tapuio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5636', '17', 'Sao Pedro do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5637', '17', 'Sao Raimundo Nonato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5638', '17', 'Sebastiao Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5639', '17', 'Sebastiao Leal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5640', '17', 'Sigefredo Pacheco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5641', '17', 'Simoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5642', '17', 'Simplicio Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5643', '17', 'Socorro do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5644', '17', 'Sussuapara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5645', '17', 'Tamboril do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5646', '17', 'Tanque do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5647', '17', 'Teresina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5648', '17', 'Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5649', '17', 'Urucui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5650', '17', 'Valenca do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5651', '17', 'Varzea Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5652', '17', 'Varzea Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5653', '17', 'Vera Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5654', '17', 'Vila Nova do Piaui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5655', '17', 'Wall Ferraz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5656', '18', 'Abapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5657', '18', 'Abatia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5658', '18', 'Acampamento das Minas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5659', '18', 'Acungui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5660', '18', 'Adhemar de Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5661', '18', 'Adrianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5662', '18', 'Agostinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5663', '18', 'Agua Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5664', '18', 'Agua Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5665', '18', 'Agua Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5666', '18', 'Agua do Boi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5667', '18', 'Agua Mineral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5668', '18', 'Agua Vermelha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5669', '18', 'Agudos do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5670', '18', 'Alecrim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5671', '18', 'Alexandra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5672', '18', 'Almirante Tamandare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5673', '18', 'Altamira do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5674', '18', 'Altaneira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5675', '18', 'Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5676', '18', 'Alto Alegre do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5677', '18', 'Alto Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5678', '18', 'Alto do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5679', '18', 'Alto Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5680', '18', 'Alto Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5681', '18', 'Alto Piquiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5682', '18', 'Alto Pora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5683', '18', 'Alto Sabia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5684', '18', 'Alto Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5685', '18', 'Alto Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5686', '18', 'Altonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5687', '18', 'Alvorada do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5688', '18', 'Alvorada do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5689', '18', 'Amapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5690', '18', 'Amorinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5691', '18', 'Ampere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5692', '18', 'Anahy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5693', '18', 'Andira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5694', '18', 'Andorinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5695', '18', 'Angai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5696', '18', 'Angulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5697', '18', 'Antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5698', '18', 'Antonina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5699', '18', 'Antonio Brandao de Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5700', '18', 'Antonio Olinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5701', '18', 'Anunciacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5702', '18', 'Aparecida do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5703', '18', 'Apiaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5704', '18', 'Apucarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5705', '18', 'Aquidaban' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5706', '18', 'Aranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5707', '18', 'Arapongas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5708', '18', 'Arapoti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5709', '18', 'Arapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5710', '18', 'Arapuan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5711', '18', 'Ararapira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5712', '18', 'Araruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5713', '18', 'Araucaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5714', '18', 'Areia Branca dos Assis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5715', '18', 'Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5716', '18', 'Aricanduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5717', '18', 'Ariranha do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5718', '18', 'Aroeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5719', '18', 'Arquimedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5720', '18', 'Assai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5721', '18', 'Assis Chateaubriand' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5722', '18', 'Astorga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5723', '18', 'Atalaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5724', '18', 'Aurora do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5725', '18', 'Bairro Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5726', '18', 'Bairro do Felisberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5727', '18', 'Bairro Limoeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5728', '18', 'Balsa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5729', '18', 'Bandeirantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5730', '18', 'Bandeirantes D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5731', '18', 'Banhado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5732', '18', 'Barao de Lucena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5733', '18', 'Barbosa Ferraz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5734', '18', 'Barra Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5735', '18', 'Barra do Jacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5736', '18', 'Barra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5737', '18', 'Barra Mansa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5738', '18', 'Barra Santa Salete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5739', '18', 'Barracao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5740', '18', 'Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5741', '18', 'Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5742', '18', 'Barreiro das Frutas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5743', '18', 'Barreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5744', '18', 'Barrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5745', '18', 'Barro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5746', '18', 'Bateias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5747', '18', 'Baulandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5748', '18', 'Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5749', '18', 'Bela Vista do Caroba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5750', '18', 'Bela Vista do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5751', '18', 'Bela Vista do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5752', '18', 'Bela Vista do Piquiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5753', '18', 'Bela Vista do Tapiracui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5754', '18', 'Bentopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5755', '18', 'Bernardelli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5756', '18', 'Betaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5757', '18', 'Bituruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5758', '18', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5759', '18', 'Boa Esperanca do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5760', '18', 'Boa Ventura de Sao Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5761', '18', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5762', '18', 'Boa Vista da Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5763', '18', 'Bocaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5764', '18', 'Bocaiuva do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5765', '18', 'Bom Jardim do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5766', '18', 'Bom Jesus do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5767', '18', 'Bom Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5768', '18', 'Bom Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5769', '18', 'Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5770', '18', 'Bom Sucesso do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5771', '18', 'Borda do Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5772', '18', 'Borda do Campo de Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5773', '18', 'Borman' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5774', '18', 'Borrazopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5775', '18', 'Botuquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5776', '18', 'Bourbonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5777', '18', 'Braganey' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5778', '18', 'Bragantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5779', '18', 'Brasilandia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5780', '18', 'Bugre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5781', '18', 'Bulcao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5782', '18', 'Cabrito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5783', '18', 'Cacatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5784', '18', 'Cachoeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5785', '18', 'Cachoeira de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5786', '18', 'Cachoeira de Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5787', '18', 'Cachoeira do Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5788', '18', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5789', '18', 'Cadeadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5790', '18', 'Caetano Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5791', '18', 'Cafeara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5792', '18', 'Cafeeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5793', '18', 'Cafelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5794', '18', 'Cafezal do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5795', '18', 'Caita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5796', '18', 'Caixa Prego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5797', '18', 'California' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5798', '18', 'Calogeras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5799', '18', 'Cambara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5800', '18', 'Cambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5801', '18', 'Cambiju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5802', '18', 'Cambira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5803', '18', 'Campestrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5804', '18', 'Campina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5805', '18', 'Campina da Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5806', '18', 'Campina do Miranguava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5807', '18', 'Campina do Simao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5808', '18', 'Campina dos Furtados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5809', '18', 'Campina Grande do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5810', '18', 'Campinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5811', '18', 'Campo Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5812', '18', 'Campo do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5813', '18', 'Campo do Tenente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5814', '18', 'Campo Largo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5815', '18', 'Campo Largo da Roseira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5816', '18', 'Campo Magro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5817', '18', 'Campo Mourao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5818', '18', 'Candido de Abreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5819', '18', 'Candoi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5820', '18', 'Canela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5821', '18', 'Cantagalo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5822', '18', 'Canzianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5823', '18', 'Capanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5824', '18', 'Capao Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5825', '18', 'Capao Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5826', '18', 'Capao da Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5827', '18', 'Capao Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5828', '18', 'Capao Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5829', '18', 'Capitao Leonidas Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5830', '18', 'Capivara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5831', '18', 'Capoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5832', '18', 'Cara Pintado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5833', '18', 'Cara-cara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5834', '18', 'Caraja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5835', '18', 'Carambei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5836', '18', 'Caramuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5837', '18', 'Caratuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5838', '18', 'Carazinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5839', '18', 'Carbonera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5840', '18', 'Carlopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5841', '18', 'Casa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5842', '18', 'Cascatinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5843', '18', 'Cascavel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5844', '18', 'Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5845', '18', 'Catanduvas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5846', '18', 'Catanduvas do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5847', '18', 'Catarinenses' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5848', '18', 'Caxambu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5849', '18', 'Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5850', '18', 'Centenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5851', '18', 'Centenario do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5852', '18', 'Central Lupion' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5853', '18', 'Centralito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5854', '18', 'Centro Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5855', '18', 'Cerne' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5856', '18', 'Cerrado Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5857', '18', 'Cerro Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5858', '18', 'Cerro Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5859', '18', 'Ceu Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5860', '18', 'Chopinzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5861', '18', 'Cianorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5862', '18', 'Cidade Gaucha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5863', '18', 'Cintra Pimentel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5864', '18', 'Clevelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5865', '18', 'Coitinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5866', '18', 'Colombo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5867', '18', 'Colonia Acioli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5868', '18', 'Colonia Castelhanos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5869', '18', 'Colonia Castrolanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5870', '18', 'Colonia Centenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5871', '18', 'Colonia Cristina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5872', '18', 'Colonia Dom Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5873', '18', 'Colonia Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5874', '18', 'Colonia General Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5875', '18', 'Colonia Iapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5876', '18', 'Colonia Melissa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5877', '18', 'Colonia Murici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5878', '18', 'Colonia Padre Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5879', '18', 'Colonia Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5880', '18', 'Colonia Santos Andrade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5881', '18', 'Colonia Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5882', '18', 'Colonia Sapucai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5883', '18', 'Colonia Saude' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5884', '18', 'Colonia Tapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5885', '18', 'Colorado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5886', '18', 'Comur' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5887', '18', 'Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5888', '18', 'Conchas Velhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5889', '18', 'Conciolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5890', '18', 'Congonhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5891', '18', 'Congonhinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5892', '18', 'Conselheiro Mairinck' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5893', '18', 'Conselheiro Zacarias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5894', '18', 'Contenda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5895', '18', 'Copacabana do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5896', '18', 'Corbelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5897', '18', 'Cornelio Procopio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5898', '18', 'Coronel Domingos Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5899', '18', 'Coronel Firmino Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5900', '18', 'Coronel Vivida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5901', '18', 'Correia de Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5902', '18', 'Corumbatai do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5903', '18', 'Corvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5904', '18', 'Costeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5905', '18', 'Covo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5906', '18', 'Coxilha Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5907', '18', 'Cristo Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5908', '18', 'Cruz Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5909', '18', 'Cruzeiro do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5910', '18', 'Cruzeiro do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5911', '18', 'Cruzeiro do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5912', '18', 'Cruzeiro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5913', '18', 'Cruzmaltina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5914', '18', 'Cunhaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5915', '18', 'Curitiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5916', '18', 'Curiuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5917', '18', 'Curucaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5918', '18', 'Deputado Jose Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5919', '18', 'Despique' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5920', '18', 'Despraiado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5921', '18', 'Dez de Maio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5922', '18', 'Diamante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5923', '18', 'Diamante D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5924', '18', 'Diamante do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5925', '18', 'Diamante do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5926', '18', 'Doce Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5927', '18', 'Dois Irmaos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5928', '18', 'Dois Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5929', '18', 'Dois Vizinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5930', '18', 'Dom Rodrigo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5931', '18', 'Dorizon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5932', '18', 'Douradina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5933', '18', 'Doutor Antonio Paranhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5934', '18', 'Doutor Camargo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5935', '18', 'Doutor Ernesto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5936', '18', 'Doutor Oliveira Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5937', '18', 'Doutor Ulysses' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5938', '18', 'Eduardo Xavier da Silva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5939', '18', 'Emboguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5940', '18', 'Emboque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5941', '18', 'Encantado D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5942', '18', 'Encruzilhada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5943', '18', 'Eneas Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5944', '18', 'Engenheiro Beltrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5945', '18', 'Entre Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5946', '18', 'Entre Rios do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5947', '18', 'Esperanca do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5948', '18', 'Esperanca Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5949', '18', 'Espigao Alto do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5950', '18', 'Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5951', '18', 'Estacao General Lucio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5952', '18', 'Estacao Roca Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5953', '18', 'Europa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5954', '18', 'Euzebio de Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5955', '18', 'Faisqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5956', '18', 'Farol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5957', '18', 'Faxina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5958', '18', 'Faxinal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5959', '18', 'Faxinal do Ceu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5960', '18', 'Faxinal dos Elias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5961', '18', 'Faxinal Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5962', '18', 'Fazenda do Brigadeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5963', '18', 'Fazenda dos Barbosas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5964', '18', 'Fazenda Jangada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5965', '18', 'Fazenda Rio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5966', '18', 'Fazenda Salmo Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5967', '18', 'Fazendinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5968', '18', 'Felpudo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5969', '18', 'Fenix' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5970', '18', 'Fernandes Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5971', '18', 'Fernao Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5972', '18', 'Ferraria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5973', '18', 'Ferreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5974', '18', 'Figueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5975', '18', 'Figueira do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5976', '18', 'Fiusas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5977', '18', 'Flor da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5978', '18', 'Flor da Serra do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5979', '18', 'Florai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5980', '18', 'Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5981', '18', 'Florestopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5982', '18', 'Floriano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5983', '18', 'Florida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5984', '18', 'Floropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5985', '18', 'Fluviopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5986', '18', 'Formigone' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5987', '18', 'Formosa do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5988', '18', 'Foz do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5989', '18', 'Foz do Jordao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5990', '18', 'Francisco Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5991', '18', 'Francisco Beltrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5992', '18', 'Francisco Frederico Teixeira Guimaraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5993', '18', 'Frei Timoteo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5994', '18', 'Fueros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5995', '18', 'Fundao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5996', '18', 'Gamadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5997', '18', 'Gamela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5998', '18', 'Gaucha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '5999', '18', 'Gaviao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6000', '18', 'General Carneiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6001', '18', 'General Osorio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6002', '18', 'Geremia Lunardelli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6003', '18', 'Godoy Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6004', '18', 'Goioere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6005', '18', 'Goioxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6006', '18', 'Gois' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6007', '18', 'Goncalves Junior' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6008', '18', 'Graciosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6009', '18', 'Grandes Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6010', '18', 'Guaipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6011', '18', 'Guaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6012', '18', 'Guairaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6013', '18', 'Guajuvira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6014', '18', 'Guamiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6015', '18', 'Guamirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6016', '18', 'Guapirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6017', '18', 'Guapore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6018', '18', 'Guaporema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6019', '18', 'Guara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6020', '18', 'Guaraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6021', '18', 'Guaragi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6022', '18', 'Guaraituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6023', '18', 'Guarani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6024', '18', 'Guaraniacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6025', '18', 'Guarapuava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6026', '18', 'Guarapuavinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6027', '18', 'Guaraquecaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6028', '18', 'Guararema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6029', '18', 'Guaratuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6030', '18', 'Guarauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6031', '18', 'Guaravera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6032', '18', 'Guardamoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6033', '18', 'Harmonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6034', '18', 'Herculandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6035', '18', 'Herval Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6036', '18', 'Herveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6037', '18', 'Hidreletrica Itaipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6038', '18', 'Honorio Serpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6039', '18', 'Iarama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6040', '18', 'Ibaiti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6041', '18', 'Ibema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6042', '18', 'Ibiaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6043', '18', 'Ibipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6044', '18', 'Icara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6045', '18', 'Icaraima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6046', '18', 'Icatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6047', '18', 'Igrejinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6048', '18', 'Iguaracu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6049', '18', 'Iguatemi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6050', '18', 'Iguatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6051', '18', 'Iguipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6052', '18', 'Ilha do Mel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6053', '18', 'Ilha dos Valadares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6054', '18', 'Imbau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6055', '18', 'Imbauzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6056', '18', 'Imbituva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6057', '18', 'Inacio Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6058', '18', 'Inaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6059', '18', 'Independencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6060', '18', 'Indianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6061', '18', 'Inspetor Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6062', '18', 'Invernada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6063', '18', 'Invernadinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6064', '18', 'Iolopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6065', '18', 'Ipiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6066', '18', 'Ipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6067', '18', 'Iracema do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6068', '18', 'Irapuan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6069', '18', 'Irati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6070', '18', 'Irere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6071', '18', 'Iretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6072', '18', 'Itaguaje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6073', '18', 'Itaiacoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6074', '18', 'Itaipulandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6075', '18', 'Itambaraca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6076', '18', 'Itambe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6077', '18', 'Itapanhacanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6078', '18', 'Itapara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6079', '18', 'Itapejara D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6080', '18', 'Itaperucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6081', '18', 'Itaqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6082', '18', 'Itauna do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6083', '18', 'Itinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6084', '18', 'Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6085', '18', 'Ivailandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6086', '18', 'Ivaipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6087', '18', 'Ivaitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6088', '18', 'Ivate' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6089', '18', 'Ivatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6090', '18', 'Jaborandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6091', '18', 'Jaboti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6092', '18', 'Jaboticabal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6093', '18', 'Jaburu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6094', '18', 'Jacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6095', '18', 'Jacarezinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6096', '18', 'Jaciaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6097', '18', 'Jacutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6098', '18', 'Jaguapita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6099', '18', 'Jaguariaiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6100', '18', 'Jandaia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6101', '18', 'Jangada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6102', '18', 'Jangada do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6103', '18', 'Janiopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6104', '18', 'Japira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6105', '18', 'Japura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6106', '18', 'Jaracatia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6107', '18', 'Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6108', '18', 'Jardim Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6109', '18', 'Jardim Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6110', '18', 'Jardim Paredao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6111', '18', 'Jardim Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6112', '18', 'Jardinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6113', '18', 'Jataizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6114', '18', 'Javacae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6115', '18', 'Jesuitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6116', '18', 'Joa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6117', '18', 'Joaquim Tavora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6118', '18', 'Jordaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6119', '18', 'Jose Lacerda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6120', '18', 'Juciara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6121', '18', 'Jundiai do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6122', '18', 'Juranda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6123', '18', 'Jussara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6124', '18', 'Juvinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6125', '18', 'Kalore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6126', '18', 'Km Null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6127', '18', 'Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6128', '18', 'Lagoa Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6129', '18', 'Lagoa dos Ribas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6130', '18', 'Lagoa Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6131', '18', 'Lagoa Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6132', '18', 'Lagoa Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6133', '18', 'Lagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6134', '18', 'Lajeado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6135', '18', 'Lajeado Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6136', '18', 'Lajeado Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6137', '18', 'Lambari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6138', '18', 'Lapa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6139', '18', 'Laranja Azeda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6140', '18', 'Laranjal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6141', '18', 'Laranjeiras do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6142', '18', 'Lavra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6143', '18', 'Lavrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6144', '18', 'Leopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6145', '18', 'Lerroville' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6146', '18', 'Lidianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6147', '18', 'Lindoeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6148', '18', 'Linha Giacomini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6149', '18', 'Loanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6150', '18', 'Lobato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6151', '18', 'Londrina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6152', '18', 'Lopei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6153', '18', 'Lovat' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6154', '18', 'Luar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6155', '18', 'Luiziana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6156', '18', 'Lunardelli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6157', '18', 'Lupionopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6158', '18', 'Macaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6159', '18', 'Macucos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6160', '18', 'Maira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6161', '18', 'Maita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6162', '18', 'Mallet' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6163', '18', 'Malu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6164', '18', 'Mambore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6165', '18', 'Mandacaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6166', '18', 'Mandaguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6167', '18', 'Mandaguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6168', '18', 'Mandiocaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6169', '18', 'Mandirituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6170', '18', 'Manfrinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6171', '18', 'Mangueirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6172', '18', 'Manoel Ribas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6173', '18', 'Maraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6174', '18', 'Maracana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6175', '18', 'Marajo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6176', '18', 'Maravilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6177', '18', 'Marcelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6178', '18', 'Marcionopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6179', '18', 'Marechal Candido Rondon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6180', '18', 'Margarida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6181', '18', 'Maria Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6182', '18', 'Maria Luiza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6183', '18', 'Marialva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6184', '18', 'Mariental' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6185', '18', 'Marilandia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6186', '18', 'Marilena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6187', '18', 'Marilu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6188', '18', 'Mariluz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6189', '18', 'Marimbondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6190', '18', 'Maringa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6191', '18', 'Mariopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6192', '18', 'Maripa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6193', '18', 'Maristela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6194', '18', 'Mariza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6195', '18', 'Marmelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6196', '18', 'Marmeleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6197', '18', 'Marques de Abrantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6198', '18', 'Marquinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6199', '18', 'Marrecas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6200', '18', 'Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6201', '18', 'Marumbi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6202', '18', 'Matelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6203', '18', 'Matinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6204', '18', 'Mato Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6205', '18', 'Mato Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6206', '18', 'Maua da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6207', '18', 'Medianeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6208', '18', 'Meia-lua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6209', '18', 'Memoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6210', '18', 'Mendeslandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6211', '18', 'Mercedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6212', '18', 'Mirador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6213', '18', 'Miranda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6214', '18', 'Mirante do Piquiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6215', '18', 'Miraselva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6216', '18', 'Missal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6217', '18', 'Monjolinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6218', '18', 'Monte Real' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6219', '18', 'Moreira Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6220', '18', 'Morretes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6221', '18', 'Morro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6222', '18', 'Morro Ingles' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6223', '18', 'Munhoz de Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6224', '18', 'Natingui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6225', '18', 'Nilza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6226', '18', 'Nordestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6227', '18', 'Nossa Senhora Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6228', '18', 'Nossa Senhora da Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6229', '18', 'Nossa Senhora da Candelaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6230', '18', 'Nossa Senhora das Gracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6231', '18', 'Nossa Senhora de Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6232', '18', 'Nossa Senhora do Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6233', '18', 'Nova Alianca do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6234', '18', 'Nova Altamira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6235', '18', 'Nova America da Colina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6236', '18', 'Nova Amoreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6237', '18', 'Nova Aurora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6238', '18', 'Nova Bilac' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6239', '18', 'Nova Brasilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6240', '18', 'Nova Brasilia do Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6241', '18', 'Nova Cantu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6242', '18', 'Nova Concordia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6243', '18', 'Nova Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6244', '18', 'Nova Esperanca do Sudoeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6245', '18', 'Nova Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6246', '18', 'Nova Laranjeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6247', '18', 'Nova Londrina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6248', '18', 'Nova Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6249', '18', 'Nova Olimpia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6250', '18', 'Nova Prata do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6251', '18', 'Nova Riqueza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6252', '18', 'Nova Santa Barbara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6253', '18', 'Nova Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6254', '18', 'Nova Tebas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6255', '18', 'Nova Tirol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6256', '18', 'Nova Videira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6257', '18', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6258', '18', 'Novo Itacolomi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6259', '18', 'Novo Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6260', '18', 'Novo Sarandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6261', '18', 'Novo Sobradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6262', '18', 'Novo Tres Passos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6263', '18', 'Olaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6264', '18', 'Olho Agudo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6265', '18', 'Olho D\'agua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6266', '18', 'Oroite' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6267', '18', 'Ortigueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6268', '18', 'Ourilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6269', '18', 'Ourizona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6270', '18', 'Ouro Verde do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6271', '18', 'Ouro Verde do Piquiri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6272', '18', 'Padre Ponciano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6273', '18', 'Paicandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6274', '18', 'Paiol de Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6275', '18', 'Paiol Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6276', '18', 'Paiquere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6277', '18', 'Palmas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6278', '18', 'Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6279', '18', 'Palmeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6280', '18', 'Palmira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6281', '18', 'Palmital' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6282', '18', 'Palmital de Sao Silvestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6283', '18', 'Palmitopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6284', '18', 'Palotina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6285', '18', 'Panema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6286', '18', 'Pangare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6287', '18', 'Papagaios Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6288', '18', 'Paraiso do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6289', '18', 'Parana D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6290', '18', 'Paranacity' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6291', '18', 'Paranagi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6292', '18', 'Paranagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6293', '18', 'Paranapoema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6294', '18', 'Paranavai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6295', '18', 'Passa Una' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6296', '18', 'Passo da Ilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6297', '18', 'Passo dos Pupos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6298', '18', 'Passo Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6299', '18', 'Passo Liso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6300', '18', 'Pato Bragado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6301', '18', 'Pato Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6302', '18', 'Patos Velhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6303', '18', 'Pau D\'alho Do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6304', '18', 'Paula Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6305', '18', 'Paulistania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6306', '18', 'Paulo Frontin' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6307', '18', 'Peabiru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6308', '18', 'Pedra Branca do Araraquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6309', '18', 'Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6310', '18', 'Pedro Lustosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6311', '18', 'Pelado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6312', '18', 'Perobal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6313', '18', 'Perola' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6314', '18', 'Perola do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6315', '18', 'Perola Independente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6316', '18', 'Piassuguera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6317', '18', 'Pien' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6318', '18', 'Pinare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6319', '18', 'Pinhais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6320', '18', 'Pinhal do Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6321', '18', 'Pinhal Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6322', '18', 'Pinhalao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6323', '18', 'Pinhalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6324', '18', 'Pinhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6325', '18', 'Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6326', '18', 'Piquirivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6327', '18', 'Piracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6328', '18', 'Pirai do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6329', '18', 'Pirapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6330', '18', 'Piraquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6331', '18', 'Piriquitos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6332', '18', 'Pitanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6333', '18', 'Pitangueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6334', '18', 'Pitangui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6335', '18', 'Planaltina do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6336', '18', 'Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6337', '18', 'Pocinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6338', '18', 'Poema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6339', '18', 'Ponta do Pasto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6340', '18', 'Ponta Grossa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6341', '18', 'Pontal do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6342', '18', 'Porecatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6343', '18', 'Portao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6344', '18', 'Porteira Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6345', '18', 'Porto Amazonas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6346', '18', 'Porto Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6347', '18', 'Porto Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6348', '18', 'Porto Brasilio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6349', '18', 'Porto Camargo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6350', '18', 'Porto de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6351', '18', 'Porto Meira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6352', '18', 'Porto Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6353', '18', 'Porto Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6354', '18', 'Porto San Juan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6355', '18', 'Porto Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6356', '18', 'Porto Sao Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6357', '18', 'Porto Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6358', '18', 'Porto Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6359', '18', 'Prado Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6360', '18', 'Pranchita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6361', '18', 'Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6362', '18', 'Prata Um' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6363', '18', 'Presidente Castelo Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6364', '18', 'Presidente Kennedy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6365', '18', 'Primeiro de Maio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6366', '18', 'Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6367', '18', 'Prudentopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6368', '18', 'Pulinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6369', '18', 'Quatigua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6370', '18', 'Quatro Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6371', '18', 'Quatro Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6372', '18', 'Quebra Freio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6373', '18', 'Quedas do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6374', '18', 'Queimados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6375', '18', 'Querencia do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6376', '18', 'Quinta do Sol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6377', '18', 'Quinzopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6378', '18', 'Quitandinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6379', '18', 'Ramilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6380', '18', 'Rancho Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6381', '18', 'Rancho Alegre D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6382', '18', 'Realeza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6383', '18', 'Reboucas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6384', '18', 'Regiao dos Valos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6385', '18', 'Reianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6386', '18', 'Renascenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6387', '18', 'Reserva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6388', '18', 'Reserva do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6389', '18', 'Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6390', '18', 'Retiro Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6391', '18', 'Ribeirao Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6392', '18', 'Ribeirao Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6393', '18', 'Ribeirao do Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6394', '18', 'Ribeirao do Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6395', '18', 'Rio Abaixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6396', '18', 'Rio Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6397', '18', 'Rio Bom' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6398', '18', 'Rio Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6399', '18', 'Rio Bonito do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6400', '18', 'Rio Branco do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6401', '18', 'Rio Branco do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6402', '18', 'Rio Claro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6403', '18', 'Rio da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6404', '18', 'Rio das Antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6405', '18', 'Rio das Mortes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6406', '18', 'Rio das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6407', '18', 'Rio das Pombas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6408', '18', 'Rio do Mato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6409', '18', 'Rio do Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6410', '18', 'Rio Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6411', '18', 'Rio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6412', '18', 'Rio Pinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6413', '18', 'Rio Quatorze' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6414', '18', 'Rio Saltinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6415', '18', 'Rio Saudade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6416', '18', 'Rio Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6417', '18', 'Roberto Silveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6418', '18', 'Roca Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6419', '18', 'Rolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6420', '18', 'Romeopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6421', '18', 'Roncador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6422', '18', 'Rondinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6423', '18', 'Rondon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6424', '18', 'Rosario do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6425', '18', 'Sabaudia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6426', '18', 'Sagrada Familia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6427', '18', 'Salgado Filho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6428', '18', 'Salles de Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6429', '18', 'Saltinho do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6430', '18', 'Salto do Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6431', '18', 'Salto do Lontra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6432', '18', 'Salto Portao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6433', '18', 'Samambaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6434', '18', 'Santa Amelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6435', '18', 'Santa Cecilia do Pavao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6436', '18', 'Santa Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6437', '18', 'Santa Cruz de Monte Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6438', '18', 'Santa Eliza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6439', '18', 'Santa Esmeralda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6440', '18', 'Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6441', '18', 'Santa Fe do Pirapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6442', '18', 'Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6443', '18', 'Santa Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6444', '18', 'Santa Isabel do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6445', '18', 'Santa Izabel do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6446', '18', 'Santa Lucia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6447', '18', 'Santa Lurdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6448', '18', 'Santa Luzia da Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6449', '18', 'Santa Margarida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6450', '18', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6451', '18', 'Santa Maria do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6452', '18', 'Santa Maria do Rio do Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6453', '18', 'Santa Mariana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6454', '18', 'Santa Monica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6455', '18', 'Santa Quiteria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6456', '18', 'Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6457', '18', 'Santa Rita do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6458', '18', 'Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6459', '18', 'Santa Tereza do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6460', '18', 'Santa Terezinha de Itaipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6461', '18', 'Santa Zelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6462', '18', 'Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6463', '18', 'Santana do Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6464', '18', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6465', '18', 'Santo Antonio da Platina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6466', '18', 'Santo Antonio do Caiua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6467', '18', 'Santo Antonio do Iratim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6468', '18', 'Santo Antonio do Palmital' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6469', '18', 'Santo Antonio do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6470', '18', 'Santo Antonio do Sudoeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6471', '18', 'Santo Inacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6472', '18', 'Santo Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6473', '18', 'Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6474', '18', 'Sao Braz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6475', '18', 'Sao Camilo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6476', '18', 'Sao Carlos do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6477', '18', 'Sao Cirilo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6478', '18', 'Sao Clemente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6479', '18', 'Sao Cristovao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6480', '18', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6481', '18', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6482', '18', 'Sao Francisco de Imbau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6483', '18', 'Sao Francisco de Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6484', '18', 'Sao Gabriel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6485', '18', 'Sao Gotardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6486', '18', 'Sao Jeronimo da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6487', '18', 'Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6488', '18', 'Sao Joao D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6489', '18', 'Sao Joao da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6490', '18', 'Sao Joao do Caiua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6491', '18', 'Sao Joao do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6492', '18', 'Sao Joao do Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6493', '18', 'Sao Joao do Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6494', '18', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6495', '18', 'Sao Joaquim do Pontal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6496', '18', 'Sao Jorge D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6497', '18', 'Sao Jorge do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6498', '18', 'Sao Jorge do Patrocinio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6499', '18', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6500', '18', 'Sao Jose da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6501', '18', 'Sao Jose das Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6502', '18', 'Sao Jose do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6503', '18', 'Sao Jose do Itavo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6504', '18', 'Sao Jose do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6505', '18', 'Sao Jose dos Pinhais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6506', '18', 'Sao Judas Tadeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6507', '18', 'Sao Leonardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6508', '18', 'Sao Lourenco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6509', '18', 'Sao Luiz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6510', '18', 'Sao Luiz do Puruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6511', '18', 'Sao Manoel do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6512', '18', 'Sao Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6513', '18', 'Sao Martinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6514', '18', 'Sao Mateus do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6515', '18', 'Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6516', '18', 'Sao Miguel do Cambui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6517', '18', 'Sao Miguel do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6518', '18', 'Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6519', '18', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6520', '18', 'Sao Pedro do Florido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6521', '18', 'Sao Pedro do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6522', '18', 'Sao Pedro do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6523', '18', 'Sao Pedro do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6524', '18', 'Sao Pedro Lopei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6525', '18', 'Sao Pio X' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6526', '18', 'Sao Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6527', '18', 'Sao Roque do Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6528', '18', 'Sao Salvador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6529', '18', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6530', '18', 'Sao Sebastiao da Amoreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6531', '18', 'Sao Silvestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6532', '18', 'Sao Tome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6533', '18', 'Sao Valentim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6534', '18', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6535', '18', 'Sape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6536', '18', 'Sapopema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6537', '18', 'Sarandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6538', '18', 'Saudade do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6539', '18', 'Sede Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6540', '18', 'Sede Chaparral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6541', '18', 'Sede Nova Sant\'ana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6542', '18', 'Sede Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6543', '18', 'Selva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6544', '18', 'Senges' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6545', '18', 'Senhor Bom Jesus dos Gramados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6546', '18', 'Serra dos Dourados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6547', '18', 'Serra Negra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6548', '18', 'Serranopolis do Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6549', '18', 'Serraria Klas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6550', '18', 'Serrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6551', '18', 'Sertaneja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6552', '18', 'Sertanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6553', '18', 'Sertaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6554', '18', 'Sete Saltos de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6555', '18', 'Silvolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6556', '18', 'Siqueira Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6557', '18', 'Siqueira Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6558', '18', 'Socavao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6559', '18', 'Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6560', '18', 'Sulina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6561', '18', 'Sumare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6562', '18', 'Sussui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6563', '18', 'Sutis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6564', '18', 'Taipa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6565', '18', 'Tamarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6566', '18', 'Tambarutaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6567', '18', 'Tamboara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6568', '18', 'Tanque Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6569', '18', 'Tapejara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6570', '18', 'Tapira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6571', '18', 'Tapui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6572', '18', 'Taquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6573', '18', 'Taquari dos Polacos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6574', '18', 'Taquari dos Russos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6575', '18', 'Taquaruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6576', '18', 'Teixeira Soares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6577', '18', 'Telemaco Borba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6578', '18', 'Teolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6579', '18', 'Tereza Breda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6580', '18', 'Tereza Cristina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6581', '18', 'Terra Boa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6582', '18', 'Terra Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6583', '18', 'Terra Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6584', '18', 'Terra Roxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6585', '18', 'Tibagi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6586', '18', 'Tijucas do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6587', '18', 'Tijuco Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6588', '18', 'Timbu Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6589', '18', 'Tindiquera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6590', '18', 'Tiradentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6591', '18', 'Toledo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6592', '18', 'Tomaz Coelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6593', '18', 'Tomazina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6594', '18', 'Tranqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6595', '18', 'Tres Barras do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6596', '18', 'Tres Bicos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6597', '18', 'Tres Bocas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6598', '18', 'Tres Capoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6599', '18', 'Tres Corregos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6600', '18', 'Tres Lagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6601', '18', 'Tres Pinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6602', '18', 'Tres Placas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6603', '18', 'Triangulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6604', '18', 'Trindade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6605', '18', 'Triolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6606', '18', 'Tronco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6607', '18', 'Tunas do Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6608', '18', 'Tuneiras do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6609', '18', 'Tupassi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6610', '18', 'Tupinamba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6611', '18', 'Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6612', '18', 'Ubaldino Taques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6613', '18', 'Ubauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6614', '18', 'Ubirata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6615', '18', 'Umuarama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6616', '18', 'Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6617', '18', 'Uniao da Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6618', '18', 'Uniao do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6619', '18', 'Uniflor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6620', '18', 'Urai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6621', '18', 'Usina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6622', '18', 'Uvaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6623', '18', 'Valentins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6624', '18', 'Valerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6625', '18', 'Vargeado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6626', '18', 'Vassoural' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6627', '18', 'Ventania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6628', '18', 'Vera Cruz do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6629', '18', 'Vera Guarani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6630', '18', 'Vere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6631', '18', 'Vida Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6632', '18', 'Vidigal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6633', '18', 'Vila Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6634', '18', 'Vila Diniz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6635', '18', 'Vila dos Roldos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6636', '18', 'Vila Florida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6637', '18', 'Vila Gandhi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6638', '18', 'Vila Guay' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6639', '18', 'Vila Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6640', '18', 'Vila Nova de Florenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6641', '18', 'Vila Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6642', '18', 'Vila Reis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6643', '18', 'Vila Rica do Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6644', '18', 'Vila Roberto Brzezinski' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6645', '18', 'Vila Silva Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6646', '18', 'Vila Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6647', '18', 'Virmond' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6648', '18', 'Vista Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6649', '18', 'Vista Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6650', '18', 'Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6651', '18', 'Vitorino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6652', '18', 'Warta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6653', '18', 'Wenceslau Braz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6654', '18', 'Xambre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6655', '18', 'Xaxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6656', '18', 'Yolanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6657', '19', 'Abarracamento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6658', '19', 'Abraao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6659', '19', 'Afonso Arinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6660', '19', 'Agulhas Negras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6661', '19', 'Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6662', '19', 'Andrade Pinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6663', '19', 'Angra dos Reis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6664', '19', 'Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6665', '19', 'Aperibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6666', '19', 'Araruama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6667', '19', 'Areal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6668', '19', 'Armacao de Buzios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6669', '19', 'Arraial do Cabo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6670', '19', 'Arrozal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6671', '19', 'Avelar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6672', '19', 'Bacaxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6673', '19', 'Baltazar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6674', '19', 'Banquete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6675', '19', 'Barao de Juparana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6676', '19', 'Barcelos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6677', '19', 'Barra Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6678', '19', 'Barra de Macae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6679', '19', 'Barra de Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6680', '19', 'Barra do Pirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6681', '19', 'Barra Mansa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6682', '19', 'Barra Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6683', '19', 'Belford Roxo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6684', '19', 'Bemposta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6685', '19', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6686', '19', 'Boa Sorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6687', '19', 'Boa Ventura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6688', '19', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6689', '19', 'Bom Jesus do Itabapoana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6690', '19', 'Bom Jesus do Querendo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6691', '19', 'Cabo Frio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6692', '19', 'Cabucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6693', '19', 'Cachoeiras de Macacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6694', '19', 'Cachoeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6695', '19', 'Calheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6696', '19', 'Cambiasca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6697', '19', 'Cambuci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6698', '19', 'Campo do Coelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6699', '19', 'Campos dos Goytacazes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6700', '19', 'Campos Elyseos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6701', '19', 'Cantagalo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6702', '19', 'Carabucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6703', '19', 'Carapebus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6704', '19', 'Cardoso Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6705', '19', 'Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6706', '19', 'Cascatinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6707', '19', 'Casimiro de Abreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6708', '19', 'Cava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6709', '19', 'Coelho da Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6710', '19', 'Colonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6711', '19', 'Comendador Levy Gasparian' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6712', '19', 'Comendador Venancio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6713', '19', 'Conceicao de Jacarei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6714', '19', 'Conceicao de Macabu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6715', '19', 'Conrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6716', '19', 'Conselheiro Paulino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6717', '19', 'Conservatoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6718', '19', 'Cordeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6719', '19', 'Coroa Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6720', '19', 'Correas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6721', '19', 'Corrego da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6722', '19', 'Corrego do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6723', '19', 'Correntezas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6724', '19', 'Cunhambebe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6725', '19', 'Dorandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6726', '19', 'Dores de Macabu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6727', '19', 'Doutor Elias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6728', '19', 'Doutor Loreti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6729', '19', 'Duas Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6730', '19', 'Duque de Caxias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6731', '19', 'Engenheiro Passos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6732', '19', 'Engenheiro Paulo de Frontin' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6733', '19', 'Engenheiro Pedreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6734', '19', 'Estrada Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6735', '19', 'Euclidelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6736', '19', 'Falcao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6737', '19', 'Floriano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6738', '19', 'Fumaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6739', '19', 'Funil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6740', '19', 'Gavioes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6741', '19', 'Getulandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6742', '19', 'Glicerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6743', '19', 'Goitacazes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6744', '19', 'Governador Portela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6745', '19', 'Guapimirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6746', '19', 'Guia de Pacobaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6747', '19', 'Ibitiguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6748', '19', 'Ibitioca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6749', '19', 'Ibituporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6750', '19', 'Iguaba Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6751', '19', 'Imbarie' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6752', '19', 'Inconfidencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6753', '19', 'Inhomirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6754', '19', 'Inoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6755', '19', 'Ipiabas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6756', '19', 'Ipiiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6757', '19', 'Ipuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6758', '19', 'Itabapoana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6759', '19', 'Itaborai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6760', '19', 'Itacurussa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6761', '19', 'Itaguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6762', '19', 'Itaipava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6763', '19', 'Itaipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6764', '19', 'Itajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6765', '19', 'Italva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6766', '19', 'Itambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6767', '19', 'Itaocara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6768', '19', 'Itaperuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6769', '19', 'Itatiaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6770', '19', 'Jacuecanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6771', '19', 'Jaguarembe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6772', '19', 'Jamapara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6773', '19', 'Japeri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6774', '19', 'Japuiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6775', '19', 'Laje do Muriae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6776', '19', 'Laranjais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6777', '19', 'Lidice' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6778', '19', 'Lumiar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6779', '19', 'Macabuzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6780', '19', 'Macae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6781', '19', 'Macuco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6782', '19', 'Mage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6783', '19', 'Mambucaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6784', '19', 'Mangaratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6785', '19', 'Maniva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6786', '19', 'Manoel Ribeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6787', '19', 'Manuel Duarte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6788', '19', 'Marangatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6789', '19', 'Marica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6790', '19', 'Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6791', '19', 'Mesquita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6792', '19', 'Miguel Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6793', '19', 'Miracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6794', '19', 'Monera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6795', '19', 'Monjolo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6796', '19', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6797', '19', 'Monte Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6798', '19', 'Monumento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6799', '19', 'Morangaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6800', '19', 'Morro do Coco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6801', '19', 'Morro Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6802', '19', 'Mussurepe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6803', '19', 'Natividade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6804', '19', 'Neves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6805', '19', 'Nhunguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6806', '19', 'Nilopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6807', '19', 'Niteroi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6808', '19', 'Nossa Senhora da Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6809', '19', 'Nossa Senhora da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6810', '19', 'Nossa Senhora do Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6811', '19', 'Nova Friburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6812', '19', 'Nova Iguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6813', '19', 'Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6814', '19', 'Ourania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6815', '19', 'Papucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6816', '19', 'Paquequer Pequeno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6817', '19', 'Paracambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6818', '19', 'Paraiba do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6819', '19', 'Paraiso do Tobias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6820', '19', 'Paraoquena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6821', '19', 'Parapeuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6822', '19', 'Parati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6823', '19', 'Parati Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6824', '19', 'Passa Tres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6825', '19', 'Paty do Alferes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6826', '19', 'Pedra Selada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6827', '19', 'Pedro do Rio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6828', '19', 'Penedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6829', '19', 'Pentagna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6830', '19', 'Petropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6831', '19', 'Piabeta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6832', '19', 'Piao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6833', '19', 'Pinheiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6834', '19', 'Pipeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6835', '19', 'Pirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6836', '19', 'Pirangai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6837', '19', 'Pirapetinga de Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6838', '19', 'Porciuncula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6839', '19', 'Portela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6840', '19', 'Porto das Caixas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6841', '19', 'Porto Real' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6842', '19', 'Porto Velho do Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6843', '19', 'Posse' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6844', '19', 'Praia de Aracatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6845', '19', 'Pureza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6846', '19', 'Purilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6847', '19', 'Quarteis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6848', '19', 'Quatis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6849', '19', 'Queimados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6850', '19', 'Quissama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6851', '19', 'Raposo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6852', '19', 'Renascenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6853', '19', 'Resende' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6854', '19', 'Retiro do Muriae' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6855', '19', 'Rialto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6856', '19', 'Ribeirao de Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6857', '19', 'Rio Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6858', '19', 'Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6859', '19', 'Rio das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6860', '19', 'Rio das Ostras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6861', '19', 'Rio de Janeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6862', '19', 'Riograndina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6863', '19', 'Rosal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6864', '19', 'Sacra Familia do Tingua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6865', '19', 'Salutaris' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6866', '19', 'Sambaetiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6867', '19', 'Sampaio Correia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6868', '19', 'Sana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6869', '19', 'Santa Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6870', '19', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6871', '19', 'Santa Cruz da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6872', '19', 'Santa Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6873', '19', 'Santa Isabel do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6874', '19', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6875', '19', 'Santa Maria Madalena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6876', '19', 'Santa Rita da Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6877', '19', 'Santanesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6878', '19', 'Santo Aleixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6879', '19', 'Santo Amaro de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6880', '19', 'Santo Antonio de Padua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6881', '19', 'Santo Antonio do Imbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6882', '19', 'Santo Eduardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6883', '19', 'Sao Fidelis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6884', '19', 'Sao Francisco de Itabapoana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6885', '19', 'Sao Goncalo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6886', '19', 'Sao Joao da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6887', '19', 'Sao Joao de Meriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6888', '19', 'Sao Joao do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6889', '19', 'Sao Joao Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6890', '19', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6891', '19', 'Sao Jose de Uba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6892', '19', 'Sao Jose do Ribeirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6893', '19', 'Sao Jose do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6894', '19', 'Sao Jose do Vale do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6895', '19', 'Sao Mateus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6896', '19', 'Sao Pedro da Aldeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6897', '19', 'Sao Sebastiao de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6898', '19', 'Sao Sebastiao do Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6899', '19', 'Sao Sebastiao do Paraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6900', '19', 'Sao Sebastiao dos Ferreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6901', '19', 'Sao Vicente de Paula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6902', '19', 'Sapucaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6903', '19', 'Saquarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6904', '19', 'Saracuruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6905', '19', 'Sebastiao de Lacerda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6906', '19', 'Seropedica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6907', '19', 'Serrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6908', '19', 'Sete Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6909', '19', 'Silva Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6910', '19', 'Sodrelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6911', '19', 'Sossego' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6912', '19', 'Subaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6913', '19', 'Sumidouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6914', '19', 'Surui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6915', '19', 'Taboas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6916', '19', 'Tamoios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6917', '19', 'Tangua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6918', '19', 'Tapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6919', '19', 'Tarituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6920', '19', 'Teresopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6921', '19', 'Tocos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6922', '19', 'Trajano de Morais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6923', '19', 'Travessao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6924', '19', 'Tres Irmaos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6925', '19', 'Tres Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6926', '19', 'Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6927', '19', 'Valao do Barro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6928', '19', 'Valenca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6929', '19', 'Vargem Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6930', '19', 'Varre-sai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6931', '19', 'Vassouras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6932', '19', 'Venda das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6933', '19', 'Venda das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6934', '19', 'Vila da Grama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6935', '19', 'Vila do Frade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6936', '19', 'Vila Muriqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6937', '19', 'Vila Nova de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6938', '19', 'Visconde de Imbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6939', '19', 'Volta Redonda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6940', '19', 'Werneck' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6941', '19', 'Xerem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6942', '20', 'Acari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6943', '20', 'Acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6944', '20', 'Afonso Bezerra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6945', '20', 'Agua Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6946', '20', 'Alexandria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6947', '20', 'Almino Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6948', '20', 'Alto do Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6949', '20', 'Angicos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6950', '20', 'Antonio Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6951', '20', 'Apodi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6952', '20', 'Areia Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6953', '20', 'Ares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6954', '20', 'Baia Formosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6955', '20', 'Barao de Serra Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6956', '20', 'Barauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6957', '20', 'Barcelona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6958', '20', 'Belo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6959', '20', 'Bento Fernandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6960', '20', 'Boa Saude' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6961', '20', 'Bodo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6962', '20', 'Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6963', '20', 'Brejinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6964', '20', 'Caicara do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6965', '20', 'Caicara do Rio do Vento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6966', '20', 'Caico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6967', '20', 'Campo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6968', '20', 'Campo Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6969', '20', 'Canguaretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6970', '20', 'Caraubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6971', '20', 'Carnauba dos Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6972', '20', 'Carnaubais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6973', '20', 'Ceara-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6974', '20', 'Cerro Cora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6975', '20', 'Coronel Ezequiel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6976', '20', 'Coronel Joao Pessoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6977', '20', 'Corrego de Sao Mateus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6978', '20', 'Cruzeta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6979', '20', 'Currais Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6980', '20', 'Doutor Severiano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6981', '20', 'Encanto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6982', '20', 'Equador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6983', '20', 'Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6984', '20', 'Espirito Santo do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6985', '20', 'Extremoz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6986', '20', 'Felipe Guerra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6987', '20', 'Fernando Pedroza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6988', '20', 'Firmamento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6989', '20', 'Florania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6990', '20', 'Francisco Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6991', '20', 'Frutuoso Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6992', '20', 'Galinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6993', '20', 'Gameleira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6994', '20', 'Goianinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6995', '20', 'Governador Dix-sept Rosado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6996', '20', 'Grossos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6997', '20', 'Guamare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6998', '20', 'Ielmo Marinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '6999', '20', 'Igreja Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7000', '20', 'Ipanguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7001', '20', 'Ipiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7002', '20', 'Ipueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7003', '20', 'Itaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7004', '20', 'Itau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7005', '20', 'Jacana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7006', '20', 'Jandaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7007', '20', 'Janduis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7008', '20', 'Japi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7009', '20', 'Jardim de Angicos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7010', '20', 'Jardim de Piranhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7011', '20', 'Jardim do Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7012', '20', 'Joao Camara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7013', '20', 'Joao Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7014', '20', 'Jose da Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7015', '20', 'Jucurutu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7016', '20', 'Jundia de Cima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7017', '20', 'Lagoa D\'anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7018', '20', 'Lagoa de Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7019', '20', 'Lagoa de Velhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7020', '20', 'Lagoa Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7021', '20', 'Lagoa Salgada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7022', '20', 'Lajes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7023', '20', 'Lajes Pintadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7024', '20', 'Lucrecia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7025', '20', 'Luis Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7026', '20', 'Macaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7027', '20', 'Macau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7028', '20', 'Major Felipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7029', '20', 'Major Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7030', '20', 'Marcelino Vieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7031', '20', 'Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7032', '20', 'Mata de Sao Braz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7033', '20', 'Maxaranguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7034', '20', 'Messias Targino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7035', '20', 'Montanhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7036', '20', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7037', '20', 'Monte das Gameleiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7038', '20', 'Mossoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7039', '20', 'Natal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7040', '20', 'Nisia Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7041', '20', 'Nova Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7042', '20', 'Olho-d\'agua Do Borges' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7043', '20', 'Ouro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7044', '20', 'Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7045', '20', 'Parazinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7046', '20', 'Parelhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7047', '20', 'Parnamirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7048', '20', 'Passa E Fica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7049', '20', 'Passagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7050', '20', 'Patu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7051', '20', 'Pau dos Ferros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7052', '20', 'Pedra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7053', '20', 'Pedra Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7054', '20', 'Pedro Avelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7055', '20', 'Pedro Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7056', '20', 'Pendencias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7057', '20', 'Piloes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7058', '20', 'Poco Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7059', '20', 'Portalegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7060', '20', 'Porto do Mangue' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7061', '20', 'Pureza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7062', '20', 'Rafael Fernandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7063', '20', 'Rafael Godeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7064', '20', 'Riacho da Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7065', '20', 'Riacho de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7066', '20', 'Riachuelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7067', '20', 'Rio do Fogo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7068', '20', 'Rodolfo Fernandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7069', '20', 'Rosario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7070', '20', 'Ruy Barbosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7071', '20', 'Salva Vida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7072', '20', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7073', '20', 'Santa Fe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7074', '20', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7075', '20', 'Santa Teresa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7076', '20', 'Santana do Matos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7077', '20', 'Santana do Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7078', '20', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7079', '20', 'Santo Antonio do Potengi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7080', '20', 'Sao Bento do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7081', '20', 'Sao Bento do Trairi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7082', '20', 'Sao Bernardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7083', '20', 'Sao Fernando' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7084', '20', 'Sao Francisco do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7085', '20', 'Sao Geraldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7086', '20', 'Sao Goncalo do Amarante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7087', '20', 'Sao Joao do Sabugi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7088', '20', 'Sao Jose da Passagem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7089', '20', 'Sao Jose de Mipibu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7090', '20', 'Sao Jose do Campestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7091', '20', 'Sao Jose do Serido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7092', '20', 'Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7093', '20', 'Sao Miguel de Touros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7094', '20', 'Sao Paulo do Potengi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7095', '20', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7096', '20', 'Sao Rafael' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7097', '20', 'Sao Tome' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7098', '20', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7099', '20', 'Senador Eloi de Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7100', '20', 'Senador Georgino Avelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7101', '20', 'Serra Caiada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7102', '20', 'Serra da Tapuia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7103', '20', 'Serra de Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7104', '20', 'Serra do Mel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7105', '20', 'Serra Negra do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7106', '20', 'Serrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7107', '20', 'Serrinha dos Pintos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7108', '20', 'Severiano Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7109', '20', 'Sitio Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7110', '20', 'Taboleiro Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7111', '20', 'Taipu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7112', '20', 'Tangara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7113', '20', 'Tenente Ananias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7114', '20', 'Tenente Laurentino Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7115', '20', 'Tibau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7116', '20', 'Tibau do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7117', '20', 'Timbauba dos Batistas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7118', '20', 'Touros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7119', '20', 'Trairi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7120', '20', 'Triunfo Potiguar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7121', '20', 'Umarizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7122', '20', 'Upanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7123', '20', 'Varzea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7124', '20', 'Venha-ver' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7125', '20', 'Vera Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7126', '20', 'Vicosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7127', '20', 'Vila Flor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7128', '21', 'Abuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7129', '21', 'Alta Alegre dos Parecis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7130', '21', 'Alta Floresta do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7131', '21', 'Alto Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7132', '21', 'Alvorada do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7133', '21', 'Ariquemes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7134', '21', 'Buritis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7135', '21', 'Cabixi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7136', '21', 'Cacaulandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7137', '21', 'Cacoal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7138', '21', 'Calama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7139', '21', 'Campo Novo de Rondonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7140', '21', 'Candeias do Jamari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7141', '21', 'Castanheiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7142', '21', 'Cerejeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7143', '21', 'Chupinguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7144', '21', 'Colorado do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7145', '21', 'Corumbiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7146', '21', 'Costa Marques' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7147', '21', 'Cujubim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7148', '21', 'Espigao D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7149', '21', 'Governador Jorge Teixeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7150', '21', 'Guajara-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7151', '21', 'Jaci Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7152', '21', 'Jamari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7153', '21', 'Jaru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7154', '21', 'Ji-parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7155', '21', 'Machadinho D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7156', '21', 'Marco Rondon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7157', '21', 'Ministro Andreazza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7158', '21', 'Mirante da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7159', '21', 'Monte Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7160', '21', 'Nova Brasilandia D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7161', '21', 'Nova Mamore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7162', '21', 'Nova Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7163', '21', 'Nova Vida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7164', '21', 'Novo Horizonte do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7165', '21', 'Ouro Preto do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7166', '21', 'Parecis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7167', '21', 'Pedras Negras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7168', '21', 'Pimenta Bueno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7169', '21', 'Pimenteiras do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7170', '21', 'Porto Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7171', '21', 'Presidente Medici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7172', '21', 'Primavera de Rondonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7173', '21', 'Principe da Beira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7174', '21', 'Rio Crespo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7175', '21', 'Riozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7176', '21', 'Rolim de Moura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7177', '21', 'Santa Luzia do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7178', '21', 'Sao Felipe D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7179', '21', 'Sao Francisco do Guapore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7180', '21', 'Sao Miguel do Guapore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7181', '21', 'Seringueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7182', '21', 'Tabajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7183', '21', 'Teixeiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7184', '21', 'Theobroma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7185', '21', 'Urupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7186', '21', 'Vale do Anari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7187', '21', 'Vale do Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7188', '21', 'Vila Extrema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7189', '21', 'Vilhena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7190', '21', 'Vista Alegre do Abuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7191', '22', 'Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7192', '22', 'Amajari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7193', '22', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7194', '22', 'Bonfim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7195', '22', 'Canta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7196', '22', 'Caracarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7197', '22', 'Caroebe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7198', '22', 'Iracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7199', '22', 'Mucajai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7200', '22', 'Normandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7201', '22', 'Pacaraima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7202', '22', 'Rorainopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7203', '22', 'Sao Joao da Baliza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7204', '22', 'Sao Luiz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7205', '22', 'Uiramuta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7206', '23', 'Acegua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7207', '23', 'Afonso Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7208', '23', 'Agua Santa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7209', '23', 'Aguas Claras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7210', '23', 'Agudo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7211', '23', 'Ajuricaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7212', '23', 'Albardao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7213', '23', 'Alecrim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7214', '23', 'Alegrete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7215', '23', 'Alegria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7216', '23', 'Alfredo Brenner' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7217', '23', 'Almirante Tamandare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7218', '23', 'Alpestre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7219', '23', 'Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7220', '23', 'Alto da Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7221', '23', 'Alto Feliz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7222', '23', 'Alto Paredao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7223', '23', 'Alto Recreio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7224', '23', 'Alto Uruguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7225', '23', 'Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7226', '23', 'Amaral Ferrador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7227', '23', 'Ametista do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7228', '23', 'Andre da Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7229', '23', 'Anta Gorda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7230', '23', 'Antonio Kerpel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7231', '23', 'Antonio Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7232', '23', 'Arambare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7233', '23', 'Ararica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7234', '23', 'Aratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7235', '23', 'Arco Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7236', '23', 'Arco-iris' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7237', '23', 'Arroio Canoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7238', '23', 'Arroio do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7239', '23', 'Arroio do Padre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7240', '23', 'Arroio do Sal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7241', '23', 'Arroio do So' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7242', '23', 'Arroio do Tigre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7243', '23', 'Arroio dos Ratos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7244', '23', 'Arroio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7245', '23', 'Arvore So' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7246', '23', 'Arvorezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7247', '23', 'Atafona' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7248', '23', 'Atiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7249', '23', 'Augusto Pestana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7250', '23', 'Aurea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7251', '23', 'Avelino Paranhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7252', '23', 'Azevedo Sodre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7253', '23', 'Bacupari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7254', '23', 'Bage' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7255', '23', 'Baliza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7256', '23', 'Balneario Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7257', '23', 'Banhado do Colegio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7258', '23', 'Barao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7259', '23', 'Barao de Cotegipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7260', '23', 'Barao do Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7261', '23', 'Barra do Guarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7262', '23', 'Barra do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7263', '23', 'Barra do Quarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7264', '23', 'Barra do Ribeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7265', '23', 'Barra do Rio Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7266', '23', 'Barra Funda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7267', '23', 'Barracao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7268', '23', 'Barreirinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7269', '23', 'Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7270', '23', 'Barro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7271', '23', 'Barro Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7272', '23', 'Barros Cassal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7273', '23', 'Basilio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7274', '23', 'Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7275', '23', 'Beluno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7276', '23', 'Benjamin Constant do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7277', '23', 'Bento Goncalves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7278', '23', 'Bexiga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7279', '23', 'Boa Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7280', '23', 'Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7281', '23', 'Boa Vista das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7282', '23', 'Boa Vista do Burica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7283', '23', 'Boa Vista do Cadeado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7284', '23', 'Boa Vista do Incra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7285', '23', 'Boa Vista do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7286', '23', 'Boca do Monte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7287', '23', 'Boi Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7288', '23', 'Bojuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7289', '23', 'Bom Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7290', '23', 'Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7291', '23', 'Bom Principio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7292', '23', 'Bom Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7293', '23', 'Bom Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7294', '23', 'Bom Retiro do Guaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7295', '23', 'Bom Retiro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7296', '23', 'Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7297', '23', 'Boqueirao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7298', '23', 'Boqueirao do Leao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7299', '23', 'Borore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7300', '23', 'Bossoroca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7301', '23', 'Botucarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7302', '23', 'Braga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7303', '23', 'Brochier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7304', '23', 'Buriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7305', '23', 'Butia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7306', '23', 'Butias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7307', '23', 'Cacapava do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7308', '23', 'Cacequi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7309', '23', 'Cachoeira do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7310', '23', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7311', '23', 'Cacique Doble' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7312', '23', 'Cadorna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7313', '23', 'Caibate' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7314', '23', 'Caicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7315', '23', 'Camaqua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7316', '23', 'Camargo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7317', '23', 'Cambara do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7318', '23', 'Camobi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7319', '23', 'Campestre Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7320', '23', 'Campestre da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7321', '23', 'Campina das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7322', '23', 'Campina Redonda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7323', '23', 'Campinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7324', '23', 'Campinas do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7325', '23', 'Campo Bom' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7326', '23', 'Campo Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7327', '23', 'Campo do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7328', '23', 'Campo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7329', '23', 'Campo Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7330', '23', 'Campo Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7331', '23', 'Campo Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7332', '23', 'Campos Borges' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7333', '23', 'Candelaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7334', '23', 'Candido Freire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7335', '23', 'Candido Godoi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7336', '23', 'Candiota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7337', '23', 'Canela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7338', '23', 'Cangucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7339', '23', 'Canhembora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7340', '23', 'Canoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7341', '23', 'Canudos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7342', '23', 'Capane' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7343', '23', 'Capao Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7344', '23', 'Capao Comprido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7345', '23', 'Capao da Canoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7346', '23', 'Capao da Porteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7347', '23', 'Capao do Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7348', '23', 'Capao do Cipo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7349', '23', 'Capao do Leao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7350', '23', 'Capela de Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7351', '23', 'Capela Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7352', '23', 'Capinzal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7353', '23', 'Capitao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7354', '23', 'Capivari do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7355', '23', 'Capivarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7356', '23', 'Capo-ere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7357', '23', 'Capoeira Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7358', '23', 'Caraa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7359', '23', 'Caraja Seival' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7360', '23', 'Carazinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7361', '23', 'Carlos Barbosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7362', '23', 'Carlos Gomes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7363', '23', 'Carovi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7364', '23', 'Casca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7365', '23', 'Cascata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7366', '23', 'Caseiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7367', '23', 'Castelinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7368', '23', 'Catuipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7369', '23', 'Cavajureta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7370', '23', 'Cavera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7371', '23', 'Caxias do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7372', '23', 'Cazuza Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7373', '23', 'Cedro Marcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7374', '23', 'Centenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7375', '23', 'Centro Linha Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7376', '23', 'Cerrito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7377', '23', 'Cerrito Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7378', '23', 'Cerrito do Ouro Ou Vila do Cerrito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7379', '23', 'Cerro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7380', '23', 'Cerro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7381', '23', 'Cerro Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7382', '23', 'Cerro do Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7383', '23', 'Cerro do Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7384', '23', 'Cerro Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7385', '23', 'Cerro Grande do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7386', '23', 'Cerro Largo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7387', '23', 'Chapada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7388', '23', 'Charqueadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7389', '23', 'Charrua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7390', '23', 'Chiapetta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7391', '23', 'Chicoloma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7392', '23', 'Chimarrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7393', '23', 'Chorao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7394', '23', 'Chui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7395', '23', 'Chuvisca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7396', '23', 'Cidreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7397', '23', 'Cinquentenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7398', '23', 'Ciriaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7399', '23', 'Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7400', '23', 'Clemente Argolo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7401', '23', 'Coimbra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7402', '23', 'Colinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7403', '23', 'Colonia das Almas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7404', '23', 'Colonia Medeiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7405', '23', 'Colonia Municipal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7406', '23', 'Colonia Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7407', '23', 'Colonia Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7408', '23', 'Colonia Z-null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7409', '23', 'Coloninha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7410', '23', 'Colorado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7411', '23', 'Comandai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7412', '23', 'Condor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7413', '23', 'Consolata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7414', '23', 'Constantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7415', '23', 'Coqueiro Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7416', '23', 'Coqueiros do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7417', '23', 'Cordilheira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7418', '23', 'Coroados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7419', '23', 'Coronel Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7420', '23', 'Coronel Bicaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7421', '23', 'Coronel Finzito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7422', '23', 'Coronel Pilar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7423', '23', 'Coronel Teixeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7424', '23', 'Cortado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7425', '23', 'Costa da Cadeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7426', '23', 'Costao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7427', '23', 'Cotipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7428', '23', 'Coxilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7429', '23', 'Coxilha Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7430', '23', 'Cr-null' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7431', '23', 'Crissiumal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7432', '23', 'Cristal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7433', '23', 'Cristal do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7434', '23', 'Criuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7435', '23', 'Cruz Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7436', '23', 'Cruz Altense' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7437', '23', 'Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7438', '23', 'Cruzeiro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7439', '23', 'Curral Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7440', '23', 'Curumim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7441', '23', 'Daltro Filho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7442', '23', 'Dario Lassance' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7443', '23', 'David Canabarro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7444', '23', 'Delfina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7445', '23', 'Deodoro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7446', '23', 'Deposito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7447', '23', 'Derrubadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7448', '23', 'Dezesseis de Novembro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7449', '23', 'Dilermando de Aguiar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7450', '23', 'Divino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7451', '23', 'Dois Irmaos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7452', '23', 'Dois Irmaos das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7453', '23', 'Dois Lajeados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7454', '23', 'Dom Diogo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7455', '23', 'Dom Feliciano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7456', '23', 'Dom Pedrito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7457', '23', 'Dom Pedro de Alcantara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7458', '23', 'Dona Francisca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7459', '23', 'Dona Otilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7460', '23', 'Dourado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7461', '23', 'Doutor Bozano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7462', '23', 'Doutor Edgardo Pereira Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7463', '23', 'Doutor Mauricio Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7464', '23', 'Doutor Ricardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7465', '23', 'Eldorado do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7466', '23', 'Eletra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7467', '23', 'Encantado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7468', '23', 'Encruzilhada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7469', '23', 'Encruzilhada do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7470', '23', 'Engenho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7471', '23', 'Entre Rios do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7472', '23', 'Entre-ijuis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7473', '23', 'Entrepelado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7474', '23', 'Erebango' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7475', '23', 'Erechim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7476', '23', 'Ernestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7477', '23', 'Ernesto Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7478', '23', 'Erval Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7479', '23', 'Erval Seco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7480', '23', 'Erveiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7481', '23', 'Esmeralda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7482', '23', 'Esperanca do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7483', '23', 'Espigao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7484', '23', 'Espigao Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7485', '23', 'Espinilho Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7486', '23', 'Espirito Santo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7487', '23', 'Espumoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7488', '23', 'Esquina Araujo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7489', '23', 'Esquina Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7490', '23', 'Esquina Gaucha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7491', '23', 'Esquina Ipiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7492', '23', 'Esquina Piratini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7493', '23', 'Estacao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7494', '23', 'Estancia Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7495', '23', 'Estancia Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7496', '23', 'Esteio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7497', '23', 'Esteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7498', '23', 'Estreito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7499', '23', 'Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7500', '23', 'Estrela Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7501', '23', 'Eugenio de Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7502', '23', 'Evangelista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7503', '23', 'Fagundes Varela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7504', '23', 'Fao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7505', '23', 'Faria Lemos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7506', '23', 'Farinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7507', '23', 'Farrapos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7508', '23', 'Farroupilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7509', '23', 'Faxinal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7510', '23', 'Faxinal do Soturno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7511', '23', 'Faxinalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7512', '23', 'Fazenda Fialho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7513', '23', 'Fazenda Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7514', '23', 'Fazenda Vilanova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7515', '23', 'Feliz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7516', '23', 'Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7517', '23', 'Flores da Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7518', '23', 'Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7519', '23', 'Floriano Peixoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7520', '23', 'Florida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7521', '23', 'Fontoura Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7522', '23', 'Formigueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7523', '23', 'Formosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7524', '23', 'Forninho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7525', '23', 'Forquetinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7526', '23', 'Fortaleza dos Valos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7527', '23', 'Frederico Westphalen' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7528', '23', 'Frei Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7529', '23', 'Freire' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7530', '23', 'Garibaldi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7531', '23', 'Garibaldina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7532', '23', 'Garruchos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7533', '23', 'Gaurama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7534', '23', 'General Camara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7535', '23', 'Gentil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7536', '23', 'Getulio Vargas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7537', '23', 'Girua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7538', '23', 'Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7539', '23', 'Glorinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7540', '23', 'Goio-en' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7541', '23', 'Gramado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7542', '23', 'Gramado dos Loureiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7543', '23', 'Gramado Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7544', '23', 'Gramado Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7545', '23', 'Gravatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7546', '23', 'Guabiju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7547', '23', 'Guaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7548', '23', 'Guajuviras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7549', '23', 'Guapore' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7550', '23', 'Guarani das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7551', '23', 'Guassupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7552', '23', 'Harmonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7553', '23', 'Herval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7554', '23', 'Herveiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7555', '23', 'Hidraulica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7556', '23', 'Horizontina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7557', '23', 'Hulha Negra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7558', '23', 'Humaita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7559', '23', 'Ibarama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7560', '23', 'Ibare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7561', '23', 'Ibiaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7562', '23', 'Ibiraiaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7563', '23', 'Ibirapuita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7564', '23', 'Ibiruba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7565', '23', 'Igrejinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7566', '23', 'Ijucapirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7567', '23', 'Ijui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7568', '23', 'Ilha dos Marinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7569', '23', 'Ilopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7570', '23', 'Imbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7571', '23', 'Imigrante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7572', '23', 'Independencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7573', '23', 'Inhacora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7574', '23', 'Ipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7575', '23', 'Ipiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7576', '23', 'Ipiranga do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7577', '23', 'Ipuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7578', '23', 'Irai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7579', '23', 'Irui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7580', '23', 'Itaara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7581', '23', 'Itacolomi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7582', '23', 'Itacurubi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7583', '23', 'Itai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7584', '23', 'Itaimbezinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7585', '23', 'Itao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7586', '23', 'Itapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7587', '23', 'Itapuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7588', '23', 'Itaqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7589', '23', 'Itati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7590', '23', 'Itatiba do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7591', '23', 'Itauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7592', '23', 'Ituim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7593', '23', 'Ivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7594', '23', 'Ivora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7595', '23', 'Ivoti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7596', '23', 'Jaboticaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7597', '23', 'Jacuizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7598', '23', 'Jacutinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7599', '23', 'Jaguarao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7600', '23', 'Jaguarete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7601', '23', 'Jaguari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7602', '23', 'Jansen' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7603', '23', 'Jaquirana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7604', '23', 'Jari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7605', '23', 'Jazidas Ou Capela Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7606', '23', 'Joao Arregui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7607', '23', 'Joao Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7608', '23', 'Joca Tavares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7609', '23', 'Joia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7610', '23', 'Jose Otavio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7611', '23', 'Jua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7612', '23', 'Julio de Castilhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7613', '23', 'Lagoa Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7614', '23', 'Lagoa dos Tres Cantos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7615', '23', 'Lagoa Vermelha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7616', '23', 'Lagoao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7617', '23', 'Lajeado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7618', '23', 'Lajeado Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7619', '23', 'Lajeado Cerne' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7620', '23', 'Lajeado do Bugre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7621', '23', 'Lajeado Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7622', '23', 'Lara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7623', '23', 'Laranjeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7624', '23', 'Lava-pes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7625', '23', 'Lavras do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7626', '23', 'Leonel Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7627', '23', 'Liberato Salzano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7628', '23', 'Lindolfo Collor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7629', '23', 'Linha Comprida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7630', '23', 'Linha Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7631', '23', 'Linha Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7632', '23', 'Loreto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7633', '23', 'Macambara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7634', '23', 'Machadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7635', '23', 'Magisterio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7636', '23', 'Mampituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7637', '23', 'Manchinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7638', '23', 'Mangueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7639', '23', 'Manoel Viana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7640', '23', 'Maquine' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7641', '23', 'Marata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7642', '23', 'Marau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7643', '23', 'Marcelino Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7644', '23', 'Marcorama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7645', '23', 'Mariana Pimentel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7646', '23', 'Mariano Moro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7647', '23', 'Mariante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7648', '23', 'Mariapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7649', '23', 'Marques de Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7650', '23', 'Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7651', '23', 'Matarazzo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7652', '23', 'Mato Castelhano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7653', '23', 'Mato Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7654', '23', 'Mato Leitao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7655', '23', 'Mato Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7656', '23', 'Maua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7657', '23', 'Maximiliano de Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7658', '23', 'Medianeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7659', '23', 'Minas do Leao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7660', '23', 'Miraguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7661', '23', 'Miraguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7662', '23', 'Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7663', '23', 'Montauri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7664', '23', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7665', '23', 'Monte Alegre dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7666', '23', 'Monte Alverne' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7667', '23', 'Monte Belo do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7668', '23', 'Monte Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7669', '23', 'Montenegro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7670', '23', 'Mormaco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7671', '23', 'Morrinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7672', '23', 'Morrinhos do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7673', '23', 'Morro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7674', '23', 'Morro Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7675', '23', 'Morro Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7676', '23', 'Morro Reuter' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7677', '23', 'Morungava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7678', '23', 'Mostardas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7679', '23', 'Mucum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7680', '23', 'Muitos Capoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7681', '23', 'Muliterno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7682', '23', 'Nao-me-toque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7683', '23', 'Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7684', '23', 'Nicolau Vergueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7685', '23', 'Nonoai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7686', '23', 'Nossa Senhora Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7687', '23', 'Nossa Senhora da Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7688', '23', 'Nova Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7689', '23', 'Nova Araca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7690', '23', 'Nova Bassano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7691', '23', 'Nova Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7692', '23', 'Nova Brescia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7693', '23', 'Nova Candelaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7694', '23', 'Nova Esperanca do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7695', '23', 'Nova Hartz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7696', '23', 'Nova Milano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7697', '23', 'Nova Padua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7698', '23', 'Nova Palma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7699', '23', 'Nova Petropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7700', '23', 'Nova Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7701', '23', 'Nova Ramada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7702', '23', 'Nova Roma do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7703', '23', 'Nova Santa Rita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7704', '23', 'Nova Sardenha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7705', '23', 'Novo Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7706', '23', 'Novo Cabrais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7707', '23', 'Novo Hamburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7708', '23', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7709', '23', 'Novo Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7710', '23', 'Novo Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7711', '23', 'Novo Tiradentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7712', '23', 'Oliva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7713', '23', 'Oralina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7714', '23', 'Osorio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7715', '23', 'Osvaldo Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7716', '23', 'Osvaldo Kroeff' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7717', '23', 'Otavio Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7718', '23', 'Pacheca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7719', '23', 'Padilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7720', '23', 'Padre Gonzales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7721', '23', 'Paim Filho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7722', '23', 'Palmares do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7723', '23', 'Palmas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7724', '23', 'Palmeira das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7725', '23', 'Palmitinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7726', '23', 'Pampeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7727', '23', 'Panambi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7728', '23', 'Pantano Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7729', '23', 'Parai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7730', '23', 'Paraiso do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7731', '23', 'Pareci Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7732', '23', 'Parobe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7733', '23', 'Passa Sete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7734', '23', 'Passinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7735', '23', 'Passo Burmann' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7736', '23', 'Passo da Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7737', '23', 'Passo da Caveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7738', '23', 'Passo das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7739', '23', 'Passo do Adao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7740', '23', 'Passo do Sabao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7741', '23', 'Passo do Sobrado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7742', '23', 'Passo Fundo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7743', '23', 'Passo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7744', '23', 'Passo Raso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7745', '23', 'Paulo Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7746', '23', 'Pavao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7747', '23', 'Paverama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7748', '23', 'Pedras Altas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7749', '23', 'Pedreiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7750', '23', 'Pedro Garcia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7751', '23', 'Pedro Osorio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7752', '23', 'Pedro Paiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7753', '23', 'Pejucara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7754', '23', 'Pelotas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7755', '23', 'Picada Cafe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7756', '23', 'Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7757', '23', 'Pinhal Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7758', '23', 'Pinhal da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7759', '23', 'Pinhal Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7760', '23', 'Pinhalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7761', '23', 'Pinheirinho do Vale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7762', '23', 'Pinheiro Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7763', '23', 'Pinheiro Marcado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7764', '23', 'Pinto Bandeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7765', '23', 'Pirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7766', '23', 'Pirapo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7767', '23', 'Piratini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7768', '23', 'Pitanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7769', '23', 'Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7770', '23', 'Plano Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7771', '23', 'Poco das Antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7772', '23', 'Poligono do Erval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7773', '23', 'Polo Petroquimico de Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7774', '23', 'Pontao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7775', '23', 'Ponte Preta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7776', '23', 'Portao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7777', '23', 'Porto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7778', '23', 'Porto Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7779', '23', 'Porto Lucena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7780', '23', 'Porto Maua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7781', '23', 'Porto Vera Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7782', '23', 'Porto Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7783', '23', 'Pouso Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7784', '23', 'Povo Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7785', '23', 'Povoado Tozzo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7786', '23', 'Pranchada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7787', '23', 'Pratos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7788', '23', 'Presidente Lucena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7789', '23', 'Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7790', '23', 'Protasio Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7791', '23', 'Pulador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7792', '23', 'Putinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7793', '23', 'Quarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7794', '23', 'Quaraim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7795', '23', 'Quatro Irmaos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7796', '23', 'Quevedos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7797', '23', 'Quilombo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7798', '23', 'Quinta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7799', '23', 'Quintao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7800', '23', 'Quinze de Novembro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7801', '23', 'Quiteria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7802', '23', 'Rancho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7803', '23', 'Redentora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7804', '23', 'Refugiado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7805', '23', 'Relvado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7806', '23', 'Restinga Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7807', '23', 'Rincao de Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7808', '23', 'Rincao Del Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7809', '23', 'Rincao do Cristovao Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7810', '23', 'Rincao do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7811', '23', 'Rincao do Segredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7812', '23', 'Rincao Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7813', '23', 'Rincao dos Kroeff' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7814', '23', 'Rincao dos Mendes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7815', '23', 'Rincao Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7816', '23', 'Rio Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7817', '23', 'Rio Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7818', '23', 'Rio da Ilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7819', '23', 'Rio dos Indios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7820', '23', 'Rio Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7821', '23', 'Rio Pardinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7822', '23', 'Rio Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7823', '23', 'Rio Telha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7824', '23', 'Rio Tigre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7825', '23', 'Rio Toldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7826', '23', 'Riozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7827', '23', 'Roca Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7828', '23', 'Rodeio Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7829', '23', 'Rolador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7830', '23', 'Rolante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7831', '23', 'Rolantinho da Figueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7832', '23', 'Ronda Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7833', '23', 'Rondinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7834', '23', 'Roque Gonzales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7835', '23', 'Rosario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7836', '23', 'Rosario do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7837', '23', 'Sagrada Familia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7838', '23', 'Saica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7839', '23', 'Saldanha Marinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7840', '23', 'Saltinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7841', '23', 'Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7842', '23', 'Salto do Jacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7843', '23', 'Salvador das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7844', '23', 'Salvador do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7845', '23', 'Sananduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7846', '23', 'Sant Auta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7847', '23', 'Santa Barbara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7848', '23', 'Santa Barbara do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7849', '23', 'Santa Catarina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7850', '23', 'Santa Cecilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7851', '23', 'Santa Clara do Ingai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7852', '23', 'Santa Clara do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7853', '23', 'Santa Cristina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7854', '23', 'Santa Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7855', '23', 'Santa Cruz da Concordia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7856', '23', 'Santa Cruz do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7857', '23', 'Santa Flora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7858', '23', 'Santa Ines' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7859', '23', 'Santa Izabel do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7860', '23', 'Santa Lucia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7861', '23', 'Santa Lucia do Piai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7862', '23', 'Santa Luiza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7863', '23', 'Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7864', '23', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7865', '23', 'Santa Maria do Herval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7866', '23', 'Santa Rita do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7867', '23', 'Santa Rosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7868', '23', 'Santa Silvana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7869', '23', 'Santa Teresinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7870', '23', 'Santa Tereza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7871', '23', 'Santa Vitoria do Palmar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7872', '23', 'Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7873', '23', 'Santana da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7874', '23', 'Santana do Livramento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7875', '23', 'Santiago' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7876', '23', 'Santo Amaro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7877', '23', 'Santo Angelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7878', '23', 'Santo Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7879', '23', 'Santo Antonio da Patrulha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7880', '23', 'Santo Antonio das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7881', '23', 'Santo Antonio de Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7882', '23', 'Santo Antonio do Bom Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7883', '23', 'Santo Antonio do Palma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7884', '23', 'Santo Antonio do Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7885', '23', 'Santo Augusto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7886', '23', 'Santo Cristo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7887', '23', 'Santo Expedito do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7888', '23', 'Santo Inacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7889', '23', 'Sao Bento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7890', '23', 'Sao Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7891', '23', 'Sao Borja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7892', '23', 'Sao Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7893', '23', 'Sao Domingos do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7894', '23', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7895', '23', 'Sao Francisco de Assis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7896', '23', 'Sao Francisco de Paula' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7897', '23', 'Sao Gabriel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7898', '23', 'Sao Jeronimo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7899', '23', 'Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7900', '23', 'Sao Joao Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7901', '23', 'Sao Joao Bosco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7902', '23', 'Sao Joao da Urtiga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7903', '23', 'Sao Joao do Polesine' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7904', '23', 'Sao Jorge' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7905', '23', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7906', '23', 'Sao Jose da Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7907', '23', 'Sao Jose das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7908', '23', 'Sao Jose de Castro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7909', '23', 'Sao Jose do Centro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7910', '23', 'Sao Jose do Herval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7911', '23', 'Sao Jose do Hortencio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7912', '23', 'Sao Jose do Inhacora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7913', '23', 'Sao Jose do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7914', '23', 'Sao Jose do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7915', '23', 'Sao Jose dos Ausentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7916', '23', 'Sao Leopoldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7917', '23', 'Sao Lourenco das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7918', '23', 'Sao Lourenco do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7919', '23', 'Sao Luis Rei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7920', '23', 'Sao Luiz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7921', '23', 'Sao Luiz Gonzaga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7922', '23', 'Sao Manuel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7923', '23', 'Sao Marcos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7924', '23', 'Sao Martinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7925', '23', 'Sao Martinho da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7926', '23', 'Sao Miguel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7927', '23', 'Sao Miguel das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7928', '23', 'Sao Nicolau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7929', '23', 'Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7930', '23', 'Sao Paulo das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7931', '23', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7932', '23', 'Sao Pedro da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7933', '23', 'Sao Pedro do Butia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7934', '23', 'Sao Pedro do Iraxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7935', '23', 'Sao Pedro do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7936', '23', 'Sao Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7937', '23', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7938', '23', 'Sao Sebastiao do Cai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7939', '23', 'Sao Sepe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7940', '23', 'Sao Simao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7941', '23', 'Sao Valentim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7942', '23', 'Sao Valentim do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7943', '23', 'Sao Valerio do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7944', '23', 'Sao Vendelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7945', '23', 'Sao Vicente do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7946', '23', 'Sapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7947', '23', 'Sapucaia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7948', '23', 'Sarandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7949', '23', 'Scharlau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7950', '23', 'Seberi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7951', '23', 'Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7952', '23', 'Sede Aurora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7953', '23', 'Sede Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7954', '23', 'Segredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7955', '23', 'Seival' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7956', '23', 'Selbach' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7957', '23', 'Senador Salgado Filho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7958', '23', 'Sentinela do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7959', '23', 'Serafim Schmidt' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7960', '23', 'Serafina Correa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7961', '23', 'Serio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7962', '23', 'Serra dos Gregorios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7963', '23', 'Serrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7964', '23', 'Sertao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7965', '23', 'Sertao Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7966', '23', 'Sertaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7967', '23', 'Sete de Setembro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7968', '23', 'Sete Lagoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7969', '23', 'Severiano de Almeida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7970', '23', 'Silva Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7971', '23', 'Silveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7972', '23', 'Silveira Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7973', '23', 'Sinimbu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7974', '23', 'Sirio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7975', '23', 'Sitio Gabriel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7976', '23', 'Sobradinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7977', '23', 'Soledade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7978', '23', 'Souza Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7979', '23', 'Suspiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7980', '23', 'Tabai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7981', '23', 'Tabajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7982', '23', 'Taim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7983', '23', 'Tainhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7984', '23', 'Tamandua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7985', '23', 'Tanque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7986', '23', 'Tapejara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7987', '23', 'Tapera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7988', '23', 'Tapes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7989', '23', 'Taquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7990', '23', 'Taquari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7991', '23', 'Taquarichim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7992', '23', 'Taquarucu do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7993', '23', 'Tavares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7994', '23', 'Tenente Portela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7995', '23', 'Terra de Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7996', '23', 'Tesouras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7997', '23', 'Teutonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7998', '23', 'Tiaraju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '7999', '23', 'Timbauva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8000', '23', 'Tiradentes do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8001', '23', 'Toropi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8002', '23', 'Toroqua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8003', '23', 'Torquato Severo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8004', '23', 'Torres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8005', '23', 'Torrinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8006', '23', 'Touro Passo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8007', '23', 'Tramandai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8008', '23', 'Travesseiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8009', '23', 'Trentin' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8010', '23', 'Tres Arroios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8011', '23', 'Tres Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8012', '23', 'Tres Cachoeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8013', '23', 'Tres Coroas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8014', '23', 'Tres de Maio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8015', '23', 'Tres Forquilhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8016', '23', 'Tres Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8017', '23', 'Tres Passos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8018', '23', 'Tres Vendas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8019', '23', 'Trindade do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8020', '23', 'Triunfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8021', '23', 'Tronqueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8022', '23', 'Tucunduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8023', '23', 'Tuiuti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8024', '23', 'Tunas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8025', '23', 'Tunel Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8026', '23', 'Tupanci do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8027', '23', 'Tupancireta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8028', '23', 'Tupancy Ou Vila Block' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8029', '23', 'Tupandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8030', '23', 'Tupantuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8031', '23', 'Tuparendi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8032', '23', 'Tupi Silveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8033', '23', 'Tupinamba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8034', '23', 'Turucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8035', '23', 'Turvinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8036', '23', 'Ubiretama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8037', '23', 'Umbu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8038', '23', 'Uniao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8039', '23', 'Unistalda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8040', '23', 'Uruguaiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8041', '23', 'Vacacai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8042', '23', 'Vacaria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8043', '23', 'Valdastico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8044', '23', 'Vale do Rio Cai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8045', '23', 'Vale do Sol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8046', '23', 'Vale Real' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8047', '23', 'Vale Veneto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8048', '23', 'Vale Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8049', '23', 'Vanini' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8050', '23', 'Venancio Aires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8051', '23', 'Vera Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8052', '23', 'Veranopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8053', '23', 'Vertentes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8054', '23', 'Vespasiano Correa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8055', '23', 'Viadutos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8056', '23', 'Viamao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8057', '23', 'Vicente Dutra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8058', '23', 'Victor Graeff' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8059', '23', 'Vila Bender' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8060', '23', 'Vila Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8061', '23', 'Vila Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8062', '23', 'Vila Langaro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8063', '23', 'Vila Laranjeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8064', '23', 'Vila Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8065', '23', 'Vila Nova do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8066', '23', 'Vila Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8067', '23', 'Vila Seca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8068', '23', 'Vila Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8069', '23', 'Vista Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8070', '23', 'Vista Alegre do Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8071', '23', 'Vista Gaucha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8072', '23', 'Vitoria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8073', '23', 'Vitoria das Missoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8074', '23', 'Volta Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8075', '23', 'Volta Fechada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8076', '23', 'Volta Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8077', '23', 'Xadrez' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8078', '23', 'Xangri-la' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8079', '23', 'Xingu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8080', '24', 'Abdon Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8081', '24', 'Abelardo Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8082', '24', 'Agrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8083', '24', 'Agronomica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8084', '24', 'Agua Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8085', '24', 'Aguas Brancas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8086', '24', 'Aguas Claras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8087', '24', 'Aguas de Chapeco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8088', '24', 'Aguas Frias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8089', '24', 'Aguas Mornas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8090', '24', 'Aguti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8091', '24', 'Aiure' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8092', '24', 'Alfredo Wagner' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8093', '24', 'Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8094', '24', 'Alto Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8095', '24', 'Alto da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8096', '24', 'Anchieta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8097', '24', 'Angelina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8098', '24', 'Anita Garibaldi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8099', '24', 'Anitapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8100', '24', 'Anta Gorda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8101', '24', 'Antonio Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8102', '24', 'Apiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8103', '24', 'Arabuta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8104', '24', 'Araquari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8105', '24', 'Ararangua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8106', '24', 'Armazem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8107', '24', 'Arnopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8108', '24', 'Arroio Trinta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8109', '24', 'Arvoredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8110', '24', 'Ascurra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8111', '24', 'Atalanta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8112', '24', 'Aterrado Torto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8113', '24', 'Aurora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8114', '24', 'Azambuja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8115', '24', 'Baia Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8116', '24', 'Balneario Arroio do Silva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8117', '24', 'Balneario Barra do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8118', '24', 'Balneario Camboriu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8119', '24', 'Balneario Gaivota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8120', '24', 'Balneario Morro dos Conventos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8121', '24', 'Bandeirante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8122', '24', 'Barra Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8123', '24', 'Barra Clara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8124', '24', 'Barra da Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8125', '24', 'Barra da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8126', '24', 'Barra Fria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8127', '24', 'Barra Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8128', '24', 'Barra Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8129', '24', 'Barreiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8130', '24', 'Barro Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8131', '24', 'Bateias de Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8132', '24', 'Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8133', '24', 'Bela Vista do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8134', '24', 'Bela Vista do Toldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8135', '24', 'Belmonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8136', '24', 'Benedito Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8137', '24', 'Biguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8138', '24', 'Blumenau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8139', '24', 'Bocaina do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8140', '24', 'Boiteuxburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8141', '24', 'Bom Jardim da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8142', '24', 'Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8143', '24', 'Bom Jesus do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8144', '24', 'Bom Retiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8145', '24', 'Bom Sucesso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8146', '24', 'Bombinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8147', '24', 'Botuvera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8148', '24', 'Braco do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8149', '24', 'Braco do Trombudo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8150', '24', 'Brunopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8151', '24', 'Brusque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8152', '24', 'Cacador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8153', '24', 'Cachoeira de Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8154', '24', 'Cachoeira do Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8155', '24', 'Caibi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8156', '24', 'Calmon' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8157', '24', 'Camboriu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8158', '24', 'Cambuinzal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8159', '24', 'Campeche' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8160', '24', 'Campinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8161', '24', 'Campo Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8162', '24', 'Campo Belo do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8163', '24', 'Campo Ere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8164', '24', 'Campos Novos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8165', '24', 'Canasvieiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8166', '24', 'Canelinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8167', '24', 'Canoas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8168', '24', 'Canoinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8169', '24', 'Capao Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8170', '24', 'Capinzal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8171', '24', 'Capivari de Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8172', '24', 'Caraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8173', '24', 'Catanduvas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8174', '24', 'Catuira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8175', '24', 'Caxambu do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8176', '24', 'Cedro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8177', '24', 'Celso Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8178', '24', 'Cerro Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8179', '24', 'Chapadao do Lageado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8180', '24', 'Chapeco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8181', '24', 'Claraiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8182', '24', 'Cocal do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8183', '24', 'Colonia Santa Tereza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8184', '24', 'Colonia Santana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8185', '24', 'Concordia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8186', '24', 'Cordilheira Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8187', '24', 'Coronel Freitas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8188', '24', 'Coronel Martins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8189', '24', 'Correia Pinto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8190', '24', 'Corupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8191', '24', 'Criciuma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8192', '24', 'Cunha Pora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8193', '24', 'Cunhatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8194', '24', 'Curitibanos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8195', '24', 'Dal Pai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8196', '24', 'Dalbergia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8197', '24', 'Descanso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8198', '24', 'Dionisio Cerqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8199', '24', 'Dona Emma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8200', '24', 'Doutor Pedrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8201', '24', 'Engenho Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8202', '24', 'Enseada de Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8203', '24', 'Entre Rios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8204', '24', 'Ermo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8205', '24', 'Erval Velho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8206', '24', 'Espinilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8207', '24', 'Estacao Cocal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8208', '24', 'Faxinal dos Guedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8209', '24', 'Fazenda Zandavalli' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8210', '24', 'Felipe Schmidt' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8211', '24', 'Figueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8212', '24', 'Flor do Sertao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8213', '24', 'Florianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8214', '24', 'Formosa do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8215', '24', 'Forquilhinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8216', '24', 'Fragosos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8217', '24', 'Fraiburgo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8218', '24', 'Frederico Wastner' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8219', '24', 'Frei Rogerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8220', '24', 'Galvao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8221', '24', 'Garcia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8222', '24', 'Garopaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8223', '24', 'Garuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8224', '24', 'Gaspar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8225', '24', 'Goio-en' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8226', '24', 'Governador Celso Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8227', '24', 'Grao Para' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8228', '24', 'Grapia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8229', '24', 'Gravatal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8230', '24', 'Guabiruba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8231', '24', 'Guaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8232', '24', 'Guaraciaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8233', '24', 'Guaramirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8234', '24', 'Guaruja do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8235', '24', 'Guata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8236', '24', 'Guatambu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8237', '24', 'Hercilio Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8238', '24', 'Herciliopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8239', '24', 'Herval D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8240', '24', 'Ibiam' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8241', '24', 'Ibicare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8242', '24', 'Ibicui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8243', '24', 'Ibirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8244', '24', 'Icara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8245', '24', 'Ilhota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8246', '24', 'Imarui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8247', '24', 'Imbituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8248', '24', 'Imbuia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8249', '24', 'Indaial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8250', '24', 'Indios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8251', '24', 'Ingleses do Rio Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8252', '24', 'Invernada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8253', '24', 'Iomere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8254', '24', 'Ipira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8255', '24', 'Ipomeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8256', '24', 'Ipora do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8257', '24', 'Ipuacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8258', '24', 'Ipumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8259', '24', 'Iraceminha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8260', '24', 'Irakitan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8261', '24', 'Irani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8262', '24', 'Iraputa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8263', '24', 'Irati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8264', '24', 'Irineopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8265', '24', 'Ita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8266', '24', 'Itaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8267', '24', 'Itaiopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8268', '24', 'Itajai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8269', '24', 'Itajuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8270', '24', 'Itapema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8271', '24', 'Itapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8272', '24', 'Itapoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8273', '24', 'Itapocu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8274', '24', 'Itoupava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8275', '24', 'Ituporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8276', '24', 'Jabora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8277', '24', 'Jacinto Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8278', '24', 'Jaguaruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8279', '24', 'Jaragua do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8280', '24', 'Jardinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8281', '24', 'Joacaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8282', '24', 'Joinville' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8283', '24', 'Jose Boiteux' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8284', '24', 'Jupia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8285', '24', 'Lacerdopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8286', '24', 'Lages' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8287', '24', 'Lagoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8288', '24', 'Lagoa da Estiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8289', '24', 'Laguna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8290', '24', 'Lajeado Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8291', '24', 'Laurentino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8292', '24', 'Lauro Muller' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8293', '24', 'Leao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8294', '24', 'Lebon Regis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8295', '24', 'Leoberto Leal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8296', '24', 'Lindoia do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8297', '24', 'Linha das Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8298', '24', 'Lontras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8299', '24', 'Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8300', '24', 'Luiz Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8301', '24', 'Luzerna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8302', '24', 'Machados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8303', '24', 'Macieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8304', '24', 'Mafra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8305', '24', 'Major Gercino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8306', '24', 'Major Vieira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8307', '24', 'Maracaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8308', '24', 'Marari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8309', '24', 'Marata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8310', '24', 'Maravilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8311', '24', 'Marcilio Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8312', '24', 'Marechal Bormann' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8313', '24', 'Marema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8314', '24', 'Mariflor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8315', '24', 'Marombas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8316', '24', 'Marombas Bossardi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8317', '24', 'Massaranduba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8318', '24', 'Matos Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8319', '24', 'Meleiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8320', '24', 'Mirador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8321', '24', 'Mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8322', '24', 'Mirim Doce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8323', '24', 'Modelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8324', '24', 'Mondai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8325', '24', 'Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8326', '24', 'Monte Carlo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8327', '24', 'Monte Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8328', '24', 'Morro Chato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8329', '24', 'Morro da Fumaca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8330', '24', 'Morro do Meio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8331', '24', 'Morro Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8332', '24', 'Navegantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8333', '24', 'Nossa Senhora de Caravaggio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8334', '24', 'Nova Cultura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8335', '24', 'Nova Erechim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8336', '24', 'Nova Guarita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8337', '24', 'Nova Itaberaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8338', '24', 'Nova Petropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8339', '24', 'Nova Teutonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8340', '24', 'Nova Trento' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8341', '24', 'Nova Veneza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8342', '24', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8343', '24', 'Orleans' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8344', '24', 'Otacilio Costa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8345', '24', 'Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8346', '24', 'Ouro Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8347', '24', 'Paial' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8348', '24', 'Painel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8349', '24', 'Palhoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8350', '24', 'Palma Sola' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8351', '24', 'Palmeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8352', '24', 'Palmitos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8353', '24', 'Pantano do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8354', '24', 'Papanduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8355', '24', 'Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8356', '24', 'Passo de Torres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8357', '24', 'Passo Manso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8358', '24', 'Passos Maia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8359', '24', 'Paula Pereira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8360', '24', 'Paulo Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8361', '24', 'Pedras Grandes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8362', '24', 'Penha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8363', '24', 'Perico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8364', '24', 'Peritiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8365', '24', 'Pescaria Brava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8366', '24', 'Petrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8367', '24', 'Picarras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8368', '24', 'Pindotiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8369', '24', 'Pinhalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8370', '24', 'Pinheiral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8371', '24', 'Pinheiro Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8372', '24', 'Pinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8373', '24', 'Pirabeiraba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8374', '24', 'Piratuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8375', '24', 'Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8376', '24', 'Planalto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8377', '24', 'Poco Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8378', '24', 'Pomerode' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8379', '24', 'Ponte Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8380', '24', 'Ponte Alta do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8381', '24', 'Ponte Serrada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8382', '24', 'Porto Belo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8383', '24', 'Porto Uniao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8384', '24', 'Pouso Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8385', '24', 'Praia Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8386', '24', 'Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8387', '24', 'Presidente Castelo Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8388', '24', 'Presidente Getulio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8389', '24', 'Presidente Juscelino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8390', '24', 'Presidente Kennedy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8391', '24', 'Presidente Nereu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8392', '24', 'Princesa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8393', '24', 'Quarta Linha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8394', '24', 'Quilombo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8395', '24', 'Quilometro Doze' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8396', '24', 'Rancho Queimado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8397', '24', 'Ratones' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8398', '24', 'Residencia Fuck' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8399', '24', 'Ribeirao da Ilha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8400', '24', 'Ribeirao Pequeno' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8401', '24', 'Rio Antinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8402', '24', 'Rio Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8403', '24', 'Rio D\'una' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8404', '24', 'Rio da Anta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8405', '24', 'Rio da Luz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8406', '24', 'Rio das Antas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8407', '24', 'Rio das Furnas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8408', '24', 'Rio do Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8409', '24', 'Rio do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8410', '24', 'Rio do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8411', '24', 'Rio dos Bugres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8412', '24', 'Rio dos Cedros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8413', '24', 'Rio Fortuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8414', '24', 'Rio Maina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8415', '24', 'Rio Negrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8416', '24', 'Rio Preto do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8417', '24', 'Rio Rufino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8418', '24', 'Riqueza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8419', '24', 'Rodeio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8420', '24', 'Romelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8421', '24', 'Sai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8422', '24', 'Salete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8423', '24', 'Saltinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8424', '24', 'Salto Veloso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8425', '24', 'Sanga da Toca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8426', '24', 'Sangao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8427', '24', 'Santa Cecilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8428', '24', 'Santa Cruz do Timbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8429', '24', 'Santa Helena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8430', '24', 'Santa Izabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8431', '24', 'Santa Lucia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8432', '24', 'Santa Maria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8433', '24', 'Santa Rosa de Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8434', '24', 'Santa Rosa do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8435', '24', 'Santa Terezinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8436', '24', 'Santa Terezinha do Progresso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8437', '24', 'Santa Terezinha do Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8438', '24', 'Santiago do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8439', '24', 'Santo Amaro da Imperatriz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8440', '24', 'Santo Antonio de Lisboa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8441', '24', 'Sao Bento Baixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8442', '24', 'Sao Bento do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8443', '24', 'Sao Bernardino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8444', '24', 'Sao Bonifacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8445', '24', 'Sao Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8446', '24', 'Sao Cristovao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8447', '24', 'Sao Cristovao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8448', '24', 'Sao Defende' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8449', '24', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8450', '24', 'Sao Francisco do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8451', '24', 'Sao Gabriel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8452', '24', 'Sao Joao Batista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8453', '24', 'Sao Joao do Itaperiu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8454', '24', 'Sao Joao do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8455', '24', 'Sao Joao do Rio Vermelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8456', '24', 'Sao Joao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8457', '24', 'Sao Joaquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8458', '24', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8459', '24', 'Sao Jose do Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8460', '24', 'Sao Jose do Cerrito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8461', '24', 'Sao Jose do Laranjal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8462', '24', 'Sao Leonardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8463', '24', 'Sao Lourenco do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8464', '24', 'Sao Ludgero' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8465', '24', 'Sao Martinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8466', '24', 'Sao Miguel D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8467', '24', 'Sao Miguel da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8468', '24', 'Sao Miguel da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8469', '24', 'Sao Pedro de Alcantara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8470', '24', 'Sao Pedro Tobias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8471', '24', 'Sao Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8472', '24', 'Sao Sebastiao do Arvoredo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8473', '24', 'Sao Sebastiao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8474', '24', 'Sapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8475', '24', 'Saudades' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8476', '24', 'Schroeder' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8477', '24', 'Seara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8478', '24', 'Sede Oldemburg' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8479', '24', 'Serra Alta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8480', '24', 'Sertao do Maruim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8481', '24', 'Sideropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8482', '24', 'Sombrio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8483', '24', 'Sorocaba do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8484', '24', 'Sul Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8485', '24', 'Taio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8486', '24', 'Tangara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8487', '24', 'Taquara Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8488', '24', 'Taquaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8489', '24', 'Tigipio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8490', '24', 'Tigrinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8491', '24', 'Tijucas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8492', '24', 'Timbe do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8493', '24', 'Timbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8494', '24', 'Timbo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8495', '24', 'Tres Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8496', '24', 'Treviso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8497', '24', 'Treze de Maio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8498', '24', 'Treze Tilias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8499', '24', 'Trombudo Central' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8500', '24', 'Tubarao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8501', '24', 'Tunapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8502', '24', 'Tupitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8503', '24', 'Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8504', '24', 'Uniao do Oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8505', '24', 'Urubici' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8506', '24', 'Uruguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8507', '24', 'Urupema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8508', '24', 'Urussanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8509', '24', 'Vargeao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8510', '24', 'Vargem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8511', '24', 'Vargem Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8512', '24', 'Vargem do Cedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8513', '24', 'Vidal Ramos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8514', '24', 'Videira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8515', '24', 'Vila Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8516', '24', 'Vila de Volta Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8517', '24', 'Vila Milani' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8518', '24', 'Vila Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8519', '24', 'Vitor Meireles' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8520', '24', 'Witmarsum' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8521', '24', 'Xanxere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8522', '24', 'Xavantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8523', '24', 'Xaxim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8524', '24', 'Zortea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8525', '25', 'Altos Verdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8526', '25', 'Amparo de Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8527', '25', 'Aquidaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8528', '25', 'Aracaju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8529', '25', 'Araua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8530', '25', 'Areia Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8531', '25', 'Barra dos Coqueiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8532', '25', 'Barracas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8533', '25', 'Boquim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8534', '25', 'Brejo Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8535', '25', 'Campo do Brito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8536', '25', 'Canhoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8537', '25', 'Caninde de Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8538', '25', 'Capela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8539', '25', 'Carira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8540', '25', 'Carmopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8541', '25', 'Cedro de Sao Joao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8542', '25', 'Cristinapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8543', '25', 'Cumbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8544', '25', 'Divina Pastora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8545', '25', 'Estancia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8546', '25', 'Feira Nova' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8547', '25', 'Frei Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8548', '25', 'Gararu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8549', '25', 'General Maynard' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8550', '25', 'Graccho Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8551', '25', 'Ilha das Flores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8552', '25', 'Indiaroba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8553', '25', 'Itabaiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8554', '25', 'Itabaianinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8555', '25', 'Itabi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8556', '25', 'Itaporanga D\'ajuda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8557', '25', 'Japaratuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8558', '25', 'Japoata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8559', '25', 'Lagarto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8560', '25', 'Lagoa Funda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8561', '25', 'Laranjeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8562', '25', 'Macambira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8563', '25', 'Malhada dos Bois' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8564', '25', 'Malhador' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8565', '25', 'Maruim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8566', '25', 'Miranda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8567', '25', 'Moita Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8568', '25', 'Monte Alegre de Sergipe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8569', '25', 'Mosqueiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8570', '25', 'Muribeca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8571', '25', 'Neopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8572', '25', 'Nossa Senhora Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8573', '25', 'Nossa Senhora da Gloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8574', '25', 'Nossa Senhora das Dores' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8575', '25', 'Nossa Senhora de Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8576', '25', 'Nossa Senhora do Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8577', '25', 'Pacatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8578', '25', 'Palmares' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8579', '25', 'Pedra Mole' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8580', '25', 'Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8581', '25', 'Pedrinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8582', '25', 'Pinhao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8583', '25', 'Pirambu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8584', '25', 'Poco Redondo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8585', '25', 'Poco Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8586', '25', 'Porto da Folha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8587', '25', 'Propria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8588', '25', 'Riachao do Dantas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8589', '25', 'Riachuelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8590', '25', 'Ribeiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8591', '25', 'Rosario do Catete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8592', '25', 'Salgado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8593', '25', 'Samambaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8594', '25', 'Santa Luzia do Itanhy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8595', '25', 'Santa Rosa de Lima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8596', '25', 'Santana do Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8597', '25', 'Santo Amaro das Brotas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8598', '25', 'Sao Cristovao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8599', '25', 'Sao Domingos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8600', '25', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8601', '25', 'Sao Jose' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8602', '25', 'Sao Mateus da Palestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8603', '25', 'Sao Miguel do Aleixo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8604', '25', 'Simao Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8605', '25', 'Siriri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8606', '25', 'Telha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8607', '25', 'Tobias Barreto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8608', '25', 'Tomar do Geru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8609', '25', 'Umbauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8610', '26', 'Adamantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8611', '26', 'Adolfo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8612', '26', 'Agisse' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8613', '26', 'Agua Vermelha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8614', '26', 'Aguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8615', '26', 'Aguas da Prata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8616', '26', 'Aguas de Lindoia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8617', '26', 'Aguas de Santa Barbara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8618', '26', 'Aguas de Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8619', '26', 'Agudos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8620', '26', 'Agulha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8621', '26', 'Ajapi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8622', '26', 'Alambari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8623', '26', 'Alberto Moreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8624', '26', 'Aldeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8625', '26', 'Aldeia de Carapicuiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8626', '26', 'Alfredo Guedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8627', '26', 'Alfredo Marcondes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8628', '26', 'Altair' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8629', '26', 'Altinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8630', '26', 'Alto Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8631', '26', 'Alto Pora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8632', '26', 'Aluminio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8633', '26', 'Alvares Florence' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8634', '26', 'Alvares Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8635', '26', 'Alvaro de Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8636', '26', 'Alvinlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8637', '26', 'Amadeu Amaral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8638', '26', 'Amandaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8639', '26', 'Ameliopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8640', '26', 'Americana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8641', '26', 'Americo Brasiliense' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8642', '26', 'Americo de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8643', '26', 'Amparo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8644', '26', 'Ana Dias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8645', '26', 'Analandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8646', '26', 'Anapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8647', '26', 'Andes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8648', '26', 'Andradina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8649', '26', 'Angatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8650', '26', 'Anhembi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8651', '26', 'Anhumas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8652', '26', 'Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8653', '26', 'Aparecida D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8654', '26', 'Aparecida de Monte Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8655', '26', 'Aparecida de Sao Manuel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8656', '26', 'Aparecida do Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8657', '26', 'Apiai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8658', '26', 'Apiai-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8659', '26', 'Arabela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8660', '26', 'Aracacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8661', '26', 'Aracaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8662', '26', 'Aracariguama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8663', '26', 'Aracatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8664', '26', 'Aracoiaba da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8665', '26', 'Aramina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8666', '26', 'Arandu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8667', '26', 'Arapei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8668', '26', 'Araraquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8669', '26', 'Araras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8670', '26', 'Araxas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8671', '26', 'Arcadas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8672', '26', 'Arco-iris' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8673', '26', 'Arealva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8674', '26', 'Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8675', '26', 'Areiopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8676', '26', 'Ariranha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8677', '26', 'Ariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8678', '26', 'Artemis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8679', '26', 'Artur Nogueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8680', '26', 'Aruja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8681', '26', 'Aspasia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8682', '26', 'Assis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8683', '26', 'Assistencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8684', '26', 'Atibaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8685', '26', 'Atlantida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8686', '26', 'Auriflama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8687', '26', 'Avai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8688', '26', 'Avanhandava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8689', '26', 'Avare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8690', '26', 'Avencas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8691', '26', 'Bacaetava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8692', '26', 'Bacuriti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8693', '26', 'Bady Bassitt' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8694', '26', 'Baguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8695', '26', 'Bairro Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8696', '26', 'Balbinos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8697', '26', 'Balsamo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8698', '26', 'Bananal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8699', '26', 'Bandeirantes D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8700', '26', 'Barao Ataliba Nogueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8701', '26', 'Barao de Antonina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8702', '26', 'Barao de Geraldo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8703', '26', 'Barbosa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8704', '26', 'Bariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8705', '26', 'Barra Bonita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8706', '26', 'Barra do Chapeu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8707', '26', 'Barra do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8708', '26', 'Barra Dourada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8709', '26', 'Barrania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8710', '26', 'Barretos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8711', '26', 'Barrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8712', '26', 'Barueri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8713', '26', 'Bastos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8714', '26', 'Batatais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8715', '26', 'Batatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8716', '26', 'Batista Botelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8717', '26', 'Bauru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8718', '26', 'Bebedouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8719', '26', 'Bela Floresta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8720', '26', 'Bela Vista Sao-carlense' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8721', '26', 'Bento de Abreu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8722', '26', 'Bernardino de Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8723', '26', 'Bertioga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8724', '26', 'Bilac' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8725', '26', 'Birigui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8726', '26', 'Biritiba-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8727', '26', 'Biritiba-ussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8728', '26', 'Boa Esperanca do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8729', '26', 'Boa Vista dos Andradas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8730', '26', 'Boa Vista Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8731', '26', 'Bocaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8732', '26', 'Bofete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8733', '26', 'Boituva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8734', '26', 'Bom Fim do Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8735', '26', 'Bom Jesus dos Perdoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8736', '26', 'Bom Retiro da Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8737', '26', 'Bom Sucesso de Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8738', '26', 'Bonfim Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8739', '26', 'Bora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8740', '26', 'Boraceia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8741', '26', 'Borborema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8742', '26', 'Borebi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8743', '26', 'Botafogo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8744', '26', 'Botelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8745', '26', 'Botucatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8746', '26', 'Botujuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8747', '26', 'Braco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8748', '26', 'Braganca Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8749', '26', 'Bras Cubas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8750', '26', 'Brasitania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8751', '26', 'Brauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8752', '26', 'Brejo Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8753', '26', 'Brodowski' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8754', '26', 'Brotas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8755', '26', 'Bueno de Andrada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8756', '26', 'Buri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8757', '26', 'Buritama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8758', '26', 'Buritizal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8759', '26', 'Cabralia Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8760', '26', 'Cabreuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8761', '26', 'Cacapava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8762', '26', 'Cachoeira de Emas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8763', '26', 'Cachoeira Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8764', '26', 'Caconde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8765', '26', 'Cafelandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8766', '26', 'Cafesopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8767', '26', 'Caiabu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8768', '26', 'Caibura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8769', '26', 'Caieiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8770', '26', 'Caiua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8771', '26', 'Cajamar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8772', '26', 'Cajati' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8773', '26', 'Cajobi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8774', '26', 'Cajuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8775', '26', 'Cambaquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8776', '26', 'Cambaratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8777', '26', 'Campestrinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8778', '26', 'Campina de Fora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8779', '26', 'Campina do Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8780', '26', 'Campinal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8781', '26', 'Campinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8782', '26', 'Campo Limpo Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8783', '26', 'Campos de Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8784', '26', 'Campos do Jordao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8785', '26', 'Campos Novos Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8786', '26', 'Cananeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8787', '26', 'Canas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8788', '26', 'Candia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8789', '26', 'Candido Mota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8790', '26', 'Candido Rodrigues' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8791', '26', 'Canguera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8792', '26', 'Canitar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8793', '26', 'Capao Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8794', '26', 'Capela do Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8795', '26', 'Capivari' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8796', '26', 'Capivari da Mata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8797', '26', 'Caporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8798', '26', 'Capuava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8799', '26', 'Caraguatatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8800', '26', 'Carapicuiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8801', '26', 'Cardeal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8802', '26', 'Cardoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8803', '26', 'Caruara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8804', '26', 'Casa Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8805', '26', 'Cassia dos Coqueiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8806', '26', 'Castilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8807', '26', 'Catanduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8808', '26', 'Catigua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8809', '26', 'Catucaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8810', '26', 'Caucaia do Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8811', '26', 'Cedral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8812', '26', 'Cerqueira Cesar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8813', '26', 'Cerquilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8814', '26', 'Cesario Lange' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8815', '26', 'Cezar de Souza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8816', '26', 'Charqueada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8817', '26', 'Chavantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8818', '26', 'Cipo-guacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8819', '26', 'Clarinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8820', '26', 'Clementina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8821', '26', 'Cocaes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8822', '26', 'Colina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8823', '26', 'Colombia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8824', '26', 'Conceicao de Monte Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8825', '26', 'Conchal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8826', '26', 'Conchas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8827', '26', 'Cordeiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8828', '26', 'Coroados' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8829', '26', 'Coronel Goulart' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8830', '26', 'Coronel Macedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8831', '26', 'Corredeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8832', '26', 'Corrego Rico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8833', '26', 'Corumbatai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8834', '26', 'Cosmopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8835', '26', 'Cosmorama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8836', '26', 'Costa Machado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8837', '26', 'Cotia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8838', '26', 'Cravinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8839', '26', 'Cristais Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8840', '26', 'Cruz das Posses' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8841', '26', 'Cruzalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8842', '26', 'Cruzeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8843', '26', 'Cubatao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8844', '26', 'Cuiaba Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8845', '26', 'Cunha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8846', '26', 'Curupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8847', '26', 'Dalas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8848', '26', 'Descalvado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8849', '26', 'Diadema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8850', '26', 'Dirce Reis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8851', '26', 'Dirceu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8852', '26', 'Divinolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8853', '26', 'Dobrada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8854', '26', 'Dois Corregos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8855', '26', 'Dolcinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8856', '26', 'Domelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8857', '26', 'Dourado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8858', '26', 'Dracena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8859', '26', 'Duartina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8860', '26', 'Dumont' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8861', '26', 'Duplo Ceu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8862', '26', 'Echapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8863', '26', 'Eldorado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8864', '26', 'Eleuterio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8865', '26', 'Elias Fausto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8866', '26', 'Elisiario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8867', '26', 'Embauba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8868', '26', 'Embu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8869', '26', 'Embu-guacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8870', '26', 'Emilianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8871', '26', 'Eneida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8872', '26', 'Engenheiro Balduino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8873', '26', 'Engenheiro Coelho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8874', '26', 'Engenheiro Maia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8875', '26', 'Engenheiro Schmidt' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8876', '26', 'Esmeralda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8877', '26', 'Esperanca D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8878', '26', 'Espigao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8879', '26', 'Espirito Santo do Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8880', '26', 'Espirito Santo do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8881', '26', 'Estiva Gerbi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8882', '26', 'Estrela D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8883', '26', 'Estrela do Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8884', '26', 'Euclides da Cunha Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8885', '26', 'Eugenio de Melo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8886', '26', 'Fartura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8887', '26', 'Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8888', '26', 'Fatima Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8889', '26', 'Fazenda Velha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8890', '26', 'Fernando Prestes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8891', '26', 'Fernandopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8892', '26', 'Fernao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8893', '26', 'Ferraz de Vasconcelos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8894', '26', 'Flora Rica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8895', '26', 'Floreal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8896', '26', 'Floresta do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8897', '26', 'Florida Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8898', '26', 'Florinea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8899', '26', 'Franca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8900', '26', 'Francisco Morato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8901', '26', 'Franco da Rocha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8902', '26', 'Frutal do Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8903', '26', 'Gabriel Monteiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8904', '26', 'Galia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8905', '26', 'Garca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8906', '26', 'Gardenia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8907', '26', 'Gastao Vidigal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8908', '26', 'Gaviao Peixoto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8909', '26', 'General Salgado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8910', '26', 'Getulina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8911', '26', 'Glicerio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8912', '26', 'Gramadinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8913', '26', 'Guachos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8914', '26', 'Guaianas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8915', '26', 'Guaicara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8916', '26', 'Guaimbe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8917', '26', 'Guaira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8918', '26', 'Guamium' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8919', '26', 'Guapiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8920', '26', 'Guapiara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8921', '26', 'Guapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8922', '26', 'Guara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8923', '26', 'Guaracai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8924', '26', 'Guaraci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8925', '26', 'Guaraciaba D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8926', '26', 'Guarani D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8927', '26', 'Guaranta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8928', '26', 'Guarapiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8929', '26', 'Guarapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8930', '26', 'Guararapes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8931', '26', 'Guararema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8932', '26', 'Guaratingueta' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8933', '26', 'Guarei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8934', '26', 'Guariba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8935', '26', 'Guariroba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8936', '26', 'Guarizinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8937', '26', 'Guaruja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8938', '26', 'Guarulhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8939', '26', 'Guatapara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8940', '26', 'Guzolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8941', '26', 'Herculandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8942', '26', 'Holambra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8943', '26', 'Holambra Ii' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8944', '26', 'Hortolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8945', '26', 'Iacanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8946', '26', 'Iacri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8947', '26', 'Iaras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8948', '26', 'Ibate' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8949', '26', 'Ibiporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8950', '26', 'Ibira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8951', '26', 'Ibirarema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8952', '26', 'Ibitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8953', '26', 'Ibitiruna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8954', '26', 'Ibitiuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8955', '26', 'Ibitu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8956', '26', 'Ibiuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8957', '26', 'Icem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8958', '26', 'Ida Iolanda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8959', '26', 'Iepe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8960', '26', 'Igacaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8961', '26', 'Igaracu do Tiete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8962', '26', 'Igarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8963', '26', 'Igarapava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8964', '26', 'Igarata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8965', '26', 'Iguape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8966', '26', 'Ilha Comprida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8967', '26', 'Ilha Diana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8968', '26', 'Ilha Solteira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8969', '26', 'Ilhabela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8970', '26', 'Indaia do Aguapei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8971', '26', 'Indaiatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8972', '26', 'Indiana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8973', '26', 'Indiapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8974', '26', 'Ingas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8975', '26', 'Inubia Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8976', '26', 'Ipaussu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8977', '26', 'Ipero' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8978', '26', 'Ipeuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8979', '26', 'Ipigua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8980', '26', 'Iporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8981', '26', 'Ipua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8982', '26', 'Iracemapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8983', '26', 'Irape' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8984', '26', 'Irapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8985', '26', 'Irapuru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8986', '26', 'Itabera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8987', '26', 'Itaboa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8988', '26', 'Itai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8989', '26', 'Itaiuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8990', '26', 'Itajobi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8991', '26', 'Itaju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8992', '26', 'Itanhaem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8993', '26', 'Itaoca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8994', '26', 'Itapecerica da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8995', '26', 'Itapetininga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8996', '26', 'Itapeuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8997', '26', 'Itapeva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8998', '26', 'Itapevi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '8999', '26', 'Itapira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9000', '26', 'Itapirapua Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9001', '26', 'Itapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9002', '26', 'Itaporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9003', '26', 'Itapui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9004', '26', 'Itapura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9005', '26', 'Itaquaquecetuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9006', '26', 'Itaqueri da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9007', '26', 'Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9008', '26', 'Itariri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9009', '26', 'Itatiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9010', '26', 'Itatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9011', '26', 'Itirapina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9012', '26', 'Itirapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9013', '26', 'Itobi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9014', '26', 'Itororo do Paranapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9015', '26', 'Itu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9016', '26', 'Itupeva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9017', '26', 'Ituverava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9018', '26', 'Iubatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9019', '26', 'Jaborandi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9020', '26', 'Jaboticabal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9021', '26', 'Jacare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9022', '26', 'Jacarei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9023', '26', 'Jaci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9024', '26', 'Jacipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9025', '26', 'Jacuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9026', '26', 'Jacupiranga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9027', '26', 'Jafa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9028', '26', 'Jaguariuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9029', '26', 'Jales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9030', '26', 'Jamaica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9031', '26', 'Jambeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9032', '26', 'Jandira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9033', '26', 'Jardim Belval' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9034', '26', 'Jardim Presidente Dutra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9035', '26', 'Jardim Santa Luzia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9036', '26', 'Jardim Silveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9037', '26', 'Jardinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9038', '26', 'Jarinu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9039', '26', 'Jatoba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9040', '26', 'Jau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9041', '26', 'Jeriquara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9042', '26', 'Joanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9043', '26', 'Joao Ramalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9044', '26', 'Joaquim Egidio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9045', '26', 'Jordanesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9046', '26', 'Jose Bonifacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9047', '26', 'Juliania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9048', '26', 'Julio Mesquita' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9049', '26', 'Jumirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9050', '26', 'Jundiai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9051', '26', 'Jundiapeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9052', '26', 'Junqueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9053', '26', 'Junqueiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9054', '26', 'Juquia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9055', '26', 'Juquiratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9056', '26', 'Juquitiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9057', '26', 'Juritis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9058', '26', 'Juruce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9059', '26', 'Jurupeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9060', '26', 'Jurupema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9061', '26', 'Lacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9062', '26', 'Lagoa Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9063', '26', 'Lagoa Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9064', '26', 'Lagoinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9065', '26', 'Laranjal Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9066', '26', 'Laras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9067', '26', 'Lauro Penteado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9068', '26', 'Lavinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9069', '26', 'Lavrinhas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9070', '26', 'Leme' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9071', '26', 'Lencois Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9072', '26', 'Limeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9073', '26', 'Lindoia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9074', '26', 'Lins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9075', '26', 'Lobo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9076', '26', 'Lorena' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9077', '26', 'Lourdes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9078', '26', 'Louveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9079', '26', 'Lucelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9080', '26', 'Lucianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9081', '26', 'Luis Antonio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9082', '26', 'Luiziania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9083', '26', 'Lupercio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9084', '26', 'Lusitania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9085', '26', 'Lutecia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9086', '26', 'Macatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9087', '26', 'Macaubal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9088', '26', 'Macedonia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9089', '26', 'Macucos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9090', '26', 'Magda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9091', '26', 'Mailasqui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9092', '26', 'Mairinque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9093', '26', 'Mairipora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9094', '26', 'Major Prado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9095', '26', 'Manduri' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9096', '26', 'Mangaratu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9097', '26', 'Maraba Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9098', '26', 'Maracai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9099', '26', 'Marapoama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9100', '26', 'Marcondesia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9101', '26', 'Maresias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9102', '26', 'Mariapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9103', '26', 'Marilia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9104', '26', 'Marinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9105', '26', 'Maristela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9106', '26', 'Martim Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9107', '26', 'Martinho Prado Junior' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9108', '26', 'Martinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9109', '26', 'Matao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9110', '26', 'Maua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9111', '26', 'Mendonca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9112', '26', 'Meridiano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9113', '26', 'Mesopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9114', '26', 'Miguelopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9115', '26', 'Mineiros do Tiete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9116', '26', 'Mira Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9117', '26', 'Miracatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9118', '26', 'Miraluz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9119', '26', 'Mirandopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9120', '26', 'Mirante do Paranapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9121', '26', 'Mirassol' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9122', '26', 'Mirassolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9123', '26', 'Mococa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9124', '26', 'Mogi das Cruzes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9125', '26', 'Mogi-guacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9126', '26', 'Mogi-mirim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9127', '26', 'Mombuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9128', '26', 'Moncoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9129', '26', 'Mongagua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9130', '26', 'Montalvao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9131', '26', 'Monte Alegre do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9132', '26', 'Monte Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9133', '26', 'Monte Aprazivel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9134', '26', 'Monte Azul Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9135', '26', 'Monte Cabrao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9136', '26', 'Monte Castelo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9137', '26', 'Monte Mor' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9138', '26', 'Monte Verde Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9139', '26', 'Monteiro Lobato' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9140', '26', 'Moreira Cesar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9141', '26', 'Morro Agudo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9142', '26', 'Morro do Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9143', '26', 'Morungaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9144', '26', 'Mostardas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9145', '26', 'Motuca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9146', '26', 'Mourao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9147', '26', 'Murutinga do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9148', '26', 'Nantes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9149', '26', 'Narandiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9150', '26', 'Natividade da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9151', '26', 'Nazare Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9152', '26', 'Neves Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9153', '26', 'Nhandeara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9154', '26', 'Nipoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9155', '26', 'Nogueira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9156', '26', 'Nossa Senhora do Remedio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9157', '26', 'Nova Alexandria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9158', '26', 'Nova Alianca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9159', '26', 'Nova America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9160', '26', 'Nova Aparecida' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9161', '26', 'Nova Campina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9162', '26', 'Nova Canaa Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9163', '26', 'Nova Castilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9164', '26', 'Nova Europa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9165', '26', 'Nova Granada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9166', '26', 'Nova Guataporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9167', '26', 'Nova Independencia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9168', '26', 'Nova Itapirema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9169', '26', 'Nova Luzitania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9170', '26', 'Nova Odessa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9171', '26', 'Nova Patria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9172', '26', 'Nova Veneza' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9173', '26', 'Novais' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9174', '26', 'Novo Cravinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9175', '26', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9176', '26', 'Nuporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9177', '26', 'Oasis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9178', '26', 'Ocaucu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9179', '26', 'Oleo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9180', '26', 'Olimpia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9181', '26', 'Oliveira Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9182', '26', 'Onda Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9183', '26', 'Onda Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9184', '26', 'Oriente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9185', '26', 'Orindiuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9186', '26', 'Orlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9187', '26', 'Osasco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9188', '26', 'Oscar Bressane' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9189', '26', 'Osvaldo Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9190', '26', 'Ourinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9191', '26', 'Ouro Fino Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9192', '26', 'Ouro Verde' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9193', '26', 'Ouroeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9194', '26', 'Pacaembu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9195', '26', 'Padre Nobrega' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9196', '26', 'Palestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9197', '26', 'Palmares Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9198', '26', 'Palmeira D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9199', '26', 'Palmeiras de Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9200', '26', 'Palmital' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9201', '26', 'Panorama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9202', '26', 'Paraguacu Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9203', '26', 'Paraibuna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9204', '26', 'Paraiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9205', '26', 'Paraisolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9206', '26', 'Paranabi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9207', '26', 'Paranapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9208', '26', 'Paranapiacaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9209', '26', 'Paranapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9210', '26', 'Parapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9211', '26', 'Pardinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9212', '26', 'Pariquera-acu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9213', '26', 'Parisi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9214', '26', 'Parnaso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9215', '26', 'Parque Meia Lua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9216', '26', 'Paruru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9217', '26', 'Patrocinio Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9218', '26', 'Pauliceia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9219', '26', 'Paulinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9220', '26', 'Paulistania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9221', '26', 'Paulo de Faria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9222', '26', 'Paulopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9223', '26', 'Pederneiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9224', '26', 'Pedra Bela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9225', '26', 'Pedra Branca de Itarare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9226', '26', 'Pedranopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9227', '26', 'Pedregulho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9228', '26', 'Pedreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9229', '26', 'Pedrinhas Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9230', '26', 'Pedro Barros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9231', '26', 'Pedro de Toledo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9232', '26', 'Penapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9233', '26', 'Pereira Barreto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9234', '26', 'Pereiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9235', '26', 'Peruibe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9236', '26', 'Piacatu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9237', '26', 'Picinguaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9238', '26', 'Piedade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9239', '26', 'Pilar do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9240', '26', 'Pindamonhangaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9241', '26', 'Pindorama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9242', '26', 'Pinhalzinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9243', '26', 'Pinheiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9244', '26', 'Pioneiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9245', '26', 'Piquerobi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9246', '26', 'Piquete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9247', '26', 'Piracaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9248', '26', 'Piracicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9249', '26', 'Piraju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9250', '26', 'Pirajui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9251', '26', 'Piramboia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9252', '26', 'Pirangi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9253', '26', 'Pirapitingui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9254', '26', 'Pirapora do Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9255', '26', 'Pirapozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9256', '26', 'Pirassununga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9257', '26', 'Piratininga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9258', '26', 'Pitangueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9259', '26', 'Planalto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9260', '26', 'Planalto do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9261', '26', 'Platina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9262', '26', 'Poa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9263', '26', 'Poloni' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9264', '26', 'Polvilho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9265', '26', 'Pompeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9266', '26', 'Pongai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9267', '26', 'Pontal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9268', '26', 'Pontalinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9269', '26', 'Pontes Gestal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9270', '26', 'Populina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9271', '26', 'Porangaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9272', '26', 'Porto Feliz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9273', '26', 'Porto Ferreira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9274', '26', 'Porto Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9275', '26', 'Potim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9276', '26', 'Potirendaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9277', '26', 'Potunduva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9278', '26', 'Pracinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9279', '26', 'Pradinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9280', '26', 'Pradopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9281', '26', 'Praia Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9282', '26', 'Pratania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9283', '26', 'Presidente Alves' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9284', '26', 'Presidente Bernardes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9285', '26', 'Presidente Epitacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9286', '26', 'Presidente Prudente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9287', '26', 'Presidente Venceslau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9288', '26', 'Primavera' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9289', '26', 'Promissao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9290', '26', 'Prudencio E Moraes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9291', '26', 'Quadra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9292', '26', 'Quata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9293', '26', 'Queiroz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9294', '26', 'Queluz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9295', '26', 'Quintana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9296', '26', 'Quiririm' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9297', '26', 'Rafard' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9298', '26', 'Rancharia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9299', '26', 'Rechan' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9300', '26', 'Redencao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9301', '26', 'Regente Feijo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9302', '26', 'Reginopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9303', '26', 'Registro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9304', '26', 'Restinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9305', '26', 'Riacho Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9306', '26', 'Ribeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9307', '26', 'Ribeirao Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9308', '26', 'Ribeirao Branco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9309', '26', 'Ribeirao Corrente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9310', '26', 'Ribeirao do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9311', '26', 'Ribeirao dos Indios' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9312', '26', 'Ribeirao Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9313', '26', 'Ribeirao Pires' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9314', '26', 'Ribeirao Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9315', '26', 'Ribeiro do Vale' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9316', '26', 'Ribeiro dos Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9317', '26', 'Rifaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9318', '26', 'Rincao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9319', '26', 'Rinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9320', '26', 'Rio Claro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9321', '26', 'Rio das Pedras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9322', '26', 'Rio Grande da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9323', '26', 'Riolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9324', '26', 'Riversul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9325', '26', 'Roberto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9326', '26', 'Rosalia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9327', '26', 'Rosana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9328', '26', 'Roseira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9329', '26', 'Rubiacea' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9330', '26', 'Rubiao Junior' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9331', '26', 'Rubineia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9332', '26', 'Ruilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9333', '26', 'Sabauna' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9334', '26', 'Sabino' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9335', '26', 'Sagres' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9336', '26', 'Sales' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9337', '26', 'Sales Oliveira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9338', '26', 'Salesopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9339', '26', 'Salmourao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9340', '26', 'Saltinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9341', '26', 'Salto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9342', '26', 'Salto de Pirapora' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9343', '26', 'Salto do Avanhandava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9344', '26', 'Salto Grande' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9345', '26', 'Sandovalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9346', '26', 'Santa Adelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9347', '26', 'Santa Albertina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9348', '26', 'Santa America' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9349', '26', 'Santa Barbara D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9350', '26', 'Santa Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9351', '26', 'Santa Clara D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9352', '26', 'Santa Cruz da Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9353', '26', 'Santa Cruz da Esperanca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9354', '26', 'Santa Cruz da Estrela' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9355', '26', 'Santa Cruz das Palmeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9356', '26', 'Santa Cruz do Rio Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9357', '26', 'Santa Cruz dos Lopes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9358', '26', 'Santa Ernestina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9359', '26', 'Santa Eudoxia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9360', '26', 'Santa Fe do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9361', '26', 'Santa Gertrudes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9362', '26', 'Santa Isabel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9363', '26', 'Santa Isabel do Marinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9364', '26', 'Santa Lucia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9365', '26', 'Santa Margarida Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9366', '26', 'Santa Maria da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9367', '26', 'Santa Maria do Gurupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9368', '26', 'Santa Mercedes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9369', '26', 'Santa Rita D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9370', '26', 'Santa Rita do Passa Quatro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9371', '26', 'Santa Rita do Ribeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9372', '26', 'Santa Rosa de Viterbo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9373', '26', 'Santa Salete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9374', '26', 'Santa Teresinha de Piracicaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9375', '26', 'Santana da Ponte Pensa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9376', '26', 'Santana de Parnaiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9377', '26', 'Santelmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9378', '26', 'Santo Anastacio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9379', '26', 'Santo Andre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9380', '26', 'Santo Antonio da Alegria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9381', '26', 'Santo Antonio da Estiva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9382', '26', 'Santo Antonio de Posse' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9383', '26', 'Santo Antonio do Aracangua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9384', '26', 'Santo Antonio do Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9385', '26', 'Santo Antonio do Paranapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9386', '26', 'Santo Antonio do Pinhal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9387', '26', 'Santo Antonio Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9388', '26', 'Santo Expedito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9389', '26', 'Santopolis do Aguapei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9390', '26', 'Santos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9391', '26', 'Sao Benedito da Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9392', '26', 'Sao Benedito das Areias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9393', '26', 'Sao Bento do Sapucai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9394', '26', 'Sao Bernardo do Campo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9395', '26', 'Sao Berto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9396', '26', 'Sao Caetano do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9397', '26', 'Sao Carlos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9398', '26', 'Sao Francisco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9399', '26', 'Sao Francisco da Praia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9400', '26', 'Sao Francisco Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9401', '26', 'Sao Joao da Boa Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9402', '26', 'Sao Joao das Duas Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9403', '26', 'Sao Joao de Iracema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9404', '26', 'Sao Joao de Itaguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9405', '26', 'Sao Joao do Marinheiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9406', '26', 'Sao Joao Do Pau D\'alho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9407', '26', 'Sao Joao Novo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9408', '26', 'Sao Joaquim da Barra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9409', '26', 'Sao Jose da Bela Vista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9410', '26', 'Sao Jose das Laranjeiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9411', '26', 'Sao Jose do Barreiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9412', '26', 'Sao Jose do Rio Pardo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9413', '26', 'Sao Jose do Rio Preto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9414', '26', 'Sao Jose dos Campos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9415', '26', 'Sao Lourenco da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9416', '26', 'Sao Lourenco do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9417', '26', 'Sao Luis do Paraitinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9418', '26', 'Sao Luiz do Guaricanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9419', '26', 'Sao Manuel' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9420', '26', 'Sao Martinho D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9421', '26', 'Sao Miguel Arcanjo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9422', '26', 'Sao Paulo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9423', '26', 'Sao Pedro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9424', '26', 'Sao Pedro do Turvo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9425', '26', 'Sao Roque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9426', '26', 'Sao Roque da Fartura' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9427', '26', 'Sao Sebastiao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9428', '26', 'Sao Sebastiao da Grama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9429', '26', 'Sao Sebastiao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9430', '26', 'Sao Silvestre de Jacarei' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9431', '26', 'Sao Simao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9432', '26', 'Sao Vicente' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9433', '26', 'Sapezal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9434', '26', 'Sarapui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9435', '26', 'Sarutaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9436', '26', 'Sebastianopolis do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9437', '26', 'Serra Azul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9438', '26', 'Serra Negra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9439', '26', 'Serrana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9440', '26', 'Sertaozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9441', '26', 'Sete Barras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9442', '26', 'Severinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9443', '26', 'Silvania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9444', '26', 'Silveiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9445', '26', 'Simoes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9446', '26', 'Simonsen' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9447', '26', 'Socorro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9448', '26', 'Sodrelia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9449', '26', 'Solemar' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9450', '26', 'Sorocaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9451', '26', 'Sousas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9452', '26', 'Sud Mennucci' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9453', '26', 'Suinana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9454', '26', 'Sumare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9455', '26', 'Sussui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9456', '26', 'Suzanapolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9457', '26', 'Suzano' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9458', '26', 'Tabajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9459', '26', 'Tabapua' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9460', '26', 'Tabatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9461', '26', 'Taboao da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9462', '26', 'Taciba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9463', '26', 'Taguai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9464', '26', 'Taiacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9465', '26', 'Taiacupeba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9466', '26', 'Taiuva' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9467', '26', 'Talhado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9468', '26', 'Tambau' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9469', '26', 'Tanabi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9470', '26', 'Tapinas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9471', '26', 'Tapirai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9472', '26', 'Tapiratiba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9473', '26', 'Taquaral' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9474', '26', 'Taquaritinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9475', '26', 'Taquarituba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9476', '26', 'Taquarivai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9477', '26', 'Tarabai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9478', '26', 'Taruma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9479', '26', 'Tatui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9480', '26', 'Taubate' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9481', '26', 'Tecainda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9482', '26', 'Tejupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9483', '26', 'Teodoro Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9484', '26', 'Termas de Ibira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9485', '26', 'Terra Nova D\'oeste' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9486', '26', 'Terra Roxa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9487', '26', 'Tibirica' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9488', '26', 'Tibirica do Paranapanema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9489', '26', 'Tiete' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9490', '26', 'Timburi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9491', '26', 'Toledo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9492', '26', 'Torre de Pedra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9493', '26', 'Torrinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9494', '26', 'Trabiju' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9495', '26', 'Tremembe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9496', '26', 'Tres Aliancas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9497', '26', 'Tres Fronteiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9498', '26', 'Tres Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9499', '26', 'Tres Vendas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9500', '26', 'Tuiuti' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9501', '26', 'Tujuguaba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9502', '26', 'Tupa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9503', '26', 'Tupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9504', '26', 'Tupi Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9505', '26', 'Turiba do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9506', '26', 'Turiuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9507', '26', 'Turmalina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9508', '26', 'Turvinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9509', '26', 'Ubarana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9510', '26', 'Ubatuba' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9511', '26', 'Ubirajara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9512', '26', 'Uchoa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9513', '26', 'Uniao Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9514', '26', 'Universo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9515', '26', 'Urania' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9516', '26', 'Uru' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9517', '26', 'Urupes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9518', '26', 'Ururai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9519', '26', 'Utinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9520', '26', 'Vale Formoso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9521', '26', 'Valentim Gentil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9522', '26', 'Valinhos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9523', '26', 'Valparaiso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9524', '26', 'Vangloria' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9525', '26', 'Vargem' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9526', '26', 'Vargem Grande do Sul' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9527', '26', 'Vargem Grande Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9528', '26', 'Varpa' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9529', '26', 'Varzea Paulista' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9530', '26', 'Venda Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9531', '26', 'Vera Cruz' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9532', '26', 'Vicente de Carvalho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9533', '26', 'Vicentinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9534', '26', 'Vila Dirce' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9535', '26', 'Vila Nery' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9536', '26', 'Vila Xavier' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9537', '26', 'Vinhedo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9538', '26', 'Viradouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9539', '26', 'Vista Alegre do Alto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9540', '26', 'Vitoria Brasil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9541', '26', 'Vitoriana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9542', '26', 'Votorantim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9543', '26', 'Votuporanga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9544', '26', 'Zacarias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9545', '27', 'Abreulandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9546', '27', 'Aguiarnopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9547', '27', 'Alianca do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9548', '27', 'Almas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9549', '27', 'Alvorada' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9550', '27', 'Anajanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9551', '27', 'Ananas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9552', '27', 'Angico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9553', '27', 'Aparecida do Rio Negro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9554', '27', 'Apinaje' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9555', '27', 'Aragacui' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9556', '27', 'Aragominas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9557', '27', 'Araguacema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9558', '27', 'Araguacu' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9559', '27', 'Araguaina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9560', '27', 'Araguana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9561', '27', 'Araguatins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9562', '27', 'Arapoema' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9563', '27', 'Arraias' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9564', '27', 'Augustinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9565', '27', 'Aurora do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9566', '27', 'Axixa do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9567', '27', 'Babaculandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9568', '27', 'Bandeirantes do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9569', '27', 'Barra do Grota' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9570', '27', 'Barra do Ouro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9571', '27', 'Barrolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9572', '27', 'Bernardo Sayao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9573', '27', 'Bom Jesus do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9574', '27', 'Brasilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9575', '27', 'Brasilandia do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9576', '27', 'Brejinho de Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9577', '27', 'Buriti do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9578', '27', 'Cachoeirinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9579', '27', 'Campos Lindos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9580', '27', 'Cana Brava' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9581', '27', 'Cariri do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9582', '27', 'Carmolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9583', '27', 'Carrasco Bonito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9584', '27', 'Cartucho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9585', '27', 'Caseara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9586', '27', 'Centenario' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9587', '27', 'Chapada da Areia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9588', '27', 'Chapada da Natividade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9589', '27', 'Cocalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9590', '27', 'Cocalinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9591', '27', 'Colinas do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9592', '27', 'Colmeia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9593', '27', 'Combinado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9594', '27', 'Conceicao do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9595', '27', 'Correinha' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9596', '27', 'Couto de Magalhaes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9597', '27', 'Craolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9598', '27', 'Cristalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9599', '27', 'Crixas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9600', '27', 'Crixas do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9601', '27', 'Darcinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9602', '27', 'Dianopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9603', '27', 'Divinopolis do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9604', '27', 'Dois Irmaos do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9605', '27', 'Duere' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9606', '27', 'Escondido' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9607', '27', 'Esperantina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9608', '27', 'Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9609', '27', 'Figueiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9610', '27', 'Filadelfia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9611', '27', 'Formoso do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9612', '27', 'Fortaleza do Tabocao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9613', '27', 'Goianorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9614', '27', 'Goiatins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9615', '27', 'Guarai' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9616', '27', 'Gurupi' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9617', '27', 'Ilha Barreira Branca' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9618', '27', 'Ipueiras' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9619', '27', 'Itacaja' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9620', '27', 'Itaguatins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9621', '27', 'Itapiratins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9622', '27', 'Itapora do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9623', '27', 'Jau do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9624', '27', 'Juarina' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9625', '27', 'Jussara' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9626', '27', 'Lagoa da Confusao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9627', '27', 'Lagoa do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9628', '27', 'Lajeado' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9629', '27', 'Lavandeira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9630', '27', 'Lizarda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9631', '27', 'Luzinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9632', '27', 'Marianopolis do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9633', '27', 'Mateiros' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9634', '27', 'Maurilandia do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9635', '27', 'Miracema do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9636', '27', 'Mirandopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9637', '27', 'Miranorte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9638', '27', 'Monte do Carmo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9639', '27', 'Monte Lindo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9640', '27', 'Monte Santo do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9641', '27', 'Mosquito' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9642', '27', 'Muricilandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9643', '27', 'Natal' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9644', '27', 'Natividade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9645', '27', 'Nazare' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9646', '27', 'Nova Olinda' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9647', '27', 'Nova Rosalandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9648', '27', 'Novo Acordo' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9649', '27', 'Novo Alegre' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9650', '27', 'Novo Horizonte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9651', '27', 'Novo Jardim' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9652', '27', 'Oliveira de Fatima' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9653', '27', 'Palmas' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9654', '27', 'Palmeirante' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9655', '27', 'Palmeiropolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9656', '27', 'Paraiso do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9657', '27', 'Parana' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9658', '27', 'Pau D\'arco' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9659', '27', 'Pe da Serra' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9660', '27', 'Pedro Afonso' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9661', '27', 'Pedro Ludovico' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9662', '27', 'Peixe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9663', '27', 'Pequizeiro' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9664', '27', 'Piloes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9665', '27', 'Pindorama do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9666', '27', 'Piraque' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9667', '27', 'Pium' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9668', '27', 'Ponte Alta do Bom Jesus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9669', '27', 'Ponte Alta do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9670', '27', 'Pontes' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9671', '27', 'Poraozinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9672', '27', 'Porto Alegre do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9673', '27', 'Porto Lemos' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9674', '27', 'Porto Nacional' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9675', '27', 'Praia Norte' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9676', '27', 'Presidente Kennedy' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9677', '27', 'Principe' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9678', '27', 'Pugmil' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9679', '27', 'Recursolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9680', '27', 'Riachinho' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9681', '27', 'Rio da Conceicao' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9682', '27', 'Rio dos Bois' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9683', '27', 'Rio Sono' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9684', '27', 'Sampaio' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9685', '27', 'Sandolandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9686', '27', 'Santa Fe do Araguaia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9687', '27', 'Santa Maria do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9688', '27', 'Santa Rita do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9689', '27', 'Santa Rosa do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9690', '27', 'Santa Tereza do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9691', '27', 'Santa Terezinha do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9692', '27', 'Sao Bento do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9693', '27', 'Sao Felix do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9694', '27', 'Sao Miguel do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9695', '27', 'Sao Salvador do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9696', '27', 'Sao Sebastiao do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9697', '27', 'Sao Valerio da Natividade' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9698', '27', 'Silvanopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9699', '27', 'Sitio Novo do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9700', '27', 'Sucupira' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9701', '27', 'Taguatinga' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9702', '27', 'Taipas do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9703', '27', 'Talisma' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9704', '27', 'Tamboril' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9705', '27', 'Taquaralto' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9706', '27', 'Taquarussu do Tocantins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9707', '27', 'Tocantinia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9708', '27', 'Tocantinopolis' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9709', '27', 'Tupirama' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9710', '27', 'Tupirata' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9711', '27', 'Tupiratins' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9712', '27', 'Venus' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9713', '27', 'Wanderlandia' );
INSERT INTO `cidades`(`id`,`estado_id`,`nome`) VALUES ( '9714', '27', 'Xambioa' );
-- ---------------------------------------------------------


-- Dump data of "clientes" ---------------------------------
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '1', 'J', 'Andre Aloisio Silva Renovato', 'renovas', '443802518', '34515045881', 'F', NULL, 'andre.renovatto@uol.com.br', 'andre.renovatto', '(011) 22334-455_', '(013) 98998-3328', '(011) 29993-3399', '05782370', 'Pq Munhoz', 'SP', 'Rua Antonio Ambuba', '70', 'Bloco1 Apto 508', NULL, NULL, '2014-03-23 22:00:41', '2014-06-01 19:07:16', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '2', 'F', 'Camila Carina dos Santos Renovato', 'ccarina', '', '55666667744', 'F', NULL, 'camila.carina@gmail.com', 'aaaaa', '', '', '(119) 80118-042_', '', '', '', '', '', '', NULL, NULL, '2014-03-23 22:05:24', '2014-04-19 18:33:20', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '5', 'F', 'Marcos Renovato', 'Marcos', '1234566677', '11111111111111111', 'F', NULL, 'marco.renovatto@uol.com.br', '', '', '', '5555555555', '', '', '', '', '', '', NULL, NULL, '2014-03-29 22:09:59', '2014-03-30 20:32:44', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '8', 'J', 'Multidados TI', 'Multidados Lawps', '00099999900999', '79797377-0001/19', 'F', NULL, 'suporte@multidadosti.com.br', 'dfsfasdfsad', '(111) 11222-1312', '(123) 12312-3123', '(332) 12312-0988', '3244234234', 'adfasdfads', '', 'sadfasfsd', '32', 'fasdfsadfsadfsd', NULL, NULL, '2014-03-30 17:15:06', '2014-04-12 01:34:53', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '9', 'J', 'Mercado Dia%', 'Dia%', '', '123098-0001/098', 'F', NULL, 'diacontato@dia.com.br', '', '098764332', '', '1234567', '', '', '', '', '', '', NULL, NULL, '2014-03-30 19:27:38', '2014-03-30 19:36:52', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '10', 'J', 'Raça forte Clinica Veterinária', 'Raça Forte', '559969696990', '919390424-0001/093', 'F', NULL, 'racaforte@gmail.com', '', '58721088', '', '', '', '', '', '', '', '', NULL, NULL, '2014-04-01 20:21:33', '2014-04-07 22:08:30', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '11', 'J', 'Luigi Bertolli', 'renovas', '443802518', '34515045881', 'F', NULL, 'andre.renovatto@uol.com.br', 'andre.renovatto', '(011) 99888-8888', '(013) 98998-3328', '(011) 29993-3399', '05782370', 'Pq Munhoz', 'SP', 'Rua Antonio Ambuba', '70', 'Bloco1 Apto 508', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '12', 'J', 'Joelma', 'renovas', '443802518', '34515045881', 'F', NULL, 'andre.renovatto@uol.com.br', 'andre.renovatto', '(011) 99888-8888', '(013) 98998-3328', '(011) 29993-3399', '05782370', 'Pq Munhoz', 'SP', 'Rua Antonio Ambuba', '70', 'Bloco1 Apto 508', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1' );
INSERT INTO `clientes`(`id`,`tipo_pessoa`,`nome`,`apelido`,`rgie`,`cpfcnpj`,`sexo`,`aniversario`,`email`,`rede_social`,`tel_residencia`,`tel_comercial`,`celular`,`cep`,`bairro`,`cidade`,`endereco`,`numero_endereco`,`complemento`,`id_endereco`,`id_telefone`,`created`,`updated`,`ativo`) VALUES ( '13', 'J', 'Eraneide Ramos da Silva Israel Catarina Rocha', 'renovas', '443802518', '34515045881', 'F', NULL, 'andre.renovatto@uol.com.br', 'andre.renovatto', '(011) 99888-8888', '(013) 98998-3328', '(011) 29993-3399', '05782370', 'Pq Munhoz', 'SP', 'Rua Antonio Ambuba', '70', 'Bloco1 Apto 508', NULL, NULL, '0000-00-00 00:00:00', '2014-04-19 18:11:34', '1' );
-- ---------------------------------------------------------


-- Dump data of "especies" ---------------------------------
INSERT INTO `especies`(`id`,`descricao`,`comentarios`,`created`,`modified`,`ativo`) VALUES ( '1', 'Canino', NULL, '2013-10-23 23:16:05', '0000-00-00 00:00:00', '1' );
INSERT INTO `especies`(`id`,`descricao`,`comentarios`,`created`,`modified`,`ativo`) VALUES ( '2', 'Felino', NULL, '2013-10-23 23:16:05', '0000-00-00 00:00:00', '1' );
-- ---------------------------------------------------------


-- Dump data of "estados" ----------------------------------
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '01', 'AC', 'Acre' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '02', 'AL', 'Alagoas' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '03', 'AM', 'Amazonas' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '04', 'AP', 'Amapá' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '05', 'BA', 'Bahia' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '06', 'CE', 'Ceará' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '07', 'DF', 'Distrito Federal' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '08', 'ES', 'Espírito Santo' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '09', 'GO', 'Goiás' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '10', 'MA', 'Maranhão' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '11', 'MG', 'Minas Gerais' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '12', 'MS', 'Mato Grosso do Sul' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '13', 'MT', 'Mato Grosso' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '14', 'PA', 'Pará' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '15', 'PB', 'Paraíba' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '16', 'PE', 'Pernambuco' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '17', 'PI', 'Piauí' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '18', 'PR', 'Paraná' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '19', 'RJ', 'Rio de Janeiro' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '20', 'RN', 'Rio Grande do Norte' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '21', 'RO', 'Rondônia' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '22', 'RR', 'Roraima' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '23', 'RS', 'Rio Grande do Sul' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '24', 'SC', 'Santa Catarina' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '25', 'SE', 'Sergipe' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '26', 'SP', 'São Paulo' );
INSERT INTO `estados`(`id`,`uf`,`nome`) VALUES ( '27', 'TO', 'Tocantins' );
-- ---------------------------------------------------------


-- Dump data of "estoque" ----------------------------------
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '2', '3', '11', 'E', 'E', NULL, NULL, '2014-05-10 12:26:02' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '3', '3', '-1', 'S', 'V', NULL, NULL, '2014-05-10 15:27:01' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '4', '3', '-2', 'S', 'V', NULL, NULL, '2014-05-10 15:33:46' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '5', '3', '-2', 'S', 'V', NULL, NULL, '2014-05-10 15:34:30' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '6', '2', '15', 'E', 'E', NULL, NULL, '2014-05-10 16:36:27' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '7', '3', '17', 'E', 'E', NULL, NULL, '2014-05-10 21:06:28' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '8', '3', '-3', 'S', 'E', 'bolinhas com defeito, realizando devolução para fornecedor.', NULL, '2014-05-10 21:07:26' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '9', '2', '-2', 'S', 'E', 'produto atacado por insetos', NULL, '2014-05-10 21:08:17' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '10', '1', '5', 'E', 'E', 'acerto de estoque', NULL, '2014-05-10 21:17:03' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '11', '1', '-1', 'S', 'E', 'alicate com defeito, realizando devolucao do produto para o fornecedor', NULL, '2014-05-10 21:17:45' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '12', '3', '-7', 'S', 'E', 'doação para ong dog i love', NULL, '2014-05-10 21:28:52' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '13', '3', '-1', 'S', 'E', '', NULL, '2014-05-10 21:41:20' );
INSERT INTO `estoque`(`id`,`produto_id`,`valormovimento`,`tipomovimento`,`origem`,`observacao`,`user_id`,`created`) VALUES ( '14', '2', '-2', 'S', 'E', '', NULL, '2014-05-10 21:42:43' );
-- ---------------------------------------------------------


-- Dump data of "filas_atendimento" ------------------------
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '1', '10', '9', '3', '2', 'Aplicar vacina de raiva e verificar carteirinha de vacinação', '2014-05-31 22:25:13', NULL, NULL, '2014-05-31 22:27:22', '2014-05-31 22:27:22', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '2', '1', '13', '1', '1', 'Princesa não esta comendo nem fazendo necessidades', '2014-05-31 22:28:32', NULL, NULL, '2014-05-31 22:29:43', '2014-05-31 22:29:43', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '3', '2', '14', '2', '3', 'informações sobre castração e sintomas de gripe', '2014-05-31 22:34:26', NULL, NULL, '2014-05-31 22:35:26', '2014-05-31 22:35:26', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '4', '10', '9', '2', '2', 'retorno para verificação dos pontos da cirurgia', '2014-06-01 20:31:04', NULL, NULL, '2014-06-01 20:31:45', '2014-06-01 20:31:45', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '5', '1', '1', '2', '1', '', '2014-06-06 21:13:16', NULL, NULL, '2014-06-06 21:13:42', '2014-06-06 21:13:42', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '6', '2', '14', '1', '2', 'asfasfasfasdfasd', '2014-07-13 20:14:01', NULL, NULL, '2014-07-13 20:14:16', '2014-07-13 20:14:16', NULL, '1' );
INSERT INTO `filas_atendimento`(`id`,`cliente_id`,`pet_id`,`atendimento_tipo`,`prioridade_tipo`,`observacoes`,`datahora_chegada`,`ordem_chegada`,`fila_id`,`created`,`modified`,`user_id`,`ativo`) VALUES ( '7', '1', '13', '3', '3', 'Verificação de carteirinha e vacinas atrasadas', '2014-08-09 20:04:53', NULL, NULL, '2014-08-09 20:05:49', '2014-08-09 20:05:49', NULL, '1' );
-- ---------------------------------------------------------


-- Dump data of "grupo_racas" ------------------------------
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '1', 'Esportistas' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '2', 'Hounds' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '3', 'Trabalhadores' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '4', 'Pastores' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '5', 'Terriers' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '6', 'Toys' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '7', 'Não Esportistas' );
INSERT INTO `grupo_racas`(`id`,`nome`) VALUES ( '8', 'Não definido' );
-- ---------------------------------------------------------


-- Dump data of "pets" -------------------------------------
INSERT INTO `pets`(`id`,`nome`,`idade`,`nascimento`,`rg`,`apelido`,`cor`,`especie_id`,`raca_id`,`cliente_id`,`carteirinha_id`,`peso`,`tamanho`,`sexo`,`nome_pai`,`nome_mae`,`observacoes`,`created`,`modified`,`ativo`) VALUES ( '1', 'Tobby', NULL, '1995-07-15', '123435352', 'tobby', 'champagne', '1', '8', '1', NULL, '2', 'G', 'F', '', '', NULL, '2014-04-06 00:00:00', '2014-04-22 21:05:36', '1' );
INSERT INTO `pets`(`id`,`nome`,`idade`,`nascimento`,`rg`,`apelido`,`cor`,`especie_id`,`raca_id`,`cliente_id`,`carteirinha_id`,`peso`,`tamanho`,`sexo`,`nome_pai`,`nome_mae`,`observacoes`,`created`,`modified`,`ativo`) VALUES ( '9', 'Melissa', NULL, '2014-02-01', '12345678', NULL, '', '1', '22', '10', NULL, '10', 'M', 'F', 'CLOOGUE', 'MINALBA', NULL, '2014-04-09 00:20:30', '2014-06-01 23:30:37', '1' );
INSERT INTO `pets`(`id`,`nome`,`idade`,`nascimento`,`rg`,`apelido`,`cor`,`especie_id`,`raca_id`,`cliente_id`,`carteirinha_id`,`peso`,`tamanho`,`sexo`,`nome_pai`,`nome_mae`,`observacoes`,`created`,`modified`,`ativo`) VALUES ( '13', 'Princesa', NULL, '2012-09-21', '123435352', NULL, 'Marrom', '1', '4', '1', NULL, '4', 'P', 'M', 'Papai', 'Mamãe', NULL, '2014-04-11 23:50:11', '2014-04-21 14:32:12', '1' );
INSERT INTO `pets`(`id`,`nome`,`idade`,`nascimento`,`rg`,`apelido`,`cor`,`especie_id`,`raca_id`,`cliente_id`,`carteirinha_id`,`peso`,`tamanho`,`sexo`,`nome_pai`,`nome_mae`,`observacoes`,`created`,`modified`,`ativo`) VALUES ( '14', 'Brutus Calixto', NULL, '2013-11-29', '', NULL, 'Champagne', '1', '30', '2', NULL, '15', 'M', 'M', 'Bomber Dog', '', NULL, '2014-05-31 22:32:11', '2014-05-31 22:32:11', '1' );
-- ---------------------------------------------------------


-- Dump data of "produtos" ---------------------------------
INSERT INTO `produtos`(`id`,`codinterno`,`descricao`,`referencia`,`codbarras`,`codnfe`,`codean`,`codncm`,`modelo`,`origem`,`categoria_id`,`unidade_medida`,`peso`,`valor_compra`,`margem_lucro`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`observacoes`,`estoqueminimo`,`estoquemaximo`,`user_id_modified`,`created`,`modified`,`ativo`) VALUES ( '1', '123456', 'Alicate para corte de unhas cães e gatos', 'HTML-5', '7890012399932', NULL, NULL, NULL, NULL, NULL, NULL, 'U', NULL, '69.50', '45.00', '100.77', '85.50', '89.00', '98.15', 'Loren ipsun dollor, amet dollor lorem.
Amet loren dollor ipsun ariun se, lariut', '2.000', '10.000', NULL, '2014-04-28 22:37:41', '2014-05-03 21:03:56', '1' );
INSERT INTO `produtos`(`id`,`codinterno`,`descricao`,`referencia`,`codbarras`,`codnfe`,`codean`,`codncm`,`modelo`,`origem`,`categoria_id`,`unidade_medida`,`peso`,`valor_compra`,`margem_lucro`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`observacoes`,`estoqueminimo`,`estoquemaximo`,`user_id_modified`,`created`,`modified`,`ativo`) VALUES ( '2', '819237', 'Ração Pedigree Raças Pequenas Carne e Vegetais', 'P123', '7890012399932', NULL, NULL, NULL, NULL, NULL, NULL, 'U', '10.000', '48.50', '75.00', '84.88', '79.99', '81.49', '82.49', '', '1.000', '5.000', NULL, '2014-04-29 21:32:09', '2014-05-03 21:44:51', '1' );
INSERT INTO `produtos`(`id`,`codinterno`,`descricao`,`referencia`,`codbarras`,`codnfe`,`codean`,`codncm`,`modelo`,`origem`,`categoria_id`,`unidade_medida`,`peso`,`valor_compra`,`margem_lucro`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`observacoes`,`estoqueminimo`,`estoquemaximo`,`user_id_modified`,`created`,`modified`,`ativo`) VALUES ( '3', 'BOL1', 'Bola emborrachada com sino', 'BOL1', '', NULL, NULL, NULL, NULL, NULL, NULL, 'U', NULL, '2.50', '250.00', '8.75', '7.99', '0.00', '0.00', '', '4.000', '10.000', NULL, '2014-05-04 13:17:51', '2014-05-10 21:33:07', '1' );
-- ---------------------------------------------------------


-- Dump data of "racas" ------------------------------------
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '1', 'Cavalier King Charles Spaniel', '1', '1', 'O Cavalier King Charles Spaniel cativa pelo seu olhar carinhoso e seu jeito calmo de ser. É um cão ideal para toda a familia, adora crianças, idosos e é muito tolerante. No Brasil a raça ainda é pouco difundida e poucos são os canis realmente confiáveis.
 
Família: Spaniel, companhia
Grupo do AKC: Esportistas
Área de origem: Inglaterra
Função Original: buscar pequenas aves, cão de colo
Tamanho médio do macho: Alt: 30-33 cm, Peso: 5-8 kg
Tamanho médio da fêmea: Alt: 30-33 cm, Peso: 5-8 kg
Outros nomes: nenhum
Posição no ranking de inteligência: 44ª posição

', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '2', 'Cocker Spaniel Americano', '1', '1', 'O Cocker Spaniel Americano é alegre, apegado e ama agradar seu dono. Gosta de estar sempre perto da família e não dispensa um passeio pelo campo.
 
Família: Gundog, Spaniel
Área de origem: Estados Unidos
Função original: espantar e capturar aves
Tamanho médio do macho: Alt: 36-39 cm, Peso: 10-13 kg
Tamanho médio da fêmea: Alt: 34-36 cm, Peso: 10-13 kg
Outros nomes: Cocker Spaniel

Posição no ranking de inteligência: 20ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '3', 'Cocker Spaniel Inglês', '1', '1', 'O Cocker Spaniel é super popular no Brasil e está presente em diversos lares do país. Infelizmente devido à sua popularização, hoje encontramos muitos Cockers com desvio de comportamento, agressivos e nervosos. Mas o normal dessa raça é longe disso.
 
Família: Gundog, Spaniel
Grupo do AKC: Esportistas
Área de origem: Inglaterra
Função original: espantar e capturar aves
Tamanho médio do macho: Alt: 40-43 cm, Peso: 12-15 kg
Tamanho médio da fêmea: Alt: 38-40 cm, Peso: 11-14 kg
Outros nomes: Cocker Spaniel
Posição no ranking de inteligência: 18ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '4', 'Golden Retriever', '1', '1', 'Goldens parecem Labradores de pelo longo, mas tem o temperamento mais calmo e se adaptam melhor em apartamentos.
 
Família: cão de caça, cão de busca
Grupo do AKC: Esportistas
Área de origem: Inglaterra
Função Original: cão de busca
Tamanho médio do macho: Alt: 58-60 cm, Peso: 29-34 kg
Tamanho médio da fêmea: Alt: 54-57 cm, Peso: 25-30 kg
Outros nomes: Retriever Amarelo
Posição no ranking de inteligência: 4ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '5', 'Labrador', '1', '1', 'Os filhotes de Labrador são muito fofos e cativantes. E quando adultos eles continuam tão simpático quanto antes. Uma raça popular no mundo todo que conquista cada vez mais corações.
 
Família: cão de caça, cão de busca
Grupo do AKC: Esportistas
Área de origem: Canadá
Função original: busca na água
Tamanho médio do macho: Alt: 57-62 cm, Peso: 29-36 kg
Tamanho médio da fêmea: Alt: 54-60 cm, Peso: 25-31 kg
Outros nomes: Retriever do Labrador
Posição no ranking de inteligência: 7ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '6', 'Weimaraner', '1', '1', 'O Weimaraner chama atenção pela sua pelagem cinza e seus olhos claros. É um cão de caça e fiel companheiro do seu dono.
 
Família: cão de caça, pointer, cão de caças variadas
Grupo do AKC: Esportistas
Área de origem: Alemanha
Função Original: arrastar grandes caças
Tamanho médio do macho: Alt: 63-68 cm, Peso: 31-38 kg
Tamanho médio da fêmea: Alt: 58-63 cm, Peso: 31-38 kg
Outros nomes: Weimaraner vorstehhund
Posição no ranking de inteligência: 21ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '7', 'Afghan Hound', '1', '2', 'O Afghan Hound é um cão grande e teimoso, com espírito caçador mas que não deixa de ser engraçado e brincalhão. Ele precisa de espaço para correr, por isso não é indicado para apartamentos e ambientes pequenos.
 
Área de origem: Afeganistão
Função original: caçador de lebres e gazelas
Tamanho médio do macho: Alt: 68 cm, 27 kg
Tamanho médio da fêmea: Alt: 63 cm, 23 kg
Expectativa de Vida: 12-14 anos
Outros nomes: Tazi, Baluchi Hound
Posição no ranking de inteligência: 79ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '8', 'Basenji', '1', '2', 'O Basenji é conhecido como um cão “mudo”. Ele é mais agressivo que o normal dos cães de caça, por isso não é recomendado para donos inexperientes ou para pessoas tímidas/medrosas.
 
Família: sighthound, scenthound, primitivo, Sul (pariah)
Grupo do AKC: Hounds
Área de origem: África Central (Zaire e Congo)
Função Original: caça de animais pequenos
Tamanho médio do macho: Alt: 43, Peso: 11
Tamanho médio da fêmea: Alt: 40, Peso: 9
Outros nomes: Cão do Congo, Terrier do Congo
Posição no ranking de inteligência: 78ª posição', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '9', 'Basset Hound', '1', '2', 'Muitos chamam de salsicha ou salsichinha, mas o nome dessa raça é Dachshund.
 
Família: ScentHound, Terrier, Dachshund
Grupo do AKC: Hounds
Área de origem: Alemanha
Função Original: controle de texugos
 
Padrão
Tamanho médio do macho: Alt: 20-22 cm, Peso: 5-14 kg
Tamanho médio da fêmea: Alt: 20-22 cm, Peso: 5-14 kg
 
Miniatura
Tamanho médio do macho: Alt: 12-15 cm, Peso: 0.5-5 kg
Tamanho médio da fêmea: Alt: 12-15 cm, Peso: 0.5-5 kg
 
Outros nomes: Teckel, Cofap, Salsicha, Basset
Posição no ranking de inteligência: 49ª posição

Origem e história da raça

Evidências sobre o Dachshund como uma raça só foram encontradas no século 16, quando foram feitas referências a um cachorro “baixo de pernas tortas”, chamado de cão escavador, Dacksel ou cão texugo. O nome moderno, Dachshund, quer dizer simples cão texugo (dachs hund) em alemão. Esses caçadores determinados perseguem sua presa, entram na toca, tiram a presa e a matam. O Dachshund existe em três variedades de pelo e em dois tamanhos. Os Dachshunds originais tinham o pelo liso e surgiram do cruzamento do bracke, um pointer miniatura francês, com o Pinscher, um matador de vermes do tipo terrier. Algumas xilogravuras do século 16 mostram cães de pelo mais longo do tipo Dachshund. Também é possível que os Dachshund lisos tenham sido cruzados depois com Spaniels e com o Stoberhund alemão (cão de caça) para produzir uma variedade com pelos mais longos. Dachshunds de pelo duro são mencionados em 1797, mas esses cães não foram propriamente selecionados. Os mais modernos foram criados no final do século 19 com os cruzamentos entre o Dachshund de pelo liso e o Pincher Alemão de pelo curto e com o Dandie Dinmont Terrier. Cada uma dessas variedades era mais adequada para caçar em condições de clima e de terreno diferentes, mas todos eram cães fortes, resistentes, capazes de perseguir texugos, raposas e outros mamíferos menores. Até 1900, muito poucos Dachshunds eram usados para caçar animais muito pequenos, como coelhos. Apesar de alguns serem naturalmente pequenos, outros foram produzidos intencionalmente com cruzamentos de Toy Terriers ou Pinschers. Mas a maioria dos tipos resultantes desses cruzamentos não era o típico Dachshund. Em 1910, foi adotado um critério rigoroso, e cada tipo de pelo foi cruzado com diferentes raças para alcançar os melhores resultados: Os lisos foram criados com os Pinscher Miniatura, os longos com o Papillon e os de pelo curto com o Schnauzer miniatura. Depois disso, o Dachshund encontrou seu verdadeiro lugar como animal de estimação, crescendo em popularidade até se tornar um dos cães mais populares da América.
 
 
Temperamento do Dachshund
 
O Dachshund é corajoso, curioso e está sempre em busca de aventuras. Ele gosta de caçar e de cavar, de seguir uma pista com o faro e de enterrar depois de caçar. Ele é independente, mas quer participar das atividades da família sempre que pode. Ele se dá muito bem com as crianças de sua família. Alguns latem. A variedade de pelo longo pode ser mais quieta e menos parecida com o terrier. Os de pelo curto são mais ativos. Os do tipo miniatura tendem a ser mais tímidos.
 
 
Cuidados com o Dachshund
 
Apesar do Dachshund ser ativo, sua necessidade de exercícios se satisfaz com passeios moderados na coleira e caçadas no jardim. O Dachshund se adapta à vida nas cidades e em apartamentos, mas ele ainda é um caçador e adora se aventurar na floresta. O pelo liso requer higiene básica. O pelo longo precisa ser escovado uma ou duas vezes por semana e tosas ocasionais dos fios soltos. O pelo curto precisa ser escovado uma vez por semana, além de tosas ocasionais dos pelos soltos e retirada de pelos mortos duas vezes por ano.
 
 
Saúde do Dachshund
 
Principais Preocupações: doença do disco intervertebral
Preocupações Menores: KCS
Vistos Ocasionalmente: diabete, epilepsia, luxação da patela, surdez
torção gástrica
Exames sugeridos: olhos
Expectativa de vida: 12-14 anos
Observações: A obesidade é um grande problema para o Dachshund. Muitos Dachshunds
tendem ao sobrepeso, o que pode causar
doença do disco intervertebral.
 
 
Cães semelhantes ao Dachshund
 
Beagle
Coonhound
Bloodhound
Foxhound americano
Foxhound Inglês
Harrier
Otterhound
Pequeno Basset Griffon
Rhodesian Ridgeback', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '10', 'Beagle', '1', '2', 'O Beagle é um cãozinho atraente com alma de vagabundo, fiel aos seus instintos de caçados. Não é dos cães mais obedientes e não é recomendado para donos de primeira viagem, pois educá-lo pode ser um grande desafio.
 
Pode ser barulhento e um pouco cansativo, mas não deixa de ser adorável e, embora muitos possam dizer que o lugar certo para um Beagle é numa matilha de Beagles, há vários que viram cães caseiros dedicados, durante 14 ou mais anos.
 
São bondosos para as crianças e geralmente muito saudáveis (já reparou como vemos Beagles idosos pelas ruas?) – dá prazer ir passear com eles!

Os Beagles são uma antiga raça, descrita pelo menos desde o fim do século XV. Caçaram lebres durante séculos, mas foram usados contra várias presas em países diferentes do mundo.
 
O pêlo do Beagle é impermeável e requer pouco cuidado. Sua pelagem pode ser bicolor ou tricolor, mas nunca totalmente branca.

Vantagens da raça Beagle

- Dócil
- Ótimo com crianças
- Carinhosos
- Saudáveis
 
Desvantagens da raça Beagle

- Destruidores
- Desobedientes
- Fujões
 
Muitos estão querendo adotar um dos cães resgatados do Instituto Royal, que explorava centenas de Beagles. O instituto foi invadido na madrugada do dia 18 de outubro e os cães foram salvos pelos manifestantes. Agora eles estão em busca de um lar.
', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '11', 'Bloodhound', '1', '2', 'O Bloodhound é um cão calmo e um farejador nato. Ele não é “paradão” como muitos pensam. Adoram exercício e brincadeiras.
 
Família: ScentHound
Grupo do AKC: Hounds
Área de origem: Bélgica, Inglaterra
Função Original: seguir rastros
Tamanho médio do macho: Alt: 63-68 cm, Peso: 40-49 kg
Tamanho médio da fêmea: Alt: 58-63 cm, Peso: 36-45 kg
Outros nomes: Hubert hound, Cão de Santo Humberto
Posição no ranking de inteligência: 74ª posição

Origem e história da raça
 
Essência do Scenthound, as raízes do Bloodhound são muito antigas. Seu ancestral mais antigo pode ter sido o St. Hubert preto, documentado na Europa do século 8. Guilherme o Conquistador é considerado o responsável por levar esses cães para a Inglaterra em 1066. No século 12, muitas autoridades da igreja caçavam com esses cães, e a maioria dos mosteiros mantinha criações dessa raça. Eles eram tão bem criados que ficaram conhecidos como “blooded hounds” (cães de sangue), uma referência ao seu sangue puro e raça nobre. Bloodhound eram conhecidos na América desde meados de 1800. Apesar de terem ganho reputação como farejadores de escravos, muitos desses cães tinham faro múltiplo. O Bloodhound provou ser uma das raças mais úteis, usando seu faro insuperável para localizar tanto pessoas desaparecidas como criminosos. Depois de localizar a pessoa, o trabalho do Bloodhound se encerrava, pois ele nunca teve tendências ao ataque. O Bloodhound conquistou muitos recordes de rastreamento, e houve uma época em que ele era a única raça cujas identificações eram aceitas em um tribunal. Ironicamente, o nome do Bloodhound e uma publicidade ruim assustaram muitas pessoas, que acreditavam que os cães rastreavam pessoas por uma sede de sangue. Nada poderia estar mais longe da verdade. A raça é muito conhecida por todas as pessoas, mas não é muito popular como animal de estimação. Por outro lado, ele é um cão de exposição bastante competitivo e um farejador sem igual.
 
 
Temperamento do Bloodhound
 
Com todo seu jeito calmo dentro de casa, é um rastreador incansável quando está seguindo uma trilha. Ele é forte, obstinado e independente, mas ao mesmo tempo gentil e tranquilo e extremamente confiável para conviver com crianças. No entanto, ele não é um velho cachorro preguiçoso como se conta por aí, mas um cão ativo e brincalhão. Embora não seja a raça mais fácil de treinar para tarefas de obediência tradicionais, ele é incrivelmente fácil de treinar quando a tarefa envolve seguir rastros. O Bloodhound é um pouco reservado com estranhos.
 
 
Cuidados com o Bloodhound
 
Por ser um cão de caça, o Bloodhound precisa de uma boa dose de exercícios diários. Ele foi criado para rastrear em qualquer situação, e se estiver farejando algo é difícil pará-lo. Por isso ele precisa de exercícios em área segura. O Bloodhound baba bastante, por isso suas dobras precisam de limpeza diária. Suas orelhas caem na comida e precisam ser sempre limpas. Os canais auditivos também precisam de limpeza frequente para preservar sua saúde. Os cuidados com o pelo são mínimos, que podem ser limpos e escovados ocasionalmente. A maioria vive bem como um cão doméstico. Porém, essa raça não é recomendada para pessoas obcecadas com limpeza!
 
 
Saúde do Bloodhound
 
Principais Preocupações: ectrópio, entrópio , torção gástrica, otite
externa, dermatites, CHD, displasia do cotovelo
Preocupações Menores: nenhuma
Vistos Ocasionalmente: nada
Exames sugeridos: quadril, cotovelos, olhos
Expectativa de vida: 7-10 anos
 
 
Cães semelhantes ao Bloodhound
 
Beagle
Coonhound preto e castanho
Bloodhound
Dachshund (Standard)
Foxhound americano
Foxhound Inglês
Harrier
Otterhound
Pequeno Basset Griffon
Rhodesian Ridgeback
', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '12', 'Borzoi', '1', '2', 'O Borzoi não é uma raça muito comum no Brasil. Um cão com grande espírito caçador, precisa de exercícios diários e uma área livre para correr: mas sempre cercada!
 
Família: Sighthound, Sul (Sighthound)
Grupo do AKC: Hounds
Área de origem: Rússia
Função Original: perseguir lobos
Tamanho médio do macho: Alt: > 71 cm, Peso: 34-47 kg
Tamanho médio da fêmea: Alt: > 66 cm, Peso: 27-38 kg
Outros nomes: Wolfhound Russo
Posição no ranking de inteligência: 75ª posição

Origem e história da raça
 
O Borzoi (também conhecido como Wolfhound Russo) foi criado pela aristocracia russa há centenas de anos. A caça esportiva à lebre era conhecida na Rússia desde o começo do século 13. Nos séculos 15 e 16, foram feitos cruzamentos entre cães corredores com cães urso e com grandes pastores russos para aprimorar o tamanho e o pelo, ambos necessários para caçar lobos em clima frio. O primeiro padrão foi definido em 1600 em um livro de regras de caça com Borzoi. Talvez nenhuma outra raça tenha sido criada em escala tão grande com foco na caça. Centenas de servos trabalhavam na criação desses cães em enormes propriedades. As caçadas em si eram grandes eventos. Um relato descreve os cães, cavalos e caçadores chegando em um trem de mais de 40 compartimentos, enquanto outro trem trazia o grão-duque e outro da nobreza. Mais de 100 Borzois podiam participar de uma única caçada. Batedores e cães farejadores buscavam os rastros do lobo, seguidos por caçadores a cavalo. Um par ou um trio (de dois machos e uma fêmea) de Borzois eram soltos quando o lobo era encontrado. Os cães atacavam ao mesmo tempo, cercando o lobo até que o caçador chegasse para amarrar o lobo e, muitas vezes, soltá-lo logo depois. Nos anos de 1800, havia sete subtipos diferentes de Borzois na Rússia. A maioria dos Borzois de hoje descendem do tipo Perchino criado pelo grão-duque Nicolai Nicolayevitch, e muitos dos primeiros cães importados para a América vinham de canis de Perchino. O Czar costumava oferecer Borzois como presente a visitantes nobres. Após a Revolução Russa, os dias da nobreza tinham terminado e muitos Borzois foram mortos. O destino da raça ficou nas mãos da nobreza estrangeira que havia ganho Borzois e alguns poucos canis de Borzois que tinham sobrado. Na América, Borzoi logo ganhou a fama de cachorro altamente glamoroso, normalmente visto ao lado de estrelas de cinema. Apesar da pouca popularidade como cão de estimação, a raça continua popular em exposições, competições e como modelo.
 
 
Temperamento do Borzoi
 
Uma raça de elegância discreta, o Borzoi é um exemplo de cachorro doméstico bem educado. Ao ar livre, ele corre em um ritmo selvagem, e vai caçar qualquer animal que estiver correndo. Ele é independente, mas bastante sensível. Geralmente se dá bem com crianças e alguns podem ser tímidos. Ele é desconfiado com estranhos.
 
 
Cuidados com o Borzoi
 
O Borzoi precisa de exercícios diários. Embora longos passeios possam deixá-lo satisfeito, ele também precisa correr em uma grande área segura. O pelo, que é especialmente cheio nos machos, precisa ser escovado de duas a três vezes por semana. Em algumas fases, ele solta muitos pelos. Borzoi vive bem em uma casa com acesso ao quintal.
 
 
Saúde do Borzoi
 
Principais Preocupações: torção gástrica
Preocupações Menores: nenhuma
Vistos Ocasionalmente: nada
Exames Sugeridos: nenhum
Expectativa de vida: 10-12 anos
Observações: sensível à anestesia
 
 
Cães semelhantes ao Borzoi
 
Basenji
Greyhound
Cão de Ibiza
Wolfhound Irlandês
Cão do Faraó
Rhodesian Ridgeback
Whippet', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '13', 'Dachshund (Teckel)', '1', '2', 'Muitos chamam de salsicha ou salsichinha, mas o nome dessa raça é Dachshund.
 
Família: ScentHound, Terrier, Dachshund
Grupo do AKC: Hounds
Área de origem: Alemanha
Função Original: controle de texugos
 
Padrão
Tamanho médio do macho: Alt: 20-22 cm, Peso: 5-14 kg
Tamanho médio da fêmea: Alt: 20-22 cm, Peso: 5-14 kg
 
Miniatura
Tamanho médio do macho: Alt: 12-15 cm, Peso: 0.5-5 kg
Tamanho médio da fêmea: Alt: 12-15 cm, Peso: 0.5-5 kg
 
Outros nomes: Teckel, Cofap, Salsicha, Basset
Posição no ranking de inteligência: 49ª posição

Origem e história da raça

Evidências sobre o Dachshund como uma raça só foram encontradas no século 16, quando foram feitas referências a um cachorro “baixo de pernas tortas”, chamado de cão escavador, Dacksel ou cão texugo. O nome moderno, Dachshund, quer dizer simples cão texugo (dachs hund) em alemão. Esses caçadores determinados perseguem sua presa, entram na toca, tiram a presa e a matam. O Dachshund existe em três variedades de pelo e em dois tamanhos. Os Dachshunds originais tinham o pelo liso e surgiram do cruzamento do bracke, um pointer miniatura francês, com o Pinscher, um matador de vermes do tipo terrier. Algumas xilogravuras do século 16 mostram cães de pelo mais longo do tipo Dachshund. Também é possível que os Dachshund lisos tenham sido cruzados depois com Spaniels e com o Stoberhund alemão (cão de caça) para produzir uma variedade com pelos mais longos. Dachshunds de pelo duro são mencionados em 1797, mas esses cães não foram propriamente selecionados. Os mais modernos foram criados no final do século 19 com os cruzamentos entre o Dachshund de pelo liso e o Pincher Alemão de pelo curto e com o Dandie Dinmont Terrier. Cada uma dessas variedades era mais adequada para caçar em condições de clima e de terreno diferentes, mas todos eram cães fortes, resistentes, capazes de perseguir texugos, raposas e outros mamíferos menores. Até 1900, muito poucos Dachshunds eram usados para caçar animais muito pequenos, como coelhos. Apesar de alguns serem naturalmente pequenos, outros foram produzidos intencionalmente com cruzamentos de Toy Terriers ou Pinschers. Mas a maioria dos tipos resultantes desses cruzamentos não era o típico Dachshund. Em 1910, foi adotado um critério rigoroso, e cada tipo de pelo foi cruzado com diferentes raças para alcançar os melhores resultados: Os lisos foram criados com os Pinscher Miniatura, os longos com o Papillon e os de pelo curto com o Schnauzer miniatura. Depois disso, o Dachshund encontrou seu verdadeiro lugar como animal de estimação, crescendo em popularidade até se tornar um dos cães mais populares da América.
 
 
Temperamento do Dachshund
 
O Dachshund é corajoso, curioso e está sempre em busca de aventuras. Ele gosta de caçar e de cavar, de seguir uma pista com o faro e de enterrar depois de caçar. Ele é independente, mas quer participar das atividades da família sempre que pode. Ele se dá muito bem com as crianças de sua família. Alguns latem. A variedade de pelo longo pode ser mais quieta e menos parecida com o terrier. Os de pelo curto são mais ativos. Os do tipo miniatura tendem a ser mais tímidos.
 
 
Cuidados com o Dachshund
 
Apesar do Dachshund ser ativo, sua necessidade de exercícios se satisfaz com passeios moderados na coleira e caçadas no jardim. O Dachshund se adapta à vida nas cidades e em apartamentos, mas ele ainda é um caçador e adora se aventurar na floresta. O pelo liso requer higiene básica. O pelo longo precisa ser escovado uma ou duas vezes por semana e tosas ocasionais dos fios soltos. O pelo curto precisa ser escovado uma vez por semana, além de tosas ocasionais dos pelos soltos e retirada de pelos mortos duas vezes por ano.
 
 
Saúde do Dachshund
 
Principais Preocupações: doença do disco intervertebral
Preocupações Menores: KCS
Vistos Ocasionalmente: diabete, epilepsia, luxação da patela, surdez
torção gástrica
Exames sugeridos: olhos
Expectativa de vida: 12-14 anos
Observações: A obesidade é um grande problema para o Dachshund. Muitos Dachshunds
tendem ao sobrepeso, o que pode causar
doença do disco intervertebral.
 
 
Cães semelhantes ao Dachshund
 
Beagle
Coonhound
Bloodhound
Foxhound americano
Foxhound Inglês
Harrier
Otterhound
Pequeno Basset Griffon
Rhodesian Ridgeback
', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '22', 'Akita', '1', '3', 'O Akita atrai legiões de fãs pelo mundo todo. Alguns amam sua aparência de “urso” e sua imponência peculiar. Outros adoram seu jeito mais sério e menos brincalhão. Conheça a raça e se apaixone também.
 
Família: spitz, Norte (caça)
Área de origem: Japão
Função original: longas caçadas, luta de cães
Tamanho médio do macho: Alt: 63-71 cm, Peso: 38-58 kg
Tamanho médio da fêmea: Alt: 58-66 cm, Peso: 29-49 kg
Outros nomes: Akita Inu, Akita Japonês
Posição no ranking de inteligência: 54ª posição

Origem e História da raça

A raça Akita talvez seja a mais conhecida e venerada entre as raças nativas japonesas. Apesar da semelhança com os cães dos antigos túmulos japoneses, o Akita moderno remonta ao século 17, quando um nobre, com um grande interesse por cães, esteve exilado na Prefeitura de Akita na ilha de Honshu, uma área acidentada com frio intenso durante o inverno. Ele desafiou os proprietários locais para competirem na criação de uma raça de poderosos cães de caça. Esses cães se destacaram na caça de ursos, veados e javalis, mantendo o esporte à distância para o caçador. Esses antepassados do Akita foram chamados de matagi-inu, ou “cão de caça”. Os números e a qualidade da raça variaram nos 300 anos seguintes. No final de 1800, ele passou por um período em que foi usado como cão de luta, e alguns chegaram a ser cruzados com outras raças, na tentativa de melhorar suas habilidades de combate. Em 1927, foi formada a Sociedade Akita-inu Hozankai do Japão para preservar o Akita original, e em 1931 o Akita foi nomeado uma das riquezas naturais do Japão. O Akita mais homenageado de todos os tempos foi Haichiko, que esperava seu dono todas as noites na estação de trem para acompanhá-lo até em casa. Um dia, quando seu dono morreu no trabalho, Haichiko esperou por ele e continuou a voltar e a esperar todos os dias até sua morte, nove anos depois, em 8 de março de 1935. Hoje, uma estátua e uma cerimônia anual prestam homenagem à lealdade de Haichiko. O primeiro Akita chegou a América em 1937, quando Helen Keller trouxe um do Japão. Logo após a Segunda Guerra Mundial, os soldados voltaram para casa com Akitas do Japão. A popularidade da raça cresceu lentamente até receber o reconhecimento AKC em 1972. Desde então, ele tem conquistado admiradores e continua crescendo em popularidade. Hoje o Akita é usado como cão policial e cão de guarda no Japão.
 
 
Temperamento do Akita
 
Honrando sua herança dos cães do tipo Spitz, o Akita é corajoso, independente, obstinado e tenaz. Afetuoso com sua família, ele é inteiramente devotado e protegerá os membros da casa. Embora não seja uma raça para todas as pessoas, o Akita é um excelente companheiro, quando em boas mãos.
 
 
Cuidados com o Akita
 
O Akita gosta de exercícios físicos e mentais diariamente. Ele precisa de oportunidades para correr em uma área segura ou usando uma coleira em caminhadas mais longas. Com bastante exercício e treinamento, ele pode ser um cachorro doméstico tranquilo e educado. O Akita é mais feliz se puder passar a maior parte do tempo com sua família. Os pelos precisam ser escovados cerca de uma vez por semana para remover pelos mortos, e mais frequentemente durante a perda de pelos. Os Akitas tendem a ser meio bagunceiros quando tomam água!
 
 
Saúde do Akita
 
Principais Preocupações: CHD, PRA
Menores Preocupações: displasia do cotovelo, pênfigo, adenite sebácea, torção gástrica
Vistos Ocasional emente: PRA, luxação da patela, síndrome de VKH, entrópio, epilepsia, catarata, polineuropatia, hipoplasia renal cortical
Exames sugeridos: quadril, cotovelos, olhos
Expectativa de Vida: 10-12 anos
Observações: Cebolas têm sido apontadas como causadoras de alterações nas células sanguíneas dos Akitas.
 
 
Cães semelhantes ao Akita
 
Spitz Finlandês
Shiba Inu
Malamute do Alaska
Samoieda
Husky Siberiano', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '23', 'Bernese Mountain Dog', '1', '3', 'O Boiadeiro Bernês (Bernese Mountain Dog) é cativante pelo seu tamanho, pelagem e temperamento calmo e pacato.
 
Família: cão de gado, cão da montanha, mastiff (pastoreio / tração)
Grupo do AKC: Trabalhadores
Área de origem: Suíça
Função Original: tração
Tamanho médio do macho: Alt: 63-70 cm, Peso: 40-54 kg
Tamanho médio da fêmea: Alt: 58-66 cm, Peso: 31-45 kg
Outros nomes: Berner Sennenhund, Bernese/Boiadeiro de Berna, Bernese Mountain Dog
Posição no ranking de inteligência: 22ª posição

Origem e história da raça
 
O mais conhecido dos Sennenhund ou, “Cães de Montanha Suíços”, o Bernese se destaca por ser o único a ter um pelo longo e sedoso. A origem da raça é apenas especulativa. Alguns especialistas acreditam que sua história vem da época da invasão romana na Suíça, quando os mastiffs cruzaram com os cães guardadores de rebanho nativos. O cruzamento produziu um cão forte capaz de resistir ao clima dos Alpes e servir como cão de tração, guardador de rebanho, e cão pastor. Apesar da utilidade desses cães, poucas tentativas foram feitas para perpetuar a raça. No final dos de 1800, a raça estava em risco de extinção. Nessa época, o professor Albert Heim iniciou uma pesquisa sobre cães suíços que levaram a identificação do Boiadeiro Bernês (Bernese Mountain Dog) como um dos espécimes. Esses cães foram encontrados apenas nos vales dos baixos Alpes. Com os esforços de Heim, eles foram divulgados na Suíça e na Europa. Os melhores espécimes foram encontrados na área de Durrbach, dando a raça o nome de Durrbachler. Com o crescimento da raça, o nome foi mudado para Bernese Mountain Dog. O primeiro Bernese chegou à América em 1926; o reconhecimento oficial do AKC aconteceu em 1937.
 
 
Temperamento do Boiadeiro Bernês (Bernese Mountain Dog)
 
O Boiadeiro Bernês (Bernese Mountain Dog) é um cachorro fácil de conviver e um bom companheiro para a família (isto é, depois que ele passa da adolescência). Ele é sensível, leal e extremamente devotado. Ele é gentil com crianças e geralmente reservado com crianças. Normalmente convive bem com outros cães e animais domésticos.
 
 
Cuidados com o Boiadeiro Bernês (Bernese Mountain Dog)
 
Esse cão adora a vida ao ar livre, especialmente em clima frio. Ele precisa de exercícios diários moderados, seja uma boa caminhada ou passeio de coleira. Ele se integra tão bem com sua família humana que ele não deve ser deixado para viver sozinho no quintal. Dentro de casa, ele precisa de bastante espaço pra se esticar. Seu pelo precisa ser escovado uma a duas vezes por semana. Com mais frequência na troca de pelos. A expectativa de vida do Bernese é definida por uma expressão suíça: “Três anos um cão jovem, três anos um bom cão, três anos um cão velho. Todo o resto é um presente de Deus”.
 
 
Saúde do Boiadeiro Bernês (Bernese Mountain Dog)
 
Principais Preocupações: CHD, displasia do cotovelo, Histiocitose, OCD
Preocupações Menores:fragmentação do processo coronoide, torção gástrica, PRA
Vistos Ocasionalmente: hipomielinização
Exames sugeridos: quadril, cotovelos, olhos
Expectativa de vida: 7-9 anos
Observações: Ele precisa de cuidados extras contra insolação.
 
 
Cães semelhantes ao Boiadeiro Bernês (Bernese Mountain Dog)
 
Anatolian Shepherd
Boxer
Bullmastiff
Doberman Pinscher
Great Dane
Cão da Montanha
Grande Cão Suíço da Montanha
Komondor
Kuvasz
Mastiff
São Bernardo', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '24', 'Boxer', '1', '3', 'O Boxer é brincalhão e ótimo para crianças. Ele precisa de um quintal e bastante espaço para correr e se exercitar.
 
Família: cão de gado, mastiff (buldogue)
Grupo do AKC: Trabalhadores
Área de origem: Alemanha
Função Original: luta com touros, cão de guarda
Tamanho médio do macho: Alt: 57-63 cm, Peso: 29-36 kg
Tamanho médio da fêmea: Alt: 53-59 cm, Peso: 22-29 kg
Outros nomes: nenhum
Posição no ranking de inteligência: 48ª posição

Origem e história da raça
 
O Boxer vem de duas raças da Europa central que não existem mais: o grande Danzinger Bullenbeisser e o pequeno Brabenter Bullenbeisser. Bullenbeisser quer dizer “mordedor de touros”, e esses cães eram usados para prender grandes animais (javalis selvagens, veados e pequenos ursos) até que o caçador chegasse para matá-los. Isso exigia um cachorro grande, com mandíbulas poderosas e narinas recuadas para que o cachorro pudesse respirar enquanto mantinha as mandíbulas presas em um animal. Qualidades parecidas eram necessárias para os cães das lutas com touros, um esporte popular em muitos países europeus. Na Inglaterra, o Bulldog era raça preferida para esse esporte, enquanto na Alemanha eram usados os cães do tipo mastiff grandes. Por volta de 1830, caçadores alemães começaram a criar uma nova raça, cruzando seus bullenbaisers com cães do tipo mastiff em função do tamanho, com terriers pela resistência e, depois, com bulldogs. O resultado foi um cão ágil com um corpo resistente e muita força. Quando as lutas com touros ficaram ilegais, eles passaram a ser usados como cães carniceiros na Alemanha, controlando o gado dos abatedouros. Em 1895, uma raça inteiramente nova tinha surgido. Apesar da origem do nome ser obscura, é possível que venha do alemão “boxl”, como eram chamados nos abatedouros. O Boxer foi uma das primeiras raças usadas como cães policiais e militares na Alemanha. Em 1900, a raça tinha se tornado de uso geral, animal de estimação e até mesmo cão de exposição. O AKC reconheceu a raça logo depois, mas só nos anos 40 ela chegou ao auge da popularidade, chegando a se tornar a mais popular da América.
 
 
Temperamento do Boxer
 
O Boxer é brincalhão, exuberante, curioso, expressivo, devotado e extrovertido. Ele é um companheiro perfeito para uma família ativa. Ele pode ser teimoso, mas responde bem aos comandos. Geralmente se dá bem com outros cães e animais da casa.
 
 
Cuidados com o Boxer
 
O Boxer precisa de atividade mental e física todos os dias. Ele gosta de correr, mas também se satisfaz com longos passeios com coleira. Ele não se sente bem em climas quentes e não é um cachorro para viver fora da casa. Ele vive melhor se puder dividir seu tempo entre a casa e o quintal. Alguns roncam. O pelo é fácil de manter, e basta escová-lo de vez em quando para remover pelos mortos.
 
 
Saúde do Boxer
 
Principais Preocupações: cardiomiopatia, SAS, CHD
Preocupações Menores: torção gástrica, tumores, degeneração do disco invertebral, erosão da córnea, colite
Vistos Ocasionalmente: nada
Exames Sugeridos: coração, quadris
Expectativa de vida: 8-10 anos
Observações: sensível ao calor e à anestesia por serem cães braquicefálicos. Boxers brancos podem ser surdos.
 
 
Cães semelhantes ao Boxer
 
Bernese Mountain Dog
Pastor da Anatólia
Bullmastiff
Doberman Pinscher
Great Dane
Cão da Montanha
Grande Cão Suíço da Montanha
Komondor
Kuvasz
Mastiff', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '25', 'Bullmastiff', '1', '3', 'O Bullmastiff é um cão forte e precisa de pulso firme do dono. É um excelente cão de guarda e tem um temperamento tranquilo.
 
Família: cão de gado, mastiff (bulldog)
Grupo do AKC: Trabalhadores
Área de origem: Inglaterra
Função Original: guarda de propriedade
Tamanho médio do macho: Alt: 63-68 cm, Peso: 49-58 kg
Tamanho médio da fêmea: Alt: 60-66 cm, Peso: 45-54 kg
Outros nomes: nenhum
Posição no ranking de inteligência: 69ª posição

Origem e história da raça
 
Apesar dos mastiffs serem uma das mais antigas raças britânicas, seu descendente, o Bullmastiff, é provavelmente mais recente. Algumas referências ao Bullmastiff, ou de cruzamentos entre mastiff e bulldog, são encontradas em 1791. Mas não há evidências de que essa linhagem já existisse. A documentação histórica do Bullmastiff começa no final do século 19, quando a caça ilegal em grandes propriedades se tornou um problema tão grande que a vida dos cães de guarda estava em risco. Era necessário um cão forte e corajoso que pudesse aguardar a aproximação do invasor em silêncio, atacar a partir de um comando e render o invasor sem machucá-lo. O mastiff não era rápido o suficiente, e o bulldog não era tão grande, então foram cruzadas as duas raças para criar o cão perfeito, que foi chamado de “cão vigia de caça noturno” (gamekeeper’s night dog). A cor preferida era o preto machado, porque podia se camuflar melhor à noite. Quando a raça se tornou famosa, muitos proprietários escolhiam esses cães como guardas, mas preferiam os filhotes de cores mais claras, especialmente aqueles com a mancha escura na área dos olhos, uma marca de seu ancestral mastiff. Os criadores preferiram buscar uma linhagem pura do que continuar os cruzamentos entre mastiff e bulldog. Eles se empenharam em gerar um animal ideal que fosse 60 por cento mastiff e 40 por cento bulldog. Em 1924, a raça foi considerada pura e foi reconhecia pelo English Kennel Club. O reconhecimento pelo AKC veio em 1933.
 
 
Temperamento do Bullmastiff
 
O Bullmastiff é gentil e tranquilo, um companheiro devotado e um cão de guarda. Ele não se deixa provocar facilmente, mas se estiver ameaçado ele é destemido. Ele é teimoso e não é fácil motivá-lo a agir contra sua vontade. Geralmente se dá bem com outros cães e animais da casa. Ele se dá muito bem com crianças também. O Bullmastiff precisa de um lar firme e amoroso. Ele não é indicado para donos mais frágeis ou tímidos.
 
 
Cuidados com o Bullmastiff
 
O Bullmastiff é um cachorro grande que precisa de exercícios todos os dias pra ficar em forma. Mas suas necessidades são moderadas, e ele fica feliz com longos passeios de coleira. Ele não se sente bem em climas quentes e não é um cachorro para viver fora da casa. Dentro de casa, ele precisa de uma cama confortável e de bastante espaço pra se esticar. Ele baba. Alguns roncam. Os cuidados com o pelo são mínimos.
 
 
Saúde do Bullmastiff
 
Principais Preocupações: torção gástrica, CHD, Displasia do cotovelo
Preocupações Menores: entrópio
Vistos Ocasionalmente: PRA
Exames sugeridos: quadril, cotovelos, olhos
Expectativa de vida: 8-10 anos
 
 
Cães semelhantes ao Bullmastiff
 
Bernese Mountain Dog
Boxer
Doberman Pinscher
Komondor
Kuvasz
Mastiff', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '26', 'Dobermann', '1', '3', 'O Dobermann é uma das raças mais inteligentes e um excelente cão de guarda.
 
Família: mastiff
Grupo do AKC: Trabalhadores
Área de origem: Alemanha
Função Original: cão de guarda
Tamanho médio do macho: Alt: 66-71 cm, Peso: 29-40 kg
Tamanho médio da fêmea: Alt: 60-66 cm, Peso: 29-40 kg
Outros nomes: Dobermann Pinscher
Posição no ranking de inteligência: 5ª posição

Origem e histórico da raça

Poucas pessoas tiveram um impacto tão grande no mundo canino quanto Louis Dobermann, de Thuringen, Alemanha. Dobermann era um cobrador de impostos que precisava de um cão de guarda atento para acompanhá-lo em suas rondas de porta em porta. No fim do século de 1800, ele começou a criar um cão de guarda alerta e simples, provavelmente cruzando o velho Pastor Alemão e o Pinscher Alemão, e cruzamentos posteriores com o Manchester terrier preto e castanho, Greyhound e Weimaraner. Ele logo conseguiu o protótipo da raça que agora levaria seu nome. Os primeiros Dobermanns ainda tinham ossos pesados e cabeça arredondada. Novas produções foram selecionando um cão com a aparência da raça. A criação da raça aconteceu em um tempo impressionante. Em 1899 já estava formado o primeiro clube. A raça continuou a receber elogios, e o primeiro Dobermann chegou à América em 1908. A raça logo se agradou a Europa e a América como cão policial e cão de guarda, e mais tarde como cão de guerra. Seu talento nessas áreas trouxe ao Dobermann muitos admiradores, e ele logo se tornou um importante protetor da família. Sua silhueta bem desenhada e seu estado de alerta destemido colocaram o Dobermann no topo como um cão de exposição. Com o aumento de sua fama, muitas famílias começaram a gostar da raça como animal de estimação, e o Dobermann acabou se tornando a segunda raça mais popular da América em 1977. Na mesma época, surgiu um novo desafio para a raça: o surgimento do Doberman Branco albino. No esforço de reduzir o risco de reprodução desses cães, o Dobermann Pinscher Club of America convenceu o AKC a marcar os números de registro dos cachorros que carregavam o gene albino com a letra Z.
 
 
Temperamento do Dobermann
 
O Dobermann é um cão de guarda inteligente e capaz, sempre alerta e pronto para proteger sua família e sua casa. Ele é um companheiro leal e aventureiro. Gosta de desafios mentais é uma dádiva de obediência como aluno. É sensível e muito receptivo aos desejos da família, embora alguns possam ser dominadores. Geralmente é desconfiado com estranhos.
 
 
Cuidados com o Dobermann
 
Esse é um cachorro ativo que precisa de exercícios físicos e mentais todos os dias, ou pode se tornar frustrado e destrutivo. Sua necessidade de exercícios se satisfaz com longas corridas ou passeios de coleira, ou uma corrida mais intensa dentro de uma área segura. O Doberman é um companheiro melhor e um cão de guarda mais eficiente se puder compartilhar o lar de sua família. Os cuidados com o pelo são mínimos.
 
 
Saúde
 
Principais Preocupações: CVI (Síndrome de Wobbler), cardiomiopatia
Preocupações Menores: vWD, demodicose, osteossarcoma, narcolepsia, torção gástrica, CHD
Vistos Ocasionalmente: albinismo
Exames Sugeridos: DNA para vWD, cardíacos, (quadril)
Expectativa de vida: 10-12 anos
Observações: O Dobermann Azul normalmente apresenta alopecia; o Dobermann Branco sofre de vários problemas sérios de saúde.
 
 
Cães semelhantes ao Dobermann
 
Bernese Mountain Dog
Boxer
Bullmastiff
Mastiff
Terra-nova
Rottweiler
São Bernardo', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '27', 'Dogue de Bordeaux', '1', '3', NULL, '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '28', 'Husky Siberiano', '1', '3', 'Apesar da sua cara de lobo, o Husky Siberiano é um cão muito sociável e adora estar na companhia de outros animais ou seres humanos. Não é um cão ideal para cidades quentes, sendo muito tolerante ao frio.
 
Família: Spitz, Norte (tração)
Grupo do AKC: Trabalhadores
Área de origem: Rússia (Sibéria)
Função Original: puxar trenós
Tamanho médio do macho: Alt: 53-60 cm, Peso: 20-27 kg
Tamanho médio da fêmea: Alt: 50-55 cm, Peso: 15-22 Kg
Outros nomes: Husky do Ártico
Posição no ranking de inteligência: 45ª posição

Origem e história da raça

O povo Chukchi do nordeste da Ásia desenvolveu a raça hoje conhecida como Husky Siberiano. Sua origem é desconhecida, mas ele é obviamente do grupo spitz, que evoluiu por centenas de anos como um cão de trenó para esses povos nômades. Durante a corrida do ouro no Alaska, os cães se tornaram parte vital da vida nas regiões do Ártico, e as corridas de cães eram o entretenimento preferido. As corridas de apostas no Alaska, que cobriam mais de 600 km entre Nome e Candle, eram muito populares, e em 1909 os Chukchi trouxeram da Sibéria a primeira equipe de huskies. Menores e mais dóceis do que a maioria dos competidores, eles despertaram pouca admiração, com exceção de um criador, que de tão impressionado, importou 70 cães para treiná-los para a corrida de 1910. Suas três equipes chegaram em primeiro, segundo e quarto lugar, e assim marcaram um momento de incomparável domínio dos Huskies nessa corrida. Ao longo do ano, os cães de mantiveram como puxadores de trenó, mas em 1925 alcançaram seu maior sucesso. Equipes de huskies correram 540 km com soro salva-vidas para a difteria que atingia Nome e foram responsáveis por salvar a cidade. Existe uma estátua em homenagem a esses cães no Central Park. Os primeiros huskies siberianos chegaram ao Canadá e depois aos Estados Unidos por volta dessa época. O AKC reconheceu a raça em 1930. Durante a Segunda Guerra Mundial, muitos siberianos trabalharam em equipes de busca e salvamento do Exército Americano, conquistando mais tarde a admiração do público. A popularidade da raça continuou a crescer até se tornar tão amado como cão de estimação quanto era como cão de exposição ou de trenó. Ele continua a ser uma das mais populares raças do Ártico.
 
 
Temperamento do Husky Siberiano
 
Divertido, aventureiro, alerta, independente, inteligente, teimoso, travesso e obstinado. Tudo isso descreve o Husky Siberiano. Essa raça adora correr sempre que pode. Geralmente se dá bem com outros cães da casa. Na verdade, ele é um cão muito social que precisa da companhia de outros cães ou de seres humanos. Ele pode caçar gatos ou gado. Alguns uivam, cavam e roem.
 
 
Cuidados com o Husky Siberiano
 
Esse é um cão ativo, uma raça criada para correr quilômetros sem se cansar. Ele precisa de amplos exercícios todos os dias, seja em longas corridas ou longos passeios sem coleira em área segura. Ele também adora puxar e gosta de tempo frio. Seu pelo precisa ser escovado uma a duas vezes por semana. Todos os dias, durante as trocas de pelo.
 
 
Saúde do Husky Siberiano
 
Principais Preocupações: nenhuma
Preocupações Menores: PRA, distiquíase, catarata, opacidades corneanas
Vistos Ocasionalmente: CHD, glaucoma
Exames sugeridos: olhos (quadril)
Expectativa de Vida: 11-13 anos
 
 
Cães semelhantes ao Husky Siberiano
 
Akita
Malamute do Alaska
Samoieda
Spitz Finlandês
Keeshond
Schipperke
Shiba Inu
', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '29', 'Rottweiler', '1', '3', 'O Rottweiler tem origem desconhecida e provavelmente descente do Mastiff Italiano. Durante a idade média, o Rottweiler era usado como cão pastor. Essa raça quase foi instinta no século 19, mas conseguiu sobreviver e voltou com força total no século 20. O Rottweiler é usado hoje em dia para diversas funções, como tracking, pastoreio, cão de guarda, cão policial e cão de alerta.
 
 
Temperamento do Rottweiler

 
O Rottweiler pode ser um cão amável e divertido, mas ele é muito poderoso e pode ser sério às vezes. Um treinamento de obediência adequado desde filhote e a socialização são extremamente necessários (para todas as raças, não somente Rottweilers). Essa raça pode ser muito territorial e protetora de sua família e casa. Rottweilers podem ser bem intimidadores e ainda carregam a fama de serem bravos, mas eles são ótimos para famílias e podem ser muito dóceis também.

O temperamento de um Rottweiler pode variar. Alguns podem ser muito apegados e dóceis (bobos, mesmo!), enquanto outros podem ser mais irritados. É importante que essa raça seja socializada desde filhote, para que não estranhe animais ou pessoas quando adultos e por ser uma raça muito forte e poderosa, pode causar problemas. Rottweilers são ótimos com crianças se criados em um ambiente com criancas desde cedo, mas devem ser supervisionados quando estão com crianças muito pequenas, pois são muito fortes e grandes.
O Rottweiler se dá bem com outros cães, mas podem mostrar sinais de agressividade se não tiverem sido acostumados com a presença de outros cães desde filhote. Ou seja: quando for filhote, seu Rottweiler precisa ser apresentado a todos os estímulos, como crianças, outros animais, outros cães, pessoas de diversas etnias etc. É também uma raça muito protetora tanto para com sua família quanto para com seu território.

Cuidados com o Rottweiler

 
O Rottweiler tem um pelo curto e brilhante, de fácil manutenção. Escovar regulamente para tirar o excesso de pelos mortos é suficiente para mantê-lo bonito. Dar banho com muita frequencia vai tirar a oleosidade natural de sua pele, causando sérios problemas dermatológicos. Não dê banho com muita frequência em seu cão. Banho à seco é usado em muitos Rottweilers para não remover a oleosidade natural de sua pele.
 
 
Inteligência e treinamento

 
Rottweilers adoram aprender e serão excelentes se tiverem oportunidade. Treino de obediência é essencial, já que essa raça pode se tornar bem destrutiva se não for estimulada. É preciso uma pessoa forte, firme e dominante quando for treinar esse cão poderoso. O Rottweiler é extremamente inteligente e se sai muito bem em diferentes esportes, mas também pode ser teimoso. Ocupam o 9º lugar no ranking de inteligência canina.
Atividade e exercícios

 
Um Rottweiler deve ter no mínimo um quintal grande para se exercitar. Prender um Rottweiler dentro de um apartamento, por maior que o apartamento seja, não é uma boa idéia. Eles não são ativos dentro de casa, então eles precisam de muito exercício fora de casa, sem coleira de preferência. Por isso a importância do quintal, cercado, sempre. Essa raça ama passear por uma longa jornada e deve sair pra passear no mínimo duas vezes por dia, com um total de 2 horas de exercício por dia. Não ignore essa necessidade dos Rottweilers, pois pra ter um cão equilibrado, feliz e dócil, você deve suprir o que ele precisa.

Resumindo

 
- Grande, muito forte e poderoso
- Altamente inteligente (9º lugar no ranking de inteligência canina)
- Sério e confiável
- Muito protetor e territorial com sua casa e sua família
- Naturalmente alerta para estranhos e não será amigável com alguém que ele não tenha sido apresentado adequadamente
- Pode ser muito agressivo se alguém invadir seu território
- Pode ser agressivo com outros cães machos
- Ele é brincalhão e divertido
- É ótimo com crianças
- É o melhor cão de guarda de todas as raças
- Não tem medo de nada
', '2014-04-06 00:00:00', '2014-04-06 00:00:00', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '30', 'Australian Cattle Dog (Boiadeiro Australiano)', '1', '4', 'O Australian Cattle Dog é super inteligente e fiel ao dono. Muitos são apaixonados por essa raça que necessita de bastante exercício para ser feliz.  Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Austrália
Função Original: criação de gado
Tamanho médio do macho: Alt: 45-50 cm, Peso: 15-20 kg
Tamanho médio da fêmea: Alt: 43-48 cm, Peso: 15-20 kg
Outros nomes: Queensland heeler, blue/red heeler Posição no ranking de inteligência: 10ª posição
 
Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Austrália
Função Original: criação de gado
Tamanho médio do macho: Alt: 45-50 cm, Peso: 15-20 kg
Tamanho médio da fêmea: Alt: 43-48 cm, Peso: 15-20 kg
Outros nomes: Queensland heeler, blue/red heeler
Posição no ranking de inteligência: 10ª posição

Origem e história da raça

Nos primeiros anos de 1800, grandes áreas de terra na Austrália ficaram disponíveis para criação de gado bovino. O gado criado nessas terras tinha se tornado tão selvagem e rebelde que as raças européias tradicionais que tinham sido úteis na domesticação de gado, não servia mais para esse trabalho. Era necessário um cão que suportasse percorrer longas distâncias por um terreno difícil sob o calor e controlasse o gado sem latir (o que só servia para deixar o gado ainda mais selvagem). Em 1840, um homem chamado Hall cruzou alguns Blue Smooth Highland Collies com os Dingos produzindo uma linhagem conhecida como Heelers. Um macho especialmente importante foi um cachorro chamado Bentleydog, considerado o responsável pela mancha branca encontrada na cabeça dos Australian Cattle Dogs de hoje. Outros criadores cruzaram seus Heelers com outras raças, incluindo o Bull Terrier, o Dálmata e mais tarde o Kelpie preto-castanho, uma raça de cães de pastoreio de ovelhas. O resultado foi um cão com os instintos de pastoreio do Collie e do Kelpie; a resistência e o estilo tranquilo do Dingo; e o bom senso e o instinto protetor do Dálmata, todo com um estilo de pelo padronizado. Na medida em que os cães se tornaram vitais para a indústria do gado de Queensland, eles ganharam o nome de Queensland Blue Heeler. Mais tarde ficaram conhecidos como Australian Heeler, e finalmente Australian Cattle Dog. Em 1897 foi criado um padrão para a raça com ênfase nos seus traços Dingo. O Australian Cattle Dog demorou para chegar à América, talvez por sua semelhança com as raças pastoras já estabelecidas. Quando teve chance, ele mostrou seu valor e foi muito bem aceito como pastor e como animal de estimação. O AKC reconheceu a raça em 1980, e desde então se tornou um cão de exposição muito capaz, sem perder suas funções principais.
 
 
Temperamento do Australian Cattle Dog
 
Inteligente, resistente, independente, obstinado, enérgico e incansável: esses são os traços principais para um pastor de gado e são os traços do Australian Cattle Dog. Esse cão precisa de uma ocupação ou ele irá arrumar algo pra fazer sozinho. Recebendo desafios mentais e exercício físico pesado todos os dias, ele é um dos cães mais obedientes e um companheiro de aventuras exemplar. Ele tende a mordiscar os calcanhares de crianças que estiverem correndo.
 
 
Cuidados com o Australian Cattle Dog
 
O Australian Cattle Dog foi criado para ser ativo e incansável. Ele precisa de muita atividade física e mental, bem mais do que um simples passeio de coleira. Uma boa corrida ou um longo treino, juntamente com aulas de obediência e outro desafios intelectuais, são essencias todos os dias. O Australian Cattle Dog fica mais feliz quando tem algum trabalho pra fazer. O Australian Cattle Dog precisa ser escovado ou penteado toda semana para remover pelos mortos.
 
 
Saúde do Australian Cattle Dog
 
Principais Preocupações: CHD, OCD, surdez, PRA
Preocupações Menores: nenhuma
Vistos Ocasionalmente: catarata, luxação do cristalino, PPM, vWD
Exames sugeridos: quadril, audição, olhos
Expectativa de vida: 10-13 anos
 
 
Cães semelhantes ao Australian Cattle Dog
 
Pastor Australiano
Bearded Collie
Pastor Belga Malinois
Pastor Belga
Pastor Belga Tervuren
Border Terrier
Bouvier de Flandres
Briard
Cão de Canaã
Collie


', '2014-04-16 22:44:25', '2014-04-16 22:44:25', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '31', 'Border Collie', '1', '4', 'O Border Collie é o cachorro mais inteligente do mundo. Não é à toa que vemos essa raça toda hora em comerciais e filmes. Além de inteligentes, são super simpáticos e bonitos. Mas atenção: por mais tentador que possa parecer, não tenha um Border Collie em apartamento.
 
Família: pastoreio, pecuária
Área de origem: Grã-Bretanha
Função Original: pastor de ovelhas
Tamanho médio do macho: Alt: 50-58 cm, Peso: 13-20 kg
Tamanho médio da fêmea: Alt: 45-53 cm, Peso: 13-20 kg
Outros nomes: nenhum
Posição no ranking de inteligência: 1ª posição

Origem e história da raça

O Border Collie é o resultado de mais de um século de criação para a função de pastor de ovelhas. Nos anos de 1800, existia uma variedade de cães pastores de ovelhas na Grã-Bretanha. Alguns eram cães de resgate, com uma tendência inata para cercar o rebanho e trazê-lo de volta para o pastor. A maioria dos cães era barulhenta, que costumavam mordiscar e latir durante o trabalho. O orgulho pela superioridade de certos cães era normal. Em 1873, aconteceu o primeiro campeonato de cães pastores de ovelhas a fim de resolver algumas dessas questões. Esse concurso iria levar indiretamente aos primeiros collies, a partir de um cachorro chamado Hemp, que se destacou tanto que gerou um grande número de descendentes. Ele conduzia o rebanho não com latidos e mordidas, mas parando tranquilamente em frente à ovelha, e a intimidando. Hemp é considerado o pai do Border Collie. Em 1906, o primeiro padrão foi estabelecido, mas ao contrário dos padrões físicos da maioria das raças, esse se baseava em habilidades para o trabalho, sem relação com a aparência física. Essa tem sido a referência que padronizou a raça desde então. Na verdade, os cães eram chamados simplesmente de Sheepdogs (pastores de ovelhas). Apenas em 1915 foi registrado o nome Border Collie, uma referência à sua origem nas fronteiras inglesas e escocesas. O Border Collie chegou à América e imediatamente encantou os criadores de ovelhas com seu trabalho rápido e sua capacidade de obediência. Na verdade, essa última qualidade abriu as portas para a raça como uma das mais competitivas em campeonatos de obediência. Depois de trabalhar muito para ganhar fama como uma das raças mais inteligentes, e não por valores estéticos, muitos criadores de Border Collie lutaram por seu reconhecimento pelo AKC como um cão de exposição. Em 1995, o AKC reconheceu a raça e ela entrou para o círculo das exposições.
 
 
Temperamento do Border Collie
 
O Border Collie é um pacote de energia física e mental só esperando para se soltar no mundo. É uma das raças mais inteligentes e obedientes. Se puderem fazer exercícios suficientes, ele é um companheiro fiel e leal. Ele se concentra em tudo que faz e costuma encarar, o que costuma irritar outros animais. Ele também gosta de caçar outros animais. Ele é desconfiado e protetor em relação a estranhos.
 
 
Cuidados com o Border Collie
 
Poucos cães são tão voltados para o trabalho como o Border Collie. Esse é um cachorro que precisa de uma ocupação. Ele precisa de muita atividade física e mental todos os dias pra satisfazer suas necessidades de trabalho. Ele adora ficar com a família. Seu pelo precisa ser escovado ou penteado de uma a duas vezes por semana.
 
 
Saúde do Border Collie
 
Principais Preocupações: CHD
Preocupações Menores: PRA, luxação da lente, CEA, PDA, OCD, PPM
Vistos Ocasionalmente: Abiotrofia cerebelar, lipofuscinose ceróide, surdez
Exames sugeridos: quadril, olhos
Expectativa de vida: 10-14 anos
Observação: Sua alta tolerância à dor pode mascarar problemas
 
Cães semelhantes ao Border Collie
 
Pastor Australiano
Bearded Collie
Pastor Belga Malinois
Pastor Belga
Pastor Belga Tervuren
Australian Cattle Dog
Bouvier de Flandres
Briard
Cão de Canaã
Collie
', '2014-04-16 22:49:47', '2014-04-16 22:49:47', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '32', 'Collie', '1', '4', 'O Collie se tornou famoso pelo personagem da TV Lassie, conquistando imediatamente milhares de fãs pelo mundo todo.
 
Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Escócia
Função Original: pastor de ovelhas
Tamanho médio do macho: Alt: 60-66 cm, Peso: 27-34 kg
Tamanho médio da fêmea: Alt: 55-60 cm, Peso: 22-29 kg
Outros nomes: Collie Escocês
Posição no ranking de inteligência: 16ª posição

Origem e história da raça
 
A origem do Collie é tão misteriosa quanto à origem de seu nome. Uma teoria é que a raça teria a mesma raiz do Border Collie. Sobre a origem do nome, uma teoria é de que veio de uma palavra gaélica que quer dizer “útil”, o que descrevia o valor desses cães nas fazendas e rebanhos para os Celtas, primeiros habitantes das Ilhas Britânicas. Embora a proteção e o pastoreio de ovelhas seja uma das funções caninas mais antigas, só há evidências do Collie a partir de 1800. Tanto o Collie áspero como o Collie liso existiam nessa época, mas são derivados de cruzamentos diferentes. O tipo áspero era menor e com a cabeça mais larga, e normalmente sua cor era preta ou branca e preta. Na medida em que aumentou o interesse dos criadores pela raça, os dois tipos foram ficando maiores e mais refinados. O Collie do tipo áspero foi influenciado por um cachorro chamado “Old Cockie”, nascido em 1867 e considerado o responsável não apenas por estabelecer esse tipo, mas também por ter acrescentado a cor castanho clara. Nessa época, a Rainha Vitória se encantou pela raça. Com seu apoio, a popularidade do Collie cresceu não apenas entre os criadores de ovelhas, mas também entre membros da classe alta, que se apaixonaram por sua beleza. Em 1886 foi estabelecido um padrão que descreve a raça até os dias de hoje. Na mesma época, como os cães pastores de ovelhas tinham ficado importantes na América, os colonos levaram Collies com eles para o Novo Mundo. Em 1878, a Rainha Vitória colocou a raça novamente sob os holofotes apresentando dois collies na Exibição de Cães de Westminster. Isso despertou o desejo na elite americana de juntar ao clã Collie, e logo o Collie estava presente nos círculos de maior prestígio da América. Mais tarde, o Collie encontrou um novo defensor, o escritor Albert Payson Terhune, cujas histórias sobre os Collies espalharam sua fama por todas as camadas sociais. O mais famoso Collie de todos os tempos, a estrela de TV Lassie, ajudou a transforma o Collie áspero na raça mais querida de todos os tempos na América. O Collie liso nunca teve a mesma popularidade
 
 
Temperamento do Collie
 
O Collie é gentil e devotado, e amigo bem educado com todas as pessoas. Ele é um cão que herdou a vocação para o trabalho, por isso precisa de exercícios físicos e mentais todos os dias para não ficar frustrado. Ele é sensível, inteligente e gosta de agradar, embora às vezes seja um pouco teimoso. Ele pode mordiscar calcanhares quando está brincando. Alguns podem latir bastante.
 
 
Cuidados com o Collie
 
Uma boa caminhada ou corrida com coleira e algumas atividades divertidas são necessárias todos os dias. O Collie é tão voltado para a família que ele é muito mais feliz vivendo dentro de casa. O pelo do Collie liso precisa de poucos cuidados. Já o pelo do Collie áspero precisa ser escovado a cada dois dias ou mais, na época da troca de pelos.
 
 
Saúde do Collie
 
Principais Preocupações: CEA
Preocupações Menores: distiquíase, dermatite piotraumática
Vistos Ocasionalmente: PDA, surdez, Abiotrofia cerebelar (Áspero)
Exames Sugeridos: olhos, (cardíacos), (audição)
Expectativa de vida: 8-12 anos
Observações: costuma ser sensível a ivermectina. Merles não devem ser cruzados com merles. A geração de Merles homozigotos pode ser fatal ou afetar a saúde.
 
Cães semelhantes ao Collie
 
Pastor Australiano
Bearded Collien
Pastor Belga Malinois
Pastor Belga
Pastor Belga Tervuren
Border Terrier
Bouvier de Flandres
Briard
Cão de Canaã
Australian Cattle Dog
', '2014-04-16 22:52:57', '2014-04-16 22:52:57', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '33', 'Pastor Alemão', '1', '4', 'O Pastor Alemão é uma das três raças mais inteligentes do mundo. Não é à toa que foi estrela de diversos filmes e seriados e é uma das raças preferidas por quem deseja um excelente cão de guarda.
 
Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Alemanha
Função Original: pastor de ovelhas, cão de guarda, cão policial.
Tamanho médio do macho: Alt: 60-66 cm, Peso: 34-43 kg
Tamanho médio da fêmea: Alt: 55-60 cm, Peso: 34-43 kg
Outros nomes: Alsaciano, Deutscher schaferhund, pastor manto negro, pastor manto preto
Posição no ranking de inteligência: 3ª posição

Origem e história da raça

Apesar de sua aparência lembrar um lobo, o Pastor Alemão é uma raça criada bem recentemente e, contrariando a crença popular, ele é tão próximo do lobo quanto qualquer outra raça de cachorro. A raça é produto de um esforço consciente para gerar o pastor perfeito, capaz de pastorear e proteger seu rebanho. Talvez nenhuma outra raça tenha envolvido tantos esforços para aprimorar um cão, especialmente graças à criação em 1899 da Verein fur Deutsche Scharferhunde SV, uma organização dedicada a fiscalizar a criação do Pastor Alemão. Os criadores tentavam desenvolver não apenas um cão de pastoreio, mas que também se destacasse em trabalhos que exigissem coragem, atletismo e inteligência. Em pouco tempo, o Pastor Alemão provou ser um cão policial mais do que competente, e a criação seguinte aperfeiçoou habilidades de um companheiro e cão de guarda inteligente e corajoso. Durante a Primeira Guerra Mundial, ele foi a opção mais óbvia como sentinela de guerra. Na mesma época, o AKC mudou seu nome de Pastor Alemão para Cão Pastor, enquanto os britânicos alteraram para Lobo da Alsácia, em ambos os casos a intenção era apagar a associação com suas raízes alemãs. Lobo da Alsácia foi depois abandonado, pois o nome fez as pessoas terem medo da raça. Em 1931, o AKC restaurou o nome da raça para Pastor Alemão. O maior boom na popularidade do pastor aconteceu por meio de dois cães, ambos astros do cinema: Strongheart e Rin Tin Tin. O Pastor Alemão foi o número um em popularidade na América por muitos anos. Apesar de hoje em dia ele ter caído da primeira posição, o Pastor Alemão continua sendo um dos cães mais versáteis já criados, servindo como cão policial, cão de guerra, cão guia, cão de busca e salvamento, detector de drogas e explosivos, cão de exposição, cão de guarda, animal de estimação e até pastor.
 
 
Temperamento do Pastor Alemão
 
Uma das raças mais inteligentes, o Pastor Alemão é totalmente dedicado a qualquer que seja a sua missão, e é provavelmente insuperável em versatilidade no trabalho. Ele é inteiramente devotado e leal. Normalmente, ele se dá bem com outros animais domésticos.
 
 
Cuidados com o Pastor Alemão
 
Essa raça precisa de desafios mentais e físicos todos os dias. Ele adora longos exercícios e aulas de treinamento. Ele é ligado à família e vive bem como cachorro doméstico. Seu pelo precisa ser escovado uma a duas vezes por semana.
 
 
Saúde do Pastor Alemão
 
Principais Preocupações: CHD, Displasia do cotovelo
Preocupações Menores: panosteitis, vWD, paresia dos membros posteriores, cauda equina, dermatite piotraumática, alergias de pele, neoplasia maligna, pannus, catarata, torção gástrica, fístula perianal, cardiomiopatia
Vistos Ocasionalmente: insuficiência pancreática
Exames sugeridos: quadril, cotovelos, olhos (sangue)
Expectativa de vida: 10-12 anos
Observações: O Pastor Alemão é muito suscetível à infecção fatal sistêmica por fungos Aspergillus.
 
 
Cães semelhantes ao Pastor Alemão
 
Pastor Australiano
Bearded Collie
Pastor Belga
Border Terrier
Collie

', '2014-04-16 22:54:09', '2014-04-16 22:54:09', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '34', 'Pastor Australiano', '1', '4', 'Como todo cão pastor, o Pastor Australiano precisa de muito espaço e exercício. O ideal é que viva em uma casa com quintal ou em um sítio com espaço para correr.
 
Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Estados Unidos
Função Original: criação de gado
Tamanho médio do macho: Alt: 50-28 cm, Peso: 22-29 kg
Tamanho médio da fêmea: Alt: 45-53 cm, Peso: 18-20 kg
Outros nomes: nenhum
Posição no ranking de inteligência: 42ª posição

Origem e história da raça
 
O Pastor Australiano não é realmente uma raça australiana, mas chegou à América via Austrália. Uma teoria muito popular sobre a origem da raça vem do início de 1800, quando o povo basco da Europa se estabeleceu na Austrália, trazendo com eles suas ovelhas e seus cães pastores. Pouco tempo depois, muitos desses pastores se mudaram para o oeste dos Estados Unidos com seus cachorros e suas ovelhas. Naturalmente, os pastores americanos apelidaram esses cães de Pastores Australianos, em função de seu endereço anterior. As áreas difíceis da Austrália e do oeste americano exigiam muito mais desses cães do que eles enfrentavam na Europa. Uma série de cruzamentos e seleções rigorosas foi aprimorando suas habilidades para o trabalho, e o cão basco logo se adaptou e se superou sob aquelas condições tão difíceis. Essa raça permaneceu discreta até os anos 50, quando foi apresentada em shows em rodeios e participou de filmes. Muitos desses cães podem ser encontrados com pedigrees Aussies. O primeiro Aussie foi registrado pelo International English Shepherd Registry, hoje conhecido como National Stock Dog Registry. Em 1957, foi formado o Australian Shepherd Club of América que acabou se tornando o maior registro de Aussie da América. Muitos membros do Australian Shepherd Club achavam que o AKC não daria o reconhecimento oficial para a raça, por isso criaram o United States Australian Shepherd Association. O AKC reconheceu o Pastor Australiano em 1993. A popularidade da raça segundo as estatísticas do AKC subestima sua popularidade como animal de estimação porque grande quantidade de pastores australianos não está registrados no AKC. O Pastor Australiano está entre as raças mais versáteis, se destacando em obediência, pastoreio e em competição de agilidade. O Aussie também é perito em trabalhar com gado. Na verdade, alguns acham que seu estilo é até mais apropriado para o trabalho com gado bovino do que com ovelhas.
 
 
Temperamento do Pastor Australiano
 
O Pastor Australiano é altamente resistente, é amoroso, corajoso, alerta, confiante, independente, inteligente e atencioso. Se ele não puder se exercitar ou ser desafiado, ele se fica frustrado e muito difícil de conviver. Com exercícios apropriados e treinamento, ele é leal, profundamente devotado e um companheiro obediente. Ele é tímido com estranhos e tem instinto protetor. Pode tentar “pastorear” crianças e animais pequenos mordiscando.
 
 
Cuidados com o Pastor Australiano
 
Essa raça precisa de muita atividade física todos os dias, de preferência combinando desafios físicos e mentais. Apesar de poder viver ao ar livre em climas temperados, o contato humano é tão vital para essa raça que ele não se adapta vivendo no quintal. Seu pelo precisa ser escovado ou penteado de uma a duas vezes por semana.
 
 
Saúde do Pastor Australiano
 
Principais Preocupações: catarata, CEA
Preocupações Menores: CHD, dermatite solar nasal, síndrome de Pelger-Huet, colobomas da íris
Vistos Ocasionalmente: Síndrome lombar sacral, epilepsia, PRA, vWD,distiquíase, PDA, PPM
Exames sugeridos: quadril, olhos
Expectativa de vida: 12-15 anos
Observações: Essa raça costuma ser sensível a ivermectina. Porém, a dosagem para prevenção da dirofilariose é considerada segura. Os cruzamentos entre dois cães merle podem gerar descendentes merles homozigotos, o que é prejudicial à saúde, resultando normalmente em surdez e cegueira. Cruzamentos naturais entre raças bobtail podem gerar filhotes com graves defeitos na coluna vertebral.
 
 
Cães semelhantes ao Basenji
 
Australian Cattle Dog
Bearded Collie
Pastor Belga Malinois
Pastor Belga
Pastor Belga Tervuren
Border Terrier
Bouvier de Flandres
Briard
Cão de Canaã
Collie', '2014-04-16 22:55:45', '2014-04-16 22:55:45', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '35', 'Pastor de Shetland', '1', '4', 'O Pastor de Shetland, ou simplesmente “Sheltie”, está entre as 10 raças mais inteligentes e tem um desejo enorme de agradar seu dono e sua família, sendo facilmente adestrado. Por ser um cão pastor, pode ter a tendência de latir em demasia.
 
Família: pastoreio, pecuária
Grupo do AKC: Pastores
Área de origem: Escócia (Ilhas Shetland)
Função Original: pastor de ovelhas
Tamanho médio do macho: Alt: 33-40 cm, Peso: 9 kg
Tamanho médio da fêmea: Alt: 33-40 cm, Peso: 9 kg
Outros nomes: Sheltie
Posição no ranking de inteligência: 6ª posição

Origem e história da raça
Os ancestrais do Pastor de Shetland foram os pastores da Escócia que também estão nas raízes do Collie e do Border Collie. Alguns desses cães eram bem pequenos, medindo cerca de 45 cm de altura. É quase certo que o Pastor de Shetland deriva desses primeiros cães do tipo Collie, que foram depois produzidos nas Ilhas Shetland. Alguns cães da ilha também podem ter tido um papel e mesmo o Cavalier King Charles Spaniel preto e castanho. A escassez de vegetação favorecia um gado menor e os cães necessários para pastoreá-los eram proporcionalmente menores. Em uma terra com poucas cercas, um pastor adaptado era essencial para manter o rebanho longe das terras cultivadas. Como todos os cães de fazenda, eles pastoreavam não apenas ovelhas, mas também pôneis e galinhas. Em algumas áreas distantes, era costume manter os animais em casa durante o inverno, e o amável cão pastor conquistou seu lugar como parte da família. Por causa desse isolamento do resto do mundo, a raça se definiu em um tempo relativamente curto. A frota naval britânica costumava frequentar as ilhas para manobras e levava filhotes para serem criados na Inglaterra. Os primeiros cães eram chamados de “toonie dogs” (“toon” era o termo usado em Shetland para “fazenda”), mas eles começaram a ser exibidos (por volta de 1906) como Shetland Collies. Os criadores de collies não aceitaram esse o nome, que foi mudado para Pastor de Shetland. A raça é muito mais chamada por seu apelido “Sheltie”. Nos primeiros anos na Inglaterra, criadores costumavam cruzar Shelties com Collies de pelo áspero na tentativa de melhorar suas características Collie. Essa prática gerou Shelties de tamanho acima da média e não voltou a ser feita. Acompanhando a imensa popularidade do Collie, o Sheltie se tornou o cão perfeito para famílias que procuravam um cão de estimação leal, marcante e de tamanho menor, e hoje é uma das raças mais populares do mundo.
 
 
Temperamento do Pastor de Shetland
 
O Pastor de Shetland é extremamente inteligente, sensível e com desejo de agradar. Essa combinação faz dele um cachorro muito obediente, que aprende rápido e muito devotado à família. Além de gentil, brincalhão, amável e companheiro, ele é ótimo com crianças, embora possa mordiscar calcanhares nas brincadeiras. Ele late bastante.
 
 
Cuidados com o Pastor de Shetland
 
O Shetie é enérgico, mas fica feliz com uma longa caminhada, uma corrida curta ou umas sessões de treino. Ele é muito ligado à sua família e deveria ser um cachorro da casa. Seu pelo cheio precisa ser escovado a cada dois dias.
 
 
Saúde do Pastor de Shetland
 
Principais Preocupações: dermatomiosite
Preocupações Menores: CEA, PRA, triquíase, catarata, hemofilia, Doença De Legg-Perthes, luxação da patela
Vistos Ocasionalmente: PDA, surdez, epilepsia, vWD
Exames sugeridos: olhos, quadris, DNA para vWD
Expectativa de Vida: 12-14 anos
Observações: pode ser sensível a ivermectina. Merles não devem ser cruzados com merles. A geração de Merles homozigotos pode ser fatal ou afetar a saúde.
 
 
Cães semelhantes ao Pastor de Shetland
 
Pastor Australiano
Bearded Collie
Pastor Belga
Border Collie
', '2014-04-16 22:56:58', '2014-04-16 22:56:58', '1' );
INSERT INTO `racas`(`id`,`descricao`,`especie_id`,`grupo_id`,`observacao`,`created`,`updated`,`ativo`) VALUES ( '36', 'Pastor Maremano Abruzês', '1', '4', 'O Pastor Maremano Abruzês é uma excelente raça para guarda de rebanhos. Ainda raro no Brasil, o canil Bocaina’s Borders é um dos melhores canis na criação dessa raça.
 
Família: pastoreio
Grupo do AKC: Pastores
Área de origem: Itália
Função Original: pastoreio, guarda
Tamanho médio do macho: Alt: 65-73 cm, Peso: 35-45 kg
Tamanho médio da fêmea: Alt: 60-68 cm, Peso: 30-40 kg
Outros nomes: nenhum
Posição no ranking de inteligência: desconhecida

Origem e história da raça

Alguns dizem que antigamente eram duas raças distintas: o Abruzês e o Maremano. O Abruzês era um cão de montanha e tinha um porte maior, enquanto o Maremano tinha o pelo levemente mais curto. Entretanto, nos anos 50, os dois foram estabelecidos oficialmente como uma única raça, levando o nome de Pastor Maremano Abruzês. Essa é uma raça típica para guardar rebanhos, descentende de pastores europeus como o Karabash, Akbash (Turquia), o Kuvac (Eslováquia), o Kuvasz e o Komondor (Hungria) e o Cão dos Pirineus, da França. Embora seja visto regularmente na Grã-bretanha, essa raça ainda é rara em países fora da Itália. Não é uma raça muito propensa ao treinamento de obediência, mas é um excelente guarda para rebanhos.
 
 
Temperamento do Pastor Maremano Abruzês
 
O Pastor Maremano é muito amigável e bem equilibrado guarda de rebanho. É também um excelente cão de companhia. Um cão leal, corajoso e determinado, é um magnífico cão de guarda para rebanhos sem latir demais. É muito afetuoso mas não é dependente do dono. São criados para serem independentes. Você deve ser um dono calmo, mas firme, confiante e consistente com o seu cão para que ele obedeça ao treinamento, embora seja um cão muito inteligente. O Pastor Maremano se dá muito bem com outros cães e animais e pode ser um pouco reservado com estranhos, mas não muito. O Maremano é alerta e controla o rebanho perfeitamente. Como cão de companhia, ele não é muito apegado e extrovertido, mas é um excelente cão para a família, pois defende sua casa e particularmente crianças.
 
 
Cuidados
 
O Pastor Maremano não é recomendado para viver em apartamentos. Se fizer bastante exercício, será um cão calmo dentro de casa, porém essa raça foi acostumada há séculos a lugares amplos como sítios e fazendas. Seu pelo espesso permite que ele durma do lado de fora, embora psicologicamente estar junto com a família seja fundamental. Jamais submeta seu Pastor Maremano a temperaturas muito altas e nos dias mais quentes deve ter muita água e sombra à disposição.
 
Expectativa de Vida: 11-13 anos
', '2014-04-16 22:58:20', '2014-04-16 22:58:20', '1' );
-- ---------------------------------------------------------


-- Dump data of "role" -------------------------------------
INSERT INTO `role`(`id`,`role`,`alias`) VALUES ( '1', 'Administrador', 'admin' );
-- ---------------------------------------------------------


-- Dump data of "servicos" ---------------------------------
INSERT INTO `servicos`(`id`,`codinterno`,`descricao`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`categoria_id`,`observacoes`,`user_id_modified`,`modified`,`created`,`ativo`) VALUES ( '1', 'APL-01', 'Aplicação de vacina', NULL, NULL, NULL, NULL, NULL, 0x4170C3B3732061706C696361C3A7C3A36F2C20616E696D616C2073756A6569746F206120656E6A6F6F73, NULL, '2014-06-01 19:20:44', '2014-05-10 22:51:09', '1' );
INSERT INTO `servicos`(`id`,`codinterno`,`descricao`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`categoria_id`,`observacoes`,`user_id_modified`,`modified`,`created`,`ativo`) VALUES ( '2', 'BT-RP', 'Banho e Tosa - Raças Pequenas', '38.0000', '32.9900', '31.9900', '29.9900', NULL, 0x42616E686F2070617261207261C3A761732070657175656E6173, NULL, '2014-05-10 23:57:56', '2014-05-10 23:47:22', '1' );
INSERT INTO `servicos`(`id`,`codinterno`,`descricao`,`valor_venda`,`valor_promocao`,`valor_promocao2`,`valor_promocao3`,`categoria_id`,`observacoes`,`user_id_modified`,`modified`,`created`,`ativo`) VALUES ( '3', 'BT-RM', 'Banho e Tosa - Raças Médias', '55.0000', '52.9900', '49.9900', '46.9900', NULL, '', NULL, '2014-05-10 23:57:09', '2014-05-10 23:57:09', '1' );
-- ---------------------------------------------------------


-- Dump data of "system_menus" -----------------------------
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '1', 'Dashboard', '/', '0', '', 'icon-home', '1', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '2', 'Cadastros', 'javascript:void(0)', '1', '', 'icon-group', '3', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '3', 'Financeiro', 'javascript:void(0)', '1', '', 'icon-dollar', '5', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '4', 'Vendas', 'javascript:void(0)', '1', '', 'icon-shopping-cart', '6', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '5', 'Relatorios', 'javascript:void(0)', '1', '', 'icon-list-ul', '7', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '6', 'Configurações', 'javascript:void(0)', '1', '', 'icon-cogs', '8', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '7', 'Movimentações', 'javascript:void(0)', '1', NULL, 'icon-random', '4', 'ALL' );
INSERT INTO `system_menus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`modulename`) VALUES ( '8', 'Atendimento', 'javascript:void(0)', '1', NULL, 'icon-female', '2', 'ALL' );
-- ---------------------------------------------------------


-- Dump data of "system_submenus" --------------------------
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '1', 'Clientes', '/clientes/listar', '1', '', 'icon-user', '1', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '2', 'Pets', '/pets/listar', '1', '', 'icon-linux', '2', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '3', 'Produtos', '/produtos/listar', '1', '', 'icon-truck', '3', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '4', 'A Pagar', 'javascript:void(0);', '1', 'drawer--minus.png', NULL, '0', '0', NULL );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '5', 'A Receber', 'javascript:void(0);', '1', 'drawer--plus.png', NULL, '0', '0', NULL );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '6', 'Produtos', 'javascript:void(0);', '1', 'truck.png', NULL, '0', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '7', 'Serviços', 'javascript:void(0);', '1', 'puzzle.png', NULL, '0', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '8', 'Empresa', 'javascript:void(0);', '1', '', NULL, '6', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '9', 'Tabelas Auxiliares', 'javascript:void(0);', '1', NULL, NULL, '1', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '10', 'Menus', '/menus/listar', '1', NULL, NULL, '2', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '11', 'Controles de Acesso', 'javascript:void(0);', '1', NULL, NULL, '3', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '12', 'Usuarios', 'javascript:void(0);', '1', NULL, NULL, '4', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '13', 'Configurador de Etiquetas', 'javascript:void(0);', '1', NULL, NULL, '5', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '14', 'SubSubMenu', 'javascript:void(0);', '1', NULL, NULL, '6', '6', '6' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '15', 'Serviços', '/servicos/listar', '1', NULL, 'icon-briefcase', '4', '2', '2' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '17', 'Estoque', '/estoque', '1', NULL, 'icon-dropbox', '1', '7', '7' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '18', 'Caixa', 'javascript:void(0);', '1', NULL, 'icon-dollar', '2', '7', '7' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '19', 'Consulta', 'javascript:void(0);', '1', NULL, 'icon-check', '2', '8', '8' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '20', 'Agendar', 'javascript:void(0);', '1', NULL, 'icon-calendar', '3', '8', '8' );
INSERT INTO `system_submenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '21', 'Fila Atendimento', '/atendimentos/fila', '1', NULL, 'icon-male', '1', '8', '8' );
-- ---------------------------------------------------------


-- Dump data of "system_subsubmenus" -----------------------
INSERT INTO `system_subsubmenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '107', 'Sub 1', 'nada', '1', 'wer', 'icon-windows', '1', '14', '1' );
INSERT INTO `system_subsubmenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '108', 'Sub 2', 'dois', '1', 'weqrwe', 'icon-bullhorn', '2', '14', '3' );
INSERT INTO `system_subsubmenus`(`id`,`menuname`,`menulink`,`hassub`,`menuimage`,`menuimageclass`,`menuposition`,`fathermenu`,`menu_id`) VALUES ( '109', 'Sub 3', 'tre', '1', NULL, ' icon-external-link', '3', '14', NULL );
-- ---------------------------------------------------------


-- Dump data of "tabelas_auxiliares" -----------------------
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '1', 'atendimento_prioridade', '1', 'Baixa' );
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '2', 'atendimento_prioridade', '2', 'Média' );
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '3', 'atendimento_prioridade', '3', 'Alta' );
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '4', 'atendimento_tipo', '1', 'Nova Consulta' );
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '5', 'atendimento_tipo', '2', 'Retorno Consulta' );
INSERT INTO `tabelas_auxiliares`(`id`,`auxiliar`,`codigo`,`valor`) VALUES ( '6', 'atendimento_tipo', '3', 'Aplicação de Vacina' );
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`id`,`role_id`,`username`,`password`,`ativo`) VALUES ( '2', '1', 'andre', 'andre', '0' );
INSERT INTO `users`(`id`,`role_id`,`username`,`password`,`ativo`) VALUES ( '3', '0', 'camila', '00bfc45be8af9d66a43cf280e8b33d2efb2dea12', '1' );
INSERT INTO `users`(`id`,`role_id`,`username`,`password`,`ativo`) VALUES ( '4', '0', 'cake', '4152c43e1e7554f61f50cb81c46d9dbf704825d0', '1' );
INSERT INTO `users`(`id`,`role_id`,`username`,`password`,`ativo`) VALUES ( '5', '0', 'ronald', 'eb1ad7f414a70feec0d72f00f9e9a8851ce3ed88', '1' );
-- ---------------------------------------------------------


-- CREATE INDEX "prodst" -----------------------------------
CREATE INDEX `prodst` USING BTREE ON `estoque`( `produto_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "raca_id" ----------------------------------
CREATE INDEX `raca_id` USING BTREE ON `pets`( `raca_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "fathermenu" -------------------------------
CREATE INDEX `fathermenu` USING BTREE ON `system_submenus`( `fathermenu` );
-- ---------------------------------------------------------


-- CREATE INDEX "fathermenu_2" -----------------------------
CREATE INDEX `fathermenu_2` USING BTREE ON `system_submenus`( `fathermenu` );
-- ---------------------------------------------------------


-- CREATE INDEX "fathermenu_3" -----------------------------
CREATE INDEX `fathermenu_3` USING BTREE ON `system_submenus`( `fathermenu` );
-- ---------------------------------------------------------


-- CREATE INDEX "fathermenu_4" -----------------------------
CREATE INDEX `fathermenu_4` USING BTREE ON `system_submenus`( `fathermenu` );
-- ---------------------------------------------------------


-- CREATE INDEX "menu_id" ----------------------------------
CREATE INDEX `menu_id` USING BTREE ON `system_submenus`( `menu_id` );
-- ---------------------------------------------------------


-- CREATE INDEX "fathermenu" -------------------------------
CREATE INDEX `fathermenu` USING BTREE ON `system_subsubmenus`( `fathermenu` );
-- ---------------------------------------------------------


-- CREATE INDEX "submenu_id" -------------------------------
CREATE INDEX `submenu_id` USING BTREE ON `system_subsubmenus`( `menu_id` );
-- ---------------------------------------------------------


-- CREATE LINK "estoque_ibfk_1" ----------------------------
ALTER TABLE `estoque` ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY ( `produto_id` ) REFERENCES `produtos`( `id` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "raca" --------------------------------------
ALTER TABLE `pets` ADD CONSTRAINT `raca` FOREIGN KEY ( `raca_id` ) REFERENCES `racas`( `id` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "subsubmenu" --------------------------------
ALTER TABLE `system_subsubmenus` ADD CONSTRAINT `subsubmenu` FOREIGN KEY ( `fathermenu` ) REFERENCES `system_submenus`( `id` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


