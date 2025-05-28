public class App {
    public static void main(String[] args) {
        Par<String, Double> aluno = new Par<>("Ana", 9.5);
        Par<Integer, String> funcionario = new Par<>(101, "Carlos");
        Par<Float, Float> coordenadas = new Par<>(12.5f, 8.7f);
        Par<Boolean, String> status = new Par<>(true, "Operação bem-sucedida");
        Par<Character, Integer> letraNumero = new Par<>('A', 1);

        System.out.println("Aluno: " + aluno);
        System.out.println("Funcionário: " + funcionario);
        System.out.println("Coordenadas: " + coordenadas);
        System.out.println("Status: " + status);
        System.out.println("Letra e Número: " + letraNumero);
    }
}
