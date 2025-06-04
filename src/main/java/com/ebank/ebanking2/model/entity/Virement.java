package com.ebank.ebanking2.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Virement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne//@ManyToOne means many records of the current entity are associated with one record of another entity
    @JoinColumn(name = "compte_emetteur_id")
    private CCourant compteEmetteur;

    @ManyToOne
    @JoinColumn(name = "compte_recepteur_id")
    private CCourant compteRecepteur;

    private double montant;

    @CreatedDate
    private LocalDateTime createdAt;

    @Enumerated(EnumType.STRING)
    private Type type;
}
