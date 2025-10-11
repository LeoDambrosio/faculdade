import { Component } from '@angular/core';
import { UsuarioService } from '../usuario.service';
@Component({
selector: 'app-usuarios',
templateUrl: './usuarios.html'
})
export class Usuarios{
usuarios: any[] = [];
filtro: string = '';
  constructor(private usuarioService: UsuarioService) {
    this.usuarios = this.usuarioService.listar();
  }
  get filtrados() {
      return this.usuarios.filter(u =>
      u.nome.toLowerCase().includes(this.filtro.toLowerCase())
      );
  }
}

