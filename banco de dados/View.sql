create table usuario(
	id_usuario serial primary key,
	nome varchar(200),
	email varchar(200) not null,
	observacao varchar(200) not null,
	idnativo bit
);

create table parceiro (
	id_parceiro serial primary key,
	documento int,
	nome varchar(200),
	nomefantasia varchar(200) not null,
	observacao varchar(200) not null,
	idnativo bit
);

create table telefone(
	id_telefone serial primary key,
	numero int,
	id_usuario int references usuario(id_usuario) not null,
	id_parceiro int references parceiro(id_parceiro) not null,
	idnativo bit
);

create table pais (
	id_pais serial primary key,
	nome varchar(200),
	sigla varchar(200)
);

create table estado (
	id_estado serial primary key,
	nome varchar(200),
	sigla varchar(200),
	id_pais int references pais(id_pais)
);

create table cidade (
	id_cidade serial primary key,
	nome varchar(200),
	inscricaoestadual int,
	id_estado int references estado(id_estado)
);

create table endereco (
	id_endereco serial primary key,
	logradouro varchar(200),
	numero int,
	cep int,
	complemento varchar(200) not null,
	id_usuario int references usuario(id_usuario) not null,
	id_parceiro int references parceiro(id_parceiro) not null,
	id_cidade int references cidade(id_cidade) not null,
	idnativo bit
);

create table tabelapreco (
	id_tabelapreco serial primary key,
	descricao varchar(200),
	descontomaximo bigint not null,
	codigo int,
	iniciovigencia date,
	fimvigencia date,
	idnativo bit
);

create table produto (
	id_produto serial primary key,
	codigo int,
	descricao varchar(200),
	observacao varchar(200) not null,
	peso bigint

);

create table tabelaprecoproduto (
	id_tabelaprecoproduto serial primary key,
	id_tabelapreco int references tabelapreco(id_tabelapreco),
	id_produto int references produto(id_produto),
	preco bigint
);

create table condicaopagamento (
	id_condicaopagamento serial primary key,
	descricao varchar(200),
	codigo int,
	observacao varchar(200) not null
);

create table pedido (
	id_pedido serial primary key,
	numero int,
	valortotal bigint,
	quantidadeprodutos bigint,
	obervacao varchar(200) not null,
	id_tabelapreco int references tabelapreco(id_tabelapreco),
	id_condicaopagamento int references condicaopagamento(id_condicaopagamento),
	id_parceiro int references parceiro(id_parceiro),
	id_usuario int references usuario(id_usuario),
	data time
);

create table pedidoproduto (
	id_pedidoproduto serial primary key,
	id_pedido int references pedido(id_pedido),
	id_produto int references produto(id_produto),
	valor bigint,
	quantidade bigint
);

insert into pais (nome, sigla) values
('Brasil', 'BR');

insert into estado (nome, sigla, id_pais) values
('São Paulo', 'SP', 1),
('Rio de Janeiro', 'RJ', 1),
('Minas Gerais', 'MG', 1);

insert into cidade (nome, inscricaoestadual, id_estado) values
('São Paulo', 123456, 1),
('Campinas', 654321, 1),
('Santos', 112233, 1),
('Rio de Janeiro', 445566, 2),
('Niterói', 778899, 2),
('Petrópolis', 998877, 2),
('Belo Horizonte', 223344, 3),
('Uberlândia', 556677, 3),
('Juiz de Fora', 667788, 3),
('Ouro Preto', 334455, 3);

insert into usuario (nome, email, observacao, idnativo) values
('João Silva', 'joao@email.com', 'Usuário ativo', B'1'),
('Maria Souza', 'maria@email.com', 'Usuária VIP', B'1'),
('Pedro Lima', 'pedro@email.com', 'Comprador frequente', B'1'),
('Ana Costa', 'ana@email.com', 'Primeiro acesso', B'1'),
('Lucas Pereira', 'lucas@email.com', 'Cliente interno', B'1');

insert into parceiro (documento, nome, nomefantasia, observacao, idnativo) values
(111111111, 'Empresa Alpha Ltda', 'Alpha', 'Cliente ativo', B'1'),
(222222222, 'Comercial Beta SA', 'Beta', 'Cliente recorrente', B'1'),
(333333333, 'Mercado Gama ME', 'Gama', 'Cliente antigo', B'1'),
(444444444, 'Serviços Delta EIRELI', 'Delta', 'Cliente novo', B'1'),
(555555555, 'Tecnologia Épsilon Ltda', 'Épsilon', 'Cliente estratégico', B'1');

