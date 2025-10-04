class Produto {
    nome: string;
    preco: number;

    constructor(nome: string, preco: number){
        this.nome = nome;
        this.preco = preco;
    }

    desconto(percentual: number): number {
        return this.preco - (this.preco * percentual) / 100;
    }
}

const p1 = new Produto("Notebook", 3000);

console.log(`Preço original do ${p1.nome}: R$ ${p1.preco}`);
console.log(`Com 10% de desconto: R$ ${p1.desconto(10)}`);
console.log(`Com 25% de desconto: R$ ${p1.desconto(25)}`);
