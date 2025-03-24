create table idioma(
	id_idioma serial primary key,
	nome varchar(220),
	surgimento varchar(220)
);
insert into idioma (nome) values ('Português'),('Inglês'),('Espanhol'),('Italiano'),('Francês'),('Japonês'),('Chines');

create table filme(
	id_filme serial primary key,
	nome varchar(220),
	lancamento varchar(220)
);
insert into filme (nome) values ('Deadpoll'), ('Wolverine'), ('A Ordem');

create table ator(
	id_ator serial primary key,
	nome varchar(220),
	idade numeric,
	nacionalidade varchar(220)
);
insert into ator (nome) values ('Jude Law'), ('Deadpool'), ('Wolverine');

create table filme_ator(
	id serial primary key,
	id_ator int,
	id_filme int,
	constraint fk_filme Foreign key (id_filme) references filme(id_filme),
	constraint fk_ator foreign key (id_ator) references ator(id_ator)
);

select * from filme_ator