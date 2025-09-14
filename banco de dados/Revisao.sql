1--DML linguagem manipulacao de dados.
--EX: create, alter e drop.
	
--DDL linguagem definicao de dados.
--EX: insert, update e delete.
	
--DQL linguagem consulta de dados.
--EX: select, from e where.

2--TCL Linguagem de Controle de Transações, é uma subcategoria de comandos SQL que lida com a gestão das transações em um banco de dados. 
--EX:Commit, Rollback, Save Point e Set Transaction.

3--DCL Linguagem de Controle de Dados, é uma subcategoria de comandos SQL que trata da concessão e revogação de permissões aos usuários do banco de dados.
--Grant e Revoke.

4--Dado o esquema abaixo:

create table Banco(
	id_Banco serial primary key,
	nome varchar(200),
	descricao varchar(200),
	endereco varchar(200),
	valorDeMercado bigint,
	telefone bigint
);

create table Cidade(
	id_Cidade serial primary key,
	nome varchar(200),
	estado varcar(200),
	quantidadePopulacao bigint
);

create table Agencia(
	id_Agencia serial primary key,
	nome varchar(200),
	id_Cidade references Cidade(id_Cidade),
	totalCliente bigint,
	id_Banco int references Banco(id_Banco),
	telefone bigint 
);

create table Pessoa(
	id_Cidade serial primary key,
	cpf bigint,
	nome varchar(200),
	telefone bigint
);

create table pessoaAgencia(
	id_pessoaAgnecia serial primary key,
	id_Agencia references Agencia(id_Agencia),
	id_Pessoa references Pessoa(id_Pessoa)
);

insert into Banco (nome, descricao, endereco, valorDeMercado, telefone)
values 
('Banco do Brasil', 'Banco tradicional', 'Av. Paulista, 1000 - SP', 5000000000, 1131210000),
('Caixa Econômica', 'Banco público', 'Setor Bancário Sul - DF', 3000000000, 6132112000),
('Itaú', 'Banco privado', 'Rua Itaim, 200 - SP', 7000000000, 1132113000);

insert into Cidade (nome, estado, quantidadePopulacao)
values
('São Paulo', 'SP', 12300000),
('Rio de Janeiro', 'RJ', 6700000),
('Belo Horizonte', 'MG', 2500000);

insert into Agencia (nome, id_Cidade, totalCliente, id_Banco, telefone) values
('Agência Paulista', 1, 15000, 1, 1132221111),
('Agência Copacabana', 2, 8000, 2, 2133332222),
('Agência Savassi', 3, 5000, 3, 3134445555);

insert into Pessoa (cpf, nome, telefone) values
(12345678901, 'João Silva', 11999990001),
(23456789012, 'Maria Oliveira', 21999990002),
(34567890123, 'Carlos Souza', 31999990003);

insert into pessoaAgencia (id_Agencia, id_Pessoa)
values
(1, 1),
(2, 2),
(3, 3);

select p.nome, p.cpf, b.nome, b.nome, a.nome, c.nome
from Pessoa p
join pessoaAgencia pa on p.id_Pessoa = pa.id_Pessoa
join Agencia a on pa.id_Agencia = a.id_Agencia
join Banco b on a.id_Banco = b.id_Banco
join Cidade c on a.id_Cidade = c.id_Cidade
where b.valorDeMercado > X
  and a.totalCliente >= Y
  and c.quantidadePopulacao > Z;

select b.nome, a.nome, p.nome, p.cpf, c.nome
from Pessoa p
join pessoaAgencia pa on p.id_Pessoa = pa.id_Pessoa
join Agencia a on pa.id_Agencia = a.id_Agencia
join Banco b on a.id_Banco = b.id_Banco
join Cidade c on a.id_Cidade = c.id_Cidade;

--5 Explique o que é uma Function.
--Uma FUNCTION é um bloco de código PL/SQL que pode ser invocado sempre que necessário.

--6 Quais as funções que retornam data e hora no postgresql?
--age(timestamp, timestamp) returns interval
--current_date returns date
--current_time returns time
--current_timestamp returns timestamp
--now() returns timestamp
--date_part(text, timestamp) returns real

--7 Como converter um dado qualquer para um texto no postgresql? Faça alguns exemplos.
--No PostgreSQL, a conversão de tipos de dados também pode ser feita usando o operador ::, que é equivalente ao CAST.
--EX: select cast(123 as text); e select 123 :: text;

--8 Qual a diferença entre CAST e CONVERT?
--o Cast converte de forma simples sem ter opcoes de personalisacao ja o Convert vc pode personalisar com UTF8 para LATIN1.

--9 Explique o que é uma UDF. Faça um exemplo para as quatro operações básicas.
--Uma UDF - User Defined Function é uma função personalizada, criada sob demanda de um banco de dados por um de seus usuários.
--Exemplo +
--CREATE FUNCTION Adicionar(@num1 INT, @num2 INT)
--RETURNS numeric AS BEGIN
--RETURN @num1 + @num2; END;
--Exemplo -
--CREATE FUNCTION Subtrair(@num1 INT, @num2 INT)
--RETURNS numeric AS BEGIN
--RETURN @num1 - @num2; END;
--Exemplo *
--CREATE FUNCTION Multiplicar(@num1 INT, @num2 INT)
--RETURNS numeric AS BEGIN
--RETURN @num1 * @num2; END;
--Exemplo /
--CREATE FUNCTION Dividir(@num1 INT, @num2 INT)
--RETURNS FLOAT AS BEGIN
--IF @num2 = 0 RETURN NULL;
--ELSE RETURN CAST(@num1 AS FLOAT) / @num2; END;

--10 Explique o que é a linguagem PLPGSQL.
--São funções que utilizam a Linguagem Procedural 

--11Faça uma function para deletar as pessoas com base na informação do cpf delas.
--