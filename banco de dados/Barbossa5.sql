create table pais (
    id_pais serial primary key,
    nome varchar(100),
    sigla varchar(10)
);

create table estado (
    id_estado serial primary key,
    nome varchar(100),
    sigla varchar(10),
    id_pais int,
    constraint fk_estado_pais foreign key (id_pais) references pais(id_pais)
);

create table cidade (
    id_cidade serial primary key,
    nome varchar(100),
    inscricaoestadual int,
    id_estado int,
    constraint fk_cidade_estado foreign key (id_estado) references estado(id_estado)
);
drop table cidade;
create table usuario (
    id_usuario serial primary key,
    nome varchar(255),
    email varchar(255),
    observacao varchar(255),
    idnativo bit
);

create table parceiro (
    id_parceiro serial primary key,
    documento int,
    nome varchar(255),
    nomefantasia varchar(255),
    observacao varchar(255),
    idnativo bit
);

create table endereco (
    id_endereco serial primary key,
    logradouro varchar(255),
    numero int,
    cep int,
    complemento varchar(255),
    id_usuario int,
    id_parceiro int,
    id_cidade int,
    idnativo bit,
    constraint fk_endereco_usuario foreign key (id_usuario) references usuario(id_usuario),
    constraint fk_endereco_parceiro foreign key (id_parceiro) references parceiro(id_parceiro),
    constraint fk_endereco_cidade foreign key (id_cidade) references cidade(id_cidade)
);

create table telefone (
    id_telefone serial primary key,
    numero int,
    id_usuario int,
    id_parceiro int,
    idnativo bit,
    constraint fk_telefone_usuario foreign key (id_usuario) references usuario(id_usuario),
    constraint fk_telefone_parceiro foreign key (id_parceiro) references parceiro(id_parceiro)
);

create table produto (
    id_produto serial primary key,
    codigo int,
    descricao varchar(255),
    observacao varchar(255),
    peso real
);

create table condicaopagamento (
    id_condicaopagamento serial primary key,
    descricao varchar(255),
    codigo int,
    observacao varchar(255)
);

alter table condicaopagamento
alter column codigo type varchar(200);

create table tabelapreco (
    id_tabelapreco serial primary key,
    descricao varchar(200),
    descontomaximo reaL,
    codigo int,
    iniciovigencia date,
    fimvigencia date,
    idnativo bit
);

create table tabelaprecoproduto (
    id_tabelaprecoproduto serial primary key,
    id_tabelapreco int,
    id_produto int,
    preco real,
    constraint fk_tpp_tabela foreign key (id_tabelapreco) references tabelapreco(id_tabelapreco),
    constraint fk_tpp_produto foreign key (id_produto) references produto(id_produto)
);

create table pedido (
    id_pedido serial primary key,
    numero int,
    valortotal real,
    quantidadeprodutos real,
    observacao varchar(255),
    id_tabelapreco int,
    id_condicaopagamento int,
    id_parceiro int,
    id_usuario int,
    data timestamp,
    constraint fk_pedido_tabelapreco foreign key (id_tabelapreco) references tabelapreco(id_tabelapreco),
    constraint fk_pedido_pagamento foreign key (id_condicaopagamento) references condicaopagamento(id_condicaopagamento),
    constraint fk_pedido_parceiro foreign key (id_parceiro) references parceiro(id_parceiro),
    constraint fk_pedido_usuario foreign key (id_usuario) references usuario(id_usuario)
);

create table pedidoproduto (
    id_pedidoproduto serial primary key,
    id_pedido int,
    id_produto int,
    valor real,
    quantidade real,
    constraint fk_pedidoproduto_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_pedidoproduto_produto foreign key (id_produto) references produto(id_produto)
);

