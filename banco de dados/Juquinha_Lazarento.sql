create table Hero(
	id_Hero serial primary key,
	nome varchar(200),
	universo varchar(200)
);

create table Power(
	id_Power serial primary key,
	nome_power varchar(200)
);

create table Hero_Power(
	id_Hero int references Hero(id_Hero),
	id_Power int references Power(id_Power),
	nivel int
);

create table HQ(
	id_HQ serial primary key,
	titulo varchar(200),
	ano_publicacao int,
	id_Hero int references Hero(id_Hero)
);

insert into hero (nome, universo) values
('Jean Grey', 'Marvel'),
('Jubilee', 'Marvel'),
('John Stewart', 'DC'),
('Jessica Jones', 'Marvel'),
('Batman', 'DC');

insert into power (nome_power) values
('Telepatia'),
('Super Força'),
('Voo'),
('Energia'),
('Velocidade');

insert into hero_power (id_hero, id_power, nivel) values
(1, 1, 95),  
(2, 4, 60),   
(3, 1, 70),  
(4, 2, 80),
(5, 5, 85);  

insert into hq (titulo, ano_publicacao, id_hero) values
('Poder da Fênix', 2019, 1),
('Sombra Roxa', 2021, 4),
('Energia Mutante', 2017, 2),
('Lanterna Verde', 2020, 3),
('Cavaleiro das Trevas', 2016, 5);

SELECT DISTINCT h.nome AS nome_heroi, q.titulo AS titulo_hq
FROM HERO h
JOIN HERO_POWER hp ON h.id_hero = hp.id_hero
JOIN POWER p ON p.id_power = hp.id_power
JOIN HQ q ON q.id_hero = h.id_hero
WHERE h.universo = 'Marvel'
  AND q.ano_publicacao >= 2018
  AND p.nome_power = 'Telepatia'
  AND hp.nivel >= 90
  AND h.nome LIKE 'J%';
