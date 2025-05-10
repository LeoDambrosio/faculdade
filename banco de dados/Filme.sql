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

--select *from filme_ator
--select *from filme
--select *from ator
select a.nome,c.cache from ator a
inner join ator_cache c
on a.idator=c.idator;

select a.nome, f.nome from ator a
inner join filme_ator fa
on a.idator=fa.idator
inner join filme f
on fa.idfilme=f.idfilme;

select a.nome, c.cache from ator a
right join ator_cache c
on a.idator=c.idator

select a.nome, c.cache from ator a
left join ator_cache c
on a.idator=c.idator

SELECT A.NOME, C.CACHE FROM ATOR A 
FULL OUTER JOIN ATOR_CACHE C
ON A.IDATOR=C.IDATOR

create table a(
	val int
);

create table b(
	val int
);

insert into a values (9),(8),(7),(4);
insert into b values (10),(8),(14),(5),(7);

select a.val,b.val
from a
full outer join b
on a.val=b.val;

