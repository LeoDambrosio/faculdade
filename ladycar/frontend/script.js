const API_URL = "http://localhost:3000";

// Array de todas as telas principais para facilitar o gerenciamento de visibilidade
const ALL_SCREENS = [
    "loginScreen",
    "registerScreen",
    "homeScreen",
    "agendarScreen", // AGORA É O FORMULÁRIO ÚNICO
    "servicosScreen",
    "profileScreen"
];

// Função unificada para esconder todas as telas
function hideAllScreens() {
    ALL_SCREENS.forEach(id => {
        const screen = document.getElementById(id);
        if (screen) {
            screen.classList.add("hidden");
        }
    });
    // Remove o estado 'active' de todos os itens de navegação
    document.querySelectorAll(".nav-item").forEach(el => el.classList.remove("active"));
}

// Funções para mostrar telas
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
    // Garante que o ícone Home fique ativo ao mostrar a Home
    document.querySelector(".nav-home").classList.add("active"); 
}

// CORRIGIDO: Exibir Tela de Agendamento (FORMULÁRIO ÚNICO)
function showAgendar() {
    hideAllScreens();
    document.getElementById("agendarScreen").classList.remove("hidden");
    document.querySelector("#agendarScreen .nav-home").classList.add("active");
}

// Exibir Tela de Serviços Realizados
async function showServicos() {
    hideAllScreens();
    document.getElementById("servicosScreen").classList.remove("hidden");
    document.querySelector("#servicosScreen .nav-home").classList.add("active"); // Mantém o Home como ativo na barra

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
}

// Exibir Tela de Perfil e carregar dados
function showProfile() {
    hideAllScreens();
    document.getElementById("profileScreen").classList.remove("hidden");
    document.querySelector(".nav-profile").classList.add("active");
    loadProfileData(); 
}

// Função para carregar dados do perfil (simulação)
function loadProfileData() {
    const user = JSON.parse(localStorage.getItem("user"));

    if (user) {
        // Preenche os campos com os dados existentes
        document.getElementById("profileNome").value = user.nome || '';
        document.getElementById("profileEmail").value = user.email || '';
        
        // Simulação de outros dados (você deve buscar esses dados do backend)
        document.getElementById("profileTelefone").value = user.telefone || '';
        document.getElementById("profileCep").value = user.cep || '';
        document.getElementById("profileEndereco").value = user.endereco || '';
        document.getElementById("profileBairro").value = user.bairro || '';
        document.getElementById("profileComplemento").value = user.complemento || '';
        document.getElementById("profileCidadeEstado").value = user.cidadeEstado || '';
    }
}


// INÍCIO DA LÓGICA DE EVENTOS

// 1. LOGIN
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

// 2. CADASTRO
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

// 3. LOGOUT
document.getElementById("logoutBtn").addEventListener("click", () => {
    localStorage.removeItem("user");
    showLogin();
});

// 4. TROCA DE TELA INICIAL (Login/Cadastro)
document.getElementById("goToRegister").addEventListener("click", (e) => {
    e.preventDefault();
    showRegister();
});

document.getElementById("goToLogin").addEventListener("click", (e) => {
    e.preventDefault();
    showLogin();
});

// 5. BOTÕES DA HOME (Agendar e Serviços Realizados)
document.getElementById("btnAgendar").addEventListener("click", showAgendar);
document.getElementById("btnServicos").addEventListener("click", showServicos);

// 6. BARRA DE NAVEGAÇÃO INFERIOR (TODOS os botões)
document.querySelectorAll(".nav-home").forEach(el => el.addEventListener("click", showMain));
document.querySelectorAll(".nav-profile").forEach(el => el.addEventListener("click", showProfile));

// Adicione aqui a lógica para os outros botões da nav (Search, Cart, Chat) se necessário
document.querySelectorAll(".nav-search, .nav-cart, .nav-chat").forEach(el => el.addEventListener("click", (e) => {
    e.preventDefault();
    alert("Função em desenvolvimento.");
}));


// 7. CRIAR AGENDAMENTO (RESTAURADO PARA FORMULÁRIO ÚNICO)
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

// 8. LÓGICA DO PERFIL (Alterar Dados)
document.getElementById("profileForm").addEventListener("submit", (e) => {
    e.preventDefault();
    
    // Simulação de coleta de dados atualizados
    const nome = document.getElementById("profileNome").value;
    const telefone = document.getElementById("profileTelefone").value;
    const cep = document.getElementById("profileCep").value;
    
    // Simulação de atualização no localStorage (para persistência de nome na home, se necessário)
    const user = JSON.parse(localStorage.getItem("user"));
    user.nome = nome;
    user.telefone = telefone;
    user.cep = cep;
    // ... atualize todos os campos
    localStorage.setItem("user", JSON.stringify(user));

    alert(`Dados atualizados (Apenas simulação): Nome: ${nome}`);
    
    // Retorna para a Home após a alteração
    showMain(); 
});


// 9. LÓGICA DO PERFIL (Excluir Conta)
document.getElementById("excluirContaBtn").addEventListener("click", () => {
    if (confirm("Tem certeza que deseja EXCLUIR sua conta? Esta ação é irreversível.")) {
        // ATENÇÃO: Aqui você faria uma chamada API DELETE para o backend para excluir a conta
        localStorage.removeItem("user");
        alert("Conta excluída com sucesso.");
        showLogin();
    }
});

// Inicia no Login se não houver usuário logado
if (localStorage.getItem("user")) {
    showMain();
} else {
    showLogin();
}