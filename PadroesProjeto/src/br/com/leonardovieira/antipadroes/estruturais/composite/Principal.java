package br.com.guilhermevillaca.antipadroes.estruturais.composite;

// 🛑 Tentativa errada de calcular o preço total
/*
 * Problemas do Código Errado
Código rígido e difícil de expandir → Se quisermos adicionar outro nível de embalagem (ex: um "Palete" de fardos), precisamos criar uma nova classe.
Falta de estrutura genérica → Cada nível (Produto, Caixa, Fardo) tem seu próprio método de preço, forçando verificações manuais.
Dificuldade para novas operações → Se quisermos listar os produtos comprados, teríamos que escrever código separado para cada tipo de item.
 */
public class Principal {
    public static void main(String[] args) {
        Produto leite = new Produto("Leite 1L", 5.00);
        Caixa caixaDeLeite = new Caixa("Caixa de Leite", leite, 12);
        Fardo fardoDeLeite = new Fardo("Fardo de Leite", caixaDeLeite, 6);

        double total = leite.getPreco() + caixaDeLeite.getPreco() + fardoDeLeite.getPreco();
        System.out.println("Total da compra: R$" + total);
    }
}
