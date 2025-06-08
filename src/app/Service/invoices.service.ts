import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { InvoiceResDTO } from '../model/dto/InvoiceResDTO';
import { InvoicePayDTO } from '../model/dto/InvoicePayDTO';

@Injectable({
  providedIn: 'root'
})
export class InvoicesService {
  private invoiceUrl = 'http://localhost:8080/e_banking_2_war_exploded/api/invoices';

  constructor(private http: HttpClient) {}

  getInvoice(clientId: number, provider: string, reference: string): Observable<InvoiceResDTO> {
    const url = `${this.invoiceUrl}/invoice/${clientId}/${provider}/${reference}`;
    return this.http.get<InvoiceResDTO>(url); //this.http.get<RetourDuBackend>(url);
  }

  payInvoice(invoicePayDTO:InvoicePayDTO): Observable<InvoiceResDTO> {
    const url = `${this.invoiceUrl}/invoice/pay`;
    return this.http.put<InvoiceResDTO>(url, invoicePayDTO);
  }
}
