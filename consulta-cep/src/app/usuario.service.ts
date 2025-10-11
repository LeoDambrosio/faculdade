import { Injectable } from '@angular/core';
import { FormsModule } from '@angular/forms';


@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
listar() {
    return [
      { nome: 'Ana', email: 'ana@email.com' },
      { nome: 'Bruno', email: 'bruno@email.com' },
      { nome: 'Carla', email: 'carla@email.com' }
    ];
  }
}

