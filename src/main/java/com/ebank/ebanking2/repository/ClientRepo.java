package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.Service.CompteService;
import com.ebank.ebanking2.model.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

import java.util.Optional;

@Repository
public interface ClientRepo extends JpaRepository<Client, Long> {
    Optional<Client> getFirstByOrderByIdDesc();

    Client findByEmail(String email);
}
