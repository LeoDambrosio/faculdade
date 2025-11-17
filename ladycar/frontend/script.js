const API_URL = "http://localhost:3000";

// ⭐️ NOVO: Variável global para guardar o serviço selecionado temporariamente (CRUCIAL PARA AGENDAMENTO)
let SELECTED_SERVICE = null; 

// ===================================
// FUNÇÕES DE EXIBIÇÃO DE TELA (Mantido)
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

function showAgendarSelection() {
  hideAllScreens();
  document.getElementById("agendarSelectionScreen").classList.remove("hidden");
  loadServices();
}

function showServiceDescription(serviceName) {
    // ⭐️ ATUALIZAÇÃO: Armazena o serviço selecionado globalmente
    SELECTED_SERVICE = serviceName;
    
    hideAllScreens();
    document.getElementById("serviceDescriptionScreen").classList.remove("hidden");
    
    document.getElementById("serviceNameBox").textContent = serviceName;
    document.getElementById("serviceDescriptionText").textContent = `Você está prestes a agendar o serviço de "${serviceName}". Por favor, clique em "Selecionar Serviço" para continuar com a data e hora.`;
}

// ⭐️ NOVO: Função para exibir a tela de Data/Hora (agendarScreen)
function showAgendarFinal() {
    if (!SELECTED_SERVICE) {
        alert("Nenhum serviço selecionado. Por favor, escolha um serviço primeiro.");
        return showAgendarSelection();
    }

    hideAllScreens();
    document.getElementById("agendarScreen").classList.remove("hidden");
    // Exibe o nome do serviço na tela de Data/Hora (assume ID 'agendandoServiceName' no index.html)
    document.getElementById("agendandoServiceName").textContent = `Serviço: ${SELECTED_SERVICE}`;
}


function showProfile() {
    hideAllScreens();
    document.getElementById("profileScreen").classList.remove("hidden");
    loadUserProfile();
}


// ===================================
// 1. EVENTOS DE LOGIN/CADASTRO (Mantido)
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
      showMain();
    } else {
      alert(data.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Cadastro Completo
document.getElementById("registerForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const nome = document.getElementById("registerNome").value;
  const email = document.getElementById("registerEmail").value;
  const documento = document.getElementById("registerDocumento").value; 
  const telefone = document.getElementById("registerTelefone").value;
  const cep = document.getElementById("registerCEP").value;
  const endereco = document.getElementById("registerEndereco").value;
  const numero = document.getElementById("registerNumero").value;
  const bairro = document.getElementById("registerBairro").value;
  const complemento = document.getElementById("registerComplemento").value;
  const cidade_estado = document.getElementById("registerCidadeEstado").value;
  const senha = document.getElementById("registerSenha").value;
  
  try {
    const res = await fetch(`${API_URL}/register`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ 
        nome, email, senha, documento, telefone, 
        cep, endereco, numero, bairro, complemento, cidade_estado 
      }),
    });

    if (res.ok) {
      alert("Cadastro realizado com sucesso! Faça login para continuar.");
      showLogin();
    } else {
      const err = await res.json();
      alert(err.error);
    }
  } catch (err) {
    alert("Erro ao conectar com o servidor");
    console.error(err);
  }
});

// Logout (Mantido)
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
// 2. LÓGICA DE PERFIL (EDIÇÃO DE CADASTRO E EXCLUSÃO)
// ===================================

function loadUserProfile() {
    const user = JSON.parse(localStorage.getItem("user"));
    
    if (!user) {
        alert("Sessão expirada. Faça login novamente.");
        showLogin();
        return;
    }
    
    document.getElementById("profileName").textContent = user.nome || "Usuário";
    
    document.getElementById("profileNomeInput").value = user.nome || "";
    document.getElementById("profileEmailInput").value = user.email || "";
    document.getElementById("profileDocumentoInput").value = user.documento || "";
    document.getElementById("profileTelefoneInput").value = user.telefone || "";
    document.getElementById("profileCEPInput").value = user.cep || "";
    document.getElementById("profileEnderecoInput").value = user.endereco || "";
    document.getElementById("profileNumeroInput").value = user.numero || "";
    document.getElementById("profileBairroInput").value = user.bairro || "";
    document.getElementById("profileComplementoInput").value = user.complemento || "";
    document.getElementById("profileCidadeEstadoInput").value = user.cidade_estado || "";
}

