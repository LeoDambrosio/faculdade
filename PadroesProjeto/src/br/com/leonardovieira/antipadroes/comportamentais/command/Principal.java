package br.com.guilhermevillaca.antipadroes.comportamentais.command;

/*
 * 
 * 🚨 Problemas no Antipadrão
❌ Alto acoplamento: Garcom depende diretamente de Cozinheiro, então qualquer mudança no cozinheiro afeta o garçom.
❌ Baixa flexibilidade: Se quisermos adicionar novos pratos, precisamos modificar Garcom.
❌ Código difícil de testar: Não há abstração para os pedidos, tornando testes complicados.

Agora, vamos corrigir isso com o Command! 🚀

 */
public class Principal {

    public static void main(String[] args) {
        Garcom garcom = new Garcom();
        garcom.fazerPedido("pizza");
        garcom.fazerPedido("hamburguer");
    }

}
