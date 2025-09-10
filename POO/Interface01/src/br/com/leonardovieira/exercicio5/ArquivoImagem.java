public class ArquivoImagem implements Arquivo{
    @Override
    public void abrir() {
        System.out.println("Abrindo arquivo de imagem...");
    }

    @Override
    public void ler() {
        System.out.println("Exibindo imagem na tela...");
    }

    @Override
    public void fechar() {
        System.out.println("Fechando arquivo de imagem.");
    }
}
