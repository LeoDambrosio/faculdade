import java.util.ArrayList;
import java.util.List;

public class SimpleList<T> {
    private List<T> lista;

    public SimpleList() {
        lista = new ArrayList<>();
    }

    public void add(T item) {
        lista.add(item);
    }

    public T get(int index) {
        return lista.get(index);
    }

    public int size() {
        return lista.size();
    }
}

