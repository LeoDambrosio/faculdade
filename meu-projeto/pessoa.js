function buscarPessoas() {
    var url = '/pessoa';
    fetch(url)
    .then((response) => response.json())
    .then((data) => {
        console.log(data);
        let div = document.querySelector('.table-pessoa'); // selecione corretamente
        div.innerHTML = ""; // limpa a tabela antes de inserir

        data.forEach(pessoa => {
            div.innerHTML += `
                <tr>
                    <td>${pessoa.id}</td>
                       <td>${pessoa.nome}</td>
                    <td>
                        <button onclick="editar(${pessoa.id})">Editar</button>
                        <button onclick="excluir(${pessoa.id})">Excluir</button>
                    </td>            
                </tr>
            `;
        });
    })
    .catch((error) => {
        console.error(error);
    });
}
