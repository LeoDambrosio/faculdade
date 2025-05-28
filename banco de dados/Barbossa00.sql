create table parceiro(
 idparceiro serial primary key,
 documento int not null,
 nome varchar(255) not null,
 nomeFantasia varchar(255),
 observacao varchar(255),
 idnativo bool
);

create table usuario(
 idusuario serial primary key,
 nome varchar(255) not null,
 email varchar(255),
 observacao varchar(255),
 idnativo bool not null
);

create table telefone(
 idtelefone serial primary key,
 numero int not null,
 idusuario int,
 idparceiro int,
 idnativo bool not null,
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario),
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro)
);

create table tabelaPreco(
 idtabelaPreco serial primary key,
 descricao int not null,
 descontoMaximo real,
 codigo int not null,
 inicioVigencia date not null,
 fimVigencia date not null,
 idnativo bool not null
);

create table produto(
 idproduto serial primary key,
 codigo int not null,
 descricao varchar(255) not null,
 observacao varchar(255),
 peso real not null
);

create table precoProduto(
 idprecoProduto serial primary key,
 idtabelaPreco int not null,
 idproduto int not null,
 preco real not null,
 constraint fk_idtabelaPreco foreign key (idtabelaPreco) references tabelaPreco(idtabelaPreco),
 constraint fk_idproduto foreign key (idproduto) references produto(idproduto)
);

create table condicaoPagamento(
 idcondicaoPagamento serial primary key,
 descricao varchar(255) not null,
 codigo int not null,
 observacao varchar(255)
);

create table pedido(
 idpedido serial primary key,
 numero int not null,
 valorTotal real not null,
 quantidadeProdutos real not null,
 observacao varchar(255),
 idtabelaPreco int not null,
 idcondicaoPagamento int not null,
 idparceiro int not null,
 idusuario int not null,
 data time not null,
 constraint fk_idtabelaPreco foreign key (idtabelaPreco) references tabelaPreco(idtabelaPreco),
 constraint fk_idcondicaoPagamento foreign key (idcondicaoPagamento) references condicaoPagamento(idcondicaoPagamento),
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro),
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario)
);

create table pedidoProduto(
 idpedidoProduto serial primary key,
 idpedido int not null,
 idproduto int not null,
 valor real not null,
 quantidade real not null,
 constraint fk_idpedido foreign key (idpedido) references pedido(idpedido),
 constraint fk_idproduto foreign key (idproduto) references produto(idproduto)
);

create table pais(
 idpais serial primary key,
 nome varchar(100) not null,
 sigla varchar(10) not null
);

create table estado(
 idestado serial primary key,
 nome varchar(100) not null,
 sigla varchar(10) not null,
 idpais int not null,
 constraint fk_idpais foreign key (idpais) references pais (idpais)
);

create table cidade(
 idcidade serial primary key,
 nome varchar(100) not null,
 inscricaoEstadual int not null,
 idestado int not null,
 constraint fk_idestado foreign key (idestado) references estado(idestado)
);

create table endereco(
 idendereco serial primary key,
 logradouro varchar(255) not null,
 numero int not null,
 cep int not null,
 complemento varchar(255),
 idparceiro int,
 idusuario int,
 idcidade int not null,
 idnativo bool not null,
 constraint fk_idparceiro foreign key (idparceiro) references parceiro(idparceiro),
 constraint fk_idusuario foreign key (idusuario) references usuario(idusuario),
 constraint fk_idcidade foreign key (idcidade) references cidade(idcidade)
);

INSERT INTO pais (nome, sigla) 
 VALUES ('Brasil', 'BR'),
 ('Argentina', 'AR'),
 ('Estados Unidos', 'US');

INSERT INTO estado (nome, sigla, idpais) 
 VALUES ('Minas Gerais', 'MG', 1),
 ('Paraná', 'PR', 1),
 ('Rio Grande do Sul', 'RS', 1),
 ('Santa Catarina', 'SC', 1),
 ('São Paulo', 'SP', 1);

