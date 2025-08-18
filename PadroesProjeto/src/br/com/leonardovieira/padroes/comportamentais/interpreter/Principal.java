package br.com.leonardovieira.padroes.comportamentais.interpreter;

/*
 * ✅ Benefícios do Interpreter
✅ Código aberto para expansão: Podemos adicionar novos operadores (*, /) sem modificar código existente.
✅ Fácil manutenção: Cada expressão (Número, Soma, Subtração) é uma classe independente.
✅ Flexibilidade: Podemos combinar expressões para interpretar frases mais complexas no futuro.
✅ Organização clara: O código está bem estruturado e segue os princípios da programação orientada a objetos.

Agora nosso código está limpo, expansível e pronto para novas expressões! 🚀
 */
public class Principal {

    public static void main(String[] args) {
        Expressao expressao1 = Interpretador.construirExpressao("10 + 5");
        System.out.println(expressao1.interpretar()); // 15

        Expressao expressao2 = Interpretador.construirExpressao("20 - 8");
        System.out.println(expressao2.interpretar()); // 12
    }

}
