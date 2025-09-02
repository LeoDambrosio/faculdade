const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");
const bcrypt = require("bcrypt");

const app = express();
app.use(cors());
app.use(express.json());

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "ladycar", // nome do banco
  password: "123", // troque pela senha do seu PostgreSQL
  port: 5432,
});

// rota cadastro
app.post("/register", async (req, res) => {
  const { nome, email, senha } = req.body;
  try {
    const check = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (check.rows.length > 0) {
      return res.status(400).json({ error: "E-mail já cadastrado" });
    }
    const hash = await bcrypt.hash(senha, 10);
    const result = await pool.query(
      "INSERT INTO cliente (nome, email, senha) VALUES ($1, $2, $3) RETURNING id_cliente, nome, email",
      [nome, email, hash]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao cadastrar" });
  }
});

// rota login
app.post("/login", async (req, res) => {
  const { email, senha } = req.body;
  try {
    const result = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (result.rows.length === 0) {
      return res.status(400).json({ error: "Usuário não encontrado" });
    }
    const user = result.rows[0];
    const valid = await bcrypt.compare(senha, user.senha);
    if (!valid) {
      return res.status(400).json({ error: "Senha incorreta" });
    }
    res.json({ id: user.id_cliente, nome: user.nome, email: user.email });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao autenticar" });
  }
});

app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});
