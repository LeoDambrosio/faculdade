import { HttpBackend, HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CepService {

  private http: HttpClient;

  constructor(handler: HttpBackend){
    this.http = new HttpClient(handler);
  }

  public consultarCep(){
    let url = 'http://viacep.com.br/ws/';

    return this.http.get(url + 85814530 + '/json'). toPromise();
  }
  
}
