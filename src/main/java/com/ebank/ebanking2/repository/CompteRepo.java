package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.entity.StatusCompte;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Optional;
import jakarta.data.repository.Repository;
import org.springframework.data.repository.query.Param;

@Repository
public interface CompteRepo extends JpaRepository<Compte, Long> {
    Optional<Compte> getFirstByOrderByIdDesc();
    List<Compte> findByClientId(Long clientId);

}

