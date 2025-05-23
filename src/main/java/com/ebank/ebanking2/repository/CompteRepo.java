package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;
import java.util.Optional;

public interface CompteRepo extends MongoRepository<Compte, String> {
    List<Compte> findByClientId(String clientId);
    Optional<Compte> getFirstByOrderByIdDesc();
}
