package br.com.leonardovieira.exercio1;

public class Programa {

	public static void main(String[] args){

		System.out.println(args[0]);

		System.out.println("Programa");

		System.out.println(args[1]);

		int resultado = calcular(Integer.valueOf(args[2]), 
			Integer.valueOf(args[3]));
		System.out.println(resultado);

	}

	public static int calcular(int a, int b){
		return a + b;
	}		

}

/*Salvar arquivo como Programa.java
para executar
javac Programa.java
java Programa.java ola mundo 20 5*/


