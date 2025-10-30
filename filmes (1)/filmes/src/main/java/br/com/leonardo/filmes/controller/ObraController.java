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
import br.com.leonardo.filmes.model.Obra;
import br.com.leonardo.filmes.repository.ObraRepository;

@RestController
@RequestMapping(value = "obra")
public class ObraController {
    
    /*
    * C Create = novo
    * R Read = listar e listar por id
    * U Update = atualizar
    * D Delete = remover
    */

    @Autowired
    ObraRepository obraRepository;

    @RequestMapping(value = "listar", method = RequestMethod.GET)
    public ResponseEntity<List<Obra>> listar(){
        return ResponseEntity.ok((List<Obra>) obraRepository.findAll());
    }

    //localhost: 8080/usuario/listar/10
    @RequestMapping(value = "listar/{id}", method = RequestMethod.GET)
    public ResponseEntity<Obra> getById(@PathVariable(value="id") Integer id){
        Optional<Obra> object = obraRepository.findById(id);
        if(object.isPresent()){
            return new ResponseEntity<>(object.get(), HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "novo", method = RequestMethod.POST)
    public ResponseEntity<Obra>novo(@RequestBody Obra obra){
        return new ResponseEntity<Obra>(obraRepository.save(obra), HttpStatus.OK);
    }

    @RequestMapping(value="remover/(id)", method=RequestMethod.DELETE)
    public ResponseEntity<Obra> remover (@PathVariable(value= "id") Integer id) {
        Optional<Obra> object = obraRepository.findById(id);
        if(object.isPresent()){
            obraRepository.delete(object.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "atualizar/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Obra> atualizar(@PathVariable(value= "id") Integer id, Obra novObra){
        Optional<Obra> object = obraRepository.findById(id);
        if(object.isPresent()){
            return new ResponseEntity<>(obraRepository.save(novObra), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
