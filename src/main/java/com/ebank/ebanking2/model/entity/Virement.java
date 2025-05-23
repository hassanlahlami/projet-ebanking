package com.ebank.ebanking2.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

import java.time.LocalDateTime;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Virement {
    @Id
    private String id;
    @Indexed
    private String emetteurCompteId;
    @Indexed
    private String recepteurCompteId;
    private double montant;
    @Indexed
    @CreatedDate
    private LocalDateTime createdAt;
    @Indexed
    private Type type;
}
