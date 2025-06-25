CREATE DATABASE SorveteControl;

CREATE TABLE produto (
    idproduto serial PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

select * from produto;

CREATE TABLE pedido (
    idpedido SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    observacao TEXT
);

select * from pedido;
