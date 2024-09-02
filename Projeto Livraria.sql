CREATE DATABASE livraria;
USE livraria;

CREATE TABLE Fornecedores (
    idFornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    cnpj VARCHAR(20),
    contato VARCHAR(100)
);

CREATE TABLE Livros (
    idLivro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidadeEstoque INT
);

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Vendas (
    idVenda INT PRIMARY KEY,
    total DECIMAL(10, 2),
    data DATE,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Fornece (
    idLivro INT,
    idFornecedor INT,
    PRIMARY KEY (idLivro, idFornecedor),
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor)
);

CREATE TABLE Conter (
    idLivro INT,
    idVenda INT,
    PRIMARY KEY (idLivro, idVenda),
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
    FOREIGN KEY (idVenda) REFERENCES Vendas(idVenda)
);

INSERT INTO Livros (idLivro, titulo, autor, preco, quantidadeEstoque) VALUES 
(1, 'A Guerra dos Tronos', 'George R. R. Martin', 49.90, 10), 
(2, 'A Fúria dos Reis', 'George R. R. Martin', 59.90, 8), 
(3, 'A Tormenta de Espadas', 'George R. R. Martin', 69.90, 6), 
(4, 'O Festim dos Corvos', 'George R. R. Martin', 59.90, 5), 
(5, 'A Dança dos Dragões', 'George R. R. Martin', 69.90, 7);

INSERT INTO Fornecedores (idFornecedor, nome, cnpj, contato)
VALUES
(3, 'Tywin Lannister', '11223344556677', 'tywin.lannister@casterlyrock.com'),
(4, 'Otto Hightower', '99887766554433', 'otto.hightower@kingslanding.com');

INSERT INTO Fornece (idFornecedor, idLivro)
VALUES
(3, 1),  -- Tywin Lannister fornece 'A Guerra dos Tronos'
(3, 2),  -- Tywin Lannister fornece 'A Fúria dos Reis'
(4, 4),  -- Otto Hightower fornece 'O Festim dos Corvos'
(4, 5);  -- Otto Hightower fornece 'A Dança dos Dragões'

INSERT INTO Clientes (idCliente, nome, telefone, email)
VALUES
(1, 'Jon Snow', '555-0100', 'jon.snow@example.com'),
(2, 'Daenerys Targaryen', '555-0200', 'daenerys.targaryen@example.com'),
(3, 'Tyrion Lannister', '555-0300', 'tyrion.lannister@example.com');

INSERT INTO Vendas (idVenda, total, data, idCliente)
VALUES
(1, 49.90, '2024-09-02', 1),
(2, 59.90, '2024-09-02', 2),
(3, 69.90, '2024-09-02', 3);

INSERT INTO Conter (idLivro, idVenda)
VALUES
(1, 1),  -- Jon Snow comprou 'A Guerra dos Tronos'
(2, 2),  -- Daenerys Targaryen comprou 'A Fúria dos Reis'
(3, 3);  -- Tyrion Lannister comprou 'A Tormenta de Espadas'
