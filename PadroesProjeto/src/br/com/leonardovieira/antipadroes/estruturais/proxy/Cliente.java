package br.com.guilhermevillaca.antipadroes.estruturais.proxy;

/*
 * Problemas:
🔴 Cada transação vai direto para o banco, sem verificações preliminares.
🔴 Se o cliente não tiver saldo ou o cartão estiver inativo, o processamento será desperdiçado.
🔴 O sistema fica menos eficiente e pode sobrecarregar o banco.
 */
public class Cliente {

    public static void main(String[] args) {
        Banco banco = new Banco();
        banco.processarPagamento("João", 500.00);
        banco.processarPagamento("Maria", 1200.00);
    }

}
