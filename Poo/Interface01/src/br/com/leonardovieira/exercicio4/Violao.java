public class Violao implements InstrumentoMusical {
     @Override
    public void tocar() {
        System.out.println("Tocando violão: dedilhando as cordas.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando o violão: ajustando as tarraxas.");
    }
}