INSERT INTO pais (id_pais, nome, sigla) VALUES
(1, 'Argentina', 'AR'),
(2, 'Estados Unidos', 'US'),
(3, 'Canadá', 'CA'),
(4, 'México', 'MX'),
(5, 'Alemanha', 'DE'),
(6, 'França', 'FR'),
(7, 'Reino Unido', 'GB'),
(8, 'Itália', 'IT'),
(9, 'Espanha', 'ES'),
(10, 'Portugal', 'PT'),
(11, 'Japão', 'JP'),
(12, 'China', 'CN'),
(13, 'Coreia do Sul', 'KR'),
(14, 'Índia', 'IN'),
(15, 'Austrália', 'AU'),
(16, 'Nova Zelândia', 'NZ'),
(17, 'África do Sul', 'ZA'),
(18, 'Egito', 'EG'),
(19, 'Rússia', 'RU'),
(20, 'Suécia', 'SE'),
(21, 'Noruega', 'NO'),
(22, 'Finlândia', 'FI'),
(23, 'Holanda', 'NL'),
(24, 'Suíça', 'CH'),
(25, 'Brasil', 'BR');

INSERT INTO estado (id_estado, nome, sigla, id_pais) VALUES
(1, 'Acre', 'AC', 25),
(2, 'Alagoas', 'AL', 25),
(3, 'Amapá', 'AP', 25),
(4, 'Amazonas', 'AM', 25),
(5, 'Bahia', 'BA', 25),
(6, 'Ceará', 'CE', 25),
(7, 'Distrito Federal', 'DF', 25),
(8, 'Espírito Santo', 'ES', 25),
(9, 'Goiás', 'GO', 25),
(10, 'Maranhão', 'MA', 25),
(11, 'Mato Grosso', 'MT', 25),
(12, 'Mato Grosso do Sul', 'MS', 25),
(13, 'Minas Gerais', 'MG', 25),
(14, 'Pará', 'PA', 25),
(15, 'Paraíba', 'PB', 25),
(16, 'Paraná', 'PR', 25),
(17, 'Pernambuco', 'PE', 25),
(18, 'Piauí', 'PI', 25),
(19, 'Rio de Janeiro', 'RJ', 25),
(20, 'Rio Grande do Norte', 'RN', 25),
(21, 'Rio Grande do Sul', 'RS', 25),
(22, 'Rondônia', 'RO', 25),
(23, 'Roraima', 'RR', 25),
(24, 'Santa Catarina', 'SC', 25),
(25, 'Sergipe', 'SE', 25);

INSERT INTO cidade (id_cidade, nome, inscricaoestadual, id_estado) VALUES
(1, 'Londrina', '01', 16),
(2, 'Maringá', '02', 16),
(3, 'Ponta Grossa', '03', 16),
(4, 'Cascavel', '04', 16),
(5, 'Foz do Iguaçu', '05', 16),
(6, 'Guarapuava', '06', 16),
(7, 'Paranaguá', '07', 16),
(8, 'São José dos Pinhais', '08', 16),
(9, 'Colombo', '09', 16),
(10, 'Araucária', '10', 16),
(11, 'Apucarana', '11', 16),
(12, 'Toledo', '12', 16),
(13, 'Campo Largo', '13', 16),
(14, 'Cianorte', '14', 16),
(15, 'Palmas', '15', 16),
(16, 'Almirante Tamandaré', '16', 16),
(17, 'Araruna', '17', 16),
(18, 'Pato Branco', '18', 16),
(19, 'União da Vitória', '19', 16),
(20, 'Telêmaco Borba', '20', 16),
(21, 'Jacarezinho', '21', 16),
(22, 'Irati', '22', 16),
(23, 'São Mateus do Sul', '23', 16),
(24, 'Quatro Barras', '24', 16),
(25, 'Curitiba', '25', 16);

