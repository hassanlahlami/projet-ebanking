import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {map, Observable} from 'rxjs';
import { MaybeClientDTO } from '../model/dto/MaybeClientDTO';
import { MaybeClientWithEmailTokenDTO } from '../model/dto/MaybeClientWithEmailTokenDTO';

@Injectable({
  providedIn: 'root'
})
export class RegisterVerification {
  private readonly apiUrl = 'http://localhost:8080/e_banking_2_war_exploded/api/maybeClient';

  constructor(private http: HttpClient) {}

  generateTokenByEmail(dto: MaybeClientDTO): Observable<boolean> {
    return this.http.post<boolean>(`${this.apiUrl}/emailSend/token`, dto);
  }

  checkEmailToken(dto: MaybeClientWithEmailTokenDTO): Observable<boolean> {
    return this.http.post<boolean>(`${this.apiUrl}/checkToken`, dto);
  }
}
