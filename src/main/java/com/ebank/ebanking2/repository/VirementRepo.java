package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Virement;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface VirementRepo extends MongoRepository<Virement, String> {
}
