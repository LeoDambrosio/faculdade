package br.com.leonardo.filmes.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.leonardo.filmes.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    Optional<Usuario> findByEmail(String nome);

}
