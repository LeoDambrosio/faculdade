CREATE TABLE cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha TEXT NOT NULL
);

CREATE TABLE agendamento (
  id_agendamento SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES cliente(id_cliente),
  data DATE NOT NULL,
  hora TIME NOT NULL,
  descricao TEXT NOT NULL
);