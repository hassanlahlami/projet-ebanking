import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import {CompteResDTO} from '../model/dto/CompteResDTO';
import {CEpargneResDTO} from '../model/dto/CEpargneResDTO';
import {CCourantResDTO} from '../model/dto/CCouurantResDTO';


@Injectable({
  providedIn: 'root'
})
export class CompteService {
  private readonly apiUrl = 'http://localhost:8080/e_banking_2_war_exploded/api/comptes'; // adapte si nécessaire

  constructor(private http: HttpClient) {}

  getAll(type: string, status: string): Observable<any[]> {
    return this.http.get<any>(`${this.apiUrl}/${status}/${type}`);
  }

  getById(id: string): Observable<CompteResDTO> {
    return this.http.get<CompteResDTO>(`${this.apiUrl}/compte/${id}`);
  }

  getByClientId(clientId: string, type: string, status: string): Observable<CompteResDTO[]> {

    return this.http.get<CompteResDTO[]>(`${this.apiUrl}/client/${clientId}/${type}/${status}`);
  }

  createCourant(dto: Partial<CCourantResDTO>): Observable<CCourantResDTO> {
    return this.http.post<CCourantResDTO>(`${this.apiUrl}/comptecourant`, dto);
  }

  createEpargne(dto: Partial<CEpargneResDTO>): Observable<CEpargneResDTO> {
    return this.http.post<CEpargneResDTO>(`${this.apiUrl}/compteepargne`, dto);
  }

  deleteById(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/compte/${id}`);
  }

  updateStatus(id: string, status: string): Observable<CompteResDTO> {
    const params = new HttpParams().set('status', status);
    return this.http.patch<CompteResDTO>(`${this.apiUrl}/compte/status/${id}`, null, { params });
  }
  getCCourantByClientId(clientId: string): Observable<CCourantResDTO[]> {
    return this.http.get<CCourantResDTO[]>(`${this.apiUrl}/client/${clientId}/ccourant/ACTIF`);
  }
}
