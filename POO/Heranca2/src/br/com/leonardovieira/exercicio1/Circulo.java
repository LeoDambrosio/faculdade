public class Circulo extends Forma {
    double raio;

    public Circulo(double raio) {
        this.raio = raio;
    }
    
    @Override
    public double calcularArea(){
        return 3.14 * raio * raio;
    }

    @Override
    public String toString(){
        return "Circulo com raio " + raio + " - Area: " + calcularArea();
    }
}
