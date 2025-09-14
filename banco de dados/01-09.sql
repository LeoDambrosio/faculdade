CREATE TABLE Produto ( 
cod_prod INT PRIMARY KEY, 
descricao VARCHAR(50) UNIQUE, 
qtde_disponivel INT NOT NULL DEFAULT 0
);
INSERT INTO Produto VALUES (1, 'Feijão', 10);
INSERT INTO Produto VALUES (2, 'Arroz', 5);
INSERT INTO Produto VALUES (3, 'Macarrão', 15);
INSERT INTO Produto VALUES (4, 'Farinha', 25);
INSERT INTO Produto VALUES (5, 'Fubá', 7);
INSERT INTO Produto VALUES (6, 'Achocolatado', 10);
INSERT INTO Produto VALUES (7, 'Sal', 15);
INSERT INTO Produto VALUES (8, 'Açúcar', 10);
INSERT INTO Produto VALUES (9, 'Óleo', 30);
select * from produto

create or replace function listagem_produtos (prod_cursor refcursor) 
returns refcursor
as 
$$
begin
	open prod_cursor for select * from produto;
	return prod_cursor;
end;
$$ language plpgsql;

--retorna a linha de resultado imediatamente seguinte à linha atual e adiciona a linha atual à linha retornada
select listagem_produtos ('cursor_prod');
fetch next in cursor_prod;

--retornar as 4 primeiras tuplas
select listagem_produtos ('cursor_prod');
fetch 4 in cursor_prod;

--retornar apenas a 4  tupla
select listagem_produtos ('cursor_prod');
fetch absolute 4 in cursor_prod;

--retornar a linha 4 primeiro (porém não vamos ver) e depois ele soma as turmas conforme o valor da relative
--ele sobrescreve o primeiro retorno e usa ele como base para o segundo
select listagem_produtos ('cursor_prod');
fetch absolute 4 in cursor_prod;
fetch relative 3 in cursor_prod;

--retorna a última linha no cursor e a torna a linha atual.
select listagem_produtos ('cursor_prod');
fetch last in cursor_prod;

--testa a função
--retorna a primeira tupla
select listagem_produtos ('cursor_prod');
fetch first in cursor_prod;

--cursor será deixado posicionado antes da primeira linha.
select listagem_produtos ('cursor_prod');
fetch prior in cursor_prod;

create table Carros (
	id_carros serial primary key,
	nome varchar(200),
	marca varchar(200),
	cor varchar(200),
	modelo varchar(200),
	ano int
);

insert into Carros(id_carros, nome, marca, cor, modelo, ano) values
('Civic', 'Honda', 'Prata', 'Sedan', 2020),
('Corolla', 'Toyota', 'Branco', 'Sedan', 2019),
('Golf', 'Volkswagen', 'Preto', 'Hatch', 2018),
('Fiesta', 'Ford', 'Vermelho', 'Hatch', 2017),
('Argo', 'Fiat', 'Azul', 'Hatch', 2021),
('Renegade', 'Jeep', 'Preto', 'SUV', 2020),
('T-Cross', 'Volkswagen', 'Branco', 'SUV', 2022),
('Onix', 'Chevrolet', 'Cinza', 'Hatch', 2019),
('Kicks', 'Nissan', 'Prata', 'SUV', 2021),
('HB20', 'Hyundai', 'Vermelho', 'Hatch', 2020);
