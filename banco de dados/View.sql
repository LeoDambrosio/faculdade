create table usuario(
	id_usuario serial primary key,
	nome varchar(200),
	email varchar(200) not null,
	observacao varchar(200) not null,
	idnativo bit
);

create table parceiro (
	id_parceiro serial primary key,
	documento int,
	nome varchar(200),
	nomefantasia varchar(200) not null,
	observacao varchar(200) not null,
	idnativo bit
);

create table telefone(
	id_telefone serial primary key,
	numero bigint,
	id_usuario int references usuario(id_usuario) not null,
	id_parceiro int references parceiro(id_parceiro) not null,
	idnativo bit
);

create table pais (
	id_pais serial primary key,
	nome varchar(200),
	sigla varchar(200)
);

create table estado (
	id_estado serial primary key,
	nome varchar(200),
	sigla varchar(200),
	id_pais int references pais(id_pais)
);

create table cidade (
	id_cidade serial primary key,
	nome varchar(200),
	inscricaoestadual int,
	id_estado int references estado(id_estado)
);

create table endereco (
	id_endereco serial primary key,
	logradouro varchar(200),
	numero int,
	cep int,
	complemento varchar(200) not null,
	id_usuario int references usuario(id_usuario) not null,
	id_parceiro int references parceiro(id_parceiro) not null,
	id_cidade int references cidade(id_cidade) not null,
	idnativo bit
);

create table tabelapreco (
	id_tabelapreco serial primary key,
	descricao varchar(200),
	descontomaximo bigint not null,
	codigo int,
	iniciovigencia date,
	fimvigencia date,
	idnativo bit
);

create table produto (
	id_produto serial primary key,
	codigo int,
	descricao varchar(200),
	observacao varchar(200) not null,
	peso bigint

);

create table tabelaprecoproduto (
	id_tabelaprecoproduto serial primary key,
	id_tabelapreco int references tabelapreco(id_tabelapreco),
	id_produto int references produto(id_produto),
	preco bigint
);

create table condicaopagamento (
	id_condicaopagamento serial primary key,
	descricao varchar(200),
	codigo int,
	observacao varchar(200) not null
);

create table pedido (
	id_pedido serial primary key,
	numero int,
	valortotal bigint,
	quantidadeprodutos bigint,
	obervacao varchar(200) not null,
	id_tabelapreco int references tabelapreco(id_tabelapreco),
	id_condicaopagamento int references condicaopagamento(id_condicaopagamento),
	id_parceiro int references parceiro(id_parceiro),
	id_usuario int references usuario(id_usuario),
	data time
);

create table pedidoproduto (
	id_pedidoproduto serial primary key,
	id_pedido int references pedido(id_pedido),
	id_produto int references produto(id_produto),
	valor bigint,
	quantidade bigint
);

insert into pais (id_pais, nome, sigla) values
(1, 'Brasil', 'BR');

insert into estado (id_estado, nome, sigla, id_pais) values
(1, 'São Paulo', 'SP', 1),
(2, 'Minas Gerais', 'MG', 1),
(3, 'Rio de Janeiro', 'RJ', 1);

insert into cidade (id_cidade, nome, inscricaoestadual, id_estado) values
(1, 'São Paulo', 12345, 1),
(2, 'Campinas', 12346, 1),
(3, 'Santos', 12347, 1),
(4, 'Belo Horizonte', 22345, 2),
(5, 'Uberlândia', 22346, 2),
(6, 'Juiz de Fora', 22347, 2),
(7, 'Rio de Janeiro', 32345, 3),
(8, 'Niterói', 32346, 3),
(9, 'Petrópolis', 32347, 3),
(10, 'Volta Redonda', 32348, 3);

insert into usuario (id_usuario, nome, email, observacao, idnativo) values
(1, 'João Silva', 'joao@email.com', 'Administrador', B'1'),
(2, 'Maria Souza', 'maria@email.com', 'Atendente', B'1'),
(3, 'Carlos Pereira', 'carlos@email.com', 'Gerente', B'1'),
(4, 'Ana Oliveira', 'ana@email.com', 'Suporte', B'1'),
(5, 'Lucas Santos', 'lucas@email.com', 'Vendedor', B'1');

