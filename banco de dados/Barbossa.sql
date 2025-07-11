create table parceiro(
 idparceiro serial primary key,
 documento int,
 nome varchar(255),
 nomeFantasia varchar(255),
 observacao varchar(255),
 idnativo bool
);

create table usuario(
 idusuario serial primary key,
 nome varchar(255),
 email varchar(255),
 observacao varchar(255),
 idnativo bool
);

create table telefone(
 idtelefone serial primary key,
 numero int,
 idusuario int,
 idparceiro int,
 idnativo bool,
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario),
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro)
);

create table tabelaPreco(
 idtabelaPreco serial primary key,
 descricao int,
 descontoMaximo real,
 codigo int,
 inicioVigencia date,
 fimVigencia date,
 idnativo bool
);

create table produto(
 idproduto serial primary key,
 codigo int,
 descricao varchar(255),
 observacao varchar(255),
 peso real
);

create table precoProduto(
 idprecoProduto serial primary key,
 idtabelaPreco int,
 idproduto int,
 preco real,
 constraint fk_idtabelaPreco foreign key (idtabelaPreco) references tabelaPreco(idtabelaPreco),
 constraint fk_idproduto foreign key (idproduto) references produto(idproduto)
);

create table condicaoPagamento(
 idcondicaoPagamento serial primary key,
 descricao varchar(255),
 codigo int,
 observacao varchar(255)
);

create table pedido(
 idpedido serial primary key,
 numero int,
 valorTotal real,
 quantidadeProdutos real,
 observacao varchar(255),
 idtabelaPreco int,
 idcondicaoPagamento int,
 idparceiro int,
 idusuario int,
 data time,
 constraint fk_idtabelaPreco foreign key (idtabelaPreco) references tabelaPreco(idtabelaPreco),
 constraint fk_idcondicaoPagamento foreign key (idcondicaoPagamento) references condicaoPagamento(idcondicaoPagamento),
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro),
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario)
);

create table pedidoProduto(
 idpedidoProduto serial primary key,
 idpedido int,
 idproduto int,
 valor real,
 quantidade real,
 constraint fk_idpedido foreign key (idpedido) references pedido(idpedido),
 constraint fk_idproduto foreign key (idproduto) references produto(idproduto)
);

create table pais(
 idpais serial primary key,
 nome varchar(100),
 sigla varchar(10)
);

create table estado(
 idestado serial primary key,
 nome varchar(100),
 sigla varchar(10),
 idpais int,
 constraint fk_idpais foreign key (idpais) references pais (idpais)
);

create table cidade(
 idcidade serial primary key,
 nome varchar(100),
 inscricaoEstadual int,
 idestado int,
 constraint fk_idestado foreign key (idestado) references estado(idestado)
);

create table endereco(
 idendereco serial primary key,
 logradouro varchar(255),
 numero int,
 cep int,
 complemento varchar(255),
 idparceiro int,
 idusuario int,
 idcidade int,
 idnativo bool,
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro),
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario),
 constraint fk_idcidade foreign key (idcidade) references cidade(idcidade)
);

insert into pais (nome, sigla) 
 values ('Brasil', 'BR'),
 ('Argentina', 'AR'),
 ('Estados Unidos', 'US');

insert into estado (nome, sigla, idpais) 
 values ('Minas Gerais', 'MG', 1),
 ('Paraná', 'PR', 1),
 ('Rio Grande do Sul', 'RS', 1),
 ('Santa Catarina', 'SC', 1),
 ('São Paulo', 'SP', 1);

insert into cidade (nome, inscricaoEstadual, idestado) 
values 
('Viña del Mar', 200001, 1),
('Punta del Este', 200004, 2),
('Toronto', 200005, 3),
('Vancouver', 200007, 4),
('Montreal', 200011, 5);

insert into  parceiro (documento, nome, nomeFantasia, observacao, idnativo)
values 
(21, 'NextLevel Corp', 'NextLevel', 'Cliente internacional', true),
(22, 'FusionTech Ltda', 'Fusion', 'Pagamentos via PayPal', true),
(23, 'GreenWay Eco', 'GreenWay', 'Sede em Toronto', true),
(24, 'Skyline Devs', 'Skyline', '', true),
(25, 'BrightIdeas Inc.', 'BrightIdeas', '', true),
(21, 'Pixel Studio', 'Pixel', '', false);

