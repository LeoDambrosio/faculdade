<<<<<<< HEAD
create table usuario (
	matricula serial primary key,
	nome varchar(200),
	email varchar(200)
);

create table endereco (
=======
create table usuario(
	id_matricula serial primary key,
	nome varchar(200),
	email varchar(200),
	Usuariomatricula int	
);

create table telefone(
	id_telefone serial primary key,
	matricula int,
	ddd numeric,
	numero numeric,
	Usuariomatricula int
);

create table usuario_telefone(
  idendereco_telefone serial primary key,
  id_matricula int,
  id_telefone int,
  constraint fk_id_matricula foreign key (id_matricula) references matricula(id_matricula),
  constraint fk_id_telefone foreign key (id_telefone) references telefone(id_telefone)
);

create table tipoEndereco(
  id_tipoEndereco serial primary key,
  descricao varchar(200) 
);

create table endereco(
>>>>>>> 7d6678a47627a908230a9a314078b8054f46a55d
	id_endereco serial primary key,
	matricula int,
	rua varchar(200),
	numero numeric,
	bairro varchar(200),
	complemento varchar(200),
<<<<<<< HEAD
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
=======
	longitude numeric,
	latitude numeric,
	Usuariomatricula int,
	id_tipoEndereco int,
    constraint fk_id_tipoEndereco foreign key (id_tipoEndereco) references tipoEndereco(id_tipoEndereco)
);

create table usuarioEndereco(
	id_usuarioEndereco serial primary key,
	id_usuario int,
	id_endereco int,
    constraint fk_id_usuario foreign key (id_usuario) references id_usuario(id_usuario),
    constraint fk_id_endereco foreign key (id_endereco) references id_endereco(id_endereco)
);

create table livro(
	id_livro serial primary key,
	codigo int,
	titulo varchar(200),
	autor varchar(200),
	id_sessao int,
	constraint fk_sessao foreign key (id_sessao) references sessao(id_sessao)
);

create table sessao(
>>>>>>> 7d6678a47627a908230a9a314078b8054f46a55d
	id_sessao serial primary key,
	descricao varchar(200),
	localizacao varchar(200)
);

<<<<<<< HEAD
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
=======
create table emprestimo(
	id_emprestimo serial primary key,
	data date,
	hora time,
	Usuariomatricula int
);

create table multa(
	id_multa serial primary key,
	valor numeric,
	data date,
	hora time,
	id_emprestimo int,
	id_matricula int,
	constraint fk_multa_emprestimo foreign key (id_emprestimo) references emprestimo(id_emprestimo),
    constraint fk_multa_usuario foreign key (id_matricula) references usuario(id_matricula)
);
>>>>>>> 7d6678a47627a908230a9a314078b8054f46a55d