insert into parceiro (id_parceiro, documento, nome, nomefantasia, observacao, idnativo) values
(1, 111111111, 'Empresa Alfa', 'Alfa LTDA', 'Cliente ativo', B'1'),
(2, 222222222, 'Empresa Beta', 'Beta SA', 'Cliente ativo', B'1'),
(3, 333333333, 'Empresa Gama', 'Gama EPP', 'Cliente ativo', B'1'),
(4, 444444444, 'Empresa Delta', 'Delta ME', 'Cliente ativo', B'1'),
(5, 555555555, 'Empresa Ômega', 'Ômega Comercial', 'Cliente ativo', B'1');

insert into telefone (id_telefone, numero, id_usuario, id_parceiro, idnativo) values
(1, 11999990001, 1, 1, B'1'),
(2, 11999990002, 2, 2, B'1'),
(3, 11999990003, 3, 3, B'1'),
(4, 11999990004, 4, 4, B'1'),
(5, 11999990005, 5, 5, B'1');

insert into endereco (id_endereco, logradouro, numero, cep, complemento, id_usuario, id_parceiro, id_cidade, idnativo) values
(1, 'Rua A', 100, 12345000, 'Casa', 1, 1, 1, B'1'),
(2, 'Rua B', 200, 13000000, 'Apto 10', 2, 2, 2, B'1'),
(3, 'Rua C', 300, 11000000, 'Sala 2', 3, 3, 3, B'1'),
(4, 'Rua D', 400, 30100000, 'Bloco B', 4, 4, 4, B'1'),
(5, 'Rua E', 500, 20200000, 'Galpão', 5, 5, 7, B'1');

insert into tabelapreco (id_tabelapreco, descricao, descontomaximo, codigo, iniciovigencia, fimvigencia, idnativo) values
(1, 'Tabela Varejo', 10, 100, '2025-01-01', '2025-12-31', B'1'),
(2, 'Tabela Atacado', 15, 200, '2025-01-01', '2025-12-31', B'1'),
(3, 'Tabela Especial', 20, 300, '2025-01-01', '2025-12-31', B'1');

insert into condicaopagamento (id_condicaopagamento, descricao, codigo, observacao) values
(1, 'À vista', 1, 'Pagamento em dinheiro'),
(2, 'Cartão 3x', 2, 'Parcelamento em 3 vezes'),
(3, 'Boleto 30 dias', 3, 'Vencimento em 30 dias');

insert into produto (id_produto, codigo, descricao, observacao, peso) values
(1, 1001, 'Notebook', 'Notebook Dell', 2000),
(2, 1002, 'Mouse', 'Mouse sem fio', 200),
(3, 1003, 'Teclado', 'Teclado mecânico', 800),
(4, 1004, 'Monitor', 'Monitor 24 polegadas', 3500),
(5, 1005, 'Impressora', 'Impressora a laser', 5000),
(6, 1006, 'Celular', 'Smartphone Android', 1800),
(7, 1007, 'Tablet', 'Tablet Samsung', 1500),
(8, 1008, 'Cadeira Gamer', 'Cadeira ergonômica', 12000),
(9, 1009, 'HD Externo', 'HD 1TB', 400),
(10, 1010, 'SSD', 'SSD 512GB', 300),
(11, 1011, 'Fonte ATX', 'Fonte 500W', 700),
(12, 1012, 'Placa de Vídeo', 'NVIDIA RTX 4060', 2500),
(13, 1013, 'Memória RAM', 'DDR4 16GB', 300),
(14, 1014, 'Headset', 'Headset Gamer', 350),
(15, 1015, 'Webcam', 'Webcam HD', 250);

insert into tabelaprecoproduto (id_tabelaprecoproduto, id_tabelapreco, id_produto, preco) values
(1, 1, 1, 4000), (2, 1, 2, 150), (3, 1, 3, 350),
(4, 2, 4, 1200), (5, 2, 5, 800), (6, 2, 6, 2500),
(7, 3, 7, 2000), (8, 3, 8, 1500), (9, 3, 9, 350),
(10, 1, 10, 400), (11, 2, 11, 600), (12, 3, 12, 3500),
(13, 1, 13, 250), (14, 2, 14, 500), (15, 3, 15, 200);

insert into pedido (id_pedido, numero, valortotal, quantidadeprodutos, obervacao, id_tabelapreco, id_condicaopagamento, id_parceiro, id_usuario, data) values
(1, 10001, 5000, 2, 'Pedido inicial', 1, 1, 1, 1, '10:00'),
(2, 10002, 2000, 1, 'Equipamento TI', 2, 2, 2, 2, '11:00'),
(3, 10003, 1500, 3, 'Pedido urgente', 3, 3, 3, 3, '12:00'),
(4, 10004, 800, 1, 'Pedido simples', 1, 1, 4, 4, '13:00'),
(5, 10005, 6000, 4, 'Compra grande', 2, 2, 5, 5, '14:00'),
(6, 10006, 750, 2, 'Compra rápida', 3, 3, 1, 2, '15:00'),
(7, 10007, 3000, 2, 'Pedido médio', 1, 2, 2, 3, '16:00'),
(8, 10008, 1200, 1, 'Teste de produto', 2, 3, 3, 4, '17:00'),
(9, 10009, 4500, 2, 'Reposição estoque', 3, 1, 4, 5, '18:00'),
(10, 10010, 250, 1, 'Compra pequena', 1, 2, 5, 1, '19:00');

insert into pedidoproduto (id_pedidoproduto, id_pedido, id_produto, valor, quantidade) values
(1, 1, 1, 4000, 1),
(2, 1, 2, 150, 1),
(3, 2, 4, 1200, 1),
(4, 3, 6, 2500, 1),
(5, 3, 3, 350, 2),
(6, 4, 9, 350, 1),
(7, 5, 8, 1500, 2),
(8, 5, 12, 3500, 1),
(9, 6, 13, 250, 2),
(10, 7, 7, 2000, 1),
(11, 7, 14, 500, 2),
(12, 8, 10, 400, 3),
(13, 9, 5, 800, 2),
(14, 9, 11, 600, 2),
(15, 10, 15, 200, 1);

--1:
create or replace view pedido_detalhado 
as
select 
    p.numero as numero_pedido,
    pa.nome as nome_parceiro,
    ep.logradouro || ', ' || ep.numero || ' - ' || cpa.nome as endereco_parceiro,
    tp.descricao as tabela_preco,
    cp.descricao as condicao_pagamento,
    u.nome as nome_usuario,
    eu.logradouro || ', ' || eu.numero || ' - ' || cu.nome as endereco_usuario
from pedido p
join parceiro pa on p.id_parceiro = pa.id_parceiro
join usuario u on p.id_usuario = u.id_usuario
join tabelapreco tp on p.id_tabelapreco = tp.id_tabelapreco
join condicaopagamento cp on p.id_condicaopagamento = cp.id_condicaopagamento
join endereco ep on ep.id_parceiro = pa.id_parceiro
join cidade cpa on ep.id_cidade = cpa.id_cidade
join endereco eu on eu.id_usuario = u.id_usuario
join cidade cu on eu.id_cidade = cu.id_cidade;

select * from pedido_detalhado;

--2
create or replace view preco_produto 
as
select 
    p.id_produto as codigo_produto,
    p.descricao as descricao_produto,
    tp.descricao as descricao_tabela_preco,
    tp.iniciovigencia as inicio_vigencia,
    tp.fimvigencia as fim_vigencia,
    tpp.preco as preco_produto,
    cp.descricao as condicao_pagamento
from produto p
join tabelaprecoproduto tpp on p.id_produto = tpp.id_produto
join tabelapreco tp on tpp.id_tabelapreco = tp.id_tabelapreco
join pedido pd on pd.id_tabelapreco = tp.id_tabelapreco
join condicaopagamento cp on cp.id_condicaopagamento = pd.id_condicaopagamento;

select * from preco_produto;

--3
create or replace view pedidos_parceiro 
as
select 
    pa.nome as nome_parceiro,
    ep.logradouro || ', ' || ep.numero as endereco_parceiro,
    t.numero as telefone_parceiro,
    pd.numero as numero_pedido,
    pd.data as data_pedido,
    pd.valortotal as valor_total,
    pd.quantidadeprodutos as quantidade_produtos,
    ci.nome as cidade,
    es.nome as estado,
    ps.nome as pais
from parceiro pa
join endereco ep on ep.id_parceiro = pa.id_parceiro
join telefone t on t.id_parceiro = pa.id_parceiro
join pedido pd on pd.id_parceiro = pa.id_parceiro
join cidade ci on ci.id_cidade = ep.id_cidade
join estado es on es.id_estado = ci.id_estado
join pais ps on ps.id_pais = es.id_pais;

select * from pedidos_parceiro;

--4
create or replace view usuario_pedidos 
as
select 
    u.nome as nome_usuario,
    sum(pd.quantidadeprodutos) as quantidade_produtos,
    max(pd.valortotal) as maior_valor_pedido,
    min(pd.valortotal) as menor_valor_pedido
from usuario u
left join pedido pd on pd.id_usuario = u.id_usuario
group by u.nome;

select * from usuario_pedidos;