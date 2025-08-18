package br.com.guilhermevillaca.antipadroes.comportamentais.interpreter;

/*
 * 🚨 Problemas no Antipadrão
❌ Difícil de expandir: Se quisermos adicionar novos operadores (*, /), precisamos modificar o código, quebrando o princípio aberto/fechado.
❌ Baixa flexibilidade: O código só entende expressões fixas de três partes (num operador num).
❌ Código rígido: Se quisermos interpretar expressões mais complexas, o código precisará de muitos if-else.
 */
public class Principal {

    public static void main(String[] args) {
        Interpretador interpretador = new Interpretador();
        System.out.println(interpretador.interpretar("10 + 5")); // 15
        System.out.println(interpretador.interpretar("20 - 8")); // 12
    }

}