INSERT INTO usuario (id_usuario, nome, email, observacao, idnativo) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', 'Usuária ativa', B'1'),
(2, 'Bruno Souza', 'bruno.souza@email.com', 'Usuário novo', B'1'),
(3, 'Carlos Lima', 'carlos.lima@email.com', 'Inativo', B'0'),
(4, 'Daniela Alves', 'daniela.alves@email.com', 'Administrador', B'1'),
(5, 'Eduardo Mendes', 'eduardo.mendes@email.com', 'Usuário padrão', B'1'),
(6, 'Fernanda Costa', 'fernanda.costa@email.com', 'Usuária ativa', B'1'),
(7, 'Gabriel Rocha', 'gabriel.rocha@email.com', 'Usuário premium', B'1'),
(8, 'Helena Martins', 'helena.martins@email.com', 'Usuária inativa', B'0'),
(9, 'Igor Ferreira', 'igor.ferreira@email.com', 'Usuário novo', B'1'),
(10, 'Juliana Pereira', 'juliana.pereira@email.com', 'Usuária ativa', B'1'),
(11, 'Kleber Santos', 'kleber.santos@email.com', 'Administrador', B'1'),
(12, 'Larissa Almeida', 'larissa.almeida@email.com', 'Usuária padrão', B'1'),
(13, 'Marcelo Oliveira', 'marcelo.oliveira@email.com', 'Usuário ativo', B'1'),
(14, 'Natália Dias', 'natalia.dias@email.com', 'Usuária premium', B'1'),
(15, 'Otávio Carvalho', 'otavio.carvalho@email.com', 'Usuário novo', B'1'),
(16, 'Patrícia Ribeiro', 'patricia.ribeiro@email.com', 'Usuária ativa', B'1'),
(17, 'Quésia Nunes', 'quesia.nunes@email.com', 'Usuária inativa', B'0'),
(18, 'Rafael Barbosa', 'rafael.barbosa@email.com', 'Usuário padrão', B'1'),
(19, 'Sabrina Gonçalves', 'sabrina.goncalves@email.com', 'Usuária ativa', B'1'),
(20, 'Tiago Pinto', 'tiago.pinto@email.com', 'Usuário novo', B'1'),
(21, 'Úrsula Fernandes', 'ursula.fernandes@email.com', 'Usuária premium', B'1'),
(22, 'Vítor Santos', 'vitor.santos@email.com', 'Usuário ativo', B'1'),
(23, 'Wagner Lima', 'wagner.lima@email.com', 'Administrador', B'1'),
(24, 'Xênia Castro', 'xenia.castro@email.com', 'Usuária padrão', B'1'),
(25, 'Yuri Moreira', 'yuri.moreira@email.com', 'Usuário novo', B'1');

INSERT INTO parceiro (id_parceiro, documento, nome, nomefantasia, observacao, idnativo) VALUES
(1, '12345678000190', 'Empresa Alpha LTDA', 'Alpha', 'Parceiro estratégico', B'1'),
(2, '98765432000110', 'Beta Comércio SA', 'Beta', 'Fornecedor principal', B'1'),
(3, '23456789000101', 'Gama Serviços ME', 'Gama Serviços', 'Parceiro de logística', B'0'),
(4, '34567890000112', 'Delta Tecnologia Ltda', 'Delta Tech', 'Desenvolvedor de software', B'1'),
(5, '45678901000123', 'Epsilon Distribuidora', 'Epsilon', 'Distribuidor oficial', B'0'),
(6, '56789012000134', 'Zeta Importações', 'Zeta Import', 'Importador exclusivo', B'1'),
(7, '67890123000145', 'Eta Consultoria', 'Eta Consult', 'Consultoria financeira', B'0'),
(8, '78901234000156', 'Teta Construções', 'Teta Construções', 'Construtora parceira', B'1'),
(9, '89012345000167', 'Iota Marketing', 'Iota MKT', 'Agência de marketing', B'0'),
(10, '90123456000178', 'Kappa Transportes', 'Kappa Trans', 'Transportadora', B'1'),
(11, '12345670000189', 'Lambda Engenharia', 'Lambda Eng', 'Engenharia civil', B'0'),
(12, '12345678000111', 'Mu Indústrias', 'Mu Indústria', 'Fornecedor de peças', B'1'),
(13, '23456789000122', 'Nu Saúde', 'Nu Saúde', 'Clínica parceira', B'0'),
(14, '34567890000133', 'Xi Alimentação', 'Xi Foods', 'Fornecedor de alimentos', B'1'),
(15, '45678901000144', 'Omicron Educação', 'Omicron Edu', 'Parceiro educacional', B'0'),
(16, '56789012000155', 'Pi Serviços Gerais', 'Pi Serviços', 'Limpeza e conservação', B'1'),
(17, '67890123000166', 'Rho Segurança', 'Rho Seg', 'Segurança patrimonial', B'0'),
(18, '78901234000177', 'Sigma Telecom', 'Sigma Tel', 'Provedor de internet', B'1'),
(19, '89012345000188', 'Tau Eventos', 'Tau Eventos', 'Organização de eventos', B'0'),
(20, '90123456000199', 'Upsilon Transporte', 'Upsilon Trans', 'Transporte urbano', B'1'),
(21, '12345670000100', 'Phi Automóveis', 'Phi Auto', 'Revenda de veículos', B'0'),
(22, '12345678000121', 'Chi Alimentação', 'Chi Foods', 'Distribuição de alimentos', B'1'),
(23, '23456789000132', 'Psi Tecnologia', 'Psi Tech', 'Desenvolvimento de apps', B'0'),
(24, '34567890000143', 'Omega Serviços', 'Omega Serv', 'Serviços gerais', B'1'),
(25, '45678901000154', 'Alpha Beta Ltda', 'AlphaBeta', 'Parceiro comercial', B'0');

