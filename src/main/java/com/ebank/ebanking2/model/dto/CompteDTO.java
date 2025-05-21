package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.StatusCompte;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompteDTO {
    private String id;
    private double solde;
    private StatusCompte status;
}
