package br.com.leonardovieira.padroes.comportamentais.mediator;

import java.util.ArrayList;
import java.util.List;

public class MediadorConcreto implements Mediador {
    private List<Colaborador> colaboradores;

    public MediadorConcreto() {
        this.colaboradores = new ArrayList<>();
    }

    @Override
    public void adicionarColaborador(Colaborador colaborador) {
        colaboradores.add(colaborador);
    }

    @Override
    public void enviarMensagem(String mensagem, Colaborador remetente) {
        for (Colaborador colaborador : colaboradores) {
            // Não envie a mensagem de volta para o remetente
            if (colaborador != remetente) {
                colaborador.receberMensagem(mensagem);
            }
        }
    }
}