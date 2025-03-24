package br.com.leonardovieira.exerciciop2;

public class Aluno {

        public String nome;

        public int idade;

        public int matricula;

        public Aluno  () {
            System.out.println("Aqui estao as informacoes do Aluno:");
        }

        public void informacoes() {
            System.out.println("O aluno e:" + this.nome);
            System.out.println(this.nome + " tem " + this.idade);
            System.out.println("A matricula do aluno e:" + this.matricula);
            
        }

}
