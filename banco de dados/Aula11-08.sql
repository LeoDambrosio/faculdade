create table ator(
	id_ator serial primary key,
	nome varchar(200)
);

create table filme(
	id_filme serial primary key,
	nome varchar(200)
);

create table ator_cache(
	cache bigint,
	id_ator_cache serial primary key,
	id_ator int references ator(id_ator)
);

create table filme_ator(
	id_filme_ator serial primary key,
	id_ator int references ator(id_ator),
	id_filme int references filme(id_filme)
);

INSERT INTO ator_cache (cache, id_ator) VALUES
(50000, 1),
(75000, 2),
(60000, 3),
(80000, 4),
(55000, 5),
(90000, 6),
(72000, 7),
(65000, 8),
(58000, 9),
(77000, 10);

INSERT INTO filme_ator (id_ator, id_filme) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO ator (nome) VALUES
('Robert Downey Jr.'),
('Scarlett Johansson'),
('Chris Evans'),	
('Jennifer Lawrence'),
('Leonardo DiCaprio'),
('Morgan Freeman'),
('Natalie Portman'),
('Tom Hanks'),
('Emma Stone'),
('Will Smith');

INSERT INTO filme (nome) VALUES
('Avengers: Endgame'),
('The Revenant'),
('La La Land'),
('Forrest Gump'),
('Iron Man'),
('Black Widow'),
('The Pursuit of Happyness'),
('The Hunger Games'),
('Men in Black'),
('Inception');

create or replace function calculosMatematicos(x int, y int, out soma int,
	out subtracao int, out multiplicacao int, out divisao int) as $$
	begin
soma = x + y;
subtracao = x - y;
multiplicacao = x * y;
divisao = x / y;
	end;
$$ language plpgsql;

select * from calculosMatematicos(2,5);

CREATE OR REPLACE FUNCTION ATORES_FILMES_CACHES__(id_ator_ integer)
RETURNS TABLE(NOME varchar(200), FILME varchar(200), CACHE_ bigint)
AS
$$
BEGIN
RETURN QUERY
SELECT a.nome, f.nome, c.cache AS cache_ FROM ator a 
INNER JOIN filme_ator FA ON A.id_ator=FA.id_ator
INNER JOIN FILME F ON F.id_filme=FA.id_filme
INNER JOIN ator_cache C ON A.id_ator=C.id_ator
WHERE A.id_ator=id_ator_ ORDER BY  F.NOME ASC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ATORES_FILMES_CACHES__(5);

