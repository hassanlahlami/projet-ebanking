package com.ebank.ebanking2.controller;


import com.ebank.ebanking2.Service.ClientService;
import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/clients")
public class ClientController {

    @Autowired
    ClientService clientService;

    @PostMapping("/client")
    public ResponseEntity<ClientDTO> addClient(@RequestBody ClientDTO clientdto) {
        ClientDTO cdto= clientService.save(clientdto);
        return new ResponseEntity<>(cdto, HttpStatus.CREATED);
    }


    @GetMapping
    public ResponseEntity<List<ClientDTO>> allClients() {
        return ResponseEntity.ok(clientService.getAllClients());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ClientDTO> getClient(@PathVariable String id) {
        return ResponseEntity.ok(clientService.getClientById(id));
    }
}
