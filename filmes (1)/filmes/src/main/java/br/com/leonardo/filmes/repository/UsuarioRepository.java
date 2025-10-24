package br.com.leonardo.filmes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.leonardo.filmes.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

}
