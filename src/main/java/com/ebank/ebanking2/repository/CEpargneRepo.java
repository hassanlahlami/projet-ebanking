package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.CEpargne;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CEpargneRepo extends JpaRepository<CEpargne, Long> {
    long count();
}
