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
alter TABLE telefone add column idtransportadora int;
alter table telefone add constraint fk_idtransportadora FOREIGN key (idtransportadora) REFERENCES transportadora (idtransportadora);

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
alter TABLE endereco add column idtransportadora int;
alter table endereco add constraint fkidtransportadora FOREIGN key (idtransportadora) REFERENCES transportadora (idtransportadora);

INSERT INTO pais (nome, sigla) 
 VALUES ('Brasil', 'BR'),
 ('Argentina', 'AR'),
 ('Estados Unidos', 'US');

INSERT INTO estado (nome, sigla, idpais) 
 VALUES ('Minas Gerais', 'MG', 4),
 ('Paraná', 'PR', 4),
 ('Rio Grande do Sul', 'RS', 4),
 ('Santa Catarina', 'SC', 4),
 ('São Paulo', 'SP', 4);

INSERT INTO cidade (nome, inscricaoEstadual, idestado) 
VALUES 
('Viña del Mar', 200001, 6),
('Punta del Este', 200004, 7),
('Toronto', 200005, 8),
('Vancouver', 200007, 9),
('Montreal', 200011, 10);

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
 VALUES (999111111, 1, null, true),
 (999222222, 2, null, true),
 (999333333, 3, null, false),
 (997555555, 4, null, false),
 (997666666, 5, null, true),
 (997777777, 6, null, true);

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
 VALUES(1001, 150.75, 3, 'Entrega rápida', 1, 1, 6, 6, '08:30:00'),
 (1002, 300.50, 5, 'Cliente exigente', 2, 2, 5, 5, '09:15:00'),
 (1003, 50.00, 1, NULL, 3, 3, 4, 4, '10:00:00'),
 (1004, 450.99, 7, 'Urgente', 4, 4, 3, 3, '11:45:00'),
 (1005, 120.00, 2, NULL, 5, 5, 2, 2, '13:00:00'),
 (1006, 89.99, 1, 'Retirar no balcão', 1, 2, 1, 1, '14:30:00'),
 (1007, 230.49, 4, 'Verificar estoque', 2, 3, 1, 1, '15:10:00'),
 (1008, 340.90, 6, NULL, 3, 4, 2, 2, '16:45:00'),
 (1009, 410.10, 8, 'Pagamento adiantado', 4, 5, 3, 3, '17:20:00'),
 (1010, 75.25, 1, NULL, 5, 1, 4, 4, '08:00:00'),
 (1011, 520.00, 9, 'Cobrar frete', 1, 2, 5, 5, '09:30:00'),
 (1012, 180.60, 3, NULL, 2, 3, 6, 6, '10:30:00'),
 (1013, 250.40, 4, 'Aguardando aprovação', 3, 4, 6, 6, '11:30:00'),
 (1014, 90.00, 1, NULL, 4, 5, 5, 5, '12:00:00'),
 (1015, 600.50, 10, 'Entregar sábado', 5, 1, 4, 4, '13:00:00'),
 (1016, 320.90, 5, NULL, 1, 2, 3, 3, '14:00:00'),
 (1017, 115.75, 2, 'Nova negociação', 2, 3, 2, 2, '15:00:00'),
 (1018, 245.90, 3, NULL, 3, 4, 1, 1, '16:00:00'),
 (1019, 310.40, 6, 'Solicitar NF', 4, 5, 1, 1, '17:00:00'),
 (1020, 90.00, 1, NULL, 5, 1, 2, 2, '18:00:00'),
 (1021, 510.10, 8, 'Cliente novo', 1, 2, 3, 3, '08:10:00'),
 (1022, 200.20, 4, NULL, 2, 3, 4, 4, '09:20:00'),
 (1023, 130.35, 2, 'Solicitar avaliação', 3, 4, 5, 5, '10:40:00'),
 (1024, 470.00, 7, NULL, 4, 5, 6, 6, '11:50:00'),
 (1025, 150.00, 3, 'Entregar terça-feira', 5, 1, 1, 1, '13:10:00');

INSERT INTO pedidoProduto (idpedido, idproduto, valor, quantidade) 
VALUES (1, 1, 120.50, 2),
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

create table transportadora(
	idtransportadora serial primary key,
  	nome varchar(255) not null,
  	cnpj varchar(15) not null,
  	email varchar(255) not null,
  	observacao varchar(255),
	idnativo bool  	
);

