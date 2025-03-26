package br.com.leonardovieira.realacionamento;

import java.util.ArrayList;
import java.util.List;

public class Departamento {

    private String nome;
    private List<Funcionario> funcionarios;

    public Departamento(String nome) {
        this.funcionarios = new ArrayList<>();
        this.nome = nome;
    }

    public void adicionarFuncionario(Funcionario funcionario){
        funcionarios.add(funcionario);
    }

    public String getNome() {
        return nome;
    }

    public List<Funcionario> getFuncionarios() {
        return funcionarios;
    }

}