ALTER TABLE parceiro
ALTER COLUMN documento TYPE varchar(200);

INSERT INTO endereco (id_endereco, logradouro, numero, cep, complemento, id_usuario, id_parceiro, id_cidade, idnativo) VALUES
(1, 'Rua das Flores', 123, 80000000, 'Casa', 1, NULL, 1, B'1'),
(2, 'Avenida Brasil', 456, 80010001, 'Apto 101', 2, NULL, 2, B'1'),
(3, 'Rua XV de Novembro', 789, 80020002, 'Sala 2', 3, NULL, 3, B'1'),
(4, 'Travessa da Paz', 101, 80030003, 'Fundos', NULL, 1, 4, B'0'),
(5, 'Alameda das Acácias', 202, 80040004, 'Bloco B', 4, NULL, 5, B'1'),
(6, 'Rua do Comércio', 303, 80050005, 'Loja 5', NULL, 2, 6, B'0'),
(7, 'Avenida Paraná', 404, 80060006, 'Conjunto 7', 5, NULL, 7, B'1'),
(8, 'Rua São João', 505, 80070007, 'Sobreloja', NULL, 3, 8, B'0'),
(9, 'Avenida Getúlio Vargas', 606, 80080008, 'Andar 3', 6, NULL, 9, B'1'),
(10, 'Rua dos Andradas', 707, 80090009, 'Galpão', NULL, 4, 10, B'0'),
(11, 'Rua Marechal Floriano', 808, 80100010, 'Casa 2', 7, NULL, 11, B'1'),
(12, 'Rua João Pessoa', 909, 80110011, 'Apto 302', NULL, 5, 12, B'0'),
(13, 'Avenida Sete de Setembro', 111, 80120012, 'Sala 10', 8, NULL, 13, B'1'),
(14, 'Rua Barão do Rio Branco', 222, 80130013, 'Loja 1', NULL, 6, 14, B'0'),
(15, 'Travessa Oliveira', 333, 80140014, 'Fundos', 9, NULL, 15, B'1'),
(16, 'Rua Santa Catarina', 444, 80150015, 'Apto 201', NULL, 7, 16, B'0'),
(17, 'Avenida República', 555, 80160016, 'Conjunto 4', 10, NULL, 17, B'1'),
(18, 'Rua Fernando de Noronha', 666, 80170017, 'Sala 5', NULL, 8, 18, B'0'),
(19, 'Rua Castro Alves', 777, 80180018, 'Casa', 11, NULL, 19, B'1'),
(20, 'Rua Miguel Couto', 888, 80190019, 'Galpão 3', NULL, 9, 20, B'0'),
(21, 'Rua Dom Pedro II', 999, 80200020, 'Apto 501', 12, NULL, 21, B'1'),
(22, 'Avenida das Américas', 112, 80210021, 'Sala 12', NULL, 10, 22, B'0'),
(23, 'Rua Vitória Régia', 223, 80220022, 'Casa 3', 13, NULL, 23, B'1'),
(24, 'Rua Monte Castelo', 334, 80230023, 'Apto 102', NULL, 11, 24, B'0'),
(25, 'Rua Primavera', 445, 80240024, 'Fundos', 14, NULL, 25, B'1');

