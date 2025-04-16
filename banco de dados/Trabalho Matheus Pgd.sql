create table cliente (
    id_cliente serial primary key,
    nome varchar(100) not null,
    email varchar(100) not null,
    data_nascimento date,
    data_cadastro date default current_date,
    observacao text
    
);

create table pessoa_fisica (
    id_pessoa_fisica serial primary key,
    cpf varchar(14) unique not null,
    id_cliente int not null,
    constraint fk_cliente_pf foreign key(id_cliente) references cliente(id_cliente)
);

create table pessoa_juridica (
    id_pessoa_juridica serial primary key,
    cnpj varchar(18) unique not null,
    id_cliente int not null,
    constraint fk_cliente_pj foreign key(id_cliente) references cliente(id_cliente)
);

create table telefone (
    id_telefone serial primary key,
    numero varchar(20) not null
);

create table cliente_telefone (
    id_cliente int not null,
    id_telefone int not null,
    constraint pk_cliente_telefone primary key (id_cliente, id_telefone),
    constraint fk_cliente_tel foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_telefone_cli foreign key (id_telefone) references telefone(id_telefone)
);

create table endereco (
    id_endereco serial primary key,
    cep varchar(10) not null,
    logradouro varchar(100) not null,
    numero int check (numero > 0),
    cidade varchar(100) not null,
    estado varchar(50) not null,
    pais varchar(50) not null,
    complemento varchar(100),
    bairro varchar(100),
    referencia varchar(100)
);

create table cliente_endereco (
    id_cliente int not null,
    id_endereco int not null,
    constraint pk_cliente_endereco primary key (id_cliente, id_endereco),
    constraint fk_cliente_endereco_cliente foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_cliente_endereco_endereco foreign key (id_endereco) references endereco(id_endereco)
);

create table vendedor (
    id_usuario serial primary key,
    nome varchar(100) not null,
    email varchar(100)
);

alter table vendedor rename to usuario;

create table forma_pagamento (
    id_forma_pagamento serial primary key,
    tipo varchar(10) check (tipo in ('Avista', 'Debito', 'Credito')) not null
);

create table produto (
    id_produto serial primary key,
    codigo varchar(20) not null,
    descricao text not null,
    peso numeric(10,2) check (peso > 0) not null
);

create table pedido (
    id_pedido serial primary key,
    numero varchar(20) unique not null,
    data date not null default current_date,
    id_cliente int not null,
    id_endereco_entrega int not null,
    id_forma_pagamento int not null,
    id_usuario int not null,
    valor_total numeric(10,2) check (valor_total >= 0),
    valor_desconto numeric(10,2) check (valor_desconto <= 50.00),
    observacao text not null,
    prazo_entrega date check (prazo_entrega <= current_date + interval '30 day'),
    constraint fk_pedido_cliente foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_pedido_endereco foreign key (id_endereco_entrega) references endereco(id_endereco),
    constraint fk_pedido_pagamento foreign key (id_forma_pagamento) references forma_pagamento(id_forma_pagamento),
    constraint fk_pedido_usuario foreign key (id_usuario) references usuario(id_usuario)
);

alter table pedido
    add constraint chk_observacao_not_empty check (trim(observacao) <> '');

create table pedido_produto (
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    valor_venda numeric(10,2) not null,
    constraint pk_pedido_produto primary key (id_pedido, id_produto),
    constraint fk_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_produto foreign key (id_produto) references produto(id_produto)
);

create table nota_fiscal (
    id_nota_fiscal serial primary key,
    id_pedido int not null,
    data_emissao date default current_date,
    constraint fk_nf_pedido foreign key (id_pedido) references pedido(id_pedido)
);
select * from nota_fiscal;

alter table cliente add column nova_coluna varchar(100);

insert into cliente (nome, email, data_nascimento, data_cadastro, observacao, nova_coluna) values
('Joao da Silva', 'joao@email.com', '1985-05-12', '2024-03-01', 'Cliente antigo', 'vip'),
('Maria Oliveira', 'maria@email.com', '1990-10-22', '2024-03-05', 'Compra frequentemente', 'gold'),
('Empresa ABC ltda', 'contato@abc.com', null, '2024-03-07', 'Cliente empresarial', 'pj');

insert into pessoa_fisica (id_cliente, cpf) values
(1, '123.456.789-00'),
(2, '987.654.321-00');

insert into pessoa_juridica (id_cliente, cnpj) values
(3, '12.345.678/0001-99');

insert into telefone (numero) values
('(45) 99910-3671'),
('(45) 99968-2513'),
('(21) 99847-6342');

insert into cliente_telefone (id_cliente, id_telefone) values
(1, 1),
(2, 2),
(3, 3);

insert into endereco (cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values
('01000-000', 'Rua A', 123, 'Sao Paulo', 'SP', 'Brasil', 'Apt 10', 'Centro', 'Proximo ao Mercado'),
('22000-000', 'Avenida B', 456, 'Rio de Janeiro', 'RJ', 'Brasil', 'Apto 202', 'Copacabana', 'Proximo a Praia'),
('30100-000', 'Rua C', 789, 'Belo Horizonte', 'MG', 'Brasil', 'Sala 3', 'Centro', 'Em frente ao Banco');

insert into cliente_endereco (id_cliente, id_endereco) values
(1, 1),
(2, 2),
(3, 3);

insert into usuario (nome, email) values
('Vendedor 1', 'vend1@email.com'),
('Vendedor 2', 'vend2@email.com'),
('Vendedor 3', 'vend3@email.com');

insert into forma_pagamento (tipo) values
('Avista'),
('Debito'),
('Credito');

insert into produto (codigo, descricao, peso) values
('P001', 'Produto A', 0.5),
('P002', 'Produto B', 1.2),
('P003', 'Produto C', 2.0);

insert into pedido (numero, data, id_cliente, id_endereco_entrega, id_forma_pagamento, id_usuario, valor_total, valor_desconto, observacao, prazo_entrega) values
('PED001', current_date, 1, 1, 1, 1, 100.00, 10.00, 'Entregar no horario comercial', current_date + interval '5 day'),
('PED002', current_date, 2, 2, 2, 2, 200.00, 20.00, 'Urgente', current_date + interval '2 day'),
('PED003', current_date, 3, 3, 3, 3, 300.00, 30.00, 'Cliente especial', current_date + interval '7 day');

insert into pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values
(1, 1, 2, 25.00),
(1, 2, 1, 50.00),
(2, 2, 3, 45.00);

insert into nota_fiscal (id_pedido) values
(1),
(2),
(3);

select * from nota_fiscal;
