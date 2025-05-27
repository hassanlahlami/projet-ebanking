package com.ebank.ebanking2.repository;

import com.ebank.ebanking2.model.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import jakarta.data.repository.Repository;

@Repository
public interface InvoiceRepo extends JpaRepository<Invoice, Long> {
    Invoice findByClientIdAndProviderAndReferenceNumber(Long clientId, String provider, String referenceNumber);
}
