import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';

// Assumindo que você terá um modelo para a resposta da avaliação (pode ser "any" por enquanto)
interface AvaliacaoPayload {
    nota: number;
    comentario: string;
    idObra: number;
    // O backend deve adicionar o ID do usuário logado
}

@Injectable({
  providedIn: 'root'
})
export class AvaliacaoService {

  // URL base para as avaliações no seu Spring Boot
  private apiUrl = 'http://localhost:8080/avaliacoes'; 
  
  private http = inject(HttpClient);

  // Método para enviar a nova avaliação (POST /avaliacoes)
  criar(dadosAvaliacao: AvaliacaoPayload): Observable<any> {
    return this.http.post<any>(this.apiUrl, dadosAvaliacao);
  }
  
  // Método para listar avaliações de uma obra (GET /avaliacoes/obra/{id})
  listarPorObra(idObra: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/obra/${idObra}`);
  }
}