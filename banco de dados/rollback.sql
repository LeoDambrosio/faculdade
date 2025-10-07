create table ator(
	id_ator serial primary key,
	nome varchar(200)
)

select * from ator

insert into ator values(1, 'Leonardo');
	
BEGIN;
insert into ator values (1,'teste', current_timestamp);
insert into ator values (2,'teste2', current_timestamp);
SELECT * FROM ator;
COMMIT;

begin
create table teste(
	name text
)

rollback