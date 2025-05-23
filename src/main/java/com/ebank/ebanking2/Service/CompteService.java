package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.CCourantDTO;
import com.ebank.ebanking2.model.dto.CEpargneDTO;

import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.CEpargne;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.mapper.CompteMapper;
import com.ebank.ebanking2.utils.IdGenerator;
import com.ebank.ebanking2.repository.CompteRepo;
import com.ebank.ebanking2.utils.RibGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ebank.ebanking2.model.entity.StatusCompte;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CompteService{
    @Autowired
    private CompteRepo compteRepo;
    @Autowired
    private CompteMapper compteMapper;
    private IdGenerator idGenerator=new IdGenerator("C",11);
    private RibGenerator ribGenerator=new RibGenerator();
    public CCourantDTO saveCCourant(CCourantDTO dto) {
        CCourant c = compteMapper.compteDTOToCompte(dto);
        Optional<Compte> lastCompte = compteRepo.getFirstByOrderByIdDesc();
        String id;
        String rib;
        if(lastCompte.isPresent()){
            id= idGenerator.generateNextId(lastCompte.get().getId());
            rib= ribGenerator.generateNextId(lastCompte.get().getRib());
        }else{
            id=idGenerator.generateNextId(null);
            rib= ribGenerator.generateNextId(null);
        }

        c.setId(id);
        c.setRib(rib);
        c.setCreatedAt(LocalDateTime.now());
        c.setUpdatedAt(LocalDateTime.now());
        c = compteRepo.save(c);
        return compteMapper.compteToCompteDTO(c);
    }

    public CEpargneDTO saveCEpargne(CEpargneDTO dto) {
        CEpargne e = compteMapper.compteDTOToCompte(dto);
        Optional<Compte> lastCompte = compteRepo.getFirstByOrderByIdDesc();
        String id;
        String rib;

        if(lastCompte.isPresent()){
            id= idGenerator.generateNextId(lastCompte.get().getId());
            rib= ribGenerator.generateNextId(lastCompte.get().getRib());
        }else{
            id=idGenerator.generateNextId(null);
            rib= ribGenerator.generateNextId(null);
        }
        e.setId(id);
        e.setRib(rib);
        e.setCreatedAt(LocalDateTime.now());
        e.setUpdatedAt(LocalDateTime.now());
        e = compteRepo.save(e);
        return compteMapper.compteToCompteDTO(e);
    }
    public List<?> filterListCompte(List<Compte> comptes, String type, String status){
        List<?> returnedList = new ArrayList<>();
        switch (status.toUpperCase()) {
            case "TOUT":
                returnedList=comptes;
                break;
            case "ACTIF":
            case "BLOQUE":
            case "FERME":
                returnedList= comptes.stream()
                        .filter(c->c.getStatus().equals(StatusCompte.valueOf(status)))
                        .toList();
                break;
            default:
                returnedList =comptes;
        }
        switch (type.toLowerCase()) {
            case "compte":
                break;
            case "ccourant":
                returnedList= returnedList.stream()
                        .filter(c -> c instanceof CCourant)
                        .map(c -> (CCourant) c)
                        .toList();
                break;
            case "cepargne":
                returnedList= returnedList.stream()
                        .filter(c -> c instanceof CEpargne)
                        .map(c -> (CEpargne) c)
                        .toList();
                System.out.println("returned: \n"+returnedList);
                break;
            default:
                returnedList= returnedList.stream()
                        .filter(c -> c instanceof CEpargne)
                        .map(c -> (CEpargne) c)
                        .toList();

                break;
        }


        return returnedList;
    };
    public List<?> get(String type, String status) {
        List<Compte> comptes = new ArrayList<>(compteRepo.findAll());
        List<?> returnedList = new ArrayList<>();
        returnedList = filterListCompte(comptes, type, status);
        return returnedList;
    }

    public Compte getById(String id) {
        return compteRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Compte non trouvé"));
    }

    public List<?> getByClientId(String clientId, String type, String status) {
        List<Compte> comptes= compteRepo.findByClientId(clientId);
        List<?> returnedList = new ArrayList<>();
        returnedList = filterListCompte(comptes, type, status);
        return returnedList;
    }

    public void deleteById(String id) {
        compteRepo.deleteById(id);
    }

    //pour changer de status de compte soit le blquer , soit le unbloquer , fermer...
    public Compte changeStatus(String id, StatusCompte newStatus) {
        Compte compte = compteRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Compte non trouvé avec ID: " + id));

        compte.setStatus(newStatus);
        compte.setUpdatedAt(LocalDateTime.now());
        compte = compteRepo.save(compte);

        return compte;
    }



}