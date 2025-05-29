public class TestSimpleList {
    
    public static void main(String[] args) {
        SimpleList<String> stringList = new SimpleList<>();

        stringList.add("Java");
        stringList.add("Python");
        stringList.add("JavaScript");
        stringList.add("C#");
        stringList.add("Kotlin");

        System.out.println("Elementos na lista:");
        for (int i = 0; i < stringList.size(); i++) {
            System.out.println("Índice " + i + ": " + stringList.get(i));
        }

        System.out.println("\nTamanho da lista: " + stringList.size());

        SimpleList<Integer> integerList = new SimpleList<>();
        integerList.add(10);
        integerList.add(20);
        integerList.add(30);

        System.out.println("\nLista de inteiros:");
        for (int i = 0; i < integerList.size(); i++) {
            System.out.println(integerList.get(i));
        }
    }
}