INSERT INTO telefone (id_telefone, numero, id_usuario, id_parceiro, idnativo) VALUES
(1, '41912345678', 1, NULL, B'1'),
(2, '41998765432', 2, NULL, B'1'),
(3, '41987654321', 3, NULL, B'1'),
(4, '41976543210', 4, NULL, B'1'),
(5, '41965432109', 5, NULL, B'1'),
(6, '41954321098', 6, NULL, B'1'),
(7, '41943210987', 7, NULL, B'1'),
(8, '41932109876', 8, NULL, B'1'),
(9, '41921098765', 9, NULL, B'1'),
(10, '41910987654', 10, NULL, B'1'),
(11, '41999999999', 11, NULL, B'1'),
(12, '41988888888', 12, NULL, B'1'),
(13, '41977777777', NULL, 1, B'0'),
(14, '41966666666', NULL, 2, B'0'),
(15, '41955555555', NULL, 3, B'0'),
(16, '41944444444', NULL, 4, B'0'),
(17, '41933333333', NULL, 5, B'0'),
(18, '41922222222', NULL, 6, B'0'),
(19, '41911111111', NULL, 7, B'0'),
(20, '41900000000', NULL, 8, B'0'),
(21, '41912121212', NULL, 9, B'0'),
(22, '41923232323', NULL, 10, B'0'),
(23, '41934343434', NULL, 11, B'0'),
(24, '41945454545', NULL, 12, B'0'),
(25, '41956565656', NULL, 13, B'0');

alter table telefone
alter column numero type varchar(200);

INSERT INTO produto (id_produto, codigo, descricao, observacao, peso) VALUES
(1, 1001, 'Camiseta Branca', 'Tamanho M', 0.2),
(2, 1002, 'Calça Jeans', 'Tamanho 40', 0.5),
(3, 1003, 'Tênis Esportivo', 'Cor preta', 0.7),
(4, 1004, 'Jaqueta de Couro', 'Modelo unissex', 1.2),
(5, 1005, 'Mochila Escolar', 'Capacidade 30L', 0.8),
(6, 1006, 'Fone de Ouvido', 'Bluetooth 5.0', 0.3),
(7, 1007, 'Mouse Gamer', 'RGB, 6 botões', 0.15),
(8, 1008, 'Teclado Mecânico', 'Switch azul', 1.1),
(9, 1009, 'Monitor LED 24"', 'Full HD', 3.5),
(10, 1010, 'Notebook 15"', '8GB RAM, SSD 256GB', 2.1),
(11, 1011, 'Smartphone X', '128GB, Dual Chip', 0.19),
(12, 1012, 'Copo Térmico', '500ml, inox', 0.25),
(13, 1013, 'Garrafa de Água', 'Plástico BPA Free', 0.18),
(14, 1014, 'Caderno Universitário', '100 folhas', 0.4),
(15, 1015, 'Caneta Esferográfica', 'Azul, ponta fina', 0.01),
(16, 1016, 'Lápis Preto', 'Grafite HB', 0.008),
(17, 1017, 'Borracha Escolar', 'Branca, macia', 0.02),
(18, 1018, 'Mochila Executiva', 'Com porta USB', 1.0),
(19, 1019, 'Relógio Digital', 'Resistente à água', 0.12),
(20, 1020, 'Caixa de Som Bluetooth', '10W, portátil', 0.6),
(21, 1021, 'Carregador Turbo', '20W, USB-C', 0.05),
(22, 1022, 'Cabo USB', '1 metro, tipo C', 0.03),
(23, 1023, 'Pendrive 64GB', 'USB 3.0', 0.015),
(24, 1024, 'HD Externo 1TB', 'Portátil, USB 3.1', 0.23),
(25, 1025, 'Webcam Full HD', 'Com microfone', 0.09);

