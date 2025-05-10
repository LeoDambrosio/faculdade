create table curso(
	id_curso serial primary key not null,
	total_credito integer not null,
	nome_curso varchar(60) not null,
	cod_coordenador integer not null,
)
select*from curso;
drop table curso;
create table alunos(
	mat_aluno serial primary key not null,
	id_curso int,
	dat_nasc date not null,
	total_credito integer not null,
	mpg real not null,
	nom_alu varchar(60) not null,
	email varchar(30),
	constraint fk_curso foreign key(id_curso) references curso(id_curso)
)
select*from alunos;
drop table alunos;

insert into curso (nome_curso,total_credito,cod_coordenador) values ('Engenharia de Software', 3200, 101),
('Sistemas de Informação', 3000, 102),
('Análise e Desenvolvimento de Sistemas', 2800, 103),
('Ciência da Computação', 3400, 104),
('Banco de Dados', 2600, 105);

insert into alunos (nom_alu,email,dat_nasc,total_credito,mpg) values ('Ana Souza','ana.souza@email.com','1990-03-15', 1200, 7.8),
('Bruno Lima','bruno.lima@email.com','1988-07-22', 1300, 6.9),
('Camila Rocha','camila.rocha@email.com','1995-12-03', 1400, 8.5),
('Daniel Pereira','daniel.pereira@email.com','1992-01-19', 1250, 7.2),
('Eduarda Martins','eduarda.martins@email.com','1999-06-09', 1350, 8.1),
('Felipe Alves','felipe.alves@email.com','1985-10-11', 1100, 6.5),
('Gabriela Costa','gabriela.costa@email.com','1993-04-26', 1500, 9.0),
('Henrique Ramos','henrique.ramos@email.com','1990-11-30', 1280, 7.4),
('Isabela Fernandes','isabela.fernandes@email.com','1997-02-14', 1450, 8.7),
('João Victor','joao.victor@email.com','1986-08-05', 1150, 6.8),
('Karen Dias','karen.dias@email.com','1994-09-13', 1380, 7.9),
('Lucas Freitas','lucas.freitas@email.com','1989-12-21', 1420, 8.3),
('Mariana Nogueira','mariana.nogueira@email.com','2000-05-07', 1320, 8.0),
('Nathan Oliveira','nathan.oliveira@email.com','1991-03-28', 1260, 7.3),
('Patrícia Mendes','patricia.mendes@email.com','1996-07-01', 1340, 7.7);
select*from curso;

SELECT DISTINCT nom_curso,
(SELECT Min(dat_nasc) FROM Alunos WHERE
 Alunos.cod_curso =
Cursos.cod_curso) AS Aluno_Mais_velho
FROM Cursos

SELECT DISTINCT nom_curso,
(SELECT Max(mat_alu) FROM ALUNOS WHERE 
Alunos.cod_curso =Cursos.cod_curso) 
AS Ultima_Matricula
FROM Cursos


create table disciplina(
	cod_disciplina serial primary key,
	nome varchar(200),
	id_curso int,
	constraint fk_curso foreign key(id_curso) references curso(id_curso)
)

insert into disciplina (nome,id_curso) values ('Engenharia de Software',3),
('Sistemas de Informação',4),
('Análise e Desenvolvimento de Sistemas'),
('Ciência da Computação',6);

select nome from disciplina
where not exists (select id_curso from curso where curso.id_curso=disciplina.id_curso)




