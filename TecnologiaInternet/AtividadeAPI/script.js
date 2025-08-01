async function buscarCachorro() {
  const resultadoDiv = document.getElementById("resultado");
  resultadoDiv.innerHTML = "Carregando...";

  try {
    const response = await fetch("https://dog.ceo/api/breeds/image/random");
    const data = await response.json();

    resultadoDiv.innerHTML = `
      <img src="${data.message}" alt="Cachorro fofo">
    `;
  } catch (error) {
    resultadoDiv.innerHTML = "<p style='color:red;'>Erro ao buscar imagem.</p>";
    console.error("Erro:", error);
  }
}
