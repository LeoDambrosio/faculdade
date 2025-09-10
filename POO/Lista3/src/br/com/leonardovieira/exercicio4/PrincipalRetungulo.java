package Lista3.src.br.com.leonardovieira.exercicio4;

public class PrincipalRetungulo {
    public static void main(String[] args) {
        Retangulo ret = new Retangulo(5, 10);
        System.out.println("Area: " + ret.calcularArea());
        System.out.println("Perimetro: " + ret.calcularPerimetro());
    }
}
