package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.Type;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class VirementResDTO {
    private Long id;
    private CompteResDTO compteEmetteur;
    private CompteResDTO compteRecepteur;
    private double montant;
    private LocalDateTime createdAt;
    private Type type;
}
