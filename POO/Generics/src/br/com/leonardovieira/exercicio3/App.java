public class App{

    public static void main(String[] args) {
        Par<String, Double> aluno = new Par<>("João Silva", 8.5);
        System.out.println("Aluno: " + aluno);
        Par<Integer, String> funcionario = new Par<>(1234, "Maria Souza");
        System.out.println("Funcionário: " + funcionario);
        Par<Float, Float> coordenadas = new Par<>(12.5f, 8.3f);
        System.out.println("Coordenadas: " + coordenadas);
        Par<Boolean, String> status = new Par<>(true, "Operação concluída com sucesso");
        System.out.println("Status: " + status);
        Par<Character, Integer> letraNumero = new Par<>('A', 65);
        System.out.println("Letra e código ASCII: " + letraNumero);
        System.out.println("\nExemplos de uso dos métodos get:");
        System.out.println("Nome do aluno: " + aluno.getPrimeiro());
        System.out.println("Código do funcionário: " + funcionario.getPrimeiro());
        System.out.println("Coordenada Y: " + coordenadas.getSegundo());
        System.out.println("Mensagem de status: " + status.getSegundo());
        System.out.println("Código ASCII da letra: " + letraNumero.getSegundo());
    }
}
