package Lista3.src.br.com.leonardovieira.exercicio1;

public class PrincipalCarro {
    public static void main(String[] args) {
        Carro carro1 = new Carro();

        carro1.marca = "Volkswagen";
        carro1.modelo = "PassatCC";
        carro1.ano = 2018;

        carro1.exibirInformacoes();
    }
}

