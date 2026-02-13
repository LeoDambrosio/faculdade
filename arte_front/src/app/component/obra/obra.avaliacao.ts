import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { Obra } from '../../model/obra.model';
 

@Injectable({
  providedIn: 'root'
})
export class ObraService {

  // URL base para as obras no seu Spring Boot
  private apiUrl = 'http://localhost:8080/obras'; 
  
  private http = inject(HttpClient);

  // 1. Para o Painel (Listagem de Obras)
  listar(): Observable<Obra[]> {
    return this.http.get<Obra[]>(this.apiUrl);
  }

  // 2. Para a Tela de Detalhes (GET /obras/{id})
  buscarPorId(id: number): Observable<Obra> {
    return this.http.get<Obra>(`${this.apiUrl}/${id}`);
  }
  
  // 3. Para o ObraForm (Cadastro/Edição) - Mantenha este se precisar!
  // Assumindo que a interface Obra tem a mesma estrutura do objeto que você envia
  salvar(obra: Obra): Observable<Obra> {
    // Se tiver ID, faz PUT (edição), se não tiver ID, faz POST (criação)
    return this.http.post<Obra>(this.apiUrl, obra);
  }
}