package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.entity.*;
import com.ebank.ebanking2.model.mapper.VirementMapper;

import com.ebank.ebanking2.utils.IdGenerator;
import com.ebank.ebanking2.repository.ClientRepo;
import com.ebank.ebanking2.repository.CompteRepo;
import com.ebank.ebanking2.repository.VirementRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VirementService{
    @Autowired
    private ClientRepo clientRepo;
    private IdGenerator idGenerator=new IdGenerator("V",17);
    @Autowired
    private VirementRepo virementRepo;

    @Autowired
    private VirementMapper virementMapper;
    @Autowired
    private CompteRepo compteRepo;

    public VirementDTO effectuerVirement(VirementDTO dto) {
        // Validation des clients

        Compte cEmetteur = compteRepo.findById(dto.getEmetteurCompteId())
                .orElseThrow(() -> new RuntimeException("Émetteur non trouvé avec l'ID: " + dto.getEmetteurCompteId()));
        Compte cRecepteur = compteRepo.findById(dto.getRecepteurCompteId())
                .orElseThrow(() -> new RuntimeException("Récepteur non trouvé avec l'ID: " + dto.getRecepteurCompteId()));
        if(cEmetteur instanceof CEpargne){
            throw new RuntimeException("le compte emetteur est epargne, vous ne pouver pas initier virement!");
        }
        if(cRecepteur instanceof CEpargne){
            throw new RuntimeException("le compte recepteur est epargne, vous ne pouver pas initier virement!");
        }
        CCourant ccEmetteur = (CCourant) cEmetteur;
        CCourant ccRecepteur = (CCourant) cRecepteur;
        if (ccEmetteur.getStatus() != StatusCompte.ACTIF || ccRecepteur.getStatus() != StatusCompte.ACTIF) {
            throw new RuntimeException("Le compte émetteur ou récepteur n'est pas actif");
        }
        if (ccEmetteur.getSolde() < dto.getMontant()) {
            throw new RuntimeException("Solde insuffisant sur le compte émetteur");
        }
        Virement virement = virementMapper.toEntity(dto);
        // Mise à jour des soldes
        cEmetteur.setSolde(cEmetteur.getSolde() - dto.getMontant());
        cRecepteur.setSolde(cRecepteur.getSolde() + dto.getMontant());
//        // Ajout de l'ID du virement aux comptes
//        compteEmetteur.getVirements().add(virement.getId());
//        compteRecepteur.getVirements().add(virement.getId());
        // Sauvegarde des entités
        Optional<Virement> lastVirement=virementRepo.getFirstByOrderByIdDesc();
        String id;
        if(lastVirement.isPresent()){
            id=idGenerator.generateNextId(lastVirement.get().getId());
        }else{
            id=idGenerator.generateNextId(null);
        }
        virement.setId(id);
        virementRepo.save(virement);
        compteRepo.save(cEmetteur);
        compteRepo.save(cRecepteur);
        return virementMapper.toDto(virement);
    }
    public List<VirementDTO> getAllVirementByEmetteurCompteIdOrRecepteurCompteId(String eCompteId, String rCompteId) {
        return this.virementRepo.findVirementByEmetteurCompteIdOrRecepteurCompteId(eCompteId,rCompteId);
    }
}