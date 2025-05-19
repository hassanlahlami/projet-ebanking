package com.ebank.ebanking2.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Virement {
    private String id;
    private String idEmetteur;
    private String idRecepteur;
    private double montant;
    private LocalDateTime createdAt;
    private Type type;
}
