package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.CCourant;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToOne;
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
public class RechargeResDTO {
    private Long id;
    private String operateur;
    private String phoneNumber;
    private int montant;
    private LocalDateTime createdAt;
    private CCourant compte;
}
