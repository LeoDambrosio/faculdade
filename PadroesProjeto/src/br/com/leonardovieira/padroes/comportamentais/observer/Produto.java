package br.com.leonardovieira.padroes.comportamentais.observer;

import java.util.ArrayList;
import java.util.List;

public class Produto implements Subject {

    private String nome;
    private int quantidade;
    private List<Observer> observadores;

    public Produto(String nome, int quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
        this.observadores = new ArrayList<>();
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
        notificarObservadores();
    }

    public String getNome() {
        return nome;
    }

    public int getQuantidade() {
        return quantidade;
    }

    @Override
    public void adicionarObservador(Observer observador) {
        observadores.add(observador);
    }

    @Override
    public void removerObservador(Observer observador) {
        observadores.remove(observador);
    }

    @Override
    public void notificarObservadores() {
        for (Observer observer : observadores) {
            observer.atualizar(nome, quantidade);
        }
    }
}
