import { Component } from '@angular/core';
import { ObraServices } from '../services/obra-services';
import { last, lastValueFrom } from 'rxjs';

@
@Component({
  selector: 'app-obra',
  imports: [],
  templateUrl: './obra.html',
  styleUrl: './obra.css',
})
export class Obra {

  obra$: any;

  constructor(private obraService: ObraServices){

  }
  ngOnInit(): void{
    this.getObra();
  }

  public async getObra(){
    this.obra$ = await lastValueFrom(this.obraService.getObras());
  }

}
