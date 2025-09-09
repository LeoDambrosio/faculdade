create table clientes (
    id_clientes serial primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    status_cliente varchar(20) not null default 'standard'
    check (status_cliente in ('standard', 'gold', 'platinum')),
    data_cadastro date not null default current_date,
    saldo_credito numeric(10,2) not null default 0
);

create table pedidos (
    id_pedidos serial primary key,
    data_pedido timestamp not null default current_timestamp,
    status_pedido varchar(20) not null default 'aberto'
    check (status_pedido in ('aberto', 'fechado', 'cancelado')),
    total numeric(10,2) not null default 0,
	id_cliente int references clientes(id_clientes)
);

create table produtos (
    id_produtos serial primary key,
    nome varchar(100) not null,
    preco numeric(10,2) not null check (preco > 0),
    estoque int not null default 0 check (estoque >= 0),
    ativo boolean not null default true
);

create table itens_pedido (
    id_item_pedido serial primary key,
    quantidade int not null check (quantidade > 0),
    preco_unit numeric(10,2) not null check (preco_unit >= 0),
    subtotal numeric(10,2) generated always as (quantidade * preco_unit) stored,
	id_pedido int references pedidos(id_pedidos),
    id_produto int references produtos(id_produtos)
);

create table pagamentos (
    id_pagamentos serial primary key,
    id_pedido int references pedidos(id_pedidos),
    valor numeric(10,2) not null check (valor > 0),
    data_pagamento timestamp not null default current_timestamp,
    forma varchar(20) not null,
    check (forma in ('pix', 'cartao', 'boleto'))
);

insert into clientes (nome, email, status_cliente, saldo_credito) values 
('João Silva', 'joao.silva@email.com', 'standard', 100.00),
('Maria Oliveira', 'maria.oliveira@email.com', 'gold', 250.00),
('Carlos Souza', 'carlos.souza@email.com', 'platinum', 500.00),
('Ana Costa', 'ana.costa@email.com', 'standard', 0.00),
('Fernanda Lima', 'fernanda.lima@email.com', 'gold', 150.00);

insert into produtos (nome, preco, estoque, ativo) values
('Notebook Dell', 3500.00, 10, true),
('Smartphone Samsung', 2200.00, 15, true),
('Teclado Mecânico', 350.00, 20, true),
('Mouse Gamer', 180.00, 25, true),
('Monitor LG 24"', 1200.00, 8, true);

insert into pedidos (id_cliente, status_pedido, total) values
(1, 'aberto', 0),
(2, 'aberto', 0);

insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unit) values
(1, 1, 1, 3500.00),  
(1, 3, 2, 350.00),   
(1, 4, 1, 180.00);   

insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unit) values
(2, 2, 1, 2200.00),  
(2, 5, 2, 1200.00),  
(2, 4, 1, 180.00),  
(2, 3, 1, 350.00);  
