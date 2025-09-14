package br.com.guilhermevillaca.padroes.estruturais.flyweight;

import java.util.HashMap;
import java.util.Map;

public class CaractereFactory {

    private static final Map<String, CaractereFlyweight> pool = new HashMap<>();

    public static CaractereFlyweight getCaractere(char simbolo, String fonte, int tamanho) {
        String chave = simbolo + fonte + tamanho;
        if (!pool.containsKey(chave)) {
            pool.put(chave, new CaractereFlyweight(simbolo, fonte, tamanho));
        }
        return pool.get(chave);
    }

}
