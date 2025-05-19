package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Banque;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BanqueRepo extends MongoRepository<Banque, String> {
}
