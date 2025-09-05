//const cowsay = require('cowsay');

/**console.log(
    cowsay.think(
        {
            text: "Oi, eu sou uma vaquinha",
            e: "OO",
            T: "X"
        }
    )
);*/

///////////////////////////////////////////////////////////////////////

//const chalk = require('chalk');
//import chalk from 'chalk';

/*console.log(chalk.blue('Texto azul'));
console.log(chalk.green.bold('Texto verde em negrito'));
console.log(chalk.red.bgYellow('Erro!'));*/

/////////////////////////////////////////////////////////////////////

/*const axios = require('axios');
axios.get('https://viacep.com.br/ws/85814530/json/')
 .then(res => console.log(res.data))
 .catch(err => console.error(err));*/

/////////////////////////////////////////////////////////////////////

/*const dayjs = require('dayjs');
console.log(dayjs().startOf('month').add(1, 'day').set('year', 2018).format('YYYY-MM-DD HH:mm:ss'));*/

///////////////////////////////////////////////////////////////////////

/*const _ = require('lodash');
const numeros = [1, 2, 3, 4, 5];
console.log(_.shuffle(numeros)); // embaralha
console.log(_.sum(numeros)); // soma tudo*/

////////////////////////////////////////////////////////////////////

/*const figlet = require('figlet');
figlet('Hello World!', (err, data) => {
 if (!err) console.log(data);
});*/

//////////////////////////////////////////////////////////////////////

/*const { faker } = require('@faker-js/faker');
console.log(faker.person.fullName());
console.log(faker.internet.email());
console.log(faker.location.city());*/

////////////////////////////////////////////////////////////////////////

/*const axios = require("axios");
axios.get("https://viacep.com.br/ws/01001000/json/")
 .then(res => console.log(res.data))
 .catch(err => console.error(err));*/

/////////////////////////////////////////////////////////////////////

/*fetch("https://viacep.com.br/ws/01001000/json/")
 .then(res => res.json())
 .then(data => console.log(data))
 .catch(err => console.error(err));*/

///////////////////////////////////////////////////////////////////

/*const axios = require("axios");
axios.get("https://viacep.com.br/ws/01001000/json/", {
 timeout: 1000 // tempo máximo em milissegundos (1 segundo)
})
.then(res => {
 console.log("Endereço encontrado:");
 console.log(res.data);
})
.catch(err => {
 if (err.code === 'ECONNABORTED') {
 console.error("Erro: a requisição demorou mais que o tempo limite definido!");
 } else {
 console.error("Erro na requisição:", err.message);
 }
});*/

////////////////////////////////////////////////////////////////////

/*Fetch: já vem no JavaScript, bom para projetos simples e quando você não quer instalar dependências extras. Ideal para requisições básicas.
Axios: biblioteca externa, ótima para projetos médios/grandes. Facilita interceptar requisições, lidar com erros, usar baseURL, timeout e autenticação.*/

