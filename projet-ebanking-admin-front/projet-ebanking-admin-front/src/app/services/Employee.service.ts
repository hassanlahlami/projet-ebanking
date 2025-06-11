import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EmployeeDTO } from '../model/EmployeeDTO';
import { EmployeeResDTO } from '../model/EmployeeResDTO';

@Injectable({ providedIn: 'root' })
export class EmployeesService {
  private apiUrl = `http://52.91.172.32/e_banking_2_war_exploded/api/employees`;

  constructor(private http: HttpClient) {}

  getEmployees(offset: number, size: number): Observable<any> {
    return this.http.get(`${this.apiUrl}?offset=${offset}&size=${size}`,{withCredentials: true});
  }

  saveEmployee(employee: EmployeeDTO): Observable<EmployeeResDTO> {
    return this.http.post<EmployeeResDTO>(`${this.apiUrl}/employee`, employee, {withCredentials: true});
  }
}
