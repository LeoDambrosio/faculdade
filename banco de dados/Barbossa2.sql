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

select * from estado;
INSERT INTO cidade (nome, inscricaoEstadual, idestado) 
 VALUES ('Curitiba', 100001, 2),
 ('Ponta Grossa', 100004, 2),
 ('Cascavel', 100005, 2),
 ('Foz do Iguaçu', 100007, 2),
 ('Toledo', 100011, 2);
 
INSERT INTO parceiro (documento, nome, nomeFantasia, observacao, idnativo)
 VALUES (1, 'NovaTech Solutions', 'NovaTech Solutions', 'Cliente somente a vista', true),
 (2, 'GlobalSoft Ltda', 'GlobalSoft Ltda', 'Mesmo que Maria Lourdes', true),
 (3, 'EcoLogix Ambiental', 'EcoLogix Ambiental', 'entregar para Paulo', true),
 (4, 'Innovatech Serviços', 'Innovatech Serviços', '', true),
 (5, 'Alpha Consulting', 'Alpha Consulting', '', true),
 (6, 'Lumina Design', 'Lumina Design', '', false);
 
INSERT INTO usuario (nome, email, observacao, idnativo) 
 VALUES ('Ana Silva', 'ana.silva@email.com', '', true),
 ('Bruno Souza', 'bruno.souza@email.com', '', true),
 ('Carla Mendes', 'carla.mendes@email.com', '', false),
 ('Diego Lima', 'diego.lima@email.com', '', true),
 ('Elisa Torres', 'elisa.torres@email.com', '', true),
 ('Yasmin Carvalho', 'yasmin.carvalho@email.com', '', true);

INSERT INTO telefone (numero, idusuario, idparceiro, idnativo) 
 VALUES (999111111, 1, null, true),
 (999222222, 2, null, true),
 (999333333, 3, null, false),
 (997555555, null, 1, false),
 (997666666, null, 2, true),
 (997777777, null, 3, true);


INSERT INTO endereco (logradouro, numero, cep, complemento, idparceiro, idusuario, idcidade, idnativo) 
 VALUES ('Rua Paraná', 247, 35591325, 'Ao lado da Igreja', 1, NULL, 1, true),
 ('Av. Getulio Vargas', 386, 82004956, 'Loja 2', 2, NULL, 2, true),
 ('Rua Mickey Mouse', 89, 55644496, 'Próx. Museu', 3, NULL, 3, true),
 ('Rua do Alfeneiros', 777, 56691456, 'Bairro Harry Potter', NULL, 1, 4, true),
 ('Rua Amarela', 909, 51431598, 'Ao lado da Floresta', NULL, 2, 5, true);


INSERT INTO tabelaPreco (descricao, descontoMaximo, codigo, inicioVigencia, fimVigencia, idnativo) 
 VALUES (1, 13.19, 1001, '2024-01-01', '2024-12-31', true),
 (2, 4.65, 1002, '2024-01-01', '2024-12-31', true),
 (3, 8.06, 1003, '2024-01-01', '2024-12-31', true),
 (4, 3.89, 1004, '2024-01-01', '2024-12-31', true),
 (5, 8.9, 1005, '2024-01-01', '2024-12-31', true);

INSERT INTO produto (codigo, descricao, observacao, peso) 
 VALUES (501, 'Mouse', 'Lenovo', 4.03),
 (502, 'Teclado', 'Lenovo', 4.2),
 (503, 'Monitor', 'Acer', 2.74),
 (504, 'Caixa de som', 'Logitech', 3.4),
 (505, 'Impressora', 'HP', 2.95);

INSERT INTO precoProduto (idtabelaPreco, idproduto, preco) 
 VALUES (1, 1, 13.12),
 (2, 2, 38.37),
 (3, 3, 345.50),
 (4, 4, 39.90),
 (5, 5, 150.50);

INSERT INTO condicaoPagamento (descricao, codigo, observacao) 
 VALUES ('A vista', 1, 'Não vendemos fiado. Não insista!'),
 ('Crédito', 2, 'Não aceitamos cheques'),
 ('Entrada + 30/60', 3, 'Não fazemos boleto'),
 ('Entrada + 30/60/90', 4, 'Cartão de crédito'),
 ('30/60/90', 5, 'Somente cartão');

INSERT INTO pedido (numero, valorTotal, quantidadeProdutos, observacao, idtabelaPreco, idcondicaoPagamento, idparceiro, idusuario, data) 
 VALUES(1001, 150.75, 3, 'Entrega rápida', 1, 1, 1, 1, '08:30:00'),
 (1002, 300.50, 5, 'Cliente exigente', 2, 2, 2, 2, '09:15:00'),
 (1003, 50.00, 1, NULL, 3, 3, 3, 3, '10:00:00'),
 (1004, 450.99, 7, 'Urgente', 4, 4, 4, 4, '11:45:00'),
 (1005, 120.00, 2, NULL, 5, 5, 5, 5, '13:00:00'),
 (1006, 89.99, 1, 'Retirar no balcão', 1, 2, 6, 1, '14:30:00'),
 (1007, 230.49, 4, 'Verificar estoque', 2, 3, 1, 2, '15:10:00'),
 (1008, 340.90, 6, NULL, 3, 4, 2, 3, '16:45:00'),
 (1009, 410.10, 8, 'Pagamento adiantado', 4, 5, 3, 4, '17:20:00'),
 (1010, 75.25, 1, NULL, 5, 1, 4, 5, '08:00:00'),
 (1011, 520.00, 9, 'Cobrar frete', 1, 2, 5, 6, '09:30:00'),
 (1012, 180.60, 3, NULL, 2, 3, 6, 1, '10:30:00'),
 (1013, 250.40, 4, 'Aguardando aprovação', 3, 4, 1, 2, '11:30:00'),
 (1014, 90.00, 1, NULL, 4, 5, 2, 3, '12:00:00'),
 (1015, 600.50, 10, 'Entregar sábado', 5, 1, 3, 4, '13:00:00'),
 (1016, 320.90, 5, NULL, 1, 2, 4, 5, '14:00:00'),
 (1017, 115.75, 2, 'Nova negociação', 2, 3, 5, 6, '15:00:00'),
 (1018, 245.90, 3, NULL, 3, 4, 6, 1, '16:00:00'),
 (1019, 310.40, 6, 'Solicitar NF', 4, 5, 1, 2, '17:00:00'),
 (1020, 90.00, 1, NULL, 5, 1, 2, 3, '18:00:00'),
 (1021, 510.10, 8, 'Cliente novo', 1, 2, 3, 4, '08:10:00'),
 (1022, 200.20, 4, NULL, 2, 3, 4, 5, '09:20:00'),
 (1023, 130.35, 2, 'Solicitar avaliação', 3, 4, 5, 6, '10:40:00'),
 (1024, 470.00, 7, NULL, 4, 5, 6, 1, '11:50:00'),
 (1025, 150.00, 3, 'Entregar terça-feira', 5, 1, 1, 2, '13:10:00');

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