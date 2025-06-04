package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.CompteService;
import com.ebank.ebanking2.model.dto.CCourantDTO;
import com.ebank.ebanking2.model.dto.CCourantResDTO;
import com.ebank.ebanking2.model.dto.CEpargneDTO;
import com.ebank.ebanking2.model.dto.CEpargneResDTO;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.entity.StatusCompte;
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

//    @GetMapping("/compte/{id}")
//    public ResponseEntity<Compte> getById(@PathVariable Long id) {
//        return ResponseEntity.ok(compteService.getById(id));
//    }
//
    @GetMapping("/client/{clientId}/{type}/{status}")
    public ResponseEntity<List<?>> getComptes(@PathVariable("clientId") Long clientId, @PathVariable("type") String type, @PathVariable("status") String status) {
        return ResponseEntity.ok(compteService.getComptes(clientId,type,status));
    }



    @PostMapping("/comptecourant")
    public ResponseEntity<CCourantResDTO> create(@RequestBody CCourantDTO dto) {
        return ResponseEntity.ok(compteService.saveCCourant(dto));
    }



    @PostMapping("/compteepargne")
    public ResponseEntity<CEpargneResDTO> create(@RequestBody CEpargneDTO dto) {
        return ResponseEntity.ok(compteService.saveCEpargne(dto));
    }

//    @GetMapping("solde/{rib}")
//    public double getSolde( @PathVariable("rib") String rib){
//        return compteService.getSolde(rib);
//    }


//    @DeleteMapping("/compte/{id}")
//    public ResponseEntity<Void> delete(@PathVariable Long id) {
//        compteService.deleteById(id);
//        return ResponseEntity.noContent().build();
//    }
//
//    @PatchMapping("/compte/status/{id}")
//    public ResponseEntity<Compte> updateStatus(@PathVariable Long id,@RequestParam StatusCompte status) {
//        return ResponseEntity.ok(compteService.changeStatus(id, status));
//    }
//
//    @GetMapping("client/{clientId}/cCourant")
//    public ResponseEntity<List<CCourantResDTO>> getCCourantByClientId(@PathVariable("clientId") String clientId) {
//        return compteService.getCCourantByClientId(clientId);
//    }
//
//    @GetMapping("solde/{rib}")
//    public double getCompteSolde( @PathVariable("rib") String rib){
//        return compteService.getCompteSolde(rib);
//    }
    @GetMapping("soldee/{rib}")
    public double getSoldee( @PathVariable("rib") String rib){
        return compteService.getSoldee(rib);
    }

}
