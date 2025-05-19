package com.ebank.ebanking2.repository;


import com.ebank.ebanking2.model.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepo extends MongoRepository<User, String> {

}
