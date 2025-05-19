package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Compte;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CompteRepo extends MongoRepository<Compte, String> {

}
