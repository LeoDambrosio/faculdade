create table ator(
	id_ator serial primary key,
	nome varchar(255),
	sobrenome varchar(255),
	idade int
)
	
create table filme(
	id_filme serial primary key,
	descricao varchar(255),
	duracao time
)

create table categoria(
	id_categoria serial primary key,
	genero varchar(255),
	censura varchar(255)
)

create table filme_ator(
	id serial primary key,
	id_ator int,
	id_filme int,
	constraint fk_ator foreign key(id_ator) references ator(id_ator)
	constraint fk_filme foreign key(id_filme) references filme(id_filme)
)

create table filme_categoria(
	id serial primary key,
	id_filme int,
	id_categoria int,
	constraint fk_filme foreign key(id_filme) references filme(id_filme)
	constraint fk_categoria foreign key(id_categoria) references categoria(id_categoria)
)

