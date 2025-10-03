"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Tipos = void 0;
class Tipos {
    nome;
    idade;
    maiorIdade;
    notas;
    constructor(nome, idade, maiorIdade, notas) {
        this.nome = nome;
        this.idade = idade;
        this.maiorIdade = maiorIdade;
        this.notas = notas;
    }
    mostrarDados() {
        console.log("Nome: " + this.nome);
        console.log("Idade: " + this.idade);
        console.log("Maior de idade: " + this.maiorIdade);
        console.log("Notas: " + this.notas);
    }
}
exports.Tipos = Tipos;
//# sourceMappingURL=Exercicio1.js.map