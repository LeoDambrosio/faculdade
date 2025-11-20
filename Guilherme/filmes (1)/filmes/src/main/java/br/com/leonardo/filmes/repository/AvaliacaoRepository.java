package br.com.leonardo.filmes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.leonardo.filmes.model.Avaliacao;

public interface AvaliacaoRepository extends JpaRepository<Avaliacao, Integer>{

}
