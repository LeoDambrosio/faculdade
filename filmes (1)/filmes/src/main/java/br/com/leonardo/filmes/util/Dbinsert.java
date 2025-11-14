package br.com.leonardo.filmes.util;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.thedeanda.lorem.Lorem;
import com.thedeanda.lorem.LoremIpsum;

import br.com.leonardo.filmes.model.Avaliacao;
import br.com.leonardo.filmes.model.Genero;
import br.com.leonardo.filmes.model.Obra;
import br.com.leonardo.filmes.model.Usuario;
import br.com.leonardo.filmes.model.enums.TipoObra;
import br.com.leonardo.filmes.repository.AvaliacaoRepository;
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

    @Autowired
    AvaliacaoRepository avaliacaoRepository;

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

        Usuario usuario2 = new Usuario(
        null, 
        "Andre", 
        "andre@gmail.com", 
        "456", 
        LocalDateTime.now());
        usuarioRepository.save(usuario2);

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

          Lorem lorem = new LoremIpsum().getInstance();

        //Inserindo Obra
        Obra obra1 = new Obra(null, "Duro de Matar", 
            lorem.getParagraphs(1,2), 
            1988, 
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DOt_7qM3k4yc&psig=AOvVaw1dUU5AxufDDicR6xiQE_0_&ust=1761434299237000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKis2Z78vZADFQAAAAAdAAAAABAE",
            TipoObra.FILME,
            genero1);
        obraRepository.save(obra1);
    
        //Inserindo obras aleatórias
        Random random = new Random();
        for(int i = 0; i <= 10; i++){
            //gerando ano randomico
            int ano = 1960 + random.nextInt(2025-1960+1);
            Obra obra = new Obra(
                null,
                lorem.getTitle(2),
                lorem.getParagraphs(1, 2),
                ano,
                "https://picsum.photos/200/300"+ random.nextInt(50) + "/400/800",
                TipoObra.FILME,
                genero1);
            obraRepository.save(obra);
        }

        //usando lorem
        //Inserindo avaliações
        Avaliacao avaliacao1 = new Avaliacao(
            null,
            10,
            lorem.getParagraphs(1, 3),
            LocalDateTime.now(), usuario, obra1);
            avaliacaoRepository.save(avaliacao1);
    }
}