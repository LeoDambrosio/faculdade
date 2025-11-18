create table alunos(
	id serial primary key,
	nome varchar(200),
	idade int,
	curso varchar(200),
	matricula int
);



insert into alunos(nome, idade, curso, matricula)
	select
		md5(random()::text),
		(random()*30)::int,
		md5(random()::text),
		(random()*100000)::int
from generate_series(1, 100000);

select*from alunos

create table alunos2(
	id serial primary key,
	nome varchar(200),
	idade int,
	curso varchar(200),
	matricula int
);	
insert into alunos2(nome, idade, curso, matricula)
	select
		md5(random()::text),
		(random()*30)::int,
		md5(random()::text),
		(random()*100000)::int
from generate_series(1, 100000);

create index idx_matricula on alunos(matricula);

explain analyze select * from alunos2 where matricula=12345;

explain analyze select * from alunos where matricula=12345;

select*from alunos2