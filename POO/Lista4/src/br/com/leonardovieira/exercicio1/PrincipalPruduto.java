package Lista4.src.br.com.leonardovieira.exercicio1;

public class PrincipalPruduto{

    public static void main(String[] args) {
        Produto produto = new Produto("Celular", 5000.00, 10);
        produto.exibirDetalhes();
        produto.vender(3);
        produto.exibirDetalhes();
        produto.reporEstoque(5);
        produto.exibirDetalhes();
    }
}