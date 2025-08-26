create table pedidos(
      id_pedido serial primary key,
      data_pedido date,
      status_pedido varchar(255),
      total numeric,
      id_cliente int references clientes(id_cliente)
);

create table clientes(
      id_cliente serial primary key,
      nome varchar(200),
      email varchar(200),
      status_cliente varchar(200),
      data_cadastro time,
      saldo_credito numeric,
);

create table pagamentos(
      id_pagamento serial primary key,
      valor numeric(10,2),
      data_pagamento date,
      forma varchar(200),
      id_pedido int references padidos(id_pedido)
);

create table produtos(
      id_produto serial primary key,
      nome varchar(200),
      preco numeric not null,
      estoque numeric,
      ativo
);

create table itens_pedido(
      id_item serial primary key,
      id_pedido int references pedidos(id_pedido),
      id_produto int references produto(id_produto),
      quantidade numeric,
      preco_unit 
      subtotal
);

