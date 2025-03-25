package br.com.leonardovieira.realacionamento;

import java.util.ArrayList;
import java.util.List;

public class Departamento {

        private String nome;
        private List<Funcionario> funcionario;

        public Departamento(String nome) {
            this.funcionario = new ArrayList<>();
            this.nome = nome;
        }

        public static void main(String[] args) {
            
        }

}
