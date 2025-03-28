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
	constraint fk_ator foreign key(id_ator) references ator(id_ator),
	constraint fk_filme foreign key(id_filme) references filme(id_filme)
)

create table filme_categoria(
	id serial primary key,
	id_filme int,
	id_categoria int,
	constraint fk_filme foreign key(id_filme) references filme(id_filme),
	constraint fk_categoria foreign key(id_categoria) references categoria(id_categoria)
)

--Insira 5 registros na tabela filme.
insert into filme (descricao) values ('Um Sonho de Liberdade'), ('Pantera Negra'), ('Tropa de Elite'), ('O Auto da Compadecida'),('Inception');

--Insira 10 atores na tabela ator.
insert into ator (nome,sobrenome) values ('Morgan','Freeman'),
('Viola','Davis'),
('Wagner','Moura'),
('Denzel','Washington'),
('Mariana','Ximenes'),
('Idris','Elba'),
('Fernanda','Montenegro'),
('Regina','King'),
('Antônio','Fagundes'),
('Lupita','Nyong’o');

update ator
set idade = null
where idade like '30';

select*from ator
	
--Insira 3 categorias de filmes.
insert into categoria (genero,censura) values ('Ação','14'), ('Drama','10'), ('Comédia','10');

--Todo o filme deve ter ao menos uma categoria vinculada.
insert into filme_categoria (id_filme, id_categoria) values (1, 2),(2, 1), (3, 1), (4, 3), (5, 2);

select*from filme_categoria
	
--Todo o filme deve ter ao menos uma categoria vinculada.
insert into filme_ator (id_filme, id_ator) values (1, 1), (2, 1), (3, 1), (2, 2), (4, 2), (5, 2), (3, 3), (6, 3), (7, 3),
(4, 4), (8, 4), (9, 4), 
(5, 5), (9, 5), (10, 5);

select*from filme_ator

--Atualize a censura das categorias com o nome de “X”, para 14 anos.
update categoria 
set censura = '14 anos'
where censura like'10';

select*from categoria



