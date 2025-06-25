import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Criando uma coleção de arquivos
        List<Arquivo> arquivos = new ArrayList<>();

        arquivos.add(new ArquivoTexto());
        arquivos.add(new ArquivoImagem());
        arquivos.add(new ArquivoAudio());

        // Iterando sobre a lista
        for (Arquivo arquivo : arquivos) {
            arquivo.abrir();
            arquivo.ler();
            arquivo.fechar();
            System.out.println("-----------");
        }
    }
}
