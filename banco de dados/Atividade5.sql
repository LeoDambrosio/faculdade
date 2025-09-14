--Atividade 5

create table Fornecedores(
	id serial primary key,
	nome varchar(200),
	bairro varchar(200),
	cidade varchar(200),
	estado varchar(2000)
);

insert into Fornecedores (id, nome, bairro, cidade, estado) values
(1, 'Henrique', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
(2, 'Marcelo Augusto', 'Rua Imigrantes', 'Belo Horizonte', 'MG'),
(3, 'Caroline Silva', 'Av São Paulo', 'Salvador', 'BA'),
(4, 'Guilerme Staff', 'Rua Central', 'Porto Alegre', 'RS'),
(5, 'Isabela Moraes', 'Av Juiz Grande', 'Curitiba', 'PR'),
(6, 'Francisco Accerr', 'Av Paulista', 'São Paulo', 'SP');

--Relatório das cidades
select distinct cidade
from fornecedores
order by cidade;
