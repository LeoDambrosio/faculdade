package br.com.guilhermevillaca.padroes.estruturais.composite;

// 🚀 Testando a solução correta
/*
 * Benefícios do Padrão Composite
✔ Código flexível e escalável → Podemos adicionar novos tipos de embalagem sem mudar a lógica.
✔ Operações consistentes → Podemos chamar getPreco() e listarItens() em qualquer nível da hierarquia.
✔ Evita verificações desnecessárias → Não precisamos mais checar manualmente se um item é um produto único ou um grupo.

Agora temos um sistema onde produtos individuais e grupos de produtos podem ser manipulados da mesma forma, facilitando manutenção e expansão. 🚀
 */
public class Principal {
    public static void main(String[] args) {
        // Criando produtos individuais
        Produto leite = new Produto("Leite 1L", 5.00);
        Produto cerveja = new Produto("Cerveja 600ml", 7.00);

        // Criando caixas de produtos
        Embalagem caixaDeLeite = new Embalagem("Caixa de Leite (12 unidades)");
        for (int i = 0; i < 12; i++) {
            caixaDeLeite.adicionarItem(new Produto("Leite 1L", 5.00));
        }

        Embalagem caixaDeCerveja = new Embalagem("Caixa de Cerveja (6 unidades)");
        for (int i = 0; i < 6; i++) {
            caixaDeCerveja.adicionarItem(new Produto("Cerveja 600ml", 7.00));
        }

        // Criando fardos de caixas
        Embalagem fardoDeLeite = new Embalagem("Fardo de Leite (6 caixas)");
        for (int i = 0; i < 6; i++) {
            fardoDeLeite.adicionarItem(caixaDeLeite);
        }

        Embalagem fardoDeCerveja = new Embalagem("Fardo de Cerveja (4 caixas)");
        for (int i = 0; i < 4; i++) {
            fardoDeCerveja.adicionarItem(caixaDeCerveja);
        }

        // Criando um carrinho de compras com itens variados
        Embalagem carrinho = new Embalagem("Carrinho de Compras");
        carrinho.adicionarItem(leite);
        carrinho.adicionarItem(caixaDeLeite);
        carrinho.adicionarItem(fardoDeLeite);
        carrinho.adicionarItem(fardoDeCerveja);

        // Exibindo os itens e o preço total
        carrinho.listarItens();
        System.out.println("Total da compra: R$" + carrinho.getPreco());
    }
}
