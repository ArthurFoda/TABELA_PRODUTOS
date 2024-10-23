-- 1. Criação da tabela Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecivel BOOLEAN NOT NULL,
    marca VARCHAR(50),
    nacionalidade VARCHAR(50)
);

-- 2. Inserção de cinco produtos
INSERT INTO Produtos (id_produto, nome, preco, estoque, perecivel, marca, nacionalidade) VALUES
(1, 'Maçã', 3.50, 100, TRUE, 'Frutaria', 'Brasil'),
(2, 'Arroz', 5.20, 50, FALSE, 'Grãos Ltda', 'Brasil'),
(3, 'Leite', 4.00, 30, TRUE, 'Laticínios', 'Brasil'),
(4, 'Feijão', 7.00, 70, FALSE, 'Legumes e Cia', 'Brasil'),
(5, 'Iogurte', 2.80, 20, TRUE, 'Laticínios', 'Brasil');

-- 3. Verificação dos dados inseridos
SELECT * FROM Produtos;

SELECT COUNT(*) AS total_produtos FROM Produtos;
SELECT AVG(preco) AS preco_medio FROM Produtos;

SELECT 
    perecivel,
    AVG(preco) AS preco_medio
FROM Produtos
GROUP BY perecivel;

SELECT 
    nome,
    AVG(preco) AS preco_medio
FROM Produtos
GROUP BY nome;

SELECT 
    AVG(preco) AS preco_medio,
    SUM(estoque) AS total_estoque
FROM Produtos;

SELECT 
    nome,
    marca,
    estoque
FROM Produtos
WHERE preco = (SELECT MAX(preco) FROM Produtos);

SELECT * 
FROM Produtos
WHERE preco > (SELECT AVG(preco) FROM Produtos);

SELECT 
    nacionalidade,
    COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY nacionalidade;
