package Lista3.src.br.com.leonardovieira.exercicio6;

public class Principal {
    public static void main(String[] args) {
        Pessoa pessoa = new Pessoa();
        pessoa.setNome("João");
        pessoa.setIdade(20);

        boolean podeTirarCNH = pessoa.verificarIdade();

        System.out.println("Nome: " + pessoa.getNome());
        System.out.println("Idade: " + pessoa.getIdade());
        System.out.println("Pode tirar CNH? " + podeTirarCNH);
    }
}

