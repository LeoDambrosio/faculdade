import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FormComponent } from './form/form';
import { ObraServices } from './services/obra-services';
import { ObraForm } from './obra/obra-form/obra-form';


export const routes: Routes = [
    
    { path: '', redirectTo: 'form', pathMatch: 'full' },
    { path: 'form', component: FormComponent },
    { path: 'obra', component: ObraServices },
    { path: 'obra-form', component: ObraForm }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
