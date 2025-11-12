create table cliente (
    id_cliente serial primary key,
    nome varchar(100) not null,
    telefone varchar(20) not null unique,
    email varchar(100) not null unique,
    endereco varchar(200) not null
);

CREATE TABLE agendamento (
  id_agendamento SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES cliente(id_cliente),
  data DATE NOT NULL,
  hora TIME NOT NULL,
  descricao TEXT NOT NULL
);

create table veiculo (
    id_veiculo serial primary key,
    id_cliente int references cliente(id_cliente),
    placa varchar(10) unique not null,
    marca varchar(50),
    modelo varchar(50),
    ano int,
    cor varchar(30)
);

create table funcionario (
    id_funcionario serial primary key,
    nome varchar(100) not null,
    cargo varchar(50) not null,
    telefone varchar(20) not null unique,
    email varchar(100) not null unique
);

create table servico (
    id_servico serial primary key,
    descricao varchar(200) not null,
    preco decimal(10,2) not null
);

create table orcamento (
    id_orcamento serial primary key,
    id_cliente int references cliente(id_cliente) not null,
    data_orcamento date not null default current_date,
    valor_total decimal(10,2) not null
);

create table item_orcamento (
    id_item serial primary key,
    id_orcamento int references orcamento(id_orcamento) not null,
    id_servico int references servico(id_servico) not null,
    quantidade int not null check (quantidade > 0),
    subtotal decimal(10,2) not null check (subtotal >= 0)
);

create table atendimento (
    id_atendimento serial primary key,
    id_cliente int references cliente(id_cliente) not null,
    id_orcamento int references orcamento(id_orcamento) not null,
    id_veiculo int references veiculo(id_veiculo),
    data_atendimento date not null default current_date,
    status varchar(20) check (status in ('Agendado', 'Concluído', 'Cancelado')),
    observacoes text
);

create table pagamento (
    id_pagamento serial primary key,
    id_atendimento int references atendimento(id_atendimento) not null,
    data_pagamento date not null default current_date,
    valor_pago decimal(10,2) not null check (valor_pago >= 0),
    metodo varchar(20) check (metodo in ('Dinheiro', 'Cartao', 'Pix', 'Transferencia')),
    status varchar(20) check (status in ('Pendente', 'Pago', 'Parcial'))
);

create table funcionario_atendimento (
    id_funcionario int references funcionario(id_funcionario) not null,
    id_atendimento int references atendimento(id_atendimento) not null,
    funcao_no_atendimento varchar(50),
    primary key (id_funcionario, id_atendimento)
);

--Mostra de maneira detalhada os orçamentos selecionados
create or replace view vw_orcamentos_detalhados as
select 
    o.id_orcamento,
    c.nome as cliente,
    o.data_orcamento,
    s.descricao as servico,
    io.quantidade,
    io.subtotal,
    o.valor_total
from orcamento o
join cliente c on o.id_cliente = c.id_cliente
join item_orcamento io on o.id_orcamento = io.id_orcamento
join servico s on io.id_servico = s.id_servico;

select*from vw_orcamentos_detalhados;

--Mostra os agendamentos futuros com cliente, veículo e funcionários designados
create or replace view vw_atendimentos_agendados as
select 
    a.id_atendimento,
    c.nome as cliente,
    v.placa,
    v.modelo,
    a.data_atendimento,
    a.status,
    f.nome as funcionario,
    fa.funcao_no_atendimento
from atendimento a
join cliente c on a.id_cliente = c.id_cliente
join veiculo v on a.id_veiculo = v.id_veiculo
join funcionario_atendimento fa on a.id_atendimento = fa.id_atendimento
join funcionario f on fa.id_funcionario = f.id_funcionario
where a.status = 'Agendado';

select*from vw_atendimentos_agendados;

--Mostra os pagamentos que ainda estão pendentes
create or replace view vw_pagamentos_pendentes as
select 
    p.id_pagamento,
    c.nome as cliente,
    a.id_atendimento,
    p.valor_pago,
    p.metodo,
    p.status
from pagamento p
join atendimento a on p.id_atendimento = a.id_atendimento
join cliente c on a.id_cliente = c.id_cliente
where p.status in ('Pendente', 'Parcial');

select*from vw_pagamentos_pendentes;

--Calcula o valor_total do orcamento
create or replace function sp_atualizar_valor_orcamento(p_id_orcamento int)
returns void as $$
declare
    soma decimal(10,2);
begin
    select coalesce(sum(subtotal),0) 
    into soma
    from item_orcamento
    where id_orcamento = p_id_orcamento;

    update orcamento
    set valor_total = soma
    where id_orcamento = p_id_orcamento;
end;
$$ language plpgsql;