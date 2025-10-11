import { Routes } from '@angular/router';
import { Cep } from './cep/cep';

export const routes: Routes = [
    {path: 'cep', component: Cep},
    {path: '', component: Cep}
];
