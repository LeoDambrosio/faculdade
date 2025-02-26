create table pizza;(
	id_pizza serial primary key,
	tamanho varchar(255),
	preco real,
	constraint fk sabor foreign key(id_sabor) references ingredientes(id_ingrediente)
	constraint fk ingrediente foreign key(id_ingredientes) references sabor(id_sabor)
);
create table ingredientes;(
	id_ingrdiente serial primary key,
	nome varchar(255),
	quantidade varchar(255),
	descricao varchar(255),
);
create table sabor;(
	id_sabor serial primary key,
	nome varchar(255),
	descricao varchar(255),
);
create table sabor_ingredientes;(
	constraint fk sabor foreign key(id_sabor) references ingredientes(id_ingrediente)
	constraint fk ingrediente foreign key(id_ingredientes) references sabor(id_sabor)
)

