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

CREATE TABLE transportadora (
    id_transportadora SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE
);

ALTER TABLE telefone
ADD COLUMN id_transportadora INT,
ADD CONSTRAINT fk_telefone_transportadora FOREIGN KEY (id_transportadora)
REFERENCES transportadora(id_transportadora);

ALTER TABLE endereco
ADD COLUMN id_transportadora INT,
ADD CONSTRAINT fk_endereco_transportadora FOREIGN KEY (id_transportadora)
REFERENCES transportadora(id_transportadora);

CREATE TABLE nota_fiscal (
    id_nota_fiscal SERIAL PRIMARY KEY,
    numero_nf VARCHAR(20) NOT NULL,
    chave_acesso VARCHAR(50) NOT NULL UNIQUE,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    valor_icms DECIMAL(10, 2),
    base_calculo_icms DECIMAL(10, 2),
    valor_pis DECIMAL(10, 2),
    valor_cofins DECIMAL(10, 2),
    idpedido INT NOT NULL,
    idparceiro INT NOT NULL,
    idendereco INT NOT NULL,
    id_transportadora INT NOT NULL,
    CONSTRAINT fkpedido FOREIGN KEY (idpedido) REFERENCES pedido(idpedido),
    CONSTRAINT fkparceiro FOREIGN KEY (idparceiro) REFERENCES parceiro(idparceiro),
    CONSTRAINT fkendereco FOREIGN KEY (idendereco) REFERENCES endereco(idendereco),
    CONSTRAINT fk_transportadora FOREIGN KEY (id_transportadora) REFERENCES transportadora(id_transportadora)
);

create table telefone(
	idtelefone serial primary key,
	numero varchar(200),
	id_transportadora int,
	CONSTRAINT fk_transportadora FOREIGN KEY (id_transportadora) REFERENCES transportadora(id_transportadora)	
);

create table endereco(
	idendereco serial primary key,
	logradouro varchar(200),
	numero int, 
	bairro varchar(200), 
	cidade varchar(200), 
	estado varchar(200),
	cep int, 
	id_transportadora int,
	CONSTRAINT fk_transportadora FOREIGN KEY (id_transportadora) REFERENCES transportadora(id_transportadora)	
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
 data time not null
);

create table parceiro(
 idparceiro serial primary key,
 documento int not null,
 nome varchar(255) not null,
 nomeFantasia varchar(255),
 observacao varchar(255),
 idnativo bool
);
	
INSERT INTO transportadora (nome, cnpj) VALUES
('TransRapido', '12.345.678/0001-01'),
('Expresso do Sul', '98.765.432/0001-02'),
('Nordeste Cargas', '11.222.333/0001-03'),
('RodoFrete Brasil', '22.333.444/0001-04'),
('Carga Certa', '33.444.555/0001-05');

INSERT INTO telefone (numero, id_transportadora) VALUES
('1188887777', 1),
('1177776666', 2),
('1188885555', 3),
('1177774444', 4),
('1166673333', 5);

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, cep, id_transportadora) VALUES
('Rua A', '100', 'Centro', 'São Paulo', 'SP', '01000000', 1),
('Rua B', '200', 'Vila Nova', 'Rio de Janeiro', 'RJ', '20000000', 2),
('Rua C', '300', 'Boa Vista', 'Salvador', 'BA', '40000000', 3),
('Rua D', '400', 'Industrial', 'Belo Horizonte', 'MG', '30000000', 4),
('Rua E', '500', 'Comercial', 'Curitiba', 'PR', '80000000', 5);

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

INSERT INTO  parceiro (documento, nome, nomeFantasia, observacao, idnativo)
VALUES 
(21, 'NextLevel Corp', 'NextLevel', 'Cliente internacional', true),
(22, 'FusionTech Ltda', 'Fusion', 'Pagamentos via PayPal', true),
(23, 'GreenWay Eco', 'GreenWay', 'Sede em Toronto', true),
(24, 'Skyline Devs', 'Skyline', '', true),
(25, 'BrightIdeas Inc.', 'BrightIdeas', '', true),
(21, 'Pixel Studio', 'Pixel', '', false);


INSERT INTO nota_fiscal (numero_nf, chave_acesso, data_emissao, valor_total, valor_icms, base_calculo_icms,
valor_pis, valor_cofins, idpedido, idparceiro, idendereco, id_transportadora) VALUES
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
