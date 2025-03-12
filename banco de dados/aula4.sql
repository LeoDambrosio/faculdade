---EXERCICIO 1
create table cliente(
	id_cliente serial primary key,
	nome varchar(100) not null,
	email varchar(150)unique,
	data_nacimento date
);

---EXERCICIO 2
create table pedido(
	id_pedido serial primary key,
	id_cliente int,
    data_pedido date not null,
	valor_total numeric(10,2) not null,
	constraint fk_cliente foreign key (id_cliente) references cliente (id_cliente)
);

---EXERCICIO 3

---EXERCICIO 4
create table produto(
	id_produto serial primary key,
	nome varchar(200) not null,
	preco numeric(10,2) default 00.0
);

---EXERCICIO 5
ALTER TABLE produto ALTER COLUMN preco TYPE numeric;

---EXERCICIO 6
ALTER TABLE Produto ADD COLUMN estoque text;

---EXERCICIO 7
ALTER TABLE Produto DROP COLUMN estoque;

---EXERCICIO 8
ALTER TABLE Produto ADD CHECK (nome <> '');

---EXERCICIO 9
ALTER TABLE Produto DROP CONSTRAINT produto_pkey;

---EXERCICIO 10
ALTER TABLE pedido RENAME TO vendas;

---EXERCICIO 11
--O comando DROP TABLE é usado para descartar uma tabela existente.
--Não será possível descartar uma tabela se ela estiver referenciada por outros objetos, como acionadores, ou se contiver quaisquer dados. 

---EXERCICIO 12
--O comando TRUNCATE TABLE remove todas as linhas de uma tabela sem registrar as exclusões de linhas individuais – ou seja, remove o conteúdo de uma tabela em uma única instrução.

---EXERCICIO 13
--DROP DATABASE loja_virtual;

---EXERCICIO 14
--O comando TRUNCATE TABLE remove todas as linhas de uma tabela sem registrar as exclusões de linhas individuais – ou seja, remove o conteúdo de uma tabela em uma única instrução.
--Para deletar todas as linhas, tuplas, de uma tabela utiliza-se o comando delete:

---EXERCICIO 15
--ALTER TABLE Produto RENAME COLUMN nome TO decricao_produto;

