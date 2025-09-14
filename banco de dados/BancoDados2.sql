create function add(integer, integer) returns integer as'select $1+$2;' language sql immutable returns null on null input;

select add(4,7)

create or replace function increment(i integer) returns integer as $$ begin return i+1;
end $$ language plpgsql; 

select increment(410)

CREATE TABLE alunos (
    idaluno INT PRIMARY KEY,
    nome VARCHAR(100),
    cod_matricula INT
);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (1, 'João Silva', 1);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (2, 'Maria Santos', 2);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (3, 'Carlos Oliveira', 3);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (4, 'Ana Pereira', 4);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (5, 'Pedro Souza', 5);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (6, 'Mariana Lima', 6);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (7, 'Fernando Costa', 7);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (8, 'Amanda Rodrigues', 8);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (9, 'Lucas Martins', 9);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (10, 'Camila Almeida', 10);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (11, 'Gustavo Oliveira', 11);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (12, 'Juliana Barbosa', 12);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (13, 'Rafaela Sousa', 13);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (14, 'Daniel Pereira', 14);
INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (15, 'Carolina Silva', 15);

create or replace function clean_alunos() returns void as' delete from alunos where cod_matricula < 10;' language sql;

select * from alunos 
select clean_alunos()
select * from alunos

CREATE OR REPLACE FUNCTION select_alunos(cod_matricula integer) RETURNS alunos AS $$
select * from alunos where cod_matricula = $1
$$ LANGUAGE SQL;
select select_alunos(15)

CREATE OR REPLACE FUNCTION nome_alunos(cod_matricula integer) RETURNS text AS $$
select nome from alunos where cod_matricula = $1
$$ LANGUAGE SQL;
select nome_alunos(11)

CREATE OR REPLACE FUNCTION insert_alunos(idaluno int, nome varchar(100), cod_matricula int ) RETURNS int AS $$
with inserido as(
INSERT INTO ALUNOS(idaluno, nome, cod_matricula)
VALUES($1,$2,$3)
RETURNING cod_matricula
)
select cod_matricula from inserido
$$ LANGUAGE SQL;

select insert_alunos(23,'Alunoson Valdicson',44)

