package br.com.leonardo.filmes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.leonardo.filmes.model.Genero;

public interface GeneroRepository extends JpaRepository<Genero, Long>{

}
