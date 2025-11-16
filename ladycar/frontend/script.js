const API_URL = "http://localhost:3000";

// ===================================
// FUNÇÕES DE EXIBIÇÃO DE TELA
// ===================================
function hideAllScreens() {
  document.querySelectorAll('.container, .app-screen').forEach(el => el.classList.add('hidden'));
}

function showLogin() {
  hideAllScreens();
  document.getElementById("loginScreen").classList.remove("hidden");
}

function showRegister() {
  hideAllScreens();
  document.getElementById("registerScreen").classList.remove("hidden");
}

function showMain() {
  hideAllScreens();
  document.getElementById("homeScreen").classList.remove("hidden");
}

function showServicos() {
  hideAllScreens();
  document.getElementById("servicosScreen").classList.remove("hidden");
  loadServicos();
}

// NOVO: Tela de Seleção de Serviços
function showAgendarSelection() {
  hideAllScreens();
  document.getElementById("agendarSelectionScreen").classList.remove("hidden");
}

// NOVO: Tela de Descrição do Serviço
function showServiceDescription(serviceName) {
    hideAllScreens();
    document.getElementById("serviceDescriptionScreen").classList.remove("hidden");
    
    // Preenche o nome do serviço e a descrição
    document.getElementById("serviceNameBox").textContent = serviceName;
    document.getElementById("serviceDescriptionText").textContent = `Você está prestes a agendar o serviço de "${serviceName}". Por favor, clique em "Selecionar Serviço" para continuar com a data e hora.`;
}


// ===================================
// 1. EVENTOS DE LOGIN/CADASTRO
// ===================================

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
      showMain(); // Leva para a Home/Manutenção
    } else {
      alert(data.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Cadastro (Não faz login automático)
document.getElementById("registerForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const nome = document.getElementById("registerNome").value;
  const email = document.getElementById("registerEmail").value;
  // AVISO: Seu server.js ATUAL não recebe 'documento'. Você deve alterá-lo.
  // const documento = document.getElementById("registerDocumento").value; 
  const senha = document.getElementById("registerSenha").value;
  
  // A confirmação de senha foi removida do HTML, mas a validação interna do JS deve ser removida se o campo for removido
  // const confirma = document.getElementById("registerConfirmaSenha").value; 
  // if (senha !== confirma) return alert("As senhas não coincidem!");

  try {
    const res = await fetch(`${API_URL}/register`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nome, email, senha }),
      // body: JSON.stringify({ nome, email, senha, documento }), // Usar este se o backend for atualizado
    });

    if (res.ok) {
      alert("Cadastro realizado com sucesso! Faça login para continuar.");
      showLogin(); // Vai para a tela de Login
    } else {
      const err = await res.json();
      alert(err.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Logout
document.getElementById("logoutBtn") && document.getElementById("logoutBtn").addEventListener("click", () => {
  localStorage.removeItem("user");
  showLogin();
});

// Troca de telas (Login/Cadastro)
document.getElementById("goToRegister").addEventListener("click", (e) => {
  e.preventDefault();
  showRegister();
});

document.getElementById("goToLogin").addEventListener("click", (e) => {
  e.preventDefault();
  showLogin();
});


// ===================================
// 2. LÓGICA DE AGENDAMENTO (NOVO FLUXO)
// ===================================

// 2.1 Botão "AGENDAR SERVIÇOS" na Home
document.getElementById("btnAgendar").addEventListener("click", showAgendarSelection);
document.getElementById("navAgendar") && document.getElementById("navAgendar").addEventListener("click", showAgendarSelection);


// 2.2 Seleção de Serviço (Leva para a descrição)
document.querySelectorAll(".service-list .service-button").forEach(button => {
    button.addEventListener("click", () => {
        const selectedService = button.getAttribute('data-service');
        showServiceDescription(selectedService);
    });
});

// 2.3 Botão "SELECIONAR SERVIÇO" na Descrição (Volta para a tela de agendamento original, mas com o serviço preenchido)
document.getElementById("selectServiceBtn").addEventListener("click", () => {
    const serviceName = document.getElementById("serviceNameBox").textContent;
    alert(`Serviço "${serviceName}" selecionado! Agora vamos para a tela de data/hora (A tela de Agendamento original deve ser adaptada para o novo fluxo).`);
    // NOTE: Se você tivesse uma tela de Agendamento final, você chamaria ela aqui:
    // showFinalAgendamento(serviceName);
    
    // Por enquanto, apenas volta para a Home
    showMain(); 
});

// 2.4 Voltar da Descrição para a Seleção
document.getElementById("voltarParaSelecao").addEventListener("click", showAgendarSelection);


// ===================================
// 3. LÓGICA DE SERVIÇOS REALIZADOS
// ===================================

document.getElementById("btnServicos").addEventListener("click", showServicos);

async function loadServicos() {
  const user = JSON.parse(localStorage.getItem("user"));
  const lista = document.getElementById("listaServicos");
  lista.innerHTML = "<p>Carregando...</p>";

  if (!user || !user.id) {
    lista.innerHTML = "<p>Faça login para ver seus serviços.</p>";
    return;
  }

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
}

// Voltar para home
document.getElementById("voltarHome2").addEventListener("click", showMain);

// Navegação pela barra inferior
document.querySelectorAll(".nav-home").forEach(el => el.addEventListener("click", showMain));
document.querySelectorAll(".nav-cart").forEach(el => el.addEventListener("click", showAgendarSelection));
// TODO: Adicionar lógica para outros ícones (Busca, Chat, Perfil)