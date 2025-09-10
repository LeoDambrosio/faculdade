public class Cachorro implements Animal {
     @Override
    public void emitirSom(){
        System.out.println("O cachorro late");
    }

    @Override 
    public void mover(){
        System.out.println("O cachorro está correndo");
    }

}
