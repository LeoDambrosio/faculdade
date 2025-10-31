import { Component } from '@angular/core';
import { ObraServices } from '../services/obra-services';
import { last, lastValueFrom } from 'rxjs';
import { Router } from '@angular/router';


@Component({
  selector: 'app-obra',
  templateUrl: './obra.html',
  styleUrls: ['./obra.css']
})
export class Obra {

  obra$: any;

  constructor(private obraService: ObraServices, private route: Router){}
  
  ngOnInit(): void{
    this.getObra();
  }

  public async getObra(){
    this.obra$ = await lastValueFrom(this.obraService.getObras());
  }

  //redireciona para componente de edicao de obra
  public editar(id:number){
    this.route.navigate(['obra/editar', id]);
  }

  //chamar um metodo do service que sera excluido 
  public excluir(id:number){

  }

}
