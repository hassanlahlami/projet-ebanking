package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.VirementService;
import com.ebank.ebanking2.model.dto.VirementDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/virements")
public class VirementController {

    @Autowired
    private VirementService virementService;
    @GetMapping("/hello")
    public String hello() {
        return "Hello from virements";
    }
    @PostMapping("/virement")
    public ResponseEntity<VirementDTO> effectuerVirement(@RequestBody VirementDTO virementDTO) {
        return ResponseEntity.ok(virementService.effectuerVirement(virementDTO));
    }
    @GetMapping("/{id}")
    public ResponseEntity<List<VirementDTO>> getAllVirementsByEmetteurCompteIdOrRecepteurCompteId(@PathVariable String id) {
        return ResponseEntity.ok(virementService.getAllVirementByEmetteurCompteIdOrRecepteurCompteId(id,id));
    }



}