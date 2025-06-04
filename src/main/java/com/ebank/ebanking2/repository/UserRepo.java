package com.ebank.ebanking2.repository;


import com.ebank.ebanking2.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {

}
