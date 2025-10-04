interface Pessoa {
    nome: string;
    idade: number;
    email?: string;
}

const Pessoa: Pessoa = {
    nome: "Leonardo",
    idade: 21,
    email: "leleo@gmail.com"
}

console.log(Pessoa);
