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

// Rota de cadastro COMPLETO
app.post("/register", async (req, res) => {
  // ⭐️ ALTERAÇÃO: Recebendo todos os novos campos
  const { nome, email, senha, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado } = req.body;

  try {
    // Verificar se o email já existe
    const checkEmail = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (checkEmail.rows.length > 0) {
      return res.status(400).json({ error: "E-mail já cadastrado" });
    }
    
    // Hash da senha
    const hash = await bcrypt.hash(senha, 10);

    // ⭐️ ALTERAÇÃO: Inserir TODOS os novos campos no banco
    const query = `
      INSERT INTO cliente 
      (nome, email, senha, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado) 
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) 
      RETURNING id_cliente, nome, email, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado
    `;
    const result = await pool.query(query, 
      [nome, email, hash, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado]
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
    // SELECT * garante que todos os campos (incluindo os novos) são buscados
    const result = await pool.query("SELECT * FROM cliente WHERE email=$1", [email]);
    if (result.rows.length === 0) {
      return res.status(400).json({ error: "Usuário não encontrado" });
    }

    const user = result.rows[0];
    const valid = await bcrypt.compare(senha, user.senha);
    if (!valid) {
      return res.status(400).json({ error: "Senha incorreta" });
    }

    // ⭐️ ALTERAÇÃO: Incluir TODOS os campos na resposta JSON para o frontend (Perfil)
    res.json({ 
        id: user.id_cliente, 
        nome: user.nome, 
        email: user.email,
        documento: user.documento,
        telefone: user.telefone,
        cep: user.cep,
        endereco: user.endereco,
        numero: user.numero,
        bairro: user.bairro,
        complemento: user.complemento,
        cidade_estado: user.cidade_estado
    });
  } catch (err) {
    console.error("Erro no login:", err);
    res.status(500).json({ error: "Erro ao autenticar" });
  }
});

// ⭐️ NOVA Rota para ATUALIZAR o cadastro COMPLETO (Usada na tela de Perfil)
app.put("/update_profile/:id_cliente", async (req, res) => {
  const { id_cliente } = req.params;
  const { nome, email, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado } = req.body;

  try {
    const query = `
      UPDATE cliente SET 
        nome = $1, 
        email = $2, 
        documento = $3, 
        telefone = $4, 
        cep = $5, 
        endereco = $6, 
        numero = $7, 
        bairro = $8, 
        complemento = $9, 
        cidade_estado = $10
      WHERE id_cliente = $11
      RETURNING id_cliente, nome, email, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado
    `;
    
    const result = await pool.query(query, 
      [nome, email, documento, telefone, cep, endereco, numero, bairro, complemento, cidade_estado, id_cliente]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Usuário não encontrado" });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error("Erro ao atualizar perfil:", err);
    res.status(500).json({ error: "Erro ao atualizar perfil" });
  }

  
});

// ⭐️ NOVA Rota para EXCLUIR a conta do cliente (Usada na tela de Perfil)
app.delete("/delete_account/:id_cliente", async (req, res) => {
  const { id_cliente } = req.params;

  try {
    // ⚠️ IMPORTANTE: Deleta primeiro todos os agendamentos do cliente
    // Se o agendamento tiver uma chave estrangeira, isso deve ser feito primeiro.
    await pool.query("DELETE FROM agendamento WHERE id_cliente = $1", [id_cliente]);
    
    // Deleta o cliente
    const result = await pool.query("DELETE FROM cliente WHERE id_cliente = $1 RETURNING id_cliente", [id_cliente]);

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Usuário não encontrado" });
    }

    res.json({ message: "Conta excluída com sucesso." });
  } catch (err) {
    console.error("Erro ao excluir conta:", err);
    res.status(500).json({ error: "Erro ao excluir conta" });
  }
});

// Rota para listar todos os serviços disponíveis (para o carrinho)
app.get("/services", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT id_servico, nome_servico, descricao_servico FROM servicos ORDER BY nome_servico"
    );
    res.json(result.rows);
  } catch (err) {
    console.error("Erro ao listar serviços:", err);
    res.status(500).json({ error: "Erro ao buscar serviços" });
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