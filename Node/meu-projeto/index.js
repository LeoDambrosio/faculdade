const express = require("express");
const { Pool } = require("pg");

const app = new express();

// Middleware para servir arquivos estáticos da pasta public
app.use(express.static("public"));

// Middleware para permitir JSON no body das requisições
app.use(express.json());


// Conexão com PostgreSQL
const conexao = new Pool({
  host: "localhost",
  user: "postgres",
  password: "123",   // sua senha
  database: "Node",  // seu banco
  port: 5432,
});

// Função para criar tabela e inserir dados iniciais
const inicializarBanco = async () => {
  try {
    await conexao.query(`
      CREATE TABLE IF NOT EXISTS usuarios (
        id SERIAL PRIMARY KEY,
        nome TEXT NOT NULL,
        email TEXT NOT NULL
      )
    `);

    const { rowCount } = await conexao.query("SELECT * FROM usuarios");
    if (rowCount === 0) {
      await conexao.query(`
        INSERT INTO usuarios (id, nome, profissao) VALUES
        ('4', 'João Silva', 'Suporte'),
      `);
      console.log("Dados iniciais inseridos!");
    }

    console.log("Banco inicializado com sucesso!");
  } catch (err) {
    console.error("Erro ao inicializar banco:", err);
  }
};

// Chama a função de inicialização
inicializarBanco();


// Rota inicial
app.get("/", (req, res) => {
  console.log("entrou na rota ...")
  res.send("Servidor rodando!");
});

app.get("/professor", (req, res) => {
  let resposta = [
    {id: 1, nome: "Leonardo", profissao: "Analista" },
    {id: 2, nome: "Andre", profissao:"Analista" },
    {id: 3, nome: "Henrique", profissao: "Analista" }
  ];
  res.json(resposta);
});

// Servidor
app.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});
