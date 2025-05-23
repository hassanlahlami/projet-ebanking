package com.ebank.ebanking2.model.entity;


import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.config.EnableMongoAuditing;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDateTime;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Document(collection = "comptes")
@TypeAlias("compte")
@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "_class")

@JsonSubTypes({
        @JsonSubTypes.Type(value = CCourant.class, name = "courant"),
        @JsonSubTypes.Type(value = CEpargne.class, name = "epargne")
})

public class Compte{
    @Id
    private String id;
    @Indexed
    private String clientId;
    @Indexed
    private String rib;
    @Indexed
    private double solde;
    @Indexed
    private StatusCompte status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
