import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { ObraService } from '../../services/obra-services';
import { CommonModule } from '@angular/common'; 
import { AvaliacaoComponent } from '../avaliacao/avaliacao.component'; // Importe o componente de avaliação

// NOTA: Crie esta interface em src/app/model/obra.model.ts ou defina como 'any'
interface Obra {
    id: number;
    titulo: string;
    descricao: string;
    anoLancamento: string;
    imagem: string;
    tipo: string;
    genero?: { id: number, nome: string };
    notaMedia?: number;
    avaliacoes?: any[];
}


@Component({
  selector: 'app-obra',
  standalone: true,
  // O CommonModule é necessário para o *ngIf e o AvaliacaoComponent é o formulário
  imports: [CommonModule, RouterModule, AvaliacaoComponent], 
  templateUrl: './obra.html',
  styleUrl: './obra.css',
})
export class ObraComponent implements OnInit {
  
  private route = inject(ActivatedRoute);
  private obraService = inject(ObraService);

  obra: Obra | undefined;
  idObra: number = 0;
  
  ngOnInit(): void {
    // 1. Pega o ID da URL (obra/detalhe/5)
    this.route.params.subscribe(params => {
      this.idObra = +params['id']; 
      if (this.idObra) {
        this.carregarObra(this.idObra);
      }
    });
  }

  // Busca os dados da obra no backend
  async carregarObra(id: number): Promise<void> {
    try {
      this.obra = await lastValueFrom(this.obraService.buscarPorId(id));
    } catch (error) {
      console.error("Erro ao carregar detalhes da obra:", error);
      this.obra = undefined; // Garante que a mensagem de não encontrado apareça
    }
  }
}