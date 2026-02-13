import { Component, Input, inject } from '@angular/core';
import { CommonModule, NgIf } from '@angular/common';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { AvaliacaoService } from '../../services/avaliacao.service'; // Usando o serviço que acabamos de criar

@Component({
  selector: 'app-avaliacao',
  standalone: true,
  // Imports necessários para Formulários Reativos e o *ngIf
  imports: [CommonModule, ReactiveFormsModule, NgIf], 
  templateUrl: './avaliacao.html',
  styleUrl: './avaliacao.css',
})
export class AvaliacaoComponent {
  
  // Recebe o ID da obra do componente pai (ObraComponent)
  @Input() idObra: number = 0; 

  private avaliacaoService = inject(AvaliacaoService);

  formAvaliacao = new FormGroup({
    // Nota obrigatória, min 1, max 10
    nota: new FormControl<number | null>(null, [Validators.required, Validators.min(1), Validators.max(10)]), 
    // Comentário obrigatório, min 5 caracteres
    comentario: new FormControl<string>('', [Validators.required, Validators.minLength(5)])
  });

  mensagem: string = '';
  sucesso: boolean = false;

  enviarAvaliacao(): void {
    // Verifica se o formulário está válido E se temos o ID da obra
    if (this.formAvaliacao.valid && this.idObra > 0) {
      this.mensagem = 'Enviando avaliação...';
      this.sucesso = false;
      
      const novaAvaliacao = {
        nota: this.formAvaliacao.value.nota!,
        comentario: this.formAvaliacao.value.comentario!,
        idObra: this.idObra // ID que será usado para ligar a avaliação à obra no backend
      };
      
      // Chamada usando a nova sintaxe de subscribe
      this.avaliacaoService.criar(novaAvaliacao).subscribe({
        next: () => {
          this.sucesso = true;
          this.mensagem = '✅ Avaliação enviada com sucesso! Obrigado pela sua opinião.';
          this.formAvaliacao.reset(); // Limpa o formulário após o sucesso
        },
        error: (err) => {
          this.sucesso = false;
          // Mensagem de erro mais detalhada
          this.mensagem = `❌ Erro ao enviar: ${err.message || 'Verifique a conexão com o Backend.'}`;
          console.error("Erro ao enviar avaliação:", err);
        }
      });
    } else {
      this.sucesso = false;
      this.mensagem = '⚠️ Por favor, preencha a nota (1-10) e o comentário (mínimo 5 letras).';
    }
  }
}