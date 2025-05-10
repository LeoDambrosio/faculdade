public class Retangulo extends Forma {
    double lado1, lado2;

    public Retangulo(double lado1, double lado2){
        this.lado1 = lado1;
        this.lado2 = lado2;
    }

    @Override
    public double calcularArea(){
        return lado1 * lado2;
    }

    @Override
    public string toString(){
        return "Retangulo com Lados" + lado1 + "e" + lado2 + "- Area: " + calcularArea();
    }
}
