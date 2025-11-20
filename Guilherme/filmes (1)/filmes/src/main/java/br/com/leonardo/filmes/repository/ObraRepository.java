package br.com.leonardo.filmes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.leonardo.filmes.model.Obra;

public interface ObraRepository extends JpaRepository<Obra, Integer>{

}