INSERT INTO cidade (nome, inscricaoEstadual, idestado) 
VALUES 
('Viña del Mar', 200001, 1),
('Punta del Este', 200004, 2),
('Toronto', 200005, 3),
('Vancouver', 200007, 4),
('Montreal', 200011, 5);

INSERT INTO  parceiro (documento, nome, nomeFantasia, observacao, idnativo)
VALUES 
(21, 'NextLevel Corp', 'NextLevel', 'Cliente internacional', true),
(22, 'FusionTech Ltda', 'Fusion', 'Pagamentos via PayPal', true),
(23, 'GreenWay Eco', 'GreenWay', 'Sede em Toronto', true),
(24, 'Skyline Devs', 'Skyline', '', true),
(25, 'BrightIdeas Inc.', 'BrightIdeas', '', true),
(21, 'Pixel Studio', 'Pixel', '', false);

INSERT INTO usuario (nome, email, observacao, idnativo)  
VALUES 
('Lucas Andrade', 'lucas.andrade@email.com', '', true),
('Marina Lopes', 'marina.lopes@email.com', '', true),
('Thiago Ramos', 'thiago.ramos@email.com', '', false),
('Paula Figueira', 'paula.figueira@email.com', '', true),
('Felipe Duarte', 'felipe.duarte@email.com', '', true),
('Juliana Pires', 'juliana.pires@email.com', '', true);

INSERT INTO telefone (numero, idusuario, idparceiro, idnativo) 
 VALUES 
 (999111111, 1, 1, true),
 (999222222, 2, 2, true),
 (999333333, 3, 3, false),
 (997555555, 4, 4, false),
 (997666666, 5, 5, true),
 (997777777, 6, 6, true);

INSERT INTO endereco (logradouro, numero, cep, complemento, idparceiro, idusuario, idcidade, idnativo) 
VALUES 
('Rua das Oliveiras', 120, 76123111, 'Próximo à praça central', 1, NULL, 1, true),
('Av. Libertador', 784, 91500312, 'Sala 5', 2, NULL, 2, true),
('Rua dos Bosques', 10, 11000234, 'Fundos', 3, NULL, 3, true),
('Rua do Norte', 456, 77889911, 'Perto da biblioteca', 4, NULL, 4, true),
('Av. do Comércio', 1010, 88997766, '3º andar', 5, NULL, 5, true);

INSERT INTO tabelaPreco (descricao, descontoMaximo, codigo, inicioVigencia, fimVigencia, idnativo) 
VALUES 
(11, 12.00, 2001, '2025-01-01', '2025-12-31', true),
(12, 5.50, 2002, '2025-01-01', '2025-12-31', true),
(13, 10.00, 2003, '2025-01-01', '2025-12-31', true),
(14, 4.25, 2004, '2025-01-01', '2025-12-31', true),
(15, 7.95, 2005, '2025-01-01', '2025-12-31', true);

INSERT INTO produto (codigo, descricao, observacao, peso) 
VALUES 
(601, 'Notebook', 'Dell', 2.4),
(602, 'Webcam', 'Logitech', 0.5),
(603, 'Tablet', 'Samsung', 0.9),
(604, 'Headset', 'HyperX', 0.75),
(605, 'HD Externo', 'Seagate', 0.3);

INSERT INTO precoProduto (idtabelaPreco, idproduto, preco) 
VALUES 
(1, 1, 2500.00),
(2, 2, 290.99),
(3, 3, 1450.75),
(4, 4, 320.00),
(5, 5, 560.50);

INSERT INTO condicaoPagamento (descricao, codigo, observacao) 
VALUES 
('PIX à vista', 10, 'Desconto de 5%'),
('Cartão Crédito 1x', 11, 'Sem juros'),
('Cartão Crédito 3x', 12, 'Com acréscimo de 5%'),
('Boleto bancário', 13, 'Vencimento em 3 dias'),
('Transferência', 14, 'Banco Nacional');

