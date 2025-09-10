public class ArquivoTexto implements Arquivo{
    @Override
    public void abrir() {
        System.out.println("Abrindo arquivo de texto...");
    }

    @Override
    public void ler() {
        System.out.println("Lendo conteúdo do arquivo de texto...");
    }

    @Override
    public void fechar() {
        System.out.println("Fechando arquivo de texto.");
    }
}
