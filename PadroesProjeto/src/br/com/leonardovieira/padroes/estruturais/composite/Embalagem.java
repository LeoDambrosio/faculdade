package br.com.guilhermevillaca.padroes.estruturais.composite;

import java.util.ArrayList;
import java.util.List;

// 🏗️ Embalagem que pode conter produtos ou outras embalagens
public class Embalagem implements Item {
    private String nome;
    private List<Item> itens = new ArrayList<>();

    public Embalagem(String nome) {
        this.nome = nome;
    }

    public void adicionarItem(Item item) {
        itens.add(item);
    }

    @Override
    public double getPreco() {
        //return itens.stream().mapToDouble(Item::getPreco).sum();

        double total = 0;
        for (Item item : itens) {
            total += item.getPreco();
        }
        return total;
    }

    @Override
    public String getNome() {
        return nome;
    }

    public void listarItens() {
        System.out.println(nome + " contém:");
        for (Item item : itens) {
            System.out.println("  - " + item.getNome() + " (R$" + item.getPreco() + ")");
        }
    }
}