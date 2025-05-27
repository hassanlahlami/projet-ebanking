package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.*;

import com.ebank.ebanking2.model.entity.*;
import com.ebank.ebanking2.model.mapper.CompteMapper;
import com.ebank.ebanking2.repository.ClientRepo;
import com.ebank.ebanking2.repository.CompteRepo;
import com.ebank.ebanking2.repository.UserRepo;
import com.ebank.ebanking2.util.RibGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private ClientRepo clientRepo;

    @Autowired
    private RibGenerator ribGenerator;
    @Transactional
    public CCourantResDTO saveCCourant(CCourantDTO cCourantDTO) {
        Client client= clientRepo.findById(cCourantDTO.getClientId()).orElseThrow(() -> new RuntimeException("Client not found"));
        CCourant ccourant = compteMapper.toEntity(cCourantDTO);
        Optional<Compte> lastCompte = compteRepo.getFirstByOrderByIdDesc();
        String rib;
        if(lastCompte.isPresent()){
            rib= ribGenerator.generateNextId(lastCompte.get().getRib());
        }else{
            rib= ribGenerator.generateNextId(null);
        }
        ccourant.setRib(rib);
        ccourant.setClient(client);
        client.getComptes().add(ccourant);
        compteRepo.save(ccourant);
        return compteMapper.toResDTO(ccourant);
    }
    @Transactional
    public CEpargneResDTO saveCEpargne(CEpargneDTO cEpargneDTO) {
        Client client= clientRepo.findById(cEpargneDTO.getClientId()).orElseThrow(() -> new RuntimeException("Client not found"));
        CEpargne cEpargne = compteMapper.toEntity(cEpargneDTO);
        cEpargne.setClient(client);
        Optional<Compte> lastCompte = compteRepo.getFirstByOrderByIdDesc();
        String rib;
        if(lastCompte.isPresent()){
            rib= ribGenerator.generateNextId(lastCompte.get().getRib());
        }else{
            rib= ribGenerator.generateNextId(null);
        }
        cEpargne.setRib(rib);
        client.getComptes().add(cEpargne);
        compteRepo.save(cEpargne);
        return compteMapper.toResDTO(cEpargne);
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
                        .map(compteMapper::toResDTO)
                        .toList();
                break;
            case "cepargne":
                returnedList= returnedList.stream()
                        .filter(c -> c instanceof CEpargne)
                        .map(c -> (CEpargne) c)
                        .map(compteMapper::toResDTO)
                        .toList();
                System.out.println("returned: \n"+returnedList);
                break;
            default:
                returnedList= returnedList.stream()
                        .map(c->(Compte) c)
                        .map(compteMapper::toCompteResDTO)
                        .toList();

                break;
        }


        return returnedList;
    }


    public List<?> get(String type, String status) {
        List<Compte> comptes = compteRepo.findAll();
        return filterListCompte(comptes, type, status);
    }


}