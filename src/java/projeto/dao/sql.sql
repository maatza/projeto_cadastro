SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
-- Database: `db`
-- Esta tabela servirá para armazenar dados de CLIENTES e FORNECEDORES.
-- O campo tipo determina se o registro é de cliente ou fornecedor.
-- O campo valorUltOper servirá para armazenar o:
--      "valor da última venda" para cada cliente.
--      "valor da última compra" de cada fornecedor.
CREATE TABLE `tb_clientes` (
    id              int         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome            varchar(30) NOT NULL,
    telefone        varchar(20) NOT NULL,
    valorAcumulado  float       NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


