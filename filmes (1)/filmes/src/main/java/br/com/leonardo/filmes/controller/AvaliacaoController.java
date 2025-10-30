package br.com.leonardo.filmes.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import br.com.leonardo.filmes.model.Avaliacao;
import br.com.leonardo.filmes.repository.AvaliacaoRepository;

@RestController
@RequestMapping(value = "avaliacao")
public class AvaliacaoController {
    
    /*
    * C Create = novo
    * R Read = listar e listar por id
    * U Update = atualizar
    * D Delete = remover
    */

    @Autowired
    AvaliacaoRepository avaliacaoRepository;

    @RequestMapping(value = "listar", method = RequestMethod.GET)
    public ResponseEntity<List<Avaliacao>> listar(){
        return ResponseEntity.ok((List<Avaliacao>) avaliacaoRepository.findAll());
    }

    //localhost: 8080/usuario/listar/10
    @RequestMapping(value = "listar/{id}", method = RequestMethod.GET)
    public ResponseEntity<Avaliacao> getById(@PathVariable(value="id") Integer id){
        Optional<Avaliacao> object = avaliacaoRepository.findById(id);
        if(object.isPresent()){
            return new ResponseEntity<>(object.get(), HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "novo", method = RequestMethod.POST)
    public ResponseEntity<Avaliacao>novo(@RequestBody Avaliacao avaliacao){
        return new ResponseEntity<Avaliacao>(avaliacaoRepository.save(avaliacao), HttpStatus.OK);
    }

    @RequestMapping(value="remover/(id)", method=RequestMethod.DELETE)
    public ResponseEntity<Avaliacao> remover (@PathVariable(value= "id") Integer id) {
        Optional<Avaliacao> object = avaliacaoRepository.findById(id);
        if(object.isPresent()){
            avaliacaoRepository.delete(object.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "atualizar/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Avaliacao> atualizar(@PathVariable(value= "id") Integer id, Avaliacao novAvaliacao){
        Optional<Avaliacao> object = avaliacaoRepository.findById(id);
        if(object.isPresent()){
            return new ResponseEntity<>(avaliacaoRepository.save(novAvaliacao), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}

