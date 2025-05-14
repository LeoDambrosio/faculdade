-- create a table
CREATE TABLE ator (
  idator serial PRIMARY KEY,
  nome TEXT NOT NULL
);
CREATE TABLE filme (
  idfilme serial PRIMARY KEY,
  nome TEXT NOT NULL
);
CREATE TABLE filme_ator (
  idfilmeator serial PRIMARY KEY,
  idfilme INTEGER,
  idator INTEGER ,
    constraint fk_filme_ foreign key (idfilme) references filme(idfilme),
    constraint fk_ator_ foreign key (idator) references ator(idator)  
);

CREATE TABLE ator_cache (
  idatorcache serial PRIMARY KEY,
  idator INTEGER ,
  cache INTEGER ,
    constraint fk_ator_ foreign key (idator) references ator(idator)  
);

CREATE TABLE ator2 (
  idator serial PRIMARY KEY,
  nome TEXT NOT NULL
);

--delete from filme_ator
--delete from filme
--delete from ator

INSERT INTO ator (nome) VALUES ('Jean Queuri');
INSERT INTO ator (nome) VALUES ('Jean Claudio Andaime');
INSERT INTO ator (nome) VALUES ('Analdo Strogonof');
INSERT INTO ator (nome) VALUES ('Juquinha Snaiders');
INSERT INTO filme (nome) VALUES ('O senho dos pasteis');
INSERT INTO filme (nome) VALUES ('Ary Portas e as reliquias dos chaveiros');
INSERT INTO filme (nome) VALUES ('As paredes do destino');
INSERT INTO filme (nome) VALUES ('Python: a anaconda assassina');
INSERT INTO filme (nome) VALUES ('O mundo sobrio do java');
INSERT INTO filme (nome) VALUES ('Todo mundo programando em C');
INSERT INTO filme_ator (idfilme,idator) VALUES (1,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (1,2);
INSERT INTO filme_ator (idfilme,idator) VALUES (1,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (2,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (2,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (3,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,2);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,3);
INSERT INTO ator_cache (idator,cache) VALUES (1,3000);
INSERT INTO ator_cache (idator,cache) VALUES (2,8000);
INSERT INTO ator2 (nome) VALUES ('Jean Queuri');
INSERT INTO ator2 (nome) VALUES ('Leonardo da Vinti Reais');

--1
select a.nome, f.nome from ator a
inner join filme_ator fa
on a.idator=fa.idator
inner join filme f
on fa.idfilme=f.idfilme;

--2
select a.nome, c.cache from ator a
cross join ator_cache c
	
--3
select a.nome, f.nome from ator a
RIGHT join filme_ator fa
on a.idator=fa.idator
RIGHT join filme f
on fa.idfilme=f.idfilme;

--4
create table diretor(
	id_diretor serial primary key,
	nome varchar(200),
	data_nacimento date
);
create table diretor_filme(
	id_diretor_filme serial primary key,
	id_diretor int,
	idfilme int,
	constraint fk_diretor foreign key (id_diretor) references diretor(id_diretor),
	constraint fkfilme foreign key (idfilme) references filme(idfilme)
);
INSERT INTO diretor (nome, data_nacimento) VALUES
('Christopher Nolan', '1970-07-30'),
('Sofia Coppola', '1971-05-14'),
('Spike Lee', '1957-03-20'); 
INSERT INTO DIRETOR_FILME (id_diretor, idfilme) VALUES
(1, 1),
(1, 2);
INSERT INTO DIRETOR_FILME (id_diretor, idfilme) VALUES
(2, 2),
(2, 3);
INSERT INTO DIRETOR_FILME (id_diretor, idfilme) VALUES
(3, 2),
(3, 3);

--5
create table genero(
	id_genero serial primary key,
	nome varchar(200)
);
create table genero_filme(
	id_genero_filme serial primary key,
	id_genero int,
	idfilme int,
	constraint fk_genero foreign key (id_genero) references genero(id_genero),
	constraint fkfilme foreign key (idfilme) references filme(idfilme)
);
drop table gereno_filme;
INSERT INTO genero (nome) VALUES
('Comédia'),('Aventura'),('Ação'),('Drama'),('Terror'),('Ficção Científica'),('Romance'),('Animação');
INSERT INTO genero_filme (id_genero, idfilme) VALUES
(1, 1);
INSERT INTO genero_filme  (id_genero, idfilme) VALUES
(2, 2);
INSERT INTO genero_filme  (id_genero, idfilme) VALUES
(3, 3);

--6
select d.nome as nome_diretor, g.nome as genero, f.nome as filme
from filme f
inner join diretor_filme df on f.idfilme = df.idfilme
inner join diretor d on df.id_diretor = d.id_diretor
inner join genero_filme fg on f.idfilme = fg.idfilme
inner join genero g on fg.id_genero = g.id_genero
order by d.nome, g.nome
	
--7
create table diretor_cache (
  id_diretor_cache serial primary key,
  id_diretor int,
  cache int,
  constraint fk_diretor foreign key (id_diretor) references diretor(id_diretor)
);
insert into diretor_cache (id_diretor, cache)
values (1, 10000), (2, 8000), (3, 9000);

--8
select a.nome as nome_ator
from filme f
cross join ator a;

--9
select a.nome, c.cache
from ator a
left join ator_cache c on a.idator = c.idator;

--10
select nome from ator
union
select nome from ator2;

select nome from ator
union all
select nome from ator2;