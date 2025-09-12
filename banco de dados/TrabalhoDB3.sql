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

--EASY
--1
CREATE OR REPLACE FUNCTION sp_inserir_cliente(p_nome TEXT, p_email TEXT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO clientes (nome, email, status_cliente)
    VALUES (p_nome, p_email, 'standard');
END;
$$ LANGUAGE plpgsql;

-- 2) Ativar/Inativar produto
CREATE OR REPLACE FUNCTION sp_ativar_produto(p_id_produto INT, p_ativo BOOLEAN)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM produtos WHERE id_produtos = p_id_produto) THEN
        RAISE EXCEPTION 'Produto % não encontrado.', p_id_produto;
    END IF;

    UPDATE produtos SET ativo = p_ativo WHERE id_produtos = p_id_produto;
END;
$$ LANGUAGE plpgsql;

-- 3) Repor estoque
CREATE OR REPLACE FUNCTION sp_repor_estoque(p_id_produto INT, p_qtd INT)
RETURNS VOID AS $$
BEGIN
    IF p_qtd <= 0 THEN
        RAISE EXCEPTION 'Quantidade deve ser maior que zero.';
    END IF;

    UPDATE produtos
    SET estoque = estoque + p_qtd
    WHERE id_produtos = p_id_produto;
END;
$$ LANGUAGE plpgsql;

-- 4) Reajustar preço
CREATE OR REPLACE FUNCTION sp_reajustar_preco(p_id_produto INT, p_percentual NUMERIC)
RETURNS VOID AS $$
DECLARE
    v_preco_atual NUMERIC;
    v_novo_preco NUMERIC;
BEGIN
    SELECT preco INTO v_preco_atual FROM produtos WHERE id_produtos = p_id_produto;

    v_novo_preco := v_preco_atual + (v_preco_atual * p_percentual / 100);

    IF v_novo_preco < 0 THEN
        RAISE EXCEPTION 'Preço não pode ser negativo.';
    END IF;

    UPDATE produtos SET preco = v_novo_preco WHERE id_produtos = p_id_produto;
END;
$$ LANGUAGE plpgsql;

-- 5) Mudar status cliente
CREATE OR REPLACE FUNCTION sp_mudar_status_cliente(p_id_cliente INT, p_novo_status TEXT)
RETURNS VOID AS $$
BEGIN
    IF p_novo_status NOT IN ('standard','gold','platinum') THEN
        RAISE EXCEPTION 'Status inválido: %. Deve ser STANDARD, GOLD ou PLATINUM.', p_novo_status;
    END IF;

    UPDATE clientes
    SET status_cliente = p_novo_status
    WHERE id_clientes = p_id_cliente;
END;
$$ LANGUAGE plpgsql;


--MEDIUM

--1
CREATE OR REPLACE FUNCTION sp_abrir_pedido(p_id_cliente INT, INOUT p_id_pedido INT)
RETURNS INT AS $$
BEGIN
    INSERT INTO pedidos (id_cliente, status_pedido, total)
    VALUES (p_id_cliente, 'aberto', 0)
    RETURNING id_pedidos INTO p_id_pedido;
END;
$$ LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION sp_adicionar_item(p_id_pedido INT, p_id_produto INT, p_qtd INT)
RETURNS VOID AS $$
DECLARE
    v_estoque INT;
    v_preco NUMERIC;
BEGIN
    SELECT estoque, preco INTO v_estoque, v_preco
    FROM produtos WHERE id_produtos = p_id_produto;

    IF v_estoque IS NULL THEN
        RAISE EXCEPTION 'Produto % não encontrado.', p_id_produto;
    END IF;

    IF v_estoque < p_qtd THEN
        RAISE EXCEPTION 'Estoque insuficiente para o produto %.', p_id_produto;
    END IF;

    INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
    VALUES (p_id_pedido, p_id_produto, p_qtd, v_preco);

    UPDATE produtos SET estoque = estoque - p_qtd WHERE id_produtos = p_id_produto;
END;
$$ LANGUAGE plpgsql;

--3
CREATE OR REPLACE FUNCTION sp_recalcular_total(p_id_pedido INT)
RETURNS VOID AS $$
DECLARE
    v_total NUMERIC;
BEGIN
    SELECT SUM(subtotal) INTO v_total
    FROM itens_pedido
    WHERE id_pedido = p_id_pedido;

    UPDATE pedidos SET total = COALESCE(v_total, 0) WHERE id_pedidos = p_id_pedido;
END;
$$ LANGUAGE plpgsql;

--4
CREATE OR REPLACE FUNCTION sp_aplicar_desconto_status(p_id_pedido INT)
RETURNS VOID AS $$
DECLARE
    v_status TEXT;
    v_total NUMERIC;
    v_desconto NUMERIC := 0;
BEGIN
    SELECT c.status_cliente, p.total
    INTO v_status, v_total
    FROM pedidos p
    JOIN clientes c ON p.id_cliente = c.id_clientes
    WHERE p.id_pedidos = p_id_pedido;

    CASE
        WHEN v_status = 'gold' THEN v_desconto := 0.05;
        WHEN v_status = 'platinum' THEN v_desconto := 0.10;
        ELSE v_desconto := 0;
    END CASE;

    UPDATE pedidos
    SET total = v_total - (v_total * v_desconto)
    WHERE id_pedidos = p_id_pedido;
END;
$$ LANGUAGE plpgsql;

--5
CREATE OR REPLACE FUNCTION sp_registrar_pagamento(p_id_pedido INT, p_valor NUMERIC, p_forma TEXT)
RETURNS VOID AS $$
DECLARE
    v_total NUMERIC;
    v_pago NUMERIC;
