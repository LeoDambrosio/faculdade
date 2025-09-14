create table ator(
	id_ator serial primary key,
	nome varchar(200),
	ultima_atualizacao Timestamp with time zone
);

insert into ator (nome) values
('Robert Downey Jr.'),
('Scarlett Johansson'),
('Chris Evans'),	
('Jennifer Lawrence'),
('Leonardo DiCaprio');

create or replace function log_ator()
		returns trigger as $$
			begin
		update ator 
	set ultima_atualizacao = now()
	where id_ator = new.id_ator;
		return new;
			end;
	$$ language plpgsql;

CREATE TRIGGER log_ator AFTER INSERT ON ator
FOR EACH ROW EXECUTE PROCEDURE log_ator();

insert into ator(nome)values('Didi');

select * from ator;

update table ator set column;

CREATE TABLE emp (
empname text,
salary integer,
last_date timestamp,
last_user text
);

CREATE TABLE emp_audit(
operation char(1) NOT NULL,
userid text NOT NULL,
empname text NOT NULL,
salary integer,
stamp timestamp NOT NULL
);

CREATE OR REPLACE FUNCTION emp_stamp() 
	RETURNS trigger AS 
		$emp_stamp$
		  BEGIN

IF NEW.empname IS NULL THEN
RAISE EXCEPTION 'empname cannot be null';
END IF;
IF NEW.salary IS NULL THEN
RAISE EXCEPTION '% cannot have null salary', NEW.empname;
END IF;

IF NEW.salary <= 0 THEN
RAISE EXCEPTION '% cannot have a negative or null salary', NEW.empname;
END IF;

NEW.last_date := current_timestamp;
NEW.last_user := current_user;
RETURN NEW;
END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE ON emp
FOR EACH ROW EXECUTE PROCEDURE emp_stamp();

insert into emp (empname, salary) values ('Juquinha', 10000);

select *from emp;

insert into emp (empname) values ('Juquinha2');

insert into emp ( salary) values ( 20000);

insert into emp (empname, salary) values ('Juquinha2', -20000);

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$
BEGIN

IF (TG_OP = 'DELETE') THEN
INSERT INTO emp_audit SELECT 'D', user, OLD.EMPNAME, OLD.SALARY, now();
RETURN OLD;
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO emp_audit SELECT 'U', user, NEW.EMPNAME, NEW.SALARY, now();
RETURN NEW;
ELSIF (TG_OP = 'INSERT') THEN
INSERT INTO emp_audit SELECT 'I', user, NEW.EMPNAME, NEW.SALARY, now();
RETURN NEW;
END IF;
RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE
ON emp FOR EACH ROW EXECUTE PROCEDURE process_emp_audit();

insert into emp (empname, salary) values ('Juquinha Segundo', 20000);

select *from emp;

update emp set empname='Juquinha Snaidis' where empname='Juquinha Segundo';

select *from emp_audit;

delete from emp where empname='Juquinha Snaidis';

select *from emp_audit;



