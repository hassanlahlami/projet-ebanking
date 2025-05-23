package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.CompteService;
import com.ebank.ebanking2.model.dto.CCourantDTO;
import com.ebank.ebanking2.model.dto.CEpargneDTO;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.entity.StatusCompte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comptes")
public class CompteController {
    @Autowired
    private CompteService compteService;

    @GetMapping("{status}/{type}")
    public ResponseEntity<List<?>> getAll(@PathVariable("status") String status, @PathVariable("type") String type) {
        return ResponseEntity.ok(compteService.get(type,status));
    }

    @GetMapping("/compte/{id}")
    public ResponseEntity<Compte> getById(@PathVariable String id) {
        return ResponseEntity.ok(compteService.getById(id));
    }

    @GetMapping("/client/{clientId}")
    public ResponseEntity<List<?>> getByClientId(@PathVariable String clientId, @RequestParam String type, @RequestParam String status) {
        return ResponseEntity.ok(compteService.getByClientId(clientId,type,status));
    }

    @PostMapping("/comptecourant")
    public ResponseEntity<CCourantDTO> create(@RequestBody CCourantDTO dto) {
        return ResponseEntity.ok(compteService.saveCCourant(dto));
    }
    @PostMapping("/compteepargne")
    public ResponseEntity<CEpargneDTO> create(@RequestBody CEpargneDTO dto) {
        return ResponseEntity.ok(compteService.saveCEpargne(dto));
    }


    @DeleteMapping("/compte/{id}")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        compteService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/compte/status/{id}")
    public ResponseEntity<Compte> updateStatus(@PathVariable String id,@RequestParam StatusCompte status) {
        return ResponseEntity.ok(compteService.changeStatus(id, status));
    }

}
