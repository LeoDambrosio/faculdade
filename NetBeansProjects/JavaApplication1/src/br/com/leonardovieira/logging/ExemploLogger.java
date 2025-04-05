package br.com.leonardovieira.logging;
import java.util.logging.Logger;


public class ExemploLogger {
    //atributo
    private static final Logger logger = Logger.getLogger(ExemploLogger.class.getName());
    
    //construtores
    
    //metodos
    public static void main(String[] args) {
        logger.info("Iniciando nosso programa...");
        try {
            int resultado = 10/0; // erro para exemplo
        } catch (ArithmeticException e) {
            logger.severe("Erro: Divisao por zero.");
        }
        
        logger.info("Fim do programa.");
    }
    
}
