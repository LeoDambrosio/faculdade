create table usuario (
	matricula serial primary key,
	nome varchar(200),
	email varchar(200)
);

create table endereco (
	id_endereco serial primary key,
	matricula int,
	rua varchar(200),
	numero numeric,
	bairro varchar(200),
	complemento varchar(200),
	longitude int,
	latitude int
);

create table telefone (
	id_telefone serial primary key,
	matricula int,
	numero numeric,
	ddd numeric
);

create table sessao (
	id_sessao serial primary key,
	descricao varchar(200),
	localizacao varchar(200)
);

create table livro (
	id_livro serial primary key,
	codigo int,
	titulo varchar(200),
	autor varchar(200)
);

create table emprestimo (
	id_emprestimo serial primary key,
	data date,
	hora time
);

create table multa (
	id_multa serial primary key,
	valor int,
	data date,
	hora time
);

insert into usuario (nome, email) values 
('Leonardo', 'leonardo@gmail.com'),
('Andre', 'andre@gmail.com'),
('Henrique', 'henrique@gmail.com'),
('Leleo', 'leleo@gmail.com'),
('Leozin', 'leozin@gmail.com');

insert into endereco (matricula, rua, numero, bairro, complemento, longitute, latitude) values
(01, 'Condor', 925, 'Floresta', 'Penultima casa',  )