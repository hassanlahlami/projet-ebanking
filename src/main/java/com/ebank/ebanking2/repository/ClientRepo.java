package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Client;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClientRepo extends MongoRepository<Client, String> {
    Optional<Client> getFirstByOrderByIdDesc();
}