INSERT INTO condicaopagamento (id_condicaopagamento, descricao, codigo, observacao) VALUES
(1, 'A vista no boleto', 'CP01', 'Pagamento deve ser confirmado após o processamento do boleto'),
(2, 'A vista no cartão', 'CP02', 'Pagamento imediato por cartão'),
(3, '2x sem juros', 'CP03', 'Parcelamento em 2 vezes sem juros'),
(4, '3x sem juros', 'CP04', 'Parcelamento em 3 vezes sem juros'),
(5, '4x sem juros', 'CP05', 'Parcelamento em 4 vezes sem juros'),
(6, '5x sem juros', 'CP06', 'Parcelamento em 5 vezes sem juros'),
(7, '6x sem juros', 'CP07', 'Parcelamento em 6 vezes sem juros'),
(8, '7x com juros', 'CP08', 'Parcelamento em 7 vezes com juros'),
(9, '8x com juros', 'CP09', 'Parcelamento em 8 vezes com juros'),
(10, '9x com juros', 'CP10', 'Parcelamento em 9 vezes com juros'),
(11, '10x com juros', 'CP11', 'Parcelamento em 10 vezes com juros'),
(12, '30 dias', 'CP12', 'Pagamento integral em 30 dias após a emissão'),
(13, '30/60 dias', 'CP13', 'Pagamento em 2 parcelas após 30 e 60 dias'),
(14, '30/60/90 dias', 'CP14', 'Pagamento em 3 parcelas após 30, 60 e 90 dias'),
(15, 'Cheque pré-datado', 'CP15', 'Pagamento via cheque com data futura'),
(16, 'Pix a vista', 'CP16', 'Pagamento instantâneo via Pix'),
(17, 'Depósito bancário', 'CP17', 'Pagamento via depósito direto na conta'),
(18, 'Cartão de débito', 'CP18', 'Pagamento no cartão de débito com confirmação imediata'),
(19, 'Crédito 14 dias', 'CP19', 'Crédito concedido com prazo de 14 dias'),
(20, 'Crédito 30 dias', 'CP20', 'Crédito concedido com prazo de 30 dias'),
(21, 'Crédito 45 dias', 'CP21', 'Crédito concedido com prazo de 45 dias'),
(22, 'Crédito 60 dias', 'CP22', 'Crédito concedido com prazo de 60 dias'),
(23, 'Crédito 90 dias', 'CP23', 'Crédito concedido com prazo de 90 dias'),
(24, 'Parcelado no boleto', 'CP24', 'Parcelamento com boletos gerados para cada parcela'),
(25, 'Parcelado com entrada', 'CP25', 'Parcelamento com pagamento inicial');

INSERT INTO tabelapreco (id_tabelapreco, descricao, descontomaximo, codigo, iniciovigencia, fimvigencia, idnativo) VALUES
(1, 'Tabela Padrão', 5, '001', '2025-01-01', '2025-12-31', B'1'),
(2, 'Promoção Verão', 10, '002', '2025-01-15', '2025-03-31', B'0'),
(3, 'Liquidação Inverno', 15, '003', '2025-06-01', '2025-08-31', B'0'),
(4, 'Feira de Negócios', 12, '004', '2025-05-10', '2025-05-20', B'0'),
(5, 'Tabela VIP', 8, '005', '2025-01-01', '2025-12-31', B'1'),
(6, 'Desconto Atacado', 20, '006', '2025-01-01', '2025-12-31', B'1'),
(7, 'Black Friday', 25, '007', '2025-11-25', '2025-11-30', B'0'),
(8, 'Cyber Monday', 22, '008', '2025-12-01', '2025-12-01', B'0'),
(9, 'Natal Premiado', 18, '009', '2025-12-10', '2025-12-25', B'0'),
(10, 'Ano Novo', 10, '010', '2025-12-26', '2026-01-05', B'0'),
(11, 'Clientes Ouro', 7, '011', '2025-01-01', '2025-12-31', B'1'),
(12, 'Clientes Prata', 5, '012', '2025-01-01', '2025-12-31', B'1'),
(13, 'Clientes Bronze', 3, '013', '2025-01-01', '2025-12-31', B'1'),
(14, 'Tabela Regional Sul', 6, '014', '2025-02-01', '2025-08-31', B'0'),
(15, 'Tabela Regional Norte', 6, '015', '2025-02-01', '2025-08-31', B'0'),
(16, 'Tabela Regional Leste', 6, '016', '2025-02-01', '2025-08-31', B'0'),
(17, 'Tabela Regional Oeste', 6, '017', '2025-02-01', '2025-08-31', B'0'),
(18, 'Tabela Escolar', 9, '018', '2025-01-05', '2025-03-15', B'0'),
(19, 'Tabela Universitária', 11, '019', '2025-02-01', '2025-06-30', B'0'),
(20, 'Feirão de Fábrica', 17, '020', '2025-07-01', '2025-07-15', B'0'),
(21, 'Revenda Parceira', 13, '021', '2025-01-01', '2025-12-31', B'1'),
(22, 'Tabela Varejo', 5, '022', '2025-01-01', '2025-12-31', B'1'),
(23, 'Tabela E-commerce', 7, '023', '2025-01-01', '2025-12-31', B'1'),
(24, 'Tabela Corporativa', 10, '024', '2025-01-01', '2025-12-31', B'1'),
(25, 'Tabela Especial', 15, '025', '2025-03-01', '2025-09-30', B'0');
	