BEGIN
    SELECT total INTO v_total FROM pedidos WHERE id_pedidos = p_id_pedido;

    SELECT COALESCE(SUM(valor),0) INTO v_pago FROM pagamentos WHERE id_pedido = p_id_pedido;

    IF p_valor + v_pago > v_total * 1.2 THEN
        RAISE EXCEPTION 'Pagamento excede 120%% do valor do pedido.';
    END IF;

    INSERT INTO pagamentos (id_pedido, valor, forma) VALUES (p_id_pedido, p_valor, p_forma);

    SELECT COALESCE(SUM(valor),0) INTO v_pago FROM pagamentos WHERE id_pedido = p_id_pedido;

    IF v_pago >= v_total THEN
        UPDATE pedidos SET status_pedido = 'fechado' WHERE id_pedidos = p_id_pedido;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- MODO HARD

--1
CREATE OR REPLACE FUNCTION sp_cancelar_pedido(p_id_pedido INT)
RETURNS VOID AS $$
DECLARE
    v_status TEXT;
BEGIN
    SELECT status_pedido INTO v_status FROM pedidos WHERE id_pedidos = p_id_pedido;

    IF v_status <> 'aberto' THEN
        RAISE EXCEPTION 'Somente pedidos ABERTOS podem ser cancelados.';
    END IF;

    -- devolve estoque
    UPDATE produtos pr
    SET estoque = estoque + ip.quantidade
    FROM itens_pedido ip
    WHERE ip.id_produto = pr.id_produtos AND ip.id_pedido = p_id_pedido;

    -- muda status
    UPDATE pedidos SET status_pedido = 'cancelado' WHERE id_pedidos = p_id_pedido;
END;
$$ LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION sp_trocar_item(p_id_pedido INT, p_id_produto_antigo INT, p_id_produto_novo INT, p_qtd INT)
RETURNS VOID AS $$
DECLARE
    v_preco NUMERIC;
    v_estoque INT;
BEGIN
    BEGIN
        -- devolve estoque do antigo
        UPDATE produtos pr
        SET estoque = estoque + ip.quantidade
        FROM itens_pedido ip
        WHERE ip.id_produto = p_id_produto_antigo AND ip.id_pedido = p_id_pedido
        RETURNING ip.quantidade;

        DELETE FROM itens_pedido WHERE id_pedido = p_id_pedido AND id_produto = p_id_produto_antigo;

        -- pega dados do novo
        SELECT preco, estoque INTO v_preco, v_estoque FROM produtos WHERE id_produtos = p_id_produto_novo;

        IF v_estoque < p_qtd THEN
            RAISE EXCEPTION 'Estoque insuficiente para o novo produto.';
        END IF;

        INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
        VALUES (p_id_pedido, p_id_produto_novo, p_qtd, v_preco);

        UPDATE produtos SET estoque = estoque - p_qtd WHERE id_produtos = p_id_produto_novo;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE EXCEPTION 'Erro ao trocar item. Operação revertida.';
    END;
END;
$$ LANGUAGE plpgsql;

--3
CREATE OR REPLACE FUNCTION sp_promover_clientes_por_gasto(p_valor_minimo NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE clientes c
    SET status_cliente = CASE
        WHEN c.status_cliente = 'standard' THEN 'gold'
        ELSE c.status_cliente
    END
    WHERE c.id_clientes IN (
        SELECT p.id_cliente
        FROM pedidos p
        WHERE p.status_pedido = 'fechado'
          AND p.data_pedido >= (CURRENT_DATE - INTERVAL '1 year')
        GROUP BY p.id_cliente
        HAVING SUM(p.total) >= p_valor_minimo
    );
END;
$$ LANGUAGE plpgsql;

--4
CREATE OR REPLACE FUNCTION sp_fechamento_mensal_cliente(
    p_id_cliente INT,
    p_ano INT,
    p_mes INT,
    INOUT total_pedidos NUMERIC,
    INOUT total_pago NUMERIC,
    INOUT em_aberto NUMERIC
) RETURNS RECORD AS $$
BEGIN
    SELECT COALESCE(SUM(total),0)
    INTO total_pedidos
    FROM pedidos
    WHERE id_cliente = p_id_cliente
      AND EXTRACT(YEAR FROM data_pedido) = p_ano
      AND EXTRACT(MONTH FROM data_pedido) = p_mes;

    SELECT COALESCE(SUM(pg.valor),0)
    INTO total_pago
    FROM pagamentos pg
    JOIN pedidos p ON pg.id_pedido = p.id_pedidos
    WHERE p.id_cliente = p_id_cliente
      AND EXTRACT(YEAR FROM pg.data_pagamento) = p_ano
      AND EXTRACT(MONTH FROM pg.data_pagamento) = p_mes;

    em_aberto := total_pedidos - total_pago;
END;
$$ LANGUAGE plpgsql;

--5
CREATE OR REPLACE FUNCTION sp_substituir_preco_por_faixa(p_id_produto INT, p_faixa TEXT)
RETURNS VOID AS $$
DECLARE
    v_preco NUMERIC;
    v_novo NUMERIC;
BEGIN
    SELECT preco INTO v_preco FROM produtos WHERE id_produtos = p_id_produto;

    CASE p_faixa
        WHEN 'PROMO10' THEN v_novo := v_preco * 0.9;
        WHEN 'PROMO20' THEN v_novo := v_preco * 0.8;
        WHEN 'AUMENTO5' THEN v_novo := v_preco * 1.05;
        ELSE v_novo := v_preco;
    END CASE;

    IF v_novo < 0 THEN
        RAISE EXCEPTION 'Preço não pode ser negativo.';
    END IF;

    UPDATE produtos SET preco = v_novo WHERE id_produtos = p_id_produto;
END;
$$ LANGUAGE plpgsql;
