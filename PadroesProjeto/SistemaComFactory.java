interface Documento {
    void gerar(String conteudo);
}
class DocumentoPDF implements Documento {
    public void gerar(String conteudo) {
        System.out.println("Gerando PDF com o conteúdo: " + conteudo);
    }
}

class DocumentoWord implements Documento {
    public void gerar(String conteudo) {
        System.out.println("Gerando Word com o conteúdo: " + conteudo);
    }
}

class DocumentoExcel implements Documento {
    public void gerar(String conteudo) {
        System.out.println("Gerando Excel com o conteúdo: " + conteudo);
    }
}
abstract class DocumentoCreator {
    public abstract Documento criarDocumento();
}
class PDFCreator extends DocumentoCreator {
    public Documento criarDocumento() {
        return new DocumentoPDF();
    }
}

class WordCreator extends DocumentoCreator {
    public Documento criarDocumento() {
        return new DocumentoWord();
    }
}

class ExcelCreator extends DocumentoCreator {
    public Documento criarDocumento() {
        return new DocumentoExcel();
    }
}
public class SistemaComFactory {
    public static void main(String[] args) {
        DocumentoCreator creator;

        String tipo = "word"; 

        switch (tipo) {
            case "pdf":
                creator = new PDFCreator();
                break;
            case "word":
                creator = new WordCreator();
                break;
            case "excel":
                creator = new ExcelCreator();
                break;
            default:
                throw new IllegalArgumentException("Tipo de documento inválido.");
        }

        Documento doc = creator.criarDocumento();
        doc.gerar("Relatório de desempenho");
    }
}
