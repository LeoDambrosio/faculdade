public class Piano implements InstrumentoMusical{
    @Override
    public void tocar() {
        System.out.println("Tocando piano: pressionando as teclas.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando o piano: ajustando a tensão das cordas internas.");
    }
}
