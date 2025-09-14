--Atividade 6

create table produtos (
	id_produtos serial primary key,
	nome varchar(50),
	quantidade numeric,
	preco numeric
)

insert into produtos (nome, quantidade, preco) values
	('two-door wardrobe', 100, 80),
	('Dining table', 1000, 560),
	('Towel holder', 10000, 5.50),
	('computer desk', 350, 100),
	('chair', 3000, 210.64),
	('single bed', 750, 99);

--O setor financeiro da nossa empresa, está querendo saber os menores, maiores, média e soma valores dos produtos, que vendemos, posteriormente deverá fazer uma função de contagem de quantos produtos existem na base.
select 
    min(preco),
    max(preco),
    ROUND(avg(preco), 2),
    sum(preco * quantidade)
from 
    produtos;
select count(*) 
from produtos;

--Atividade 7

create table clientes (
    id_clientes serial primary key,
    nome varchar(200),
    rua varchar(200),
    cidade varchar(200),
    estado varchar(200) ,
    limite_credito decimal(10,2)
);

insert into clientes (id_clientes, nome, rua, cidade, estado, limite_credito) values
(1, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', 475.00),
(2, 'Cecilia Olivia Rodrigues', 'Rua Sizuka Usuy', 'Cianorte', 'PR', 3170.00),
(3, 'Augusto Fernando Carlos Eduardo Cardoso', 'Rua Baldomiro Koerich', 'Palhoça', 'SC', 1067.00),
(4, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', 475.00),
(5, 'Sabrina Heloisa Gabriela Barros', 'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre', 'RS', 4312.00),
(6, 'Joaquim Diego Lorenzo Araújo', 'Rua Vitorino', 'Novo Hamburgo', 'RS', 2314.00);

create table pedidos (
    id_pedidos serial primary key,
    data_pedido date,
    id_cliente int,
    foreign key (id_cliente) references clientes(id_clientes)
);

insert into pedidos (id_pedidos, data_pedido, id_cliente) values
(1, '2016-05-13', 3),
(2, '2016-01-12', 2),
(3, '2016-04-18', 5),
(4, '2016-09-07', 4),
(5, '2016-02-13', 6),
(6, '2016-08-05', 3);

select 
    c.nome,
    p.id_pedidos,
    p.data_pedido
from 
    clientes c
inner join 
    pedidos p on c.id_clientes = p.id_cliente
where 
    p.data_pedido between '2016-01-01' and '2016-06-30'
order by 
    c.nome, p.data_pedido;