package com.ebank.ebanking2.repository;


import com.ebank.ebanking2.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
