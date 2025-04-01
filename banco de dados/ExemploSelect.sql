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
 
select * from filme
	
select *,(2*taxa) from filme 
	
select * from filme where id_filme = 5;

select * from filme order by titulo desc
select * from filme order by titulo asc

select * from filme where titulo like '%Cavaleiro%';


