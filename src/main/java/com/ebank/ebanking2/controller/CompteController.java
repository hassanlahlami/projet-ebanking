package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.CompteService;
import com.ebank.ebanking2.model.dto.*;
import com.ebank.ebanking2.model.entity.Compte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/comptes")
@CrossOrigin
public class CompteController {
    @Autowired
    private CompteService compteService;

    @GetMapping("{status}/{type}")
    public ResponseEntity<List<?>> getAll(@PathVariable("status") String status, @PathVariable("type") String type) {
        return ResponseEntity.ok(compteService.get(type,status));
    }
    @GetMapping("solde/{rib}")
    public double getSolde( @PathVariable("rib") String rib){
        return compteService.getSolde(rib);
    }

    @GetMapping("/compte/{id}")
    public ResponseEntity<Compte> getById(@PathVariable Long id) {
        return ResponseEntity.ok(compteService.getById(id));
    }
//
//    @GetMapping("/client/{clientId}/{type}/{status}")
//    public ResponseEntity<List<?>> getByClientId(@PathVariable("clientId") Long clientId, @PathVariable("type") String type, @PathVariable("status") String status) {
//        return ResponseEntity.ok(compteService.getByClientId(clientId,type,status));
//    }
//
    @GetMapping("/client/{clientId}/{type}/{status}")
    public ResponseEntity<List<?>> getByClientId(@PathVariable("clientId") Long clientId, @PathVariable("type") String type, @PathVariable("status") String status) {
        return ResponseEntity.ok(compteService.getByClientId(clientId, type, status));
    }
    public ResponseEntity<List<?>> getComptes(@PathVariable("clientId") Long clientId, @PathVariable("type") String type, @PathVariable("status") String status) {
        return ResponseEntity.ok(compteService.getComptes(clientId,type,status));
    }



    @PostMapping("/comptecourant")
    public ResponseEntity<CCourantResDTO> create(@RequestBody CCourantDTO dto) {
        return ResponseEntity.ok(compteService.saveCCourant(dto));
    }
@GetMapping("/getallbyid/{id}/{type}/{status}")
public String getallbyid(@PathVariable("id")Long id,@PathVariable("type") String type,@PathVariable("status")String status){
        return compteService.getAllComptes(id,type,status);
}



    @PostMapping("/compteepargne")
    public ResponseEntity<CEpargneResDTO> create(@RequestBody CEpargneDTO dto) {
        return ResponseEntity.ok(compteService.saveCEpargne(dto));
    }



    @GetMapping("client/{clientId}/cCourant")
    public ResponseEntity<List<CCourantResDTO>> getCCourantByClientId(@PathVariable("clientId") Long clientId) {
        return ResponseEntity.ok(new ArrayList<>());
    }
    @GetMapping("soldee/{rib}")
    public double getSoldee( @PathVariable("rib") String rib){
        return compteService.getSolde(rib);

    }


}
