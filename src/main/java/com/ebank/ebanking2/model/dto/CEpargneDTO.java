package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.StatusCompte;

import java.time.LocalDateTime;

public class CEpargneDTO {
    private String id;
    private String clientId;
    private double solde;
    private StatusCompte status;
    private Double tauxInterets;
    private LocalDateTime dateInterets;
}
