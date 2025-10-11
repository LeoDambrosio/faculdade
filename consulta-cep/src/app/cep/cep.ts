import { Component } from '@angular/core';
import { CepService } from './cep.service';

@Component({
  selector: 'app-cep',
  imports: [],
  templateUrl: './cep.html',
  styleUrl: './cep.css'
})
export class Cep {

  cep: any;
  logradouro: any;
  bairro: any;
  cidade: any;
  uf: any;

  constructor(private cepService: CepService){

  }

  public buscarCep(){
    this.cepService.consultarCep().then(resposta => {
      let retorno: any = resposta;
      console.log(retorno);
      
      //alert(retorno.logradouro);
      this.cep = retorno.cep;
      this.logradouro = retorno.logradouro;
      this.bairro = retorno.bairro;
      this.cidade = retorno.localidade;
      this.uf = retorno.uf;

    })
  }
}
