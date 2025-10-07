const API_URL = "http://localhost:3000";

// Funções para mostrar telas
function showLogin() {
  document.getElementById("loginScreen").classList.remove("hidden");
  document.getElementById("registerScreen").classList.add("hidden");
  document.getElementById("homeScreen").classList.add("hidden");
  document.getElementById("agendarScreen").classList.add("hidden");
  document.getElementById("servicosScreen").classList.add("hidden");
}

function showRegister() {
  document.getElementById("loginScreen").classList.add("hidden");
  document.getElementById("registerScreen").classList.remove("hidden");
  document.getElementById("homeScreen").classList.add("hidden");
  document.getElementById("agendarScreen").classList.add("hidden");
  document.getElementById("servicosScreen").classList.add("hidden");
}

function showMain() {
  document.getElementById("loginScreen").classList.add("hidden");
  document.getElementById("registerScreen").classList.add("hidden");
  document.getElementById("homeScreen").classList.remove("hidden");
  document.getElementById("agendarScreen").classList.add("hidden");
  document.getElementById("servicosScreen").classList.add("hidden");
}

// Login
document.getElementById("loginForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const email = document.getElementById("loginEmail").value;
  const senha = document.getElementById("loginSenha").value;

  try {
    const res = await fetch(`${API_URL}/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, senha }),
    });

    const data = await res.json();

    if (res.ok) {
      localStorage.setItem("user", JSON.stringify(data));
      showMain();
    } else {
      alert(data.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Cadastro
document.getElementById("registerForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const nome = document.getElementById("registerNome").value;
  const email = document.getElementById("registerEmail").value;
  const senha = document.getElementById("registerSenha").value;
  const confirma = document.getElementById("registerConfirmaSenha").value;

  if (senha !== confirma) return alert("As senhas não coincidem!");

  try {
    const res = await fetch(`${API_URL}/register`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nome, email, senha }),
    });

    const data = await res.json();

    if (res.ok) {
      localStorage.setItem("user", JSON.stringify(data));
      showMain();
    } else {
      alert(data.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Logout
document.getElementById("logoutBtn").addEventListener("click", () => {
  localStorage.removeItem("user");
  showLogin();
});

// Trocar telas
document.getElementById("goToRegister").addEventListener("click", (e) => {
  e.preventDefault();
  showRegister();
});

document.getElementById("goToLogin").addEventListener("click", (e) => {
  e.preventDefault();
  showLogin();
});

// Abrir telas da home
document.getElementById("btnAgendar").addEventListener("click", () => {
  document.getElementById("homeScreen").classList.add("hidden");
  document.getElementById("agendarScreen").classList.remove("hidden");
});

document.getElementById("btnServicos").addEventListener("click", async () => {
  document.getElementById("homeScreen").classList.add("hidden");
  document.getElementById("servicosScreen").classList.remove("hidden");

  const user = JSON.parse(localStorage.getItem("user"));
  const lista = document.getElementById("listaServicos");
  lista.innerHTML = "<p>Carregando...</p>";

  try {
    const res = await fetch(`${API_URL}/agendamentos/${user.id}`);
    const data = await res.json();

    if (res.ok) {
      if (data.length === 0) {
        lista.innerHTML = "<p>Ainda não há serviços cadastrados.</p>";
      } else {
        lista.innerHTML = "";
        data.forEach((ag) => {
          const div = document.createElement("div");
          div.classList.add("servico-item");
          div.innerHTML = `
            <p><strong>Data:</strong> ${ag.data}</p>
            <p><strong>Hora:</strong> ${ag.hora}</p>
            <p><strong>Serviço:</strong> ${ag.descricao}</p>
            <hr>
          `;
          lista.appendChild(div);
        });
      }
    } else {
      lista.innerHTML = "<p>Erro ao carregar serviços.</p>";
    }
  } catch (err) {
    lista.innerHTML = "<p>Erro ao conectar com o servidor.</p>";
    console.error(err);
  }
});

// Voltar para home
document.getElementById("voltarHome1").addEventListener("click", showMain);
document.getElementById("voltarHome2").addEventListener("click", showMain);

// Criar agendamento
document.getElementById("agendarForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const user = JSON.parse(localStorage.getItem("user"));

  const data = document.getElementById("dataAgendamento").value;
  const hora = document.getElementById("horaAgendamento").value;
  const descricao = document.getElementById("descricaoServico").value;

  try {
    const res = await fetch(`${API_URL}/agendar`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id_cliente: user.id,
        data,
        hora,
        descricao
      }),
    });

    if (res.ok) {
      alert("Agendamento criado!");
      showMain();
    } else {
      const err = await res.json();
      alert(err.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});
