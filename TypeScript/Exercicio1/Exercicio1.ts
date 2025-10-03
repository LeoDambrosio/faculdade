export class Tipos {
    nome: string;
    idade: number;
    maiorIdade: boolean;
    notas: number[];

    constructor(nome: string, idade: number, maiorIdade: boolean, notas: number[]){
        this.nome = nome;
        this.idade = idade;
        this.maiorIdade = maiorIdade;
        this.notas = notas;
    }
    
    mostrarDados ():void {
        console.log("Nome: " + this.nome);
        console.log("Idade: " + this.idade);
        console.log("Maior de idade: " + this.maiorIdade);
        console.log("Notas: " + this.notas);
    }
}