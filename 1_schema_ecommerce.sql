-- Exemplo de estrutura inicial para a tabela de Clientes
CREATE TABLE IF NOT EXISTS Clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) UNIQUE,
    Address VARCHAR(100)
);
