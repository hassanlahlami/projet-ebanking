import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CryptoserviceService {

  constructor(private http:HttpClient) { }
  post(achatdto:any,rib:string){
    const params: any = {
      "rib": rib
    };
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(`http://localhost:8080/e_banking_2_war_exploded/crypto?rib=${rib}`,achatdto,  // Serialize payload to JSON
      { headers });

  }
  postvendre(achatdto:any,rib:string){
    const params: any = {
      "rib": rib
    };
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post(`http://localhost:8080/e_banking_2_war_exploded/crypto/vendre?rib=${rib}`,achatdto,  // Serialize payload to JSON
      { headers });

  }
}
