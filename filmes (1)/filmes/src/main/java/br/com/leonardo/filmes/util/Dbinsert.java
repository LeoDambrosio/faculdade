package br.com.leonardo.filmes.util;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import br.com.leonardo.filmes.model.Genero;
import br.com.leonardo.filmes.model.Usuario;
import br.com.leonardo.filmes.repository.GeneroRepository;
import br.com.leonardo.filmes.repository.ObraRepository;
import br.com.leonardo.filmes.repository.UsuarioRepository;

@Component
public class Dbinsert implements CommandLineRunner{

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ObraRepository obraRepository;

    @Autowired
    GeneroRepository generoRepository;

    @Override
    public void run(String... args) throws Exception{

        //inserindo usuario
        Usuario usuario = new Usuario(
        null, 
        "Leonardo", 
        "leo@gmail.com", 
        "123", 
        LocalDateTime.now());
        usuarioRepository.save(usuario);

        //inserindo Genero
        Genero genero1 = new Genero(null, "Ação");
        generoRepository.save(genero1);
        Genero genero2 = new Genero(null, "Comédia");
        generoRepository.save(genero2);
        Genero genero3 = new Genero(null, "Drama");
        generoRepository.save(genero3);

        //inserindo com List
        Genero genero4 = new Genero(null, "Suspense");
        Genero genero5 = new Genero(null, "Terror");
        Genero genero6 = new Genero(null, "Animação"); 
        List<Genero> generos = Arrays.asList(genero4, genero5, genero6);
        generoRepository.saveAll(generos);
    }

}
