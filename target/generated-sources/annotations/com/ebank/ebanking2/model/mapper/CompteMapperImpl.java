package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.CompteDTO;
import com.ebank.ebanking2.model.entity.Compte;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-05-21T15:42:46+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 21.0.7 (Microsoft)"
)
@Component
public class CompteMapperImpl implements CompteMapper {

    @Override
    public CompteDTO compteToCompteDTO(Compte compte) {
        if ( compte == null ) {
            return null;
        }

        CompteDTO.CompteDTOBuilder compteDTO = CompteDTO.builder();

        compteDTO.id( compte.getId() );
        compteDTO.solde( compte.getSolde() );
        compteDTO.status( compte.getStatus() );

        return compteDTO.build();
    }

    @Override
    public Compte compteDTOToCompte(CompteDTO compteDTO) {
        if ( compteDTO == null ) {
            return null;
        }

        Compte.CompteBuilder<?, ?> compte = Compte.builder();

        compte.id( compteDTO.getId() );
        compte.solde( compteDTO.getSolde() );
        compte.status( compteDTO.getStatus() );

        return compte.build();
    }
}