create TABLE notaFiscal(
	idnotaFiscal serial PRIMARY key,
  	numeroNF int not null,
  	chaveAcesso int not null,
  	dataEmissao date not null,
  	valorTotal real not null,
  	valorICMS real not null,
  	baseCalculoICMS real not null,
  	valorPIS real not null,
  	valorCOFINS real not null,
  	idpedido int not null,
  	idparceiro int not null,
  	idendereco int not null,
  	idtransportadora int not null,
  	idtelefone int not null,
  	CONSTRAINT fk_idpedido FOREIGN key (idpedido) REFERENCES pedido (idpedido),
  	CONSTRAINT fk_idparceiro FOREIGN key (idparceiro) REFERENCES parceiro (idparceiro),
 	CONSTRAINT fk_idendereco FOREIGN key (idendereco) REFERENCES endereco (idendereco),
  	CONSTRAINT fk_idtransportadora FOREIGN key (idtransportadora) REFERENCES transportadora(idtransportadora),
  	CONSTRAINT fk_idtelefone FOREIGN key (idtelefone) REFERENCES telefone (idtelefone)
);

INSERT INTO transportadora (nome, cnpj, email, observacao, idnativo) 
 VALUES ('Transportadora Atlas Ltda', '12345678000199', 'contato@atlaslog.com.br', 'Especializada em logística rodoviária', true),
 ('Expresso São Miguel', '98765432000188', 'atendimento@saomiguel.com.br', 'Entrega rápida no sul do país', true),
 ('Jamef Transportes', '56473829000177', 'comercial@jamef.com.br', 'Distribuição nacional de encomendas', true),
 ('Braspress Logística', '99887766000166', 'sac@braspress.com.br', 'Abrangência em todo território nacional', true),
 ('Rodonaves Transportes', '11223344000155', 'vendas@rodonaves.com.br', 'Serviço expresso e carga fracionada', true);

INSERT INTO telefone (numero, idusuario, idparceiro, idtransportadora, idnativo) 
 VALUES ('453232111', null, null, 1, true),
 ('423232222', null, null, 2, true),
 ('443232333', null, null, 3, true),
 ('463232444', null, null, 4, true),
 ('413232555', null, null, 5, true);

INSERT INTO notaFiscal (numeroNF, chaveAcesso, dataEmissao, valorTotal, valorICMS, baseCalculoICMS, valorPIS, valorCOFINS,
  idpedido, idparceiro, idendereco, idtransportadora, idtelefone) 
  VALUES (1001, 123456789, '2025-05-01', 1500.00, 270.00, 1350.00, 22.50, 34.50, 1, 1, 6, 1, 1),
(1002, 1234567891, '2025-05-02', 2800.00, 504.00, 2520.00, 42.00, 64.00, 2, 2, 7, 2, 2),
(1003, 1234567892, '2025-05-03', 350.00, 63.00, 315.00, 5.25, 8.05, 3, 3, 8, 3, 3),
(1004, 1234567893, '2025-05-04', 760.00, 136.80, 684.00, 11.40, 17.30, 4, 4, 9, 4, 4),
(1005, 1234567895, '2025-05-05', 1200.00, 216.00, 1080.00, 18.00, 27.60, 5, 5, 10, 5, 5),
(1006, 1234567896, '2025-05-06', 990.00, 178.20, 891.00, 14.85, 22.77, 6, 6, 6, 1, 6),
(1007, 1234567897, '2025-05-07', 640.00, 115.20, 576.00, 9.60, 14.72, 7, 1, 7, 2, 7),
(1008, 1234567898, '2025-05-08', 875.00, 157.50, 787.50, 13.12, 20.13, 8, 2, 8, 3, 8),
(1009, 1234567899, '2025-05-09', 455.00, 81.90, 409.50, 6.83, 10.49, 9, 3, 9, 4, 9),
(1010, 123456780, '2025-05-10', 1300.00, 234.00, 1170.00, 19.50, 29.90, 10, 4, 10, 5, 10),
(1011, 223456781, '2025-05-11', 1600.00, 288.00, 1440.00, 24.00, 36.00, 11, 5, 6, 1, 1),
(1012, 223456782, '2025-05-12', 2700.00, 486.00, 2430.00, 40.50, 60.30, 12, 6, 7, 2, 2),
(1013, 223456783, '2025-05-13', 385.00, 69.30, 346.50, 5.78, 8.73, 13, 1, 8, 3, 3),
(1014, 223456784, '2025-05-14', 890.00, 160.20, 801.00, 13.35, 20.83, 14, 2, 9, 4, 4),
(1015, 223456785, '2025-05-15', 1190.00, 214.20, 1071.00, 17.85, 27.11, 15, 3, 10, 5, 5),
(1016, 223456786, '2025-05-16', 960.00, 172.80, 864.00, 14.40, 22.08, 16, 4, 6, 1, 6),
(1017, 223456787, '2025-05-17', 610.00, 109.80, 549.00, 9.15, 14.02, 17, 5, 7, 2, 7),
(1018, 223456788, '2025-05-18', 825.00, 148.50, 742.50, 12.38, 18.81, 18, 6, 8, 3, 8),
(1019, 223456789, '2025-05-19', 470.00, 84.60, 423.00, 7.05, 10.89, 19, 1, 9, 4, 9),
(1020, 2234567810, '2025-05-20', 1250.00, 225.00, 1125.00, 18.75, 28.75, 20, 2, 10, 5, 10),
(1021, 3234567811, '2025-05-21', 1590.00, 286.20, 1431.00, 23.85, 35.31, 21, 3, 6, 1, 1),
(1022, 3234567812, '2025-05-22', 2950.00, 531.00, 2655.00, 44.25, 65.73, 22, 4, 7, 2, 2),
(1023, 3234567813, '2025-05-23', 370.00, 66.60, 333.00, 5.55, 8.29, 23, 5, 8, 3, 3),
(1024, 3234567814, '2025-05-24', 910.00, 163.80, 819.00, 13.65, 21.23, 24, 6, 9, 4, 4),
(1025, 3234567815, '2025-05-25', 1185.00, 213.30, 1066.50, 17.77, 26.91, 25, 1, 10, 5, 5);

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
    cnpj varchar(18)unique
);

