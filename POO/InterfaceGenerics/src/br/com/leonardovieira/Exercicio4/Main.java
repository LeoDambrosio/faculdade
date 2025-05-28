public class Main {
    public static void main(String[] args) {
        SimpleList<String> listaDeNomes = new SimpleList<>();

        listaDeNomes.add("Ana");
        listaDeNomes.add("Bruno");
        listaDeNomes.add("Carlos");

        System.out.println("Elementos da lista:");
        for (int i = 0; i < listaDeNomes.size(); i++) {
            System.out.println("- " + listaDeNomes.get(i));
        }

        System.out.println("Tamanho da lista: " + listaDeNomes.size());
    }
}
