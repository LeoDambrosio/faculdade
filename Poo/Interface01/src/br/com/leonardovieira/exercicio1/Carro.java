public class Carro implements Veiculo{

    @Override
    public void acelerar(){
        System.out.println("O carro está acelerando.");
    }

    @Override
    public void frear(){
        System.out.println("O carro está freando.");
    }

    @Override
    public void virar(String direcao){
        System.out.println("O carro está virando" + direcao+ ".");
    }

}
