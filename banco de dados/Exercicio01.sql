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
insert into filme (descricao,duracao) values ('Um Sonho de Liberdade', '02:22'),
('Pantera Negra', '02:14'),
('Tropa de Elite', '01:55'),
('O Auto da Compadecida', '01:44'),
('Inception', '02:28');

select*from filme

--Insira 10 atores na tabela ator.
insert into ator (nome,sobrenome,idade) values ('Morgan', 'Freeman', '86'),
('Viola', 'Davis', '58'),
('Wagner', 'Moura', '47'),
('Denzel', 'Washington', '69'),
('Mariana', 'Ximenes', '42'),
('Idris', 'Elba', '51'),
('Fernanda', 'Montenegro', '94'),
('Regina', 'King', '53'),
('Antônio', 'Fagundes', '75'),
('Lupita', 'Nyong’o', '41');

select*from ator
	
--Insira 3 categorias de filmes.
insert into categoria (genero,censura) values ('Ação','16 anos'), ('Drama','livre'), ('Comédia','livre');

--Todo o filme deve ter ao menos uma categoria vinculada.
insert into filme_categoria (id_filme, id_categoria) values (1, 2),(2, 1), (3, 1), (4, 3), (5, 2);
select*from categoria
select*from filme_categoria
	
--Todo o filme deve ter ao menos uma categoria vinculada.
insert into filme_ator (id_filme, id_ator) values (1, 1), (1, 2), (1, 3), 
(2, 2), (2, 4), (2, 5), 
(3, 3), (3, 6), (3, 7), 
(4, 4), (4, 8), (4, 9), 
(5, 5), (5, 9), (5, 10);

select*from filme_ator

--Atualize a censura das categorias com o nome de “X”, para 14 anos.
update categoria 
set censura = '14 anos'
where censura like'livre';

select*from categoria

--Atualize a idade do ator mais velho para 15 anos.
update ator 
set idade = '15'
where idade like '94';
