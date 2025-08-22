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
        INSERT INTO usuarios (nome, email) VALUES
        ('João Silva', 'joao@email.com'),
        ('Maria Oliveira', 'maria@email.com')
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

// ================= ROTAS =================

// Rota inicial
app.get("/", (req, res) => {
  res.send("Servidor rodando!");
});

// Listar todos os usuários
app.get("/professor", (req, res) => {
  let resposta = [
    {
      nome: "Leonardo",
      profissao: "Analista"
    
    },
    {
      nome: "Andre",
      profissao:"Analista"
    },
    {
      nome: "Henrique",
      profissao: "Analista"
    }
  ];
  res.json(resposta);
});

// Inserir novo usuário
app.post("/usuarios", async (req, res) => {
  try {
    const { nome, email } = req.body;
    const { rows } = await conexao.query(
      "INSERT INTO usuarios (nome, email) VALUES ($1, $2) RETURNING *",
      [nome, email]
    );
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).send("Erro ao inserir usuário");
  }
});

// Atualizar usuário
app.put("/usuarios/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { nome, email } = req.body;
    const { rows } = await conexao.query(
      "UPDATE usuarios SET nome = $1, email = $2 WHERE id = $3 RETURNING *",
      [nome, email, id]
    );
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).send("Erro ao atualizar usuário");
  }
});

// Deletar usuário
app.delete("/usuarios/:id", async (req, res) => {
  try {
    const { id } = req.params;
    await conexao.query("DELETE FROM usuarios WHERE id = $1", [id]);
    res.json({ mensagem: "Usuário deletado com sucesso" });
  } catch (err) {
    console.error(err);
    res.status(500).send("Erro ao deletar usuário");
  }
});

// Servidor
app.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});
