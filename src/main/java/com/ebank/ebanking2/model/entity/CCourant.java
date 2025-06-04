package com.ebank.ebanking2.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.springframework.data.annotation.TypeAlias;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@DiscriminatorValue("CCOURANT")
@Entity
public class CCourant extends Compte{
    private boolean autorisePaiementEnLigne=true;
    @OneToMany(mappedBy = "compteEmetteur",cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<Virement> virementsEmis=new ArrayList<>();
    @OneToMany(mappedBy = "compteRecepteur",cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<Virement> virementsRecu = new ArrayList<>();
    @OneToMany(mappedBy = "compte",cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
    @JsonBackReference
    private List<Recharge> recharges = new ArrayList<>();
}
