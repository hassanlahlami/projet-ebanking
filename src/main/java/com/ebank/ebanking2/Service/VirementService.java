package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.entity.Banque;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.entity.Virement;
import com.ebank.ebanking2.repository.ClientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
public class VirementService {

    @Autowired
    private ClientRepo clientRepo;


    public String effectuerVirement(VirementDTO dto) {
        Client emetteur = clientRepo.findById(dto.getEmetteurId()).orElseThrow();
        Client recepteur = clientRepo.findById(dto.getRecepteurId()).orElseThrow();

        Compte compteEmetteur = emetteur.getComptes().stream().findFirst().orElseThrow();
        Compte compteRecepteur = recepteur.getComptes().stream().findFirst().orElseThrow();

        if (compteEmetteur.getSolde() < dto.getMontant()) throw new RuntimeException("Solde insuffisant");

        Virement v = new Virement(UUID.randomUUID().toString(), dto.getEmetteurId(), dto.getRecepteurId(), dto.getMontant(), LocalDateTime.now(), dto.getType());
        compteEmetteur.getVirements().add(v);
        compteRecepteur.getVirements().add(v);

        compteEmetteur.setSolde(compteEmetteur.getSolde() - dto.getMontant());
        compteRecepteur.setSolde(compteRecepteur.getSolde() + dto.getMontant());

        clientRepo.save(emetteur);
        clientRepo.save(recepteur);
        return "Virement effectué avec succès";
    }
}