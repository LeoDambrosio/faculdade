create table usuario(
	id_usuario serial primary key,
	matricula int,
	nome varchar(200),
	email varchar(200)
);

create table telefone(
	id_telefone serial primary key,
	ddd numeric,
	numero numeric
);

create table usuariotelefone(
  id_usuariotelefone serial primary key,
  id_usuario int,
  id_telefone int,
  constraint fk_id_usuario foreign key (id_usuario) references usuario(id_usuario),
  constraint fk_id_telefone foreign key (id_telefone) references telefone(id_telefone)
);

create table tipoendereco(
  id_tipoendereco serial primary key,
  descricao varchar(200) 
);

create table endereco(
	id_endereco serial primary key,
	rua varchar(200),
	numero numeric,
	bairro varchar(200),
	descricao varchar(200),
	longitude numeric,
	latitude numeric,
	id_tipoendereco int,
    constraint fk_id_tipoendereco foreign key (id_tipoendereco) references tipoendereco(id_tipoendereco)
);

create table usuarioendereco(
	id_usuarioendereco serial primary key,
	id_usuario int,
	id_endereco int,
    constraint fk_id_usuario foreign key (id_usuario) references usuario(id_usuario),
    constraint fk_id_endereco foreign key (id_endereco) references endereco(id_endereco)
);

create table sessao(
	id_sessao serial primary key,
	codigo int,
	descricao varchar(200),
	localizacao varchar(200)
);

create table livro(
	id_livro serial primary key,
	codigo int,
	titulo varchar(200),
	autor varchar(200),
	id_sessao int,
	constraint fk_sessao foreign key (id_sessao) references sessao(id_sessao)
);

create table emprestimo(
	id_emprestimo serial primary key,
	data date,
	hora time
);

create table emprestimolivro(
	id_emprestimolivro serial primary key,
  	id_emprestimo int,
  	id_livro int,
  	constraint fk_id_emprestimo foreign key (id_emprestimo) references emprestimo (id_emprestimo),
  	constraint fk_id_livro foreign key (id_livro) references livro (id_livro)
);

create table multa(
	id_multa serial primary key,
	valor numeric,
	data date,
	hora time
);

create table emprestimousuario(
	id_emprestimousuario serial primary key,
	id_usuario int,
	id_emprestimo int,
	id_multa int,
	constraint fk_id_usuario foreign key (id_usuario) references usuario (id_usuario),
    constraint fk_id_emprestimo foreign key (id_emprestimo) references emprestimo (id_emprestimo),
	constraint fk_id_multa foreign key (id_multa) references multa (id_multa)
);

insert into usuario (matricula, nome, email) values
(11, 'Leonardo Vieia', 'leonardovieira@email.com'),
(12, 'Henrique Moura', 'henriquemoura@email.com'),
(13, 'Andre Luzzi', 'andreluzzi@email.com'),
(14, 'Alan Alvez', 'alanalvez@email.com'),
(15, 'Letici Vieira', 'leticiavieira@email.com');

insert into telefone (ddd, numero) values
(45, 999103671),
(45, 987654321),
(45, 999888777),
(45, 912345678),
(45, 911223344);

insert into usuariotelefone (id_usuario, id_telefone) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into tipoendereco (descricao) values
('Fixo'),
('Ilha');

insert into endereco (rua, numero, bairro, descricao, longitude, latitude, id_tipoendereco) values
('Rua Condor', 925, 'Floresta', 'penultima casa', null, null, 1),
('Rua Europa', 685, 'Interlagos', 'casa cinza', null, null, 1),
(null, null, null, 'Ilha de Páscoa', '1093497', '271127', 2),
(null, null, null, 'Ilha de Madagascar', '468691', '187669', 2),
(null, null, null, 'Ilha de Bali', '1151889', '84095', 2);

insert into usuarioendereco (id_usuario, id_endereco) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into sessao (codigo, descricao, localizacao) values
(101, 'Ficção Científica', 'Estante A'),
(102, 'Literatura Brasileira', 'Estante B'),
(103, 'História Geral', 'Estante C'),
(104, 'Tecnologia', 'Estante D'),
(105, 'Infantil', 'Estante E');

insert into livro (codigo, titulo, autor, id_sessao) values
(1001, 'Duna', 'Frank Herbert', 1),
(1002, 'Dom Casmurro', 'Machado de Assis', 2),
(1003, 'História do Brasil', 'Boris Fausto', 3),
(1004, 'Clean Code', 'Robert C. Martin', 4),
(1005, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 5);

insert into emprestimo (data, hora) values
('2025-06-28', '09:00:00'),
('2025-06-28', '10:00:00'),
('2025-06-28', '11:00:00'),
('2025-06-28', '12:00:00'),
('2025-06-28', '13:00:00');

insert into emprestimolivro (id_emprestimo, id_livro) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into multa (valor, data, hora) values
(5.00, '2025-06-29', '14:00:00'),
(6.00, '2025-06-29', '15:00:00'),
(3.50, '2025-06-29', '16:00:00'),
(1.80, '2025-06-29', '17:00:00'),
(8.00, '2025-06-29', '18:00:00');

insert into emprestimousuario (id_usuario, id_emprestimo, id_multa) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--1
select 
  u.nome,
  u.email,
  t.ddd,
  t.numero,
  e.rua,
  e.numero,
  e.bairro,
  e.descricao,
  e.latitude,
  e.longitude
from usuario u
left join usuariotelefone ut on u.id_usuario = ut.id_usuario
left join telefone t on ut.id_telefone = t.id_telefone
left join usuarioendereco ue on u.id_usuario = ue.id_usuario
left join endereco e on ue.id_endereco = e.id_endereco;


--2
alter table emprestimo add column data_devolucao date;

--3
insert into emprestimo (data, hora, data_devolucao) values
('2025-01-21', '11:22', '2025-02-02');

--4
insert into emprestimousuario (id_usuario, id_emprestimo, id_multa) values
(1, 6, null);

--5
insert into emprestimolivro (id_emprestimo, id_livro) values
(6, 1);

--6
select 
  u.nome,
  u.matricula,
  l.titulo,
  l.codigo,
  s.descricao,
  s.codigo,
  u.email,
  case 
    when e.data_devolucao is null then 'EMPRESTADO'
    else 'DEVOLVIDO'
  end as status_emprestimo
from usuario u
inner join emprestimousuario eu on u.id_usuario = eu.id_usuario
inner join emprestimo e on eu.id_emprestimo = e.id_emprestimo
inner join emprestimolivro el on e.id_emprestimo = el.id_emprestimo
inner join livro l on el.id_livro = l.id_livro
inner join sessao s on l.id_sessao = s.id_sessao;

--7
select 
  u.matricula,
  count(m.id_multa) as qtd_multas,
  sum(m.valor) as total_pago,
  avg(m.valor) as media_valor,
  min(m.valor) as menor_valor,
  max(m.valor) as maior_valor
from usuario u
inner join emprestimousuario eu on u.id_usuario = eu.id_usuario
inner join multa m on eu.id_multa = m.id_multa
group by u.matricula
order by total_pago desc;