insert into usuario (nome, email, observacao, idnativo)  
values 
('Lucas Andrade', 'lucas.andrade@email.com', '', true),
('Marina Lopes', 'marina.lopes@email.com', '', true),
('Thiago Ramos', 'thiago.ramos@email.com', '', false),
('Paula Figueira', 'paula.figueira@email.com', '', true),
('Felipe Duarte', 'felipe.duarte@email.com', '', true),
('Juliana Pires', 'juliana.pires@email.com', '', true);

insert into telefone (numero, idusuario, idparceiro, idnativo) 
 values 
 (999111111, 1, 1, true),
 (999222222, 2, 2, true),
 (999333333, 3, 3, false),
 (997555555, 4, 4, false),
 (997666666, 5, 5, true),
 (997777777, 6, 6, true);

insert into endereco (logradouro, numero, cep, complemento, idparceiro, idusuario, idcidade, idnativo) 
values 
('Rua das Oliveiras', 120, 76123111, 'Próximo à praça central', 1, NULL, 1, true),
('Av. Libertador', 784, 91500312, 'Sala 5', 2, NULL, 2, true),
('Rua dos Bosques', 10, 11000234, 'Fundos', 3, NULL, 3, true),
('Rua do Norte', 456, 77889911, 'Perto da biblioteca', 4, NULL, 4, true),
('Av. do Comércio', 1010, 88997766, '3º andar', 5, NULL, 5, true);

insert into tabelaPreco (descricao, descontoMaximo, codigo, inicioVigencia, fimVigencia, idnativo) 
values 
(11, 12.00, 2001, '2025-01-01', '2025-12-31', true),
(12, 5.50, 2002, '2025-01-01', '2025-12-31', true),
(13, 10.00, 2003, '2025-01-01', '2025-12-31', true),
(14, 4.25, 2004, '2025-01-01', '2025-12-31', true),
(15, 7.95, 2005, '2025-01-01', '2025-12-31', true);

insert into produto (codigo, descricao, observacao, peso) 
values 
(601, 'Notebook', 'Dell', 2.4),
(602, 'Webcam', 'Logitech', 0.5),
(603, 'Tablet', 'Samsung', 0.9),
(604, 'Headset', 'HyperX', 0.75),
(605, 'HD Externo', 'Seagate', 0.3);

insert into precoProduto (idtabelaPreco, idproduto, preco) 
values 
(1, 1, 2500.00),
(2, 2, 290.99),
(3, 3, 1450.75),
(4, 4, 320.00),
(5, 5, 560.50);

insert into condicaoPagamento (descricao, codigo, observacao) 
values 
('PIX à vista', 10, 'Desconto de 5%'),
('Cartão Crédito 1x', 11, 'Sem juros'),
('Cartão Crédito 3x', 12, 'Com acréscimo de 5%'),
('Boleto bancário', 13, 'Vencimento em 3 dias'),
('Transferência', 14, 'Banco Nacional');

insert into pedido (numero, valorTotal, quantidadeProdutos, observacao, idtabelaPreco, idcondicaoPagamento, idparceiro, idusuario, data) 
 values(1001, 150.75, 3, 'Entrega rápida', 1, 1, 1, 1, '08:30:00'),
 (1002, 300.50, 5, 'Cliente exigente', 2, 2, 2, 2, '09:15:00'),
 (1003, 50.00, 1, NULL, 3, 3, 3, 3, '10:00:00'),
 (1004, 450.99, 7, 'Urgente', 4, 4, 4, 4, '11:45:00'),
 (1005, 120.00, 2, NULL, 5, 5, 5, 5, '13:00:00'),
 (1006, 89.99, 1, 'Retirar no balcão', 1, 1, 1, 6, '14:30:00'),
 (1007, 230.49, 4, 'Verificar estoque', 2, 2, 2, 1, '15:10:00'),
 (1008, 340.90, 6, NULL, 3, 3, 3, 2, '16:45:00'),
 (1009, 410.10, 8, 'Pagamento adiantado', 4, 4, 4, 3, '17:20:00'),
 (1010, 75.25, 1, NULL, 5, 1, 5, 4, '08:00:00'),
 (1011, 520.00, 9, 'Cobrar frete', 1, 2, 1, 5, '09:30:00'),
 (1012, 180.60, 3, NULL, 2, 3, 2, 6, '10:30:00'),
 (1013, 250.40, 4, 'Aguardando aprovação', 3, 4, 3, 1, '11:30:00'),
 (1014, 90.00, 1, NULL, 4, 5, 4, 2, '12:00:00'),
 (1015, 600.50, 10, 'Entregar sábado', 5, 1, 5, 3, '13:00:00'),
 (1016, 320.90, 5, NULL, 1, 2, 1, 4, '14:00:00'),
 (1017, 115.75, 2, 'Nova negociação', 2, 3, 2, 5, '15:00:00'),
 (1018, 245.90, 3, NULL, 3, 4, 3, 6, '16:00:00'),
 (1019, 310.40, 6, 'Solicitar NF', 4, 5, 4, 1, '17:00:00'),
 (1020, 90.00, 1, NULL, 5, 1, 5, 2, '18:00:00'),
 (1021, 510.10, 8, 'Cliente novo', 1, 2, 1, 3, '08:10:00'),
 (1022, 200.20, 4, NULL, 2, 3, 2, 4, '09:20:00'),
 (1023, 130.35, 2, 'Solicitar avaliação', 3, 4, 3, 5, '10:40:00'),
 (1024, 470.00, 7, NULL, 4, 5, 4, 6, '11:50:00'),
 (1025, 150.00, 3, 'Entregar terça-feira', 5, 1, 5, 1, '13:10:00');

