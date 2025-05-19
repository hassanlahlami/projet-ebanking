package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Client;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ClientRepo extends MongoRepository<Client, String> {
}
