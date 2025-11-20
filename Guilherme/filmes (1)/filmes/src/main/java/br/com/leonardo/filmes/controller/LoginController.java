package br.com.leonardo.filmes.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.leonardo.filmes.model.Usuario;
import br.com.leonardo.filmes.repository.UsuarioRepository;


@RestController
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @PostMapping("/entrar")
    public ResponseEntity<?> login(@RequestBody Usuario loginRequest) {

        Optional<Usuario> usuario = usuarioRepository.findByEmail(loginRequest.getEmail());

        if (usuario.isPresent() && usuario.get().getSenha().equals(loginRequest.getSenha())) {
            return ResponseEntity.ok(usuario.get());
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Usuário ou senha incorretos");
    }
}
