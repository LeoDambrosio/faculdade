const API_URL = "http://localhost:3000";

// Mostrar telas
function showLogin() {
  document.getElementById("loginScreen").classList.remove("hidden");
  document.getElementById("registerScreen").classList.add("hidden");
  document.getElementById("mainContent").classList.add("hidden");
}

function showRegister() {
  document.getElementById("loginScreen").classList.add("hidden");
  document.getElementById("registerScreen").classList.remove("hidden");
  document.getElementById("mainContent").classList.add("hidden");
}

function showMain() {
  document.getElementById("loginScreen").classList.add("hidden");
  document.getElementById("registerScreen").classList.add("hidden");
  document.getElementById("mainContent").classList.remove("hidden");
}

// Login
document.getElementById("loginForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const email = document.getElementById("loginEmail").value;
  const senha = document.getElementById("loginSenha").value;

  const res = await fetch(`${API_URL}/login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ email, senha }),
  });

  const data = await res.json();
  if (res.ok) {
    alert("Login realizado com sucesso!");
    localStorage.setItem("user", JSON.stringify(data));
    showMain();
  } else {
    alert(data.error);
  }
});

// Cadastro
document.getElementById("registerForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const nome = document.getElementById("registerNome").value;
  const email = document.getElementById("registerEmail").value;
  const senha = document.getElementById("registerSenha").value;
  const confirma = document.getElementById("registerConfirmaSenha").value;

  if (senha !== confirma) {
    alert("As senhas não coincidem!");
    return;
  }

  const res = await fetch(`${API_URL}/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ nome, email, senha }),
  });

  const data = await res.json();
  if (res.ok) {
    alert("Cadastro realizado com sucesso!");
    localStorage.setItem("user", JSON.stringify(data));
    showMain();
  } else {
    alert(data.error);
  }
});

// Trocar entre login e cadastro
document.getElementById("goToRegister").addEventListener("click", (e) => {
  e.preventDefault();
  showRegister();
});

document.getElementById("goToLogin").addEventListener("click", (e) => {
  e.preventDefault();
  showLogin();
});

// Logout
document.getElementById("logoutBtn").addEventListener("click", () => {
  localStorage.removeItem("user");
  showLogin();
});
