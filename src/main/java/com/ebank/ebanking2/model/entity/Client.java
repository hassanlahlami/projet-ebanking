package com.ebank.ebanking2.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@DiscriminatorValue("CLIENT")
@Entity
public class Client extends User {
    private boolean valid = false;
    private String job;
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL,fetch = FetchType.EAGER, orphanRemoval = true)
    @JsonBackReference
    private List<Compte> comptes=new ArrayList<>();
    @JsonBackReference
    @OneToMany(mappedBy = "client",cascade = CascadeType.ALL,fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Invoice> invoices=new ArrayList<>();

}