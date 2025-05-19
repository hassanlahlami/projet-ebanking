package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.VirementService;
import com.ebank.ebanking2.model.dto.VirementDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/virements")
public class VirementController {

    @Autowired
    private VirementService virementService;

    @PostMapping
    public ResponseEntity<String> virement(@RequestBody VirementDTO virementDTO) {
        return ResponseEntity.ok(virementService.effectuerVirement(virementDTO));
    }
}