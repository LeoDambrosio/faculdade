create table produto_grupo(
	produto_grupo_id serial primary key,
	nome_grupo varchar(200),
	cod_grupo numeric
);

create table produto(
	id_produto serial primary key,
	descricao varchar(100),
	nome varchar(200),
	produto_num integer,
	preco real,
	produto_grupo_id int,
	constraint fk_produto_grupo foreign key (produto_grupo_id) references produto_grupo (produto_grupo_id)
);

alter table produto add column Descricao2 text;
alter table produto drop column Descricao2;