INSERT INTO tabelaprecoproduto (id_tabelaprecoproduto, id_tabelapreco, id_produto, preco) VALUES
(1, 1, 1, 19.90),
(2, 1, 2, 29.99),
(3, 1, 3, 39.50),
(4, 1, 4, 49.00),
(5, 1, 5, 59.99),
(6, 2, 1, 17.91),
(7, 2, 2, 26.99),
(8, 2, 3, 35.55),
(9, 2, 4, 44.10),
(10, 2, 5, 53.99),
(11, 3, 1, 16.92),
(12, 3, 2, 25.49),
(13, 3, 3, 33.58),
(14, 3, 4, 41.65),
(15, 3, 5, 50.99),
(16, 4, 6, 24.75),
(17, 4, 7, 34.20),
(18, 4, 8, 44.90),
(19, 4, 9, 54.10),
(20, 4, 10, 64.80),
(21, 5, 11, 15.00),
(22, 5, 12, 25.99),
(23, 5, 13, 35.40),
(24, 5, 14, 45.60),
(25, 5, 15, 55.55);

INSERT INTO pedido (id_pedido, numero, valortotal, quantidadeprodutos, observacao, id_tabelapreco, id_condicaopagamento, id_parceiro, id_usuario, data) VALUES
(1, '001', 199.90, 3, 'Entrega prevista para 3 dias', 1, 1, 1, 1, '2025-01-15 10:00:00'),
(2, '002', 349.50, 5, 'Cliente pediu embalagem para presente', 2, 3, 2, 2, '2025-02-20 14:30:00'),
(3, '003', 79.99, 1, 'Retirada na loja', 1, 2, 3, 3, '2025-03-05 09:15:00'),
(4, '004', 459.00, 7, 'Frete grátis aplicado', 3, 5, 4, 4, '2025-04-10 16:45:00'),
(5, '005', 120.00, 2, 'Urgente', 1, 16, 5, 5, '2025-05-15 11:20:00'),
(6, '006', 230.45, 4, 'Cliente novo', 2, 4, 6, 6, '2025-06-20 13:10:00'),
(7, '007', 315.80, 6, 'Repetição de pedido anterior', 3, 6, 7, 7, '2025-07-25 15:30:00'),
(8, '008', 99.90, 1, 'Enviar amostra junto', 1, 2, 8, 8, '2025-08-30 10:45:00'),
(9, '009', 150.00, 3, 'Data especial', 2, 3, 9, 9, '2025-09-05 12:00:00'),
(10, '010', 80.50, 2, 'Cupom aplicado', 1, 16, 10, 10, '2025-10-10 14:15:00'),
(11, '011', 210.00, 5, 'Sem observações', 3, 5, 11, 11, '2025-11-15 16:30:00'),
(12, '012', 395.25, 6, 'Entrega em horário comercial', 2, 4, 12, 12, '2025-12-20 09:45:00'),
(13, '013', 57.90, 1, 'Solicitou nota fiscal', 1, 1, 13, 13, '2025-01-25 11:00:00'),
(14, '014', 678.90, 9, 'Pedido corporativo', 3, 7, 14, 14, '2025-02-28 13:15:00'),
(15, '015', 45.00, 1, 'Pagamento via Pix', 1, 16, 15, 15, '2025-03-05 15:30:00'),
(16, '016', 135.75, 2, 'Cliente fidelidade', 2, 3, 16, 16, '2025-04-10 10:45:00'),
(17, '017', 220.00, 4, 'Devolver produto anterior', 3, 5, 17, 17, '2025-05-15 12:00:00'),
(18, '018', 89.99, 1, 'Agendar entrega', 1, 2, 18, 18, '2025-06-20 14:15:00'),
(19, '019', 312.30, 5, 'Conferir disponibilidade', 2, 4, 19, 19, '2025-07-25 16:30:00'),
(20, '020', 410.00, 6, 'Endereço alterado', 3, 6, 20, 20, '2025-08-30 09:45:00'),
(21, '021', 99.99, 2, 'Embalagem reciclável', 1, 16, 21, 21, '2025-09-05 11:00:00'),
(22, '022', 560.10, 7, 'Desconto concedido', 2, 4, 22, 22, '2025-10-10 13:15:00'),
(23, '023', 248.75, 3, 'Aguardando confirmação de estoque', 3, 5, 23, 23, '2025-11-15 15:30:00'),
(24, '024', 130.00, 2, 'Entregar no condomínio', 1, 3, 24, 24, '2025-12-20 10:45:00'),
(25, '025', 275.60, 4, 'Cliente frequente', 2, 4, 25, 25, '2025-01-25 12:00:00');