insert into pedidoProduto (idpedido, idproduto, valor, quantidade) 
values (1, 1, 120.50, 2),
 (2, 2, 89.99, 1),
 (3, 3, 345.50, 1),
 (4, 4, 39.90, 3),
 (5, 5, 150.50, 1),
 (6, 1, 130.00, 2),
 (7, 2, 100.00, 2),
 (8, 3, 320.00, 1),
 (9, 4, 50.00, 1),
 (10, 5, 140.00, 2),
 (11, 1, 110.00, 1),
 (12, 2, 90.00, 1),
 (13, 3, 310.00, 2),
 (14, 4, 44.44, 2),
 (15, 5, 160.00, 1),
 (16, 1, 115.00, 3),
 (17, 2, 85.50, 2),
 (18, 3, 300.00, 1),
 (19, 4, 35.90, 1),
 (20, 5, 155.00, 1),
 (21, 1, 125.00, 1),
 (22, 2, 95.00, 1),
 (23, 3, 330.00, 2),
 (24, 4, 42.00, 1),
 (25, 5, 145.00, 1);

--1)Crie uma query para retornar todas as informações de usuários do sistema. O retorno deverá ser o nome do usuário, e-mail, 
--seu logradouro, número, cep e complemento, e por ultimo mais não menos importante, seu número de telefone. Se o usuário 
--não possuir um telefone ou endereço cadastrado, deverá ser null a informação.

select 
    u.nome as nome_usuario,
    u.email,
    e.logradouro,
    e.numero,
    e.cep,
    e.complemento,
    t.numero as telefone
from 
    usuario u
left join endereco e on u.idusuario = e.idusuario
left join telefone t on u.idusuario = t.idusuario;

--2)Crie uma querry semelhante para Parceiro, porém trazendo o
--nome fantasia do parteiro, acrescido do nome da cidade desse
--parceiro, o nome do estado e a sua sigla e o nome do pais e sua sigla.

select 
    p.nomeFantasia as "Nome Fantasia do Parceiro",
    c.nome as "Cidade",
    est.nome as "Estado",
    est.sigla as "UF",
    pa.nome as "País",
    pa.sigla as "Sigla País"
from 
    parceiro p
left join 
    endereco en on p.idparceiro = en.idparceiro
left join 
    cidade c on en.idcidade = c.idcidade
left join 
    estado est on c.idestado = est.idestado
left join 
    pais pa on est.idpais = pa.idpais
order by 
    p.nomeFantasia;

--3 – Crie uma query para trazer todas as tabelas de preço ativas, que
--estão vigentes que possua algum produto associado a tal tabela que
--seja com um peso maior que X e que tenha sido utilizado em um
--pedido para o parceiro X.

select distinct tp.*
 from tabelaPreco tp
 inner join precoProduto tpp on tp.idtabelapreco = tpp.idtabelapreco
 inner join produto prod on tpp.idproduto = prod.idproduto
 inner join pedido p on tp.idtabelaPreco = p.idtabelaPreco
