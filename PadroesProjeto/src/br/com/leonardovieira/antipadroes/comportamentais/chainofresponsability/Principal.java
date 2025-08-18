package br.com.guilhermevillaca.antipadroes.comportamentais.chainofresponsability;

/*
 * 🚨 Problemas no Antipadrão
❌ Código rígido: Qualquer mudança exige mexer diretamente na classe PagamentoProcessor.
❌ Dificuldade de manutenção: Adicionar novas regras torna o código ainda mais confuso.
❌ Baixa reutilização: As verificações são fixas, não podem ser reutilizadas separadamente.

Agora vamos corrigir isso usando o Chain of Responsibility! 🚀
 */
public class Principal {
    public static void main(String[] args) {
        PagamentoProcessor processor = new PagamentoProcessor();
        processor.processarPagamento("João", 300);
        processor.processarPagamento("Maria", 700);
    }
}