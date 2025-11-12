const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");
const bcrypt = require("bcrypt");

const app = express();
app.use(cors());
app.use(express.json());

// Conexão com PostgreSQL
const pool = new Pool({
  user: "postgres",     
  host: "localhost",    
  database: "LadyCar",  
  password: "123",      
  port: 5432,           
});

// Teste inicial
app.get("/", (req, res) => {
  res.send("Servidor backend rodando 🚗🌸");
});

// Rota de cadastro
app.post("/register", async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    // Verificar se o email já existe
    const check = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (check.rows.length > 0) {
      return res.status(400).json({ error: "E-mail já cadastrado" });
    }

    // Hash da senha
    const hash = await bcrypt.hash(senha, 10);

    // Inserir no banco
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

// Rota de login
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
    console.error("Erro no login:", err);
    res.status(500).json({ error: "Erro ao autenticar" });
  }
});

// Rota de agendamento
app.post("/agendar", async (req, res) => {
  const { id_cliente, data, hora, descricao } = req.body;

  try {
    const result = await pool.query(
      "INSERT INTO agendamento (id_cliente, data, hora, descricao) VALUES ($1, $2, $3, $4) RETURNING *",
      [id_cliente, data, hora, descricao]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error("Erro ao agendar:", err);
    res.status(500).json({ error: "Erro ao criar agendamento" });
  }
});

// Rota para listar agendamentos de um cliente
app.get("/agendamentos/:id_cliente", async (req, res) => {
  const { id_cliente } = req.params;

  try {
    const result = await pool.query(
      "SELECT * FROM agendamento WHERE id_cliente=$1 ORDER BY data DESC, hora DESC",
      [id_cliente]
    );
    res.json(result.rows);
  } catch (err) {
    console.error("Erro ao listar agendamentos:", err);
    res.status(500).json({ error: "Erro ao listar agendamentos" });
  }
});

// Inicia o servidor
app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});