// Rota para atualizar o cadastro do usuário
document.getElementById("profileUpdateForm") && document.getElementById("profileUpdateForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user) return showLogin();

    const id_cliente = user.id;
    const nome = document.getElementById("profileNomeInput").value;
    const email = document.getElementById("profileEmailInput").value;
    const documento = document.getElementById("profileDocumentoInput").value;
    const telefone = document.getElementById("profileTelefoneInput").value;
    const cep = document.getElementById("profileCEPInput").value;
    const endereco = document.getElementById("profileEnderecoInput").value;
    const numero = document.getElementById("profileNumeroInput").value;
    const bairro = document.getElementById("profileBairroInput").value;
    const complemento = document.getElementById("profileComplementoInput").value;
    const cidade_estado = document.getElementById("profileCidadeEstadoInput").value;
    
    try {
        const res = await fetch(`${API_URL}/update_profile/${id_cliente}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ 
                nome, email, documento, telefone, 
                cep, endereco, numero, bairro, complemento, cidade_estado
            }),
        });

        const data = await res.json();

        if (res.ok) {
            alert("Cadastro atualizado com sucesso!");
            localStorage.setItem("user", JSON.stringify(data)); 
            loadUserProfile();
        } else {
            const data = await res.json(); // Reatribuído por segurança
            alert("Erro ao atualizar: " + data.error);
        }
    } catch (err) {
        alert("Erro ao conectar com o servidor para atualizar o perfil.");
        console.error(err);
    }
});

// ⭐️ FUNÇÃO: Excluir Conta
async function deleteAccount() {
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user || !user.id) return showLogin();

    if (!confirm("ATENÇÃO: Você tem certeza que deseja excluir sua conta? Esta ação é irreversível e removerá todos os seus dados e agendamentos.")) {
        return;
    }

    try {
        const res = await fetch(`${API_URL}/delete_account/${user.id}`, {
            method: "DELETE",
        });

        if (res.ok) {
            alert("Conta excluída com sucesso. Esperamos te ver de novo!");
            localStorage.removeItem("user");
            showLogin();
        } else {
            const data = await res.json();
            alert("Erro ao excluir conta: " + data.error);
        }
    } catch (err) {
        alert("Erro ao conectar com o servidor para exclusão.");
        console.error(err);
    }
}

// ⭐️ Evento para o botão de Excluir Conta
document.getElementById("deleteAccountBtn") && document.getElementById("deleteAccountBtn").addEventListener("click", deleteAccount);

// ⭐️ Evento para o botão Voltar para a Tela Inicial
document.getElementById("backToHomeBtn") && document.getElementById("backToHomeBtn").addEventListener("click", showMain);


// ===================================
// 3. LÓGICA DE AGENDAMENTO (FLUXO COMPLETO CORRIGIDO)
// ===================================

// ⭐️ CORREÇÃO PRINCIPAL: Evento para o botão "AGENDAR SERVIÇOS" na Home. (Se o ID for 'btnAgendar')
document.getElementById("btnAgendar") && document.getElementById("btnAgendar").addEventListener("click", showAgendarSelection); 
// ... (outros listeners)

// ⭐️ NOVO: Botão Voltar da Descrição de Serviço para a Lista de Serviços
document.getElementById("voltarParaSelecaoDeServicos") && document.getElementById("voltarParaSelecaoDeServicos").addEventListener("click", showAgendarSelection);

// ... (navegação pela barra inferior e botões)

// ⭐️ Lógica de Transição para a tela final de Agendamento
// Botão "SELECIONAR SERVIÇO" na Descrição (AGORA LEVA PARA A TELA FINAL)
document.getElementById("selectServiceBtn") && document.getElementById("selectServiceBtn").addEventListener("click", showAgendarFinal);

// Botão Voltar da Tela Final para a Descrição (ID 'voltarParaDescricao' no index.html)
document.getElementById("voltarParaDescricao") && document.getElementById("voltarParaDescricao").addEventListener("click", () => {
    // Retorna para a descrição do serviço, usando o serviço guardado
    showServiceDescription(SELECTED_SERVICE); 
});

// Confirmação e Envio do Agendamento (Lógica da tela final)
document.getElementById("finalAgendamentoForm") && document.getElementById("finalAgendamentoForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    
    const user = JSON.parse(localStorage.getItem("user"));
    if (!user || !user.id) {
        alert("Sessão expirada. Faça login novamente.");
        return showLogin();
    }
    
    if (!SELECTED_SERVICE) {
        alert("Erro: Serviço não definido.");
        return showAgendarSelection();
    }
    
    const id_cliente = user.id;
    const data = document.getElementById("agendarData").value;
    const hora = document.getElementById("agendarHora").value;
    const descricao = SELECTED_SERVICE;

    try {
        const res = await fetch(`${API_URL}/agendar`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ id_cliente, data, hora, descricao }),
        });

        if (res.ok) {
            alert(`Agendamento de "${descricao}" para ${data} às ${hora} CONFIRMADO!`);
            SELECTED_SERVICE = null; // Limpa o serviço após o sucesso
            showServicos(); // Leva para a tela de serviços realizados
        } else {
            const err = await res.json();
            alert("Erro ao agendar: " + err.error);
        }
    } catch (err) {
        alert("Erro ao conectar com o servidor para agendamento.");
        console.error(err);
    }
});


// ===================================
// 4. LÓGICA DE SERVIÇOS E NAVEGAÇÃO (Mantido)
// ===================================

async function loadServices() {
    // ... (restante da função loadServices)
    const serviceListDiv = document.getElementById("agendarSelectionScreen").querySelector(".service-list");
    serviceListDiv.innerHTML = "<p>Carregando serviços...</p>";

    try {
        const res = await fetch(`${API_URL}/services`);
        const services = await res.json();

        if (res.ok && services.length > 0) {
            serviceListDiv.innerHTML = "";
            
            services.forEach(service => {
                const button = document.createElement("button");
                button.classList.add("service-button");
                button.setAttribute("data-service", service.nome_servico);
                button.textContent = service.nome_servico.toUpperCase();
                
                button.addEventListener("click", () => {
                    showServiceDescription(service.nome_servico);
                });

                serviceListDiv.appendChild(button);
            });
        } else {
            serviceListDiv.innerHTML = "<p>Nenhum serviço disponível no momento.</p>";
        }

    } catch (err) {
        serviceListDiv.innerHTML = "<p>Erro ao carregar serviços do servidor.</p>";
        console.error(err);
    }
}

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
          const dataFormatada = new Date(ag.data).toLocaleDateString('pt-BR', {timeZone: 'UTC'}); 
          
          div.innerHTML = `
            <p><strong>Data:</strong> ${dataFormatada}</p>
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

// Navegação pela barra inferior e botões
document.getElementById("voltarHome2").addEventListener("click", showMain);
document.querySelectorAll(".nav-home").forEach(el => el.addEventListener("click", showMain));
document.querySelectorAll(".nav-cart").forEach(el => el.addEventListener("click", showAgendarSelection));
document.querySelectorAll(".nav-profile").forEach(el => el.addEventListener("click", showProfile));