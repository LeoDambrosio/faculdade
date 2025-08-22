function buscarProfessor(){

    var url = "/professor";

    fetch(url)
    .then((response) => response.json())
    .then((data) => {
        let div = document.querySelector('.professor');
        data.forEach(professor => {
            div.innerHTML += `
               <p>${professor.nome} tem a profissao ${professor.profissao}</p>
            `;
            console.log(buscarProfessor.nome + " tem a profissao: " + professor.profissao);
        });
    })
    .catch((error) => {
        console.error(error);
    })
}