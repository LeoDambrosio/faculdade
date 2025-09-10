public class Flauta implements InstrumentoMusical{
    @Override
    public void tocar() {
        System.out.println("Tocando flauta: soprando pelas aberturas.");
    }

    @Override
    public void afinar() {
        System.out.println("Afinando a flauta: ajustando a posição do bocal.");
    }
}
