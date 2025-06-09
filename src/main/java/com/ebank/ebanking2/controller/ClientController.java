package com.ebank.ebanking2.controller;


import com.ebank.ebanking2.Service.ClientService;
import com.ebank.ebanking2.Service.Tokenmailservice;
import com.ebank.ebanking2.mail.mail;
import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.ClientResDTO;
import com.ebank.ebanking2.model.dto.Clientchangedto;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.tokenmail;
import com.ebank.ebanking2.repository.Tokenmailrepo;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200/")
@RestController
@RequestMapping("api/clients")
public class ClientController {

    @Autowired
    ClientService clientService;
    @Autowired
    Tokenmailservice tokenmailservice;
    @Autowired
    Tokenmailrepo tokenrepo;
    @Autowired
    mail mailservice;


    @PostMapping("/client")
    public ResponseEntity<ClientResDTO> addClient(@RequestBody ClientDTO clientdto) {
        ClientResDTO cdto= clientService.addClient(clientdto);
        return new ResponseEntity<>(cdto, HttpStatus.CREATED);
    }


    @GetMapping
    public ResponseEntity<List<ClientResDTO>> allClients() {
        return ResponseEntity.ok(clientService.getAllClients());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ClientResDTO> getClient(@PathVariable("id") Long id) {
        return ResponseEntity.ok(clientService.getClientById(id));
    }
    @DeleteMapping("/{id}")
    public void deleteClient(@PathVariable("id") Long id) {
        clientService.deleteClient(id);
    }

    @PostMapping("/post/token/{id}")
    public boolean posttoken(@PathVariable("id") long id) throws MessagingException {
        String token=tokenmailservice.generateSixDigitToken();
        Client client = clientService.getClientnodtoById(id);
      String tokenma= tokenmailservice.savetoken(token,client).getToken();
      mailservice.javasend(client.getEmail(),tokenma,"validation token","token");
return true;
    }

    @RequestMapping("send-verification")
    public String sendEcodeVerification(){
        return mailservice.sendMailForEcode();
    }

    @PutMapping("/update/{id}")
    public boolean update(@RequestBody Clientchangedto clientchangedto, @RequestParam("token") String token, @PathVariable("id") long id) {
        boolean validation=tokenmailservice.validateToken(token,id);
        if (validation){
            clientService.updateclient(id, clientchangedto);
            return true;
        }
        else{
            return false;
        }

    }
    @GetMapping("/alltoken")
    public List<tokenmail>tokenmail(){
        return tokenrepo.findAll();
    }
    @DeleteMapping("/delete/token/{id}")
    public void delete(@PathVariable("id") long token) {
        tokenrepo.deleteById(token);
    }
}