CREATE TABLE nota_fiscal (
  id_nota_fiscal   SERIAL PRIMARY KEY,
  numero_nf        VARCHAR(20),
  chave_acesso     VARCHAR(60) UNIQUE,
  data_emissao     DATE,
  valor_total      DECIMAL(10,2),
  valor_icms       DECIMAL(10,2),
  base_icms        DECIMAL(10,2),
  valor_pis        DECIMAL(10,2),
  valor_cofins     DECIMAL(10,2),
  idpedido        INT,
  idparceiro      INT,
  idendereco      INT,
  idtransportadora INT,
CONSTRAINT fk_notapedido FOREIGN KEY (idpedido) REFERENCES pedido(idpedido),
CONSTRAINT fk_notaparceiro FOREIGN KEY (idparceiro) REFERENCES parceiro(idparceiro),
CONSTRAINT fk_notaendereco FOREIGN KEY (idendereco) REFERENCES endereco(idendereco),
CONSTRAINT fk_notatransportadora FOREIGN KEY (idtransportadora) REFERENCES transportadora(idtransportadora)
);


insert into transportadora (nome, cnpj) values
('raccoon express', '12345678/000101'),
('nemesis logística', '23456789/000102'),
('stars freight', '34567890/000103'),
('red queen cargas', '45678901/000104'),
('hive transportes', '56789012/000105');

insert into endereco (logradouro, numero, bairro, cep, id_cidade, id_transportadora) values
('rua alfa', '100', 'centro', '12345-000', 1, 1),
('rua beta', '200', 'jardins', '23456-111', 2, 2),
('rua gama', '300', 'industrial', '34567-222', 3, 3),
('rua delta', '400', 'comercial', '45678-333', 4, 4),
('rua épsilon', '500', 'residencial', '56789-444', 5, 5);

insert into telefone (ddd, numero, id_transportadora) values
(11, '998877665', 1),
(21, '987654321', 2),
(31, '976543210', 3),
(41, '965432109', 4),
(51, '954321098', 5);

insert into nota_fiscal (
    numero_nf, chave_acesso, data_emissao, valor_total, valor_icms,
    base_icms, valor_pis, valor_cofins, id_pedido, id_parceiro, id_endereco, id_transportadora
)
select
    'nf' || g.i, 'chave-acesso-' || g.i, current_date - (g.i % 5),
    100 + g.i * 10, 10 + g.i, 80 + g.i * 2,
    2 + g.i * 0.2, 3 + g.i * 0.3,
    (g.i % 5) + 1, (g.i % 5) + 1, (g.i % 5) + 1, (g.i % 5) + 1
from generate_series(1, 25) as g(i);