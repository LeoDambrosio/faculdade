package br.com.guilhermevillaca.padroes.estruturais.bridge;

/**
 *
 * @author villaca
 */
/**
 *
 *
 * Cenário Vamos usar um exemplo de dispositivos e controles remotos. Teremos
 * diferentes tipos de dispositivos (TV e Rádio) e diferentes tipos de controles
 * remotos (ControleRemotoBásico e ControleRemotoAvançado). Utilizaremos o
 * padrão Bridge para permitir que novos dispositivos e controles remotos possam
 * ser adicionados facilmente.
 * 
 * Benefícios do Padrão Bridge
✔ Separa as hierarquias de dispositivos e controles → Podemos adicionar novos dispositivos ou novos controles sem precisar criar várias subclasses.
✔ Código reutilizável → Qualquer controle pode ser usado com qualquer dispositivo.
✔ Facilidade de manutenção → Se quisermos adicionar um novo tipo de controle (ex: Controle por App), basta criar uma nova classe sem mexer nos dispositivos.
 */
public class Principal {

    public static void main(String[] args) {
        // Criamos uma TV e um Rádio
        Dispositivo tv = new Televisao();
        Dispositivo radio = new Radio();
        Dispositivo projetor = new Projetor(); // Novo dispositivo


        // Criamos controles remotos diferentes para os dispositivos
        ControleRemoto controleBasicoTV = new ControleRemotoBasico(tv);
        ControleRemoto controleAvancadoRadio = new ControleRemotoAvancado(radio);
        ControleRemoto controleAvancadoProjetor = new ControleRemotoAvancado(projetor); // Novo controle para projetor


        // Usamos os controles nos dispositivos
        controleBasicoTV.ligar();
        controleBasicoTV.aumentarVolume();

        controleAvancadoRadio.ligar();
        controleAvancadoRadio.aumentarVolume();
        ((ControleRemotoAvancado) controleAvancadoRadio).silenciar(); // Método avançado

        controleAvancadoProjetor.ligar();
        controleAvancadoProjetor.aumentarVolume();
        ((Projetor) projetor).mudarFonte("HDMI"); // Método específico do projetor

    }
}
