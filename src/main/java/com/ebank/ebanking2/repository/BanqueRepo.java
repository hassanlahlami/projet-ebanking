package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Banque;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BanqueRepo extends MongoRepository<Banque, String> {
}
