package com.ebank.ebanking2.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.data.annotation.TypeAlias;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@TypeAlias("courant")
public class CCourant extends Compte{
    private boolean autorisePaiementEnLigne=false;
}
