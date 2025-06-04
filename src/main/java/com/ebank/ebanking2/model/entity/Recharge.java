package com.ebank.ebanking2.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Recharge {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;
    private String operateur;
    private String phoneNumber;
    private int montant;
    @ManyToOne(fetch = FetchType.LAZY)
    private CCourant compte;

    @CreationTimestamp
    @Column(updatable = false)
    private LocalDateTime createdAt;


}
