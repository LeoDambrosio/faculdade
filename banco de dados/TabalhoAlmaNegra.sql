create table usuario (
	id_usuario serial primary key,
	nome varchar(200),
	cpf int,
	data_nacimento date,
	id_gerente int,
	constraint fk_gerente foreign key(id_gerente) references usuario (id_usuario)
)
drop table usuario;
select * from usuario;
	
create table endereco (
	id_endereco serial primary key,
	rua varchar(200),
	cidade varchar(200)
)
	
create table companhia (
	id_companhia serial primary key,
	nome varchar(200)	
)

create table gerente (
	id_gerente serial primary key,
	
)

create table trabalho (
	id_trabalho serial primary key,
	nome varchar(200)
)

create table endereco_usuario (
	id_endereco_usuario serial primary key,
	id_usuario int,
	id_endereco int,
	constraint fk_endereco foreign key(id_endereco) references endereco (id_endereco),
	constraint fk_usuario foreign key(id_usuario) references usuario (id_usuario)	
)