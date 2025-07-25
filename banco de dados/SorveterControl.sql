CREATE TABLE funcionario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  telefone VARCHAR(15)
);

CREATE TABLE produto (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10, 2)
);

CREATE TABLE pedido (
  id SERIAL PRIMARY KEY,
  id_funcionario INT REFERENCES funcionario(id),
  data DATE,
  valor_total DECIMAL(10, 2)
);
