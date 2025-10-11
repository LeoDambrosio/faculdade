import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MensagemService {
obterMensagem(): string {
return 'Angular é incrível!';
}
}
