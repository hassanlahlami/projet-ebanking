package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Virement;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface VirementRepo extends MongoRepository<Virement, String> {
    public List<VirementDTO> findVirementByEmetteurCompteIdOrRecepteurCompteId(String EmetteurCompteId,String RecepteurCompteId);
    Optional<Virement> getFirstByOrderByIdDesc();

}