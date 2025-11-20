/*import { RouterModule, Routes } from '@angular/router';
import { Login } from './component/login/login';
import { Painel } from './component/painel/painel';
import { Obra } from './component/obra/obra';
import { ObraForm } from './component/obra/obra-form/obra-form';


export const routes: Routes = [
    { path: '', redirectTo: 'login', pathMatch:'full'},
    { path: 'login', component: Login},
    { path: 'painel', component: Painel },
    { path: 'obra', component: Obra },
    { path: 'obra/editar/:id', component: ObraForm },
    { path: 'login', component: Login}
];''*/

import { Routes } from '@angular/router';
import { Login } from './component/login/login';
import { Painel } from './component/painel/painel';
import { Obra } from './component/obra/obra';
import { ObraForm } from './component/obra/obra-form/obra-form';

export const routes: Routes = [
    { path: '', redirectTo: 'login', pathMatch: 'full' },
    { path: 'login', component: Login },
    { path: 'painel', component: Painel },
    
    // ROTA IMPORTANTE: O ':id' permite passar qual obra foi clicada
    { path: 'obra/detalhe/:id', component: Obra }, 
    
    // Rota para criar/editar (área administrativa)
    { path: 'obra/cadastro', component: ObraForm },
    { path: 'obra/editar/:id', component: ObraForm }
];