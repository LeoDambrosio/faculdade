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

public class SistemaSemFactory {
    public static void main(String[] args) {
        String tipo = "pdf"; 

        Documento doc;

        if (tipo.equals("pdf")) {
            doc = new DocumentoPDF();
        } else if (tipo.equals("word")) {
            doc = new DocumentoWord();
        } else if (tipo.equals("excel")) {
            doc = new DocumentoExcel();
        } else {
            throw new IllegalArgumentException("Tipo de documento inválido.");
        }

        doc.gerar("Relatório de vendas");
    }
}
