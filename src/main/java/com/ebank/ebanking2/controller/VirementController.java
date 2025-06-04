package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.VirementService;
import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.dto.VirementDTOrib;
import com.ebank.ebanking2.model.dto.VirementResDTO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/virements")
@CrossOrigin
public class VirementController {

    @Autowired
    private VirementService virementService;
    @GetMapping("/hello")
    public String hello() {
        return "Hello from virements";
    }
//    @PostMapping("/virement")
//    public ResponseEntity<VirementDTO> effectuerVirement(@RequestBody VirementDTO virementDTO) {
//    public ResponseEntity<VirementResDTO> effectuerVirement(@RequestBody VirementDTO virementDTO) {
//        return ResponseEntity.ok(virementService.effectuerVirement(virementDTO));
//    }
//    @GetMapping("/{id}")
//    public ResponseEntity<List<VirementDTO>> getAllVirementsByEmetteurCompteIdOrRecepteurCompteId(@PathVariable Long id) {
//        return ResponseEntity.ok(virementService.getAllVirementByEmetteurCompteIdOrRecepteurCompteId(id,id));
//    }
    @GetMapping("/{id}")
    public ResponseEntity<Page<VirementResDTO>> getAllVirementsByEmetteurCompteIdOrRecepteurCompteId(@PathVariable("id") Long id, @RequestParam("offset") Integer offset, @RequestParam("size") Integer size) {
        return ResponseEntity.ok(virementService.getAllVirementByEmetteurCompteIdOrRecepteurCompteId(id,id,offset,size));
    }
    @GetMapping("/{id}/recu")
    public ResponseEntity<byte[]> getRecuPdf(@PathVariable("id") Long id) throws IOException {
        Path path = Paths.get(System.getProperty("user.dir"),"recus/recu_virement_" + id + ".pdf");

        if (!Files.exists(path)) {
            throw new FileNotFoundException("PDF not found: " + path.toAbsolutePath());
        }

        byte[] pdfContent = Files.readAllBytes(path);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=recu_virement_" + id + ".pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdfContent);
    }
    @PostMapping("/virement")
    public ResponseEntity<?> executeVirement(@RequestBody VirementDTOrib request) {
        try {
            VirementResDTO response = virementService.executeVirement(request);
            return ResponseEntity.ok(Map.of(
                    "message", "Virement effectué avec succès",
                    "data", response
            ));
        } catch (IllegalArgumentException | IllegalStateException ex) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", ex.getMessage()
            ));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of(
                    "error", "Erreur inattendue"
            ));
        }
    }



}