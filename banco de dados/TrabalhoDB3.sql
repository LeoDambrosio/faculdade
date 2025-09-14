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

select * from pagamentos;

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

-- modo easy
-- 1
create or replace function sp_inserir_cliente(p_nome text, p_email text)
returns void as $$
begin
    insert into clientes (nome, email, status_cliente)
    values (p_nome, p_email, 'standard');
end;
$$ language plpgsql;

select sp_inserir_cliente('lucas mendes', 'lucas.mendes@email.com');
select * from clientes;

-- 2
create or replace function sp_ativar_produto(p_id_produto int, p_ativo boolean)
returns void as $$
begin
    if not exists (select 1 from produtos where id_produtos = p_id_produto) then
        raise exception 'produto % nao encontrado.', p_id_produto;
    end if;

    update produtos set ativo = p_ativo where id_produtos = p_id_produto;
end;
$$ language plpgsql;

select sp_ativar_produto(1, false); 
select sp_ativar_produto(1, true); 

select * from produtos;

-- 3
create or replace function sp_repor_estoque(p_id_produto int, p_qtd int)
returns void as $$
begin
    if p_qtd <= 0 then
        raise exception 'quantidade deve ser maior que zero.';
    end if;

    update produtos
    set estoque = estoque + p_qtd
    where id_produtos = p_id_produto;
end;
$$ language plpgsql;

select sp_repor_estoque(2, 5);

select * from produtos;

-- 4
create or replace function sp_reajustar_preco(p_id_produto int, p_percentual numeric)
returns void as $$
declare
    v_preco_atual numeric;
    v_novo_preco numeric;
begin
    select preco into v_preco_atual from produtos where id_produtos = p_id_produto;

    v_novo_preco := v_preco_atual + (v_preco_atual * p_percentual / 100);

    if v_novo_preco < 0 then
        raise exception 'preco nao pode ser negativo.';
    end if;

    update produtos set preco = v_novo_preco where id_produtos = p_id_produto;
end;
$$ language plpgsql;

select sp_reajustar_preco(3, 10);
select sp_reajustar_preco(3, -5);

select * from produtos;

-- 5
create or replace function sp_mudar_status_cliente(p_id_cliente int, p_novo_status text)
returns void as $$
begin
    if p_novo_status not in ('standard','gold','platinum') then
        raise exception 'status invalido: %. deve ser standard, gold ou platinum.', p_novo_status;
    end if;

    update clientes
    set status_cliente = p_novo_status
    where id_clientes = p_id_cliente;
end;
$$ language plpgsql;

select sp_mudar_status_cliente(1, 'standard');

select * from clientes;

-- modo medium
-- 1
create or replace function sp_abrir_pedido(p_id_cliente int)
returns int as $$
declare
    v_id_pedido int;
begin
    insert into pedidos (id_cliente, status_pedido, total)
    values (p_id_cliente, 'aberto', 0)
    returning id_pedidos into v_id_pedido;

    return v_id_pedido;
end;
$$ language plpgsql;

select sp_abrir_pedido(1);

select * from pedidos;

-- 2
create or replace function sp_adicionar_item(p_id_pedido int, p_id_produto int, p_qtd int)
returns void as $$
declare
    v_estoque int;
    v_preco numeric;
begin
    select estoque, preco into v_estoque, v_preco
    from produtos where id_produtos = p_id_produto;

    if v_estoque is null then
        raise exception 'produto % nao encontrado.', p_id_produto;
    end if;

    if v_estoque < p_qtd then
        raise exception 'estoque insuficiente para o produto %.', p_id_produto;
    end if;

    insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
    values (p_id_pedido, p_id_produto, p_qtd, v_preco);

    update produtos set estoque = estoque - p_qtd where id_produtos = p_id_produto;
end;
$$ language plpgsql;

select sp_adicionar_item(1, 2, 2);

select * from itens_pedido;

-- 3
create or replace function sp_recalcular_total(p_id_pedido int)
returns void as $$
declare
    v_total numeric;
begin
    select sum(subtotal) into v_total
    from itens_pedido
    where id_pedido = p_id_pedido;

    update pedidos set total = coalesce(v_total, 0) where id_pedidos = p_id_pedido;
end;
$$ language plpgsql;

select sp_recalcular_total(1);

select * from produtos;

-- 4
create or replace function sp_aplicar_desconto_status(p_id_pedido int)
returns void as $$
declare
    v_status text;
    v_total numeric;
    v_desconto numeric := 0;
begin
    select c.status_cliente, p.total
    into v_status, v_total
    from pedidos p
    join clientes c on p.id_cliente = c.id_clientes
    where p.id_pedidos = p_id_pedido;

    case
        when v_status = 'gold' then v_desconto := 0.05;
        when v_status = 'platinum' then v_desconto := 0.10;
        else v_desconto := 0;
    end case;

    update pedidos
    set total = v_total - (v_total * v_desconto)
    where id_pedidos = p_id_pedido;
end;
$$ language plpgsql;

select sp_aplicar_desconto_status(2);

select * from pedidos;

-- 5
create or replace function sp_registrar_pagamento(
    p_id_pedido int,
    p_valor numeric,
    p_forma text
)
returns void as $$
declare
    v_total numeric;
    v_pago numeric;
    v_novo_total_pago numeric;
begin
    if p_valor <= 0 then
        raise exception 'valor do pagamento deve ser maior que zero.';
    end if;

    if p_forma not in ('pix','cartao','boleto') then
        raise exception 'forma de pagamento invalida: %', p_forma;
    end if;

    select total into v_total
    from pedidos
    where id_pedidos = p_id_pedido;

    if v_total is null then
        raise exception 'pedido % nao encontrado.', p_id_pedido;
    end if;

    select coalesce(sum(valor),0) into v_pago from pagamentos where id_pedido = p_id_pedido;

    v_novo_total_pago := v_pago + p_valor;

    if v_novo_total_pago > v_total * 1.2 then
        raise exception 'pagamento excede 120%% do valor do pedido. pago atualmente: %, novo pagamento: %, limite: %',
            v_pago, p_valor, v_total * 1.2;
    end if;

    insert into pagamentos (id_pedido, valor, forma) values (p_id_pedido, p_valor, p_forma);
    select coalesce(sum(valor),0) into v_pago from pagamentos where id_pedido = p_id_pedido;

    if v_pago >= v_total then
        update pedidos set status_pedido = 'fechado' where id_pedidos = p_id_pedido;
    end if;
end;
$$ language plpgsql;

select sp_recalcular_total(1);
select sp_registrar_pagamento(1, 100, 'boleto');

select * from pagamentos;

-- modo hard
-- 1
create or replace function sp_cancelar_pedido(p_id_pedido int)
returns void as $$
declare
    v_status text;
begin
    select status_pedido 
    into v_status 
    from pedidos 
    where id_pedidos = p_id_pedido;

    if v_status <> 'aberto' then
        raise exception 'somente pedidos abertos podem ser cancelados.';
    end if;

    update produtos pr
    set estoque = estoque + ip.quantidade
    from itens_pedido ip
    where ip.id_produto = pr.id_produtos and ip.id_pedido = p_id_pedido;

    update pedidos set status_pedido = 'cancelado' where id_pedidos = p_id_pedido;
end;
$$ language plpgsql;

select sp_cancelar_pedido(1);

select * from pedidos;

-- 2
create or replace function sp_trocar_item(
    p_id_pedido int,
    p_id_produto_antigo int,
    p_id_produto_novo int,
    p_qtd int
)
returns void as $$
declare
    v_preco numeric;
    v_estoque int;
begin
    begin
        update produtos pr
        set estoque = estoque + ip.quantidade
        from itens_pedido ip
        where ip.id_produto = p_id_produto_antigo
          and ip.id_pedido = p_id_pedido;

        delete from itens_pedido
        where id_pedido = p_id_pedido
          and id_produto = p_id_produto_antigo;

        select preco, estoque into v_preco, v_estoque
        from produtos
        where id_produtos = p_id_produto_novo;

        if v_estoque < p_qtd then
            raise exception 'estoque insuficiente para o novo produto %', p_id_produto_novo;
        end if;

        insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
        values (p_id_pedido, p_id_produto_novo, p_qtd, v_preco);

        update produtos
        set estoque = estoque - p_qtd
        where id_produtos = p_id_produto_novo;

    exception
        when others then
            raise exception 'erro ao trocar item. operacao revertida.';
    end;
end;
$$ language plpgsql;

select sp_trocar_item(1, 2, 3, 1);

select * from itens_pedido;

-- 3
create or replace function sp_promover_clientes_por_gasto(p_valor_minimo numeric)
returns void as $$
begin
    update clientes c
    set status_cliente = case
        when c.status_cliente = 'standard' then 'gold'
        else c.status_cliente
    end
    where c.id_clientes in (
        select p.id_cliente
        from pedidos p
        where p.status_pedido = 'fechado'
          and p.data_pedido >= (current_date - interval '1 year')
        group by p.id_cliente
        having sum(p.total) >= p_valor_minimo
    );
end;
$$ language plpgsql;

select sp_promover_clientes_por_gasto(2000);

select * from clientes;

-- 4
create or replace function sp_fechamento_mensal_cliente(
    p_id_cliente int,
    p_ano int,
    p_mes int
)
returns table (
    total_pedidos numeric,
    total_pago numeric,
    em_aberto numeric
) as $$
begin
    return query
    select 
        coalesce(sum(p.total),0) as total_pedidos,
        coalesce(sum(pg.valor),0) as total_pago,
        coalesce(sum(p.total),0) - coalesce(sum(pg.valor),0) as em_aberto
    from pedidos p
    left join pagamentos pg on pg.id_pedido = p.id_pedidos
    where p.id_cliente = p_id_cliente
      and extract(year from p.data_pedido) = p_ano
      and extract(month from p.data_pedido) = p_mes;
end;
$$ language plpgsql;

select * from sp_fechamento_mensal_cliente(1, 2025, 9);

select * from clientes;

-- 5
create or replace function sp_substituir_preco_por_faixa(p_id_produto int, p_faixa text)
returns void as $$
declare
    v_preco numeric;
    v_novo numeric;
begin
    select preco into v_preco from produtos where id_produtos = p_id_produto;

    case p_faixa
        when 'promo10' then v_novo := v_preco * 0.9;
        when 'promo20' then v_novo := v_preco * 0.8;
        when 'aumento5' then v_novo := v_preco * 1.05;
        else v_novo := v_preco;
    end case;

    if v_novo < 0 then
        raise exception 'preco nao pode ser negativo.';
    end if;

    update produtos 
    set preco = v_novo 
    where id_produtos = p_id_produto;
end;
$$ language plpgsql;

select sp_substituir_preco_por_faixa(3, 'promo10');
select sp_substituir_preco_por_faixa(3, 'aumento5');

select * from produtos;
