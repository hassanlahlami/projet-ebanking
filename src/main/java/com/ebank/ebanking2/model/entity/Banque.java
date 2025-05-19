package com.ebank.ebanking2.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("banque")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Banque {
    private double fraisVirement;
    private double plafondVirement;
    private double commissionCrypto;
    private double negatifMontantAutorise;

}
