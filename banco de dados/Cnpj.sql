create table usuario(
	nome varchar(200),
	idade numeric,
	data_nacimento date
);

alter table usuario add column cnpj

alter table usuario drop column cnpj

insert into usuario (nome, idade, data_nacimento) values 
('Andre Luzzi', 20, '2003-04-22'),
('Henrique Moura', 25, '2000-04-17'),
('Leonardo Dambrosio', 20, '2004-09-14'),
('Alan Alves', 32, '1993-12-06'),
('Leticia Vieira', 30, '1995-07-24');

alter table usuario order by idade desc;
