--Atividade 1

create table customers (
  	id numeric primary key,
  	name varchar(100),
 	street varchar(100),
  	city varchar(50),
  	state char(2),
  	credit_limit numeric(10, 2)
);

insert into customers (id, name, street, city, state, credit_limit) values
(1, 'Pedro Augusto da Rocha', 'Rua Pedro Carlos Hoffman', 'Porto Alegre', 'RS', 700.00),
(2, 'Antonio Carlos Mamel', 'Av. Pinheiros', 'Belo Horizonte', 'MG', 3500.50),
(3, 'Luiza Augusta Mhor', 'Rua Salto Grande', 'Niteroi', 'RJ', 4000.00),
(4, 'Jane Ester', 'Av 7 de setembro', 'Erechim', 'RS', 800.00),
(5, 'Marcos Antônio dos Santos', 'Av Farrapos', 'Porto Alegre', 'RS', 4250.25);

--Exibir o nome de todos os clientes cujo estado seja ‘RS’
select name
from customers
where state = 'RS';

--Faça uma sql para contar quantos registros foram dados na saída.
select count(*) as total_clientes from customers;

--Crie uma sql para retornar o maior valor, a média, o menor e a somatória do limit_credit dos clientes de ‘RS’.
select 
	max(credit_limit),
  	avg(credit_limit),
  	min(credit_limit),
 	sum(credit_limit)  
from customers
where state = 'RS';

--Crie um agrupamento da quantidade de cliente por estados
select state, count(*)
from customers
group by state;

--Atividade 2

--Rotorna os endereco dos clientes que moram em Porto Alegre:
select name, street, city, state
from customers
where city = 'Porto Alegre';


