create table filme(
	id_filme serial primary key,
	descricao varchar(255),
	titulo varchar(255),
	taxa float,
	obs varchar(255)
)

insert into filme (descricao, titulo, taxa, obs) values ('Mafia, poder e traicao.', 'O Poderoso Chefao', '12.99', 'Classico do cinema'),  
('Viagem espacial e buracos de minhoca.', 'Interestelar', '14.50', 'Ficcao cientifica incrivel'),  
('Sociedade, anarquia e identidade.', 'Clube da Luta', '10.00', 'Filme cult imperdivel'),  
('Sonhos dentro de sonhos.', 'A Origem', '13.99', 'Roteiro genial e complexo'),  
('Super-herois contra Thanos.', 'Vingadores: Ultimato', '15.00', 'Sucesso absoluto'),  
('Dinheiro e corrupcao.', 'O Lobo de Wall Street', '11.50', 'Baseado em fatos reais'),  
('Historias entrelacadas e violencia.', 'Pulp Fiction', '9.99', 'Obra-prima de Tarantino'),  
('A batalha final pela Terra Media.', 'O Senhor dos Aneis: O Retorno do Rei', '14.99', 'Oscar de Melhor Filme'),  
('O Coringa desafia Gotham.', 'Batman: O Cavaleiro das Trevas', '12.75', 'Atuacao lendaria de Heath Ledger'),  
('Realidade simulada e rebeliao.', 'Matrix', '11.99', 'Revolucionario em efeitos visuais'),  
('A vida extraordinaria de um homem comum.', 'Forrest Gump', '10.49', 'Inspirador e emocionante'),  
('Lutas e vinganca na Roma Antiga.', 'Gladiador', '13.25', 'Luta Romana'),  
('A origem do vilao.', 'Coringa', '12.50', 'Retrato sombrio e psicologico'),  
('Suspense e psicopatia.', 'O Silencio dos Inocentes', '10.99', 'Thriller inesquecivel'),  
('Romance e tragedia no navio.', 'Titanic', '11.75', 'Fenomeno de bilheteria');  

create table ator(
	id_ator serial primary key,
	nome varchar(255),
	sobrenome varchar(255),
	idade int
)

create table filme_ator(
	id serial primary key,
	id_ator int,
	id_filme int,
	constraint fk_ator foreign key(id_ator) references ator(id_ator),
	constraint fk_filme foreign key(id_filme) references filme(id_filme)
)

insert into ator (nome, sobrenome, idade) values ('Leonardo', 'DiCaprio', 49),  
('Robert', 'Downey Jr.', 59),  
('Johnny', 'Depp', 61),  
('Will', 'Smith', 55),  
('Brad', 'Pitt', 60),  
('Tom', 'Cruise', 62),  
('Denzel', 'Washington', 69),  
('Keanu', 'Reeves', 60),  
('Samuel', 'L. Jackson', 76),  
('Morgan', 'Freeman', 87),  
('Al', 'Pacino', 84),  
('Robert', 'De Niro', 80),  
('Christian', 'Bale', 50),  
('Joaquin', 'Phoenix', 49),  
('Tom', 'Hanks', 68);

insert into filme_ator (id_ator,id_filme) values (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),
	(7,7),(8,8),(9,9),(10,10),(11,11),
	(12,12),(13,13),(14,14),(15,15);

select * from filme_ator
	
select *,(2*taxa) from filme 
	
select * from filme where id_filme = 5;

select * from filme order by titulo desc
select * from filme order by titulo asc

select * from filme where titulo like '%Cavaleiro%';

select sum(taxa) from filme;

select avg(taxa) from filme;

select max(taxa) from filme;

select min(taxa) from filme;

select id_filme, count(id_ator) from filme_ator group by id_filme
	
select * from filme where taxa between 5 and 10;

select * from filme_ator limit 10;

select * from filme_ator offset 10;

