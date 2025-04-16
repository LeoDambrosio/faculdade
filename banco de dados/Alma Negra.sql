create table cidade (
    id_cidade serial primary key,
    nome varchar(100) not null
);

insert into cidade (nome) values 
('Cascavel'), 
('Toledo'), 
('Não me Toque'), 
('Frederico Wesphalen');

create table endereco (
    id_endereco serial primary key,
    rua varchar(100),
    id_cidade int,
    constraint fk_endereco_cidade foreign key (id_cidade) references cidade(id_cidade)
);

insert into endereco (rua, id_cidade) values
('Carlo de Carvalho', 1), 
('universitaria', 2),        
('brasil', 1),        
('brasil', 2),        
('Carlos Gomes', 1),  
('paraná', 1);        

create table usuario (
    id_usuario serial primary key,
    nome varchar(100) not null,
    id_gerente int,
    constraint fk_gerente foreign key (id_gerente) references usuario(id_usuario)
);

insert into usuario (nome, id_gerente) values 
('Bill', null),
('Torvalds', null),
('Juquinha', 1),
('Mariazinha', 1),
('Renatinho', 2),
('Dimas', 2);

create table companhia (
    id_companhia serial primary key,
    nome varchar(100) not null,
    id_cidade int,
    constraint fk_companhia_cidade foreign key (id_cidade) references cidade(id_cidade)
);

insert into companhia (nome, id_cidade) values
('Janela OS', 3),         
('Pinguim OS', 4);        

create table empregado (
    id_empregado serial primary key,
    id_usuario int,
    id_endereco int,
    constraint fk_empregado_usuario foreign key (id_usuario) references usuario(id_usuario),
    constraint fk_empregado_endereco foreign key (id_endereco) references endereco(id_endereco)
);

insert into empregado (id_usuario, id_endereco) values
(3, 1), 
(4, 2), 
(5, 3),  
(6, 4), 
(1, 5),  
(2, 6);  

select * from empregado;

create table trabalho (
    id_trabalho serial primary key,
    id_empregado int,
    id_companhia int,
    salario numeric(10,2),
    constraint fk_trabalha_empregado foreign key (id_empregado) references empregado(id_empregado),
    constraint fk_trabalha_companhia foreign key (id_companhia) references companhia(id_companhia)
);

insert into trabalho (id_empregado, id_companhia, salario) values
(1, 1, 1000),  
(2, 1, 2000),  
(3, 2, 3000), 
(4, 2, 4000),  
(5, 1, 10000), 
(6, 2, 10000);

update cidade 
set nome = 'Velho Cascavel' 
where nome = 'Cascavel';

update cidade 
set nome = 'Nova Toledo' 
where nome = 'Toledo';

update usuario 
set nome = 'Felisberto' 
where nome = 'dimas';

update endereco 
set rua = 'Faculdade' 
where rua = 'universitaria';

select empregado.id_empregado as empregado_id
from empregado
join trabalho on empregado.id_empregado = trabalho.id_empregado
join companhia on trabalho.id_companhia = companhia.id_companhia
where companhia.nome = 'Pinguim OS';

select gerente.id_usuario as gerente_id, empregado.nome as empregado
from usuario empregado
join usuario gerente on empregado.id_gerente = gerente.id_usuario
where empregado.nome in ('juquinha', 'mariazinha');

select gerente.nome as gerente, count(empregado.id_usuario) as total_empregados
from usuario empregado
join usuario gerente on empregado.id_gerente = gerente.id_usuario
group by gerente.nome;
