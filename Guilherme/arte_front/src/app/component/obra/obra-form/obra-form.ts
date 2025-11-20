import { Component, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ObraServices } from '../../../services/obra-services';
import { GeneroServices } from '../../../services/GeneroService';

@Component({
  selector: 'app-obra-form',
  imports: [
    FormsModule,
    ReactiveFormsModule
  ],
  templateUrl: './obra-form.html',
  styleUrl: './obra-form.css',
})
export class ObraForm {

  genero$: any
  id: any;
  private activateRoute = inject(ActivatedRoute);
  private obraService = inject(ObraServices);
  private route = inject(Router);
  private generoService = inject(GeneroServices);
  obra: any;


  form = new FormGroup({
    id: new FormControl<number | null>(null),
    titulo: new FormControl<string | null>(''),
    descricao: new FormControl<string | null>(''),
    anoLancamento: new FormControl<string | null>(null),
    imagemurl: new FormControl<string | null>(''),
    tipo: new FormControl<string | null>(null),
    genero: new FormControl<string | null>('')
  });

  constructor(){

  }

  ngOnInit(){
    this.id = this.activateRoute.snapshot.params['id'];
    if(this.id){
      this.getById();
    }
    this.getGeneros();

  }
  
  public async getGeneros(){
    this.genero$ = await lastValueFrom(this.generoService.getGenero());
  }

  public async getById(){
    this.obra = await lastValueFrom(this.obraService.getObraById(this.id));
    //popular campos do formulário
    this.form.controls.id.setValue(this.obra.id);
    this.form.controls.titulo.setValue(this.obra.titulo);
    this.form.controls.descricao.setValue(this.obra.descricao);
    this.form.controls.anoLancamento.setValue(this.obra.anoLancamento);
    this.form.controls.imagemurl.setValue(this.obra.imagemurl);
    this.form.controls.tipo.setValue(this.obra.tipo);
    this.form.controls.genero.setValue(this.obra.genero?.id);
  }

  public salvar(){
    let obra = {
      id: this.id,
      titulo:this.form.controls.titulo.value,
      descricao:this.form.controls.descricao.value,
      anoLancamento: this.form.controls.anoLancamento.value,
      imagemUrl:this.form.controls.imagemurl.value,
      tipo: this.form.controls.tipo.value,
      genero: {
        id:this.form.controls.genero.value
      }
    }
     this.obraService.salvar(obra).subscribe(
      obra => {
        this,this.route.navigate(['obra']);
      },
      erro =>{
        console.log(erro);
      }
    )
  }
}