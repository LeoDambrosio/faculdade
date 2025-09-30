const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");
const bcrypt = require("bcrypt");

const app = express();
app.use(cors());
app.use(express.json());

// Conexão com PostgreSQL
const pool = new Pool({
  user: "postgres",     // seu usuário do banco
  host: "localhost",    // onde o banco está rodando
  database: "LadyCar",  // nome do banco
  password: "123",      // sua senha do PostgreSQL
  port: 5432,           // porta padrão do Postgres
});

// Teste inicial
app.get("/", (req, res) => {
  res.send("Servidor backend rodando 🚀");
});

// ✅ Rota de Cadastro
app.post("/register", async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    // Verifica se já existe esse e-mail
    const check = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (check.rows.length > 0) {
      return res.status(400).json({ error: "E-mail já cadastrado" });
    }

    // Criptografa a senha
    const hash = await bcrypt.hash(senha, 10);

    // Insere no banco
    const result = await pool.query(
      "INSERT INTO cliente (nome, email, senha) VALUES ($1, $2, $3) RETURNING id_cliente, nome, email",
      [nome, email, hash]
    );

    res.json(result.rows[0]);
  } catch (err) {
    console.error("Erro no cadastro:", err);
    res.status(500).json({ error: "Erro ao cadastrar" });
  }
});

// ✅ Rota de Login
app.post("/login", async (req, res) => {
  const { email, senha } = req.body;

  try {
    // Busca usuário pelo email
    const result = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (result.rows.length === 0) {
      return res.status(400).json({ error: "Usuário não encontrado" });
    }

    const user = result.rows[0];

    // Compara senha digitada com a senha criptografada do banco
    const valid = await bcrypt.compare(senha, user.senha);
    if (!valid) {
      return res.status(400).json({ error: "Senha incorreta" });
    }

    // Retorna apenas dados básicos
    res.json({ id: user.id_cliente, nome: user.nome, email: user.email });
  } catch (err) {
    console.error("Erro no login:", err);
    res.status(500).json({ error: "Erro ao autenticar" });
  }
});

// ✅ Inicia o servidor
app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});