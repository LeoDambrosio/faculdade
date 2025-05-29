import java.util.ArrayList;
import java.util.List;

public class SimpleList<T> {
    private List<T> list;

    public SimpleList() {
        this.list = new ArrayList<>();
    }

    public void add(T item) {
        list.add(item);
    }

    public T get(int index) {
        if (index < 0 || index >= list.size()) {
            throw new IndexOutOfBoundsException("Índice inválido: " + index);
        }
        return list.get(index);
    }

    public int size() {
        return list.size();
    }
}