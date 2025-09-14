package br.com.guilhermevillaca.padroes.estruturais.proxy;

/*
 * Vantagens do Proxy
✅ Controle de acesso: O Proxy filtra solicitações antes de atingir o banco real.
✅ Eficiência: Transações inválidas são bloqueadas antes de consumir recursos do banco.
✅ Segurança: O Proxy pode proteger o sistema real contra acessos indevidos.

Esse é um Proxy de Proteção, pois ele controla o acesso ao banco. Também existem outros tipos de Proxy, como Proxy Virtual (usado para carregar objetos pesados sob demanda).
 */
public class Cliente {

    public static void main(String[] args) {
        ServicoBanco banco = new ProxyBanco();

        banco.processarPagamento("João", 500.00); // Deve passar
        banco.processarPagamento("Maria", 200.00); // Deve falhar (cartão inativo)
        banco.processarPagamento("João", 600.00); // Deve falhar (saldo insuficiente)
    }

}
