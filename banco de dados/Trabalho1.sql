CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50)
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10,2),
    estoque INT
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    data_pedido DATE DEFAULT CURRENT_DATE
);

CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT
);

INSERT INTO clientes (nome, email, cidade) VALUES
('João Silva', 'joao@email.com', 'Curitiba'),
('Maria Oliveira', 'maria@email.com', 'São Paulo'),
('Carlos Pereira', 'carlos@email.com', 'Curitiba'),
('Ana Souza', 'ana@email.com', 'Rio de Janeiro');

INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook', 3500.00, 10),
('Smartphone', 2000.00, 20),
('Mouse', 50.00, 100),
('Teclado', 120.00, 50);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2025-08-01'),
(2, '2025-08-02');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 4, 1);

--Exercicio1
--1. Crie uma função soma que receba dois números inteiros e retorne a soma deles.

CREATE FUNCTION add(integer, integer) RETURNS integer AS '
select $1 + $2;
' LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

select add(1,1)

--Exercicio2
--2. Crie uma função estoque_produto que receba o nome de um produto e retorne o estoque disponível.

CREATE FUNCTION estoque_produto(nome_prod TEXT)
RETURNS INT
AS $$
    SELECT estoque
    FROM produtos
    WHERE nome = nome_prod;
$$ LANGUAGE sql;

select estoque_produto('Notebook');

--Exercicio3
--3. Crie uma função preco_com_desconto que receba o nome de um produto e um percentual de desconto, retornando o preço final.

CREATE OR REPLACE FUNCTION preco_com_desconto(nome_prod TEXT, desconto NUMERIC)
RETURNS NUMERIC(10,2)
AS $$
    SELECT ROUND(preco - (preco * (desconto / 100)), 2)
    FROM (
        SELECT preco
        FROM produtos
        WHERE nome = nome_prod
        LIMIT 1
    ) AS sub;
$$ LANGUAGE sql;

select preco_com_desconto('Notebook', 10);
DROP FUNCTION preco_com_desconto(TEXT, NUMERIC);

--Exercicio4
--4. Crie uma função total_itens_pedido que receba o ID de um pedido e retorne a soma das quantidades de todos os itens desse pedido.

CREATE OR REPLACE FUNCTION total_itens_pedido(p_id INT)
RETURNS INT
AS $$
    SELECT COALESCE(SUM(quantidade), 0)
    FROM itens_pedido
    WHERE id_pedido = p_id;
$$ LANGUAGE sql;

SELECT total_itens_pedido(1);

--Exercicio5
--5. Crie uma função busca_cliente_email que receba um email e retorne o nome do cliente correspondente.

CREATE OR REPLACE FUNCTION busca_cliente_email(email_cliente TEXT)
RETURNS TEXT
AS $$
    SELECT nome
    FROM clientes
    WHERE email = email_cliente
    LIMIT 1;
$$ LANGUAGE sql;

SELECT busca_cliente_email('joao@email.com');

--ExercicioPT2

--Exercicio1
--1. Crie uma função aumenta_estoque que receba o ID de um produto e uma quantidade, atualizando o estoque desse produto.
