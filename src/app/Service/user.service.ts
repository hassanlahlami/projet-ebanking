import { HttpClient } from "@angular/common/http";
import { ClientResDTO } from "../model/dto/ClientResDTO";

import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})

export class UserService{
    private client_url = "http://localhost:8080/e_banking_2_war_exploded/api/clients";

    constructor(private http: HttpClient) {}


    getClient(clientId:number){
        const url = `${this.client_url}/${clientId}`;
        return this.http.get<ClientResDTO>(url);
    }

}