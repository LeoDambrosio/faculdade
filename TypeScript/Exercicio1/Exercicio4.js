var Produto = /** @class */ (function () {
    function Produto(nome, preco) {
        this.nome = nome;
        this.preco = preco;
    }
    Produto.prototype.desconto = function (percentual) {
        return this.preco - (this.preco * percentual) / 100;
    };
    return Produto;
}());
var p1 = new Produto("Notebook", 3000);
console.log("Pre\u00E7o original do ".concat(p1.nome, ": R$ ").concat(p1.preco));
console.log("Com 10% de desconto: R$ ".concat(p1.desconto(10)));
console.log("Com 25% de desconto: R$ ".concat(p1.desconto(25)));
