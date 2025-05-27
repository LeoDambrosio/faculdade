public class Bicicleta implements Veiculo {

    @Override
    public void acelerar(){
        System.out.println("A bicicleta está acelerando.");
    }

    @Override
    public void frear(){
        System.out.println("A bicicleta está freando.");
    }

    @Override
    public void virar(String direcao){
        System.out.println("A bicicleta está virando" +direcao+ ".");
    }

}
