package Lista4.src.br.com.leonardovieira.exercicio5;

public class PrincipalConversorTemperatura {
    public static void main(String[] args) {
        double tempCelsius = 45.0;
        double tempFahrenheit = ConversorTemperatura.celsiusParaFahrenheit(tempCelsius);

        System.out.println(tempCelsius + "°C em Fahrenheit e: " + tempFahrenheit + "°F");
    }
}
