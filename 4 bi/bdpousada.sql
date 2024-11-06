-- --------------------------------------------------------
-- Servidor:                     carmine
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para 2dsa_davi_monte
DROP DATABASE IF EXISTS `2dsa_davi_monte`;
CREATE DATABASE IF NOT EXISTS `2dsa_davi_monte` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `2dsa_davi_monte`;

-- Copiando estrutura para tabela 2dsa_davi_monte.tb01_pousada
DROP TABLE IF EXISTS `tb01_pousada`;
CREATE TABLE IF NOT EXISTS `tb01_pousada` (
  `tb01_id` int(11) NOT NULL,
  `tb01_telefone` int(11) NOT NULL,
  `tb01_cnpj` int(11) NOT NULL DEFAULT '0',
  `tb01_regiao` varchar(100) NOT NULL,
  PRIMARY KEY (`tb01_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb02_clientes
DROP TABLE IF EXISTS `tb02_clientes`;
CREATE TABLE IF NOT EXISTS `tb02_clientes` (
  `tb02_cpf` int(11) NOT NULL,
  `tb02_nome` varchar(100) NOT NULL,
  `tb02_idade` int(11) NOT NULL,
  `tb02_email` varchar(200) NOT NULL,
  `tb02_codigo` int(11) NOT NULL,
  `tb02_celular` int(11) DEFAULT NULL,
  `tb02_dt_nasc` date DEFAULT NULL,
  `tb02_endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tb02_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb03_reservas
DROP TABLE IF EXISTS `tb03_reservas`;
CREATE TABLE IF NOT EXISTS `tb03_reservas` (
  `tb03_codigo` int(11) NOT NULL,
  `tb03_regiao` varchar(50) NOT NULL,
  `tb03_quarto` int(11) NOT NULL,
  `tb03_dt_reserva` date NOT NULL,
  `tb03_cpf` int(11) NOT NULL,
  `tb03_tipo_quarto` varchar(50) NOT NULL,
  `tb03_quadra` int(11) NOT NULL,
  `tb03_nome` varchar(100) DEFAULT NULL,
  `tb03_endereco` varchar(100) DEFAULT NULL,
  `tb03_numerop` int(11) DEFAULT NULL,
  `tb03_telefone` int(11) DEFAULT NULL,
  `tb03_idade` int(11) DEFAULT NULL,
  `tb03_dt_check` date DEFAULT NULL,
  PRIMARY KEY (`tb03_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb04_checkin
DROP TABLE IF EXISTS `tb04_checkin`;
CREATE TABLE IF NOT EXISTS `tb04_checkin` (
  `tb04_codigo` int(11) NOT NULL,
  `tb04_cpf` int(11) NOT NULL,
  `tb04_data` date NOT NULL,
  `tb04_hora_entrada` time NOT NULL,
  PRIMARY KEY (`tb04_codigo`),
  KEY `FK_tb04_checkin_tb02_clientes` (`tb04_cpf`),
  CONSTRAINT `FK_tb04_checkin_tb02_clientes` FOREIGN KEY (`tb04_cpf`) REFERENCES `tb02_clientes` (`tb02_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb04_checkin_tb03_reservas` FOREIGN KEY (`tb04_codigo`) REFERENCES `tb03_reservas` (`tb03_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb05_checkout
DROP TABLE IF EXISTS `tb05_checkout`;
CREATE TABLE IF NOT EXISTS `tb05_checkout` (
  `tb05_codigo` int(11) NOT NULL,
  `tb05_hora_saida` time NOT NULL,
  `tb05_cpf` int(11) DEFAULT NULL,
  `tb05_data_saida` date NOT NULL,
  PRIMARY KEY (`tb05_codigo`),
  KEY `FK_tb05_checkout_tb02_clientes_2` (`tb05_cpf`),
  CONSTRAINT `FK_tb05_checkout_tb02_clientes` FOREIGN KEY (`tb05_codigo`) REFERENCES `tb02_clientes` (`tb02_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb05_checkout_tb02_clientes_2` FOREIGN KEY (`tb05_cpf`) REFERENCES `tb02_clientes` (`tb02_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb08_funcionarios
DROP TABLE IF EXISTS `tb08_funcionarios`;
CREATE TABLE IF NOT EXISTS `tb08_funcionarios` (
  `tb08_cpf` int(11) NOT NULL,
  `tb08_cargo` varchar(50) NOT NULL,
  `tb08_nome` varchar(50) NOT NULL,
  `tb08_saida` time NOT NULL,
  `tb08_entrada` time DEFAULT NULL,
  `tb08_endereco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tb08_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela 2dsa_davi_monte.tb09_gastos
DROP TABLE IF EXISTS `tb09_gastos`;
CREATE TABLE IF NOT EXISTS `tb09_gastos` (
  `tb09_gastos_restaurante` double(9,2) NOT NULL DEFAULT '0.00',
  `tb09_codigo` int(11) NOT NULL,
  `tb09_custos_recreaçao` double(9,2) NOT NULL,
  PRIMARY KEY (`tb09_codigo`),
  KEY `FK_tb09_gastos_tb07_restaurante` (`tb09_gastos_restaurante`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
