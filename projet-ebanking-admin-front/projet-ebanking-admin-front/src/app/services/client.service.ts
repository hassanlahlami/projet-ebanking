import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ClientService {

  constructor(private http :HttpClient) { }
  validateclient(id:string){
    return this.http.post(`http://52.91.172.32/e_banking_2_war_exploded/api/clients/validate/${id}`,{}, { withCredentials: true })
  }
  getallclients(){
   return this.http.get(`http://52.91.172.32/e_banking_2_war_exploded/api/clients`, { withCredentials: true });
  }
  updateclient(id:string,client:any,headers:HttpHeaders){
    return this.http.put(`http://52.91.172.32/e_banking_2_war_exploded/api/clients/update/client/${id}`,client, { withCredentials: true ,headers: headers});

  }
}
