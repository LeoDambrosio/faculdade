create table Categoria(
	id_categoria serial primary key,
	nome varchar(255)
)

insert into categoria (nome) values ('Ação'), ('Comédia Romantica'), ('Comédia'), ('Comédia Dramatica'), ('Aventura');

update categoria 
set nome = 'Terror'
where nome like'Comédia Romantica';

select * from categoria

create table Pais(
	id_pais serial primary key,
	nome varchar(255)
)

insert into pais (nome) values ('Andre');

update pais 
set nome = 'Mossoro'
where nome like'Andre';

select * from pais

Delete from pais Where nome like'Mossoro%';

delete from categoria where nome like'Ação%';

