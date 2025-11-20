import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; // <--- 1. IMPORTAR ISSO
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-painel',
  imports: [
    CommonModule, // <--- 2. COLOCAR AQUI DENTRO
    RouterModule
  ],
  templateUrl: './painel.html',
  styleUrl: './painel.css',
})
export class Painel {
  // Dados de exemplo para testar o visual (depois virá do seu Service)
  obras = [
    { id: 1, titulo: 'O Senhor dos Anéis', tipo: 'FILME', ano: 2001, imagem: 'https://placehold.co/300x450/000/FFF?text=SDA', nota: 9.8 },
    { id: 2, titulo: 'Breaking Bad', tipo: 'SERIE', ano: 2008, imagem: 'https://placehold.co/300x450/1a4d2e/FFF?text=Breaking+Bad', nota: 9.5 },
    { id: 3, titulo: 'Naruto', tipo: 'ANIME', ano: 2002, imagem: 'https://placehold.co/300x450/ff6600/FFF?text=Naruto', nota: 8.7 },
    { id: 4, titulo: 'Interestelar', tipo: 'FILME', ano: 2014, imagem: 'https://placehold.co/300x450/000/FFF?text=Interestelar', nota: 9.0 },
  ];
}