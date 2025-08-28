create table usuario(
	id_usuario serial primary key,
	nome varchar(200),
	email varchar(200),
	observacao varchar(200),
	idnativo bit
);

create table parceiro (
	id_parceiro serial primary key,
	documento int,
	nome varchar(200),
	nomefantasia varchar(200),
	observacao varchar(200),
	idnativo bit
);

create table telefone(
	id_telefone serial primary key,
	numero int,
	id_usuario int references ator(id_ator),
	id_parceiro int references parceiro(id_parceiro),
	idnativo bit
);

create table endereco (
	id_endereco serial primary key,
	logradouro varchar(200),
	numero int,
	cep int,
	complemento varchar(200),
	id_usuario int references ator(id_ator),
	id_parceiro int references parceiro(id_parceiro),
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

create table tabelapreco (
	id_tabelapreco serial primary key,
	descricao varchar(200),
	descontomaximo double,
	codigo int,
	iniciovigencia date,
	fimvigencia date,
	idnativo bit
);

create table tabelaprecoproduto (
	id_tabelaprecoproduto serial primary key,
	id_tabelapreco int references tabelapreco(id_tabelapreco),
	id_produto int references produto(id_produto),
	preco double,
);

create table condicaopagamento (
	id_condicaopagamento serial primary key,
	descricao varchar(200),
	codigo int,
	observacao varchar(200)
);

create table produto (
	id_produto serial primary key,
	codigo int,
	descricao varchar(200),
	observacao varchar(200),
	peso double
);

create table pedido (
	id_pedido serial primary key,
	numero int,
	valortotal double,
	quantidadeprodutos double,
	obervacao varchar(200),
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
	valor double,
	quantidade double
);

