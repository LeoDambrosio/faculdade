public class Main1 {
    public static void main(String[] args) {
        Engenheiro eng = new Engenheiro(8500.00);
        Vendedor vend = new Vendedor(4500.00);
        
        System.out.println("=== Engenheiro ===");
        eng.trabalhar();
        eng.descansar();
        eng.analisarProjeto();
        System.out.println("Salário: R$" + eng.getSalario());
        
        System.out.println("\n=== Vendedor ===");
        vend.trabalhar();
        vend.descansar();
        vend.fazerDemonstracao();
        System.out.println("Salário: R$" + vend.getSalario());
        
        System.out.println("\n=== Trabalhadores (polimorfismo) ===");
        Trabalhador[] trabalhadores = {eng, vend};
        
        for (Trabalhador t : trabalhadores) {
            t.trabalhar();
            t.descansar();
            System.out.println("---");
        }
    }
}

