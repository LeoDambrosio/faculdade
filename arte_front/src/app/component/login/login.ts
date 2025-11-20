import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LoginServices } from '../../services/LoginServices';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-login',
  imports: [
    FormsModule,
    ReactiveFormsModule,
    NgIf
],
  templateUrl: './login.html',
  styleUrl: './login.css',
})
export class Login {

  private loginService = inject(LoginServices);
  private route = inject(Router);

  mensagemErro: String = '';

  formLogin = new FormGroup({
    login: new FormControl<string>(''),
    senha: new FormControl<string>('')
  });

  public entrar() {

    console.log(this.formLogin.value);

    const login = this.formLogin.get('login')?.value;
    const senha = this.formLogin.get('senha')?.value;

    this.loginService.entrar(login, senha).subscribe({
      next: (resp) => {
        // Login sucesso!
        console.log("Login Back funcionou");
        this.route.navigate(['/painel']); // <--- MUDADO PARA PAINEL
      },
      error: (err) => {
        console.error("Erro no login:", err);
        this.mensagemErro = "Erro ao logar (Backend offline?)";
        
        // DICA: Descomente a linha abaixo para forçar a entrada mesmo com erro
        // this.route.navigate(['/painel']); 
      }
    });
    
    // Se quiser testar SEM backend nenhum, apague tudo acima e deixe só:
    // this.route.navigate(['/painel']);
  }
}