INSERT INTO pedidoproduto (id_pedidoproduto, id_pedido, id_produto, valor, quantidade) VALUES
(1, 1, 1, 19.90, 2),
(2, 2, 2, 49.99, 1),
(3, 3, 3, 35.50, 3),
(4, 4, 4, 120.00, 1),
(5, 5, 5, 15.75, 4),
(6, 6, 6, 89.00, 2),
(7, 7, 7, 25.99, 5),
(8, 8, 8, 60.00, 1),
(9, 9, 9, 99.90, 2),
(10, 10, 10, 10.00, 6),
(11, 11, 11, 45.45, 2),
(12, 12, 12, 30.00, 3),
(13, 13, 13, 22.22, 2),
(14, 14, 14, 80.80, 1),
(15, 15, 15, 17.50, 4),
(16, 16, 16, 54.90, 2),
(17, 17, 17, 12.00, 5),
(18, 18, 18, 100.00, 1),
(19, 19, 19, 18.49, 3),
(20, 20, 20, 77.77, 2),
(21, 21, 21, 65.00, 1),
(22, 22, 22, 40.40, 3),
(23, 23, 23, 29.90, 2),
(24, 24, 24, 33.33, 4),
(25, 25, 25, 70.00, 1);

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

alter table endereco add column id_transportadora integer;
alter table telefone add column id_transportadora integer;

alter table endereco
    add constraint fk_endereco_transportadora
    foreign key (id_transportadora) references transportadora(id);

alter table telefone
    add constraint fk_telefone_transportadora
    foreign key (id_transportadora) references transportadora(id);

create table nota_fiscal (
    id_nota_fiscal serial primary key,
    numero_nf varchar(20),
    chave_acesso varchar(60)unique,
    data_emissao date,
    valor_total decimal(10,2),
    valor_icms decimal(10,2),
    base_icms decimal(10,2),
    valor_pis decimal(10,2),
    valor_cofins decimal(10,2),
    id_pedido int,
    id_parceiro int,
    id_endereco int,
    id_transportadora int,
    constraint fk_nota_pedido foreign key (id_pedido) references pedido(id),
    constraint fk_nota_parceiro foreign key (id_parceiro) references parceiro(id),
    constraint fk_nota_endereco foreign key (id_endereco) references endereco(id),
    constraint fk_nota_transportadora foreign key (id_transportadora) references transportadora(id)
);

insert into transportadora (nome, cnpj) values
('raccoon express', '12.345.678/0001-01'),
('nemesis logística', '23.456.789/0001-02'),
('stars freight', '34.567.890/0001-03'),
('red queen cargas', '45.678.901/0001-04'),
('hive transportes', '56.789.012/0001-05');

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

