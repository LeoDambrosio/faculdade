import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MensagemService } from '../mensagem-service';

@Component({
  selector: 'app-boas-vindas',
  imports: [FormsModule],
  templateUrl: './boas-vindas.html',
  })
export class BoasVindas{
mensagem: string = '';
constructor(private mensagemService: MensagemService) {
this.mensagem = this.mensagemService.obterMensagem();
}
}