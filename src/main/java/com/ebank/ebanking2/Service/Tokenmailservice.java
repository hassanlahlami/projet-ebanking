package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.tokenmail;
import com.ebank.ebanking2.repository.Tokenmailrepo;
import org.springframework.stereotype.Service;

import java.util.Random;
@Service
public class Tokenmailservice {
    private Tokenmailrepo tokenmailrepo;
    private ClientService clientService;

    public Tokenmailservice(Tokenmailrepo tokenmailrepo, ClientService clientService) {
        this.tokenmailrepo = tokenmailrepo;
        this.clientService = clientService;
    }

    public String generateSixDigitToken() {
        Random random = new Random();
        int number = 100000 + random.nextInt(900000);
        return String.valueOf(number);
    }
    public tokenmail savetoken(String token , Client client) {
        tokenmail tokens=new tokenmail();
        tokens.setToken(token);
        tokens.setClient(client);
     tokenmail tokenmail=   tokenmailrepo.save(tokens);
     return tokenmail;
    }
    public boolean validateToken(String token,long clientId) {
        Client client=clientService.getClientnodtoById(clientId);
        tokenmail tokens=tokenmailrepo.findByClient(client);
        if(tokens.getToken().equals(token)){
            return true;
        }
        else {
            return false;
        }
    }
}
