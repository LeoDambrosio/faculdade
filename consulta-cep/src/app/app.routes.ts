import { Routes } from '@angular/router';
import { Home } from './home/home';
import { Sobre } from './sobre/sobre';
import { ListaProdutos } from './lista-produto/lista-produto';
import { UsuarioService } from './usuario.service';

// export const routes: Routes = [
//     {path: 'cep', component: Cep},
//     {path: '', component: BoasVindas}
// ];

export const routes: Routes = [
{ path: 'home', component: Home},
{ path: 'sobre', component: Sobre},
{ path: '', redirectTo: '/home', pathMatch: 'full' },
{ path: 'produto', component: ListaProdutos},
{ path: 'usuario', component: UsuarioService}
];
