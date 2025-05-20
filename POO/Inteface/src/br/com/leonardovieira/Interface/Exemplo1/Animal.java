public class Animal implements SerVivo{
     public Animal() {
    }

    @Override
    public void mover() {
        System.out.println("movendo");
    }

    @Override
    public void comer(int massa) {
        System.out.println("comendo");
    }

    @Override
    public void info() {
        System.out.println("info");
    }
}
