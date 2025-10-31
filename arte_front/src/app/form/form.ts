import { Component } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-form',
  standalone: true, // ← como ele é standalone, precisa importar os módulos manualmente
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './form.html',
  styleUrls: ['./form.css']
})
export class FormComponent {
  form!: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      id: [''],
      titulo: [''],
      descricao: [''],
      anoLancamento: [''],
      imagemUrl: [''],
      tipo: [''],
      genero: ['']
    });
  }

  salvar() {
    console.log('Dados do formulário:', this.form.value);
  }
}
