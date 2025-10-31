import { HttpBackend, HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ObraServices {
  
  //listar 
  url = 'http://localhost:8080/obra/';

  private http: HttpClient;
  constructor(handler: HttpBackend){
    this.http = new HttpClient(handler);
  }

  public getObras(){
    return this.http.get(this.url + 'listar').pipe(map(response=>response));
  }
  //http://localhost:8080/obra/listar/1
  public getObraById(id: number){
    return this.http.get(this.url + 'listar/' + id).pipe(map(response=>response));
  }

  public salvar(obra: any): Observable<any>{
    if(obra.id!==null){
      return this.http.put(this.url+ 'atualizar/'+ obra.id, obra);
    }
    return this.http.post(this.url + 'novo', obra);
  }
}
