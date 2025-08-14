create table ator(
	id_ator serial primary key,
	nome varchar(200)
);

create table filme(
	id_filme serial primary key,
	nome varchar(200)
);

create table ator_cache(
	id_ator_cache serial primary key,
	id_ator int,
	id_ator int references ator(id_ator),
);

create table filme_ator(
	id_filme_ator serial primary key,
	id_ator int,
	id_filme int,
	id_ator int references ator(id_ator),
	id_filme int references filme(id_filme)
);

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