INSERT INTO pedido (numero, valorTotal, quantidadeProdutos, observacao, idtabelaPreco, idcondicaoPagamento, idparceiro, idusuario, data) 
 VALUES(1001, 150.75, 3, 'Entrega rápida', 1, 1, 1, 1, '08:30:00'),
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

--1)Crie uma query para retornar todas as informações de usuários do sistema. O retorno deverá ser o nome do usuário, e-mail, 
--seu logradouro, número, cep e complemento, e por ultimo mais não menos importante, seu número de telefone. Se o usuário 
--não possuir um telefone ou endereço cadastrado, deverá ser null a informação.

SELECT 
    u.nome AS nome_usuario,
    u.email,
    e.logradouro,
    e.numero,
    e.cep,
    e.complemento,
    t.numero AS telefone
FROM 
    usuario u
LEFT JOIN endereco e ON u.idusuario = e.idusuario
LEFT JOIN telefone t ON u.idusuario = t.idusuario;

--2)Crie uma querry semelhante para Parceiro, porém trazendo o
--nome fantasia do parteiro, acrescido do nome da cidade desse
--parceiro, o nome do estado e a sua sigla e o nome do pais e sua sigla.

SELECT 
    p.nomeFantasia AS "Nome Fantasia do Parceiro",
    c.nome AS "Cidade",
    est.nome AS "Estado",
    est.sigla AS "UF",
    pa.nome AS "País",
    pa.sigla AS "Sigla País"
FROM 
    parceiro p
left JOIN 
    endereco en ON p.idparceiro = en.idparceiro
left JOIN 
    cidade c ON en.idcidade = c.idcidade
left JOIN 
    estado est ON c.idestado = est.idestado
left JOIN 
    pais pa ON est.idpais = pa.idpais
ORDER BY 
    p.nomeFantasia;

--3 – Crie uma query para trazer todas as tabelas de preço ativas, que
--estão vigentes que possua algum produto associado a tal tabela que
--seja com um peso maior que X e que tenha sido utilizado em um
--pedido para o parceiro X.

SELECT DISTINCT tp.*
 FROM tabelaPreco tp
 INNER JOIN precoProduto tpp ON tp.idtabelapreco = tpp.idtabelapreco
 INNER JOIN produto prod ON tpp.idproduto = prod.idproduto
 INNER JOIN pedido p ON tp.idtabelaPreco = p.idtabelaPreco
 --INNER JOIN pedidoProduto pp ON p.idpedido = pp.idpedido AND pp.idproduto = prod.idproduto
WHERE tp.idnativo = TRUE
 AND CURRENT_DATE BETWEEN tp.inicioVigencia AND tp.fimVigencia
 AND prod.peso < 3
 AND p.idparceiro = 2;
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

SELECT 
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
FROM pedido p
inner JOIN parceiro par 
 ON p.idparceiro = par.idparceiro
inner JOIN usuario u 
 ON p.idusuario = u.idusuario
inner JOIN tabelaPreco tp 
 ON p.idtabelaPreco = tp.idtabelaPreco
inner JOIN condicaoPagamento cp 
 ON p.idcondicaoPagamento = cp.idcondicaoPagamento
inner JOIN pedidoProduto pp 
 ON p.idpedido = pp.idpedido
inner JOIN produto prod 
 ON pp.idproduto = prod.idproduto

LEFT JOIN endereco e  
 ON par.idparceiro = e.idparceiro
LEFT JOIN cidade c 
 ON e.idcidade = c.idcidade
LEFT JOIN estado est 
 ON c.idestado = est.idestado
LEFT JOIN pais pais 
 ON est.idpais = pais.idpais
LEFT JOIN telefone t 
 ON par.idparceiro = t.idparceiro;
