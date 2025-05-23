package com.ebank.ebanking2.model.dto;

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
public class CCourantDTO {
    private String clientId;
    private double solde;
    private StatusCompte status;

}