where tp.idnativo = TRUE
 and current_date between tp.inicioVigencia and tp.fimVigencia
 and prod.peso < 3
 and p.idparceiro = 2;
select * from pedido;
select * from produto;

--4–Juquinha ingressou em uma nova aventura, agora trabalha como DBA
--na Vault-Tech. Na sua primeira semana na empresa recebeu uma missão de
--criar um BI na empresa para que os gestores pudessem acompanhar as
--vendas da empresa. O BI deverá conter as informações abaixo:
--•Número do pedido; data do pedido; valor total; quantidade de produtos;
--nome do parceiro; nome fantasia do parcerio; nome do usuário; e-mail do
--usuário; nome da tabela de preço; nome da condição de pagamento; nome
--do produto; código do produto; valor de venda do produto; nome do pais
--do pedido; sigla do estado; telefone do parceiro.
--•Como Juquinha deve mostrar serviço nesse primeiro serviço ele deverá
--criar novos inserts para ter no minimo três registros no seu BI caso não
--tenha dados no banco de dados.

select 
 p.idpedido,
 p.data,
 p.valorTotal,
 p.quantidadeProdutos,
 par.nome,
 par.nomeFantasia,
 u.nome,
 u.email,
 tp.descricao,
 cp.descricao,
 prod.descricao,
 prod.codigo,
 pp.valor,
 pais.nome,
 pais.sigla,
 est.sigla,
 t.numero
from pedido p
inner join parceiro par on p.idparceiro = par.idparceiro
inner join usuario u  on p.idusuario = u.idusuario
inner join tabelaPreco tp  on p.idtabelaPreco = tp.idtabelaPreco
inner join condicaoPagamento cp on p.idcondicaoPagamento = cp.idcondicaoPagamento	
left join pedidoProduto pp on p.idpedido = pp.idpedido
left join produto prod on pp.idproduto = prod.idproduto
left join endereco e on par.idparceiro = e.idparceiro
left join cidade c on e.idcidade = c.idcidade
left join estado est on c.idestado = est.idestado
left join pais pais on est.idpais = pais.idpais
left join telefone t on par.idparceiro = t.idparceiro;

--5 – Juquinha está trabalhando na empresa Umbrella Corporation no
--setor de TI. Existe um chamado que foi enviado para Juquinha que a
--equipe de venda solicita a criação de uma nova tabela no banco de
--dados. Tal tabela deverá abrigar as informações de nota fiscal. A
--tabela de nota fiscal deverá se relacionar com a pedido, parceiro e
--endereço. Deverá conter as seguintes informações: Número da NF;
--chave de acesso; data de emissão; valor total; valor do icms; base do
--cálculo do icms; valor do pis, valor do confins; nome da
--transportadora; cnpj da transportadora; telefone da transportadora;
--endereço da transportadora. Juquinha pediu ajuda para Jaiminho, seu
--encarregado, e ele deu uma dica para Juquinha, para ele criar uma
--tabela para a transportadora e relacionar os endereços e telefones as
--tabelas existentes.
--5 – Crie os comandos sql para criar toda a estrutura necessária, toda a
--DDL incluindo as alterações nas tabelas existentes. Também deverá
--ser criado 5 registros completos para transportadoras, com seus
--telefones e endereços vinculados e 25 registros para as notas ficais.

create table transportadora (
    id_transportadora serial primary key,
    nome varchar(100),
    cnpj varchar(18) unique
);

alter table telefone
add column id_transportadora int,
add constraint fk_telefone_transportadora foreign key (id_transportadora) references transportadora(id_transportadora);

alter table endereco
add column id_transportadora int,
add constraint fk_endereco_transportadora foreign key (id_transportadora) references transportadora(id_transportadora);

create table nota_fiscal (
    id_nota_fiscal serial primary key,
    numero_nf varchar(20),
    chave_acesso varchar(50) unique,
    data_emissao date,
    valor_total decimal(10, 2),
    valor_icms decimal(10, 2),
    base_calculo_icms decimal(10, 2),
    valor_pis decimal(10, 2),
    valor_cofins decimal(10, 2),
    idpedido int,
    idparceiro int,
    idendereco int,
    id_transportadora int,
    constraint fkpedido foreign key (idpedido) references pedido(idpedido),
    constraint fkparceiro foreign key (idparceiro) references parceiro(idparceiro),
    constraint fkendereco foreign key (idendereco) references endereco(idendereco),
    constraint fk_transportadora foreign key (id_transportadora) references transportadora(id_transportadora)
);

