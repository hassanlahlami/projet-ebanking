package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.StatusCompte;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class CEpargneResDTO {
    private Long id;
    private Client client;
    private String rib;
    private double solde;
    private StatusCompte status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private double tauxInterets;
    private LocalDateTime dateInterets;
}
