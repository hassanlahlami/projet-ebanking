import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { StatusCompte } from '../model/dto/StatusCompte';
import { CompteResDTO } from '../model/dto/CompteResDTO';


@Injectable({
  providedIn: 'root'
})
export class ComptesService {

  private comptesUrl = 'http://localhost:8095/e_banking_2_war_exploded/api/comptes';
  constructor(private http: HttpClient) {}


  getCompte(clientId: number, typeCompte:string, statusCompte:StatusCompte): Observable<CompteResDTO[]> {
      const url = `${this.comptesUrl}/client/${clientId}/${typeCompte}/${statusCompte}`;
      return this.http.get<CompteResDTO[]>(url);
  }

}