insert into endereco (logradouro, numero, cep, complemento, id_usuario, id_parceiro, id_cidade, idnativo) values
('Rua A', 100, 12345000, 'Apto 1', 1, 1, 1, B'1'),
('Rua B', 200, 22345000, 'Casa', 2, 2, 2, B'1'),
('Av C', 300, 32345000, 'Bloco 3', 3, 3, 3, B'1'),
('Travessa D', 400, 42345000, 'Fundos', 4, 4, 4, B'1'),
('Rua E', 500, 52345000, 'Loja 5', 5, 4, 5, B'1'),
('Av F', 600, 62345000, 'Galpão', 5, 1, 6, B'1'),
('Rua G', 700, 72345000, 'Sala 7', 6, 2, 7, B'1'),
('Rua H', 800, 82345000, 'Sobreloja', 7, 3, 8, B'1'),
('Av I', 900, 92345000, 'Lote 9', 8, 4, 9, B'1'),
('Rua J', 1000, 102345000, 'Conjunto 10', 9, 5, 10, B'1');

insert into telefone (numero, id_usuario, id_parceiro, idnativo) values
(11999990001, 1, null, B'1'),
(11999990002, 2, null, B'1'),
(11999990003, 3, null, B'1'),
(11999990004, 4, null, B'1'),
(11999990005, 5, null, B'1'),
(21988880001, null, 1, B'1'),
(21988880002, null, 2, B'1'),
(21988880003, null, 3, B'1'),
(31977770001, null, 4, B'1'),
(31977770002, null, 5, B'1');

insert into tabelapreco (descricao, descontomaximo, codigo, iniciovigencia, fimvigencia, idnativo) values
('Tabela Varejo', 10.0, 101, '2025-01-01', '2025-12-31', B'1'),
('Tabela Atacado', 15.0, 102, '2025-01-01', '2025-12-31', B'1'),
('Tabela Promocional', 20.0, 103, '2025-01-01', '2025-06-30', B'1');

insert into condicaopagamento (descricao, codigo, observacao) values
('À vista', 201, 'Pagamento no ato'),
('Cartão 3x', 202, 'Parcelado em 3 vezes'),
('Boleto 30 dias', 203, 'Vencimento em 30 dias');

insert into produto (codigo, descricao, observacao, peso) values
(1001, 'Arroz 5kg', 'Produto alimentício', 5.0),
(1002, 'Feijão 1kg', 'Produto alimentício', 1.0),
(1003, 'Macarrão 500g', 'Produto alimentício', 0.5),
(1004, 'Óleo 900ml', 'Produto alimentício', 0.9),
(1005, 'Açúcar 1kg', 'Produto alimentício', 1.0),
(1006, 'Sal 1kg', 'Produto alimentício', 1.0),
(1007, 'Café 500g', 'Produto alimentício', 0.5),
(1008, 'Leite 1L', 'Produto alimentício', 1.0),
(1009, 'Farinha 1kg', 'Produto alimentício', 1.0),
(1010, 'Biscoito 200g', 'Produto alimentício', 0.2),
(1011, 'Refrigerante 2L', 'Produto alimentício', 2.0),
(1012, 'Suco 1L', 'Produto alimentício', 1.0),
(1013, 'Detergente 500ml', 'Produto limpeza', 0.5),
(1014, 'Sabão em pó 1kg', 'Produto limpeza', 1.0),
(1015, 'Desinfetante 2L', 'Produto limpeza', 2.0);

insert into pedido (numero, valortotal, quantidadeprodutos, obervacao, id_tabelapreco, id_condicaopagamento, id_parceiro, id_usuario, data) values
(1, 150.0, 10, 'Primeiro pedido', 1, 1, 1, 1, '10:00'),
(2, 200.0, 12, 'Pedido urgente', 2, 2, 2, 2, '11:00'),
(3, 50.0, 5, 'Pequeno pedido', 3, 3, 3, 3, '12:00'),
(4, 300.0, 20, 'Estoque loja', 1, 1, 4, 4, '13:00'),
(5, 120.0, 8, 'Reposição', 2, 2, 5, 5, '14:00'),
(6, 180.0, 15, 'Compra mensal', 1, 3, 1, 2, '15:00'),
(7, 220.0, 18, 'Atacado', 2, 1, 2, 3, '16:00'),
(8, 75.0, 6, 'Pequena compra', 3, 2, 3, 4, '17:00'),
(9, 400.0, 25, 'Grande compra', 1, 3, 4, 5, '18:00'),
(10, 90.0, 7, 'Compra avulsa', 2, 1, 5, 1, '19:00');

insert into pedidoproduto (id_pedido, id_produto, valor, quantidade) values
(1, 1001, 30.0, 2),
(1, 1002, 20.0, 2),
(2, 1003, 50.0, 5),
(2, 1004, 150.0, 7),
(3, 1005, 25.0, 3),
(3, 1006, 25.0, 2),
(4, 1007, 60.0, 4),
(4, 1008, 240.0, 16),
(5, 1009, 80.0, 8),
(6, 1010, 180.0, 15),
(7, 1011, 220.0, 18),
(8, 1012, 75.0, 6),
(9, 1013, 200.0, 10),
(9, 1014, 200.0, 15),
(10, 1015, 90.0, 7);
