import { RouterModule, Routes } from '@angular/router';
import { ObraForm } from './obra/obra-form/obra-form';
import { Obra } from './obra/obra';
import { Login } from './login/login';
import { Painel } from './painel/painel';

export const routes: Routes = [
    { path: '', redirectTo: 'login', pathMatch:'full'},
    { path: 'login', component: Login},
    { path: 'painel', component: Painel },
    { path: 'obra', component: Obra },
    { path: 'obra/editar/:id', component: ObraForm },
    { path: 'login', component: Login}
];''