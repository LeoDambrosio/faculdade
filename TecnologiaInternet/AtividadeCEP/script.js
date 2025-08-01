async function buscarCEP() {
  const cepInput = document.getElementById("cep");
  const cep = cepInput.value.replace(/\D/g, ""); // remove caracteres não numéricos
  const resultadoDiv = document.getElementById("resultado");

  resultadoDiv.innerHTML = ""; // limpa resultado anterior

  if (cep.length !== 8 || isNaN(cep)) {
    resultadoDiv.innerHTML = `<p style="color: red;">CEP inválido. Digite 8 números.</p>`;
    return;
  }

  try {
    const response = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
    const data = await response.json();

    if (data.erro) {
      resultadoDiv.innerHTML = `<p style="color: red;">CEP não encontrado.</p>`;
      return;
    }

    resultadoDiv.innerHTML = `
      <p><strong>Logradouro:</strong> ${data.logradouro}</p>
      <p><strong>Bairro:</strong> ${data.bairro}</p>
      <p><strong>Cidade:</strong> ${data.localidade}</p>
      <p><strong>Estado:</strong> ${data.uf}</p>
    `;
  } catch (error) {
    resultadoDiv.innerHTML = `<p style="color: red;">Erro ao buscar o CEP. Tente novamente mais tarde.</p>`;
    console.error("Erro ao buscar CEP:", error);
  }
}
