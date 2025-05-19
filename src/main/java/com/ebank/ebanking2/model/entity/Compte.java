package com.ebank.ebanking2.model.entity;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Compte{
    private int id;
    private double solde;
    @Enumerated(EnumType.STRING)
    private StatusCompte status;
    private List<Virement> virements;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
