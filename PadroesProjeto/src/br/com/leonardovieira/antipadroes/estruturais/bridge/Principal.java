package br.com.guilhermevillaca.antipadroes.estruturais.bridge;

/*
 * 
 * Problemas do Código Errado (Antipadrão)
Explosão de subclasses

Se adicionarmos um novo controle (ex: "Controle de Voz"), teríamos que criar TVComControleDeVoz e RadioComControleDeVoz, multiplicando as classes.
Dificuldade de manutenção

Se quisermos modificar o comportamento do controle remoto, teríamos que fazer isso em todas as classes duplicadas.
Acoplamento excessivo

Os controles estão diretamente ligados aos dispositivos, dificultando a reutilização.
 */
public class Principal {
    public static void main(String[] args) {
        TVComControleBasico tvBasica = new TVComControleBasico();
        tvBasica.ligar();
        tvBasica.aumentarVolume();

        RadioComControleAvancado radioAvancado = new RadioComControleAvancado();
        radioAvancado.ligar();
        radioAvancado.sintonizarEstacao(101.3);
    }
}





