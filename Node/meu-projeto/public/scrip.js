function buscarProfessor(){

    var url = "/professor";

    fetch(url)
    .then((response) => response.json())
    .then((data) => {
        let div = document.querySelector('.professor');
        data.forEach(professor => {
            div.innerHTML += `
            <tr>
                    <th scope="row">${professor.id}</th>
                    <td>${professor.nome}</td>
                    <td>${professor.profissao}</td>
            </tr>
            `;
            console.log$(professor.nome + "tem a profissao" + professor.profissao);
        });
    })
    .catch((error) => {
        console.error(error);
    })
}