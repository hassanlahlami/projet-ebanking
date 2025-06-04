package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.entity.Virement;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface VirementRepo extends JpaRepository<Virement, Long> {
    Optional<Virement> getFirstByOrderByIdDesc();

}