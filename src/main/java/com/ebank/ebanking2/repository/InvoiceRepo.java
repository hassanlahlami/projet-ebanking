package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface InvoiceRepo extends JpaRepository<Invoice, Long> {
    Optional<Invoice> findByClientIdAndProviderAndReferenceNumberAndDueDateAfter(Long clientId, String provider, String referenceNumber, LocalDateTime dueDateAfter);
}