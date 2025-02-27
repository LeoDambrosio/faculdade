package br.com.leonardovieira.exercio1;

import java.util.Scanner;

public class Loja {


	public static void main(String[] args){

		Scanner in = new Scanner(System.in);

		System.out.println("Se deseja comprar um carro, digite 1, caso contrario digite 2");
		
		int opcao = in.nextInt();

		if(opcao == 1){

			Carro carro = new Carro();
			carro.modelo = "Uno";
			carro.ano = 1990;
			carro.valor = 10.000;
			
			carro.comprar();
			carro.andar();
			System.out.println(carro.modelo);
			System.out.println(carro.ano);
			System.out.println(carro.valor);

		}	

	
	}

}

/*javac Loja.java
java Loja.java*/


