package com.ebank.ebanking2.model.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
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
    private boolean autorisePaiementEnLigne=false;
    @OneToMany(mappedBy = "compteEmetteur",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Virement> virementsEmis=new ArrayList<>();
    @OneToMany(mappedBy = "compteRecepteur",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Virement> virementsRecu = new ArrayList<>();
    @OneToMany(mappedBy = "compte",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Recharge> recharges = new ArrayList<>();
}
