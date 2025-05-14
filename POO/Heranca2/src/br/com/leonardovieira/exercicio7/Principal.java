package br.com.leonardovieira.exercicio7;

public class Principal {
    public static void main(String[] args) {
        Smartphone s = new Smartphone("Samsung", "Galaxy S21", "Android");
        Televisao t = new Televisao("LG", "OLED55", 55);

        s.ligar();
        t.ligar();
    }
}