insert into transportadora (nome, cnpj) values
('TransRapido', '12.345.678/0001-01'),
('Expresso do Sul', '98.765.432/0001-02'),
('Nordeste Cargas', '11.222.333/0001-03'),
('RodoFrete Brasil', '22.333.444/0001-04'),
('Carga Certa', '33.444.555/0001-05');

insert into nota_fiscal (numero_nf, chave_acesso, data_emissao, valor_total, valor_icms, base_calculo_icms,
valor_pis, valor_cofins, id_pedido, id_parceiro, id_endereco, id_transportadora) values
('NF001', '1000000001', '2025-05-01', 1000.00, 180.00, 1000.00, 15.00, 30.00, 1, 1, 1, 1),
('NF002', '1000000002', '2025-05-02', 1500.00, 270.00, 1500.00, 22.50, 45.00, 2, 2, 2, 2),
('NF003', '1000000003', '2025-05-03', 2000.00, 360.00, 2000.00, 30.00, 60.00, 3, 3, 3, 3),
('NF004', '1000000004', '2025-05-04', 2500.00, 450.00, 2500.00, 37.50, 75.00, 4, 4, 4, 4),
('NF005', '1000000005', '2025-05-05', 3000.00, 540.00, 3000.00, 45.00, 90.00, 5, 5, 5, 5),
('NF006', '1000000006', '2025-05-06', 1200.00, 216.00, 1200.00, 18.00, 36.00, 1, 2, 1, 2),
('NF007', '1000000007', '2025-05-07', 1800.00, 324.00, 1800.00, 27.00, 54.00, 2, 3, 2, 3),
('NF008', '1000000008', '2025-05-08', 2200.00, 396.00, 2200.00, 33.00, 66.00, 3, 4, 3, 4),
('NF009', '1000000009', '2025-05-09', 2700.00, 486.00, 2700.00, 40.50, 81.00, 4, 5, 4, 5),
('NF010', '1000000010', '2025-05-10', 3200.00, 576.00, 3200.00, 48.00, 96.00, 5, 1, 5, 1),
('NF011', '1000000011', '2025-05-11', 1100.00, 198.00, 1100.00, 16.50, 33.00, 1, 3, 1, 3),
('NF012', '1000000012', '2025-05-12', 1700.00, 306.00, 1700.00, 25.50, 51.00, 2, 4, 2, 4),
('NF013', '1000000013', '2025-05-13', 2100.00, 378.00, 2100.00, 31.50, 63.00, 3, 5, 3, 5),
('NF014', '1000000014', '2025-05-14', 2600.00, 468.00, 2600.00, 39.00, 78.00, 4, 1, 4, 1),
('NF015', '1000000015', '2025-05-15', 3100.00, 558.00, 3100.00, 46.50, 93.00, 5, 2, 5, 2),
('NF016', '1000000016', '2025-05-16', 1300.00, 234.00, 1300.00, 19.50, 39.00, 1, 4, 1, 4),
('NF017', '1000000017', '2025-05-17', 1900.00, 342.00, 1900.00, 28.50, 57.00, 2, 5, 2, 5),
('NF018', '1000000018', '2025-05-18', 2300.00, 414.00, 2300.00, 34.50, 69.00, 3, 1, 3, 1),
('NF019', '1000000019', '2025-05-19', 2800.00, 504.00, 2800.00, 42.00, 84.00, 4, 2, 4, 2),
('NF020', '1000000020', '2025-05-20', 3300.00, 594.00, 3300.00, 49.50, 99.00, 5, 3, 5, 3),
('NF021', '1000000021', '2025-05-21', 1400.00, 252.00, 1400.00, 21.00, 42.00, 1, 5, 1, 5),
('NF022', '1000000022', '2025-05-22', 1600.00, 288.00, 1600.00, 24.00, 48.00, 2, 1, 2, 1),
('NF023', '1000000023', '2025-05-23', 2400.00, 432.00, 2400.00, 36.00, 72.00, 3, 2, 3, 2),
('NF024', '1000000024', '2025-05-24', 2900.00, 522.00, 2900.00, 43.50, 87.00, 4, 3, 4, 3),
('NF025', '1000000025', '2025-05-25', 3400.00, 612.00, 3400.00, 51.00, 102.00, 5, 4, 5, 4);

