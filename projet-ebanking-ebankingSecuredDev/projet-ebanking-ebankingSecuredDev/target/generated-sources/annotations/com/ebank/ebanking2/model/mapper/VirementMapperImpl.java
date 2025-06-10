package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.CompteResDTO;
import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.dto.VirementDTOrib;
import com.ebank.ebanking2.model.dto.VirementResDTO;
import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.Virement;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:27+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class VirementMapperImpl implements VirementMapper {

    @Override
    public Virement toEntity(VirementDTO virementDTO) {
        if ( virementDTO == null ) {
            return null;
        }

        Virement.VirementBuilder virement = Virement.builder();

        virement.montant( virementDTO.getMontant() );
        virement.type( virementDTO.getType() );

        return virement.build();
    }

    @Override
    public Virement toEntity(VirementDTOrib virementDTOrib) {
        if ( virementDTOrib == null ) {
            return null;
        }

        Virement.VirementBuilder virement = Virement.builder();

        virement.montant( virementDTOrib.getMontant() );
        virement.type( virementDTOrib.getType() );

        return virement.build();
    }

    @Override
    public VirementResDTO toResDTO(Virement virement) {
        if ( virement == null ) {
            return null;
        }

        VirementResDTO.VirementResDTOBuilder<?, ?> virementResDTO = VirementResDTO.builder();

        virementResDTO.id( virement.getId() );
        virementResDTO.compteEmetteur( cCourantToCompteResDTO( virement.getCompteEmetteur() ) );
        virementResDTO.compteRecepteur( cCourantToCompteResDTO1( virement.getCompteRecepteur() ) );
        virementResDTO.montant( virement.getMontant() );
        virementResDTO.createdAt( virement.getCreatedAt() );
        virementResDTO.type( virement.getType() );

        return virementResDTO.build();
    }

    @Override
    public List<VirementResDTO> toResDTOList(List<Virement> virements) {
        if ( virements == null ) {
            return null;
        }

        List<VirementResDTO> list = new ArrayList<VirementResDTO>( virements.size() );
        for ( Virement virement : virements ) {
            list.add( toResDTO( virement ) );
        }

        return list;
    }

    protected CompteResDTO cCourantToCompteResDTO(CCourant cCourant) {
        if ( cCourant == null ) {
            return null;
        }

        CompteResDTO.CompteResDTOBuilder<?, ?> compteResDTO = CompteResDTO.builder();

        compteResDTO.id( cCourant.getId() );
        compteResDTO.rib( cCourant.getRib() );
        compteResDTO.solde( cCourant.getSolde() );
        compteResDTO.status( cCourant.getStatus() );
        compteResDTO.createdAt( cCourant.getCreatedAt() );
        compteResDTO.updatedAt( cCourant.getUpdatedAt() );
        compteResDTO.autorisePaiementEnLigne( cCourant.isAutorisePaiementEnLigne() );
        compteResDTO.accountType( cCourant.getAccountType() );

        return compteResDTO.build();
    }

    protected CompteResDTO cCourantToCompteResDTO1(CCourant cCourant) {
        if ( cCourant == null ) {
            return null;
        }

        CompteResDTO.CompteResDTOBuilder<?, ?> compteResDTO = CompteResDTO.builder();

        compteResDTO.id( cCourant.getId() );
        compteResDTO.rib( cCourant.getRib() );
        compteResDTO.solde( cCourant.getSolde() );
        compteResDTO.status( cCourant.getStatus() );
        compteResDTO.createdAt( cCourant.getCreatedAt() );
        compteResDTO.updatedAt( cCourant.getUpdatedAt() );
        compteResDTO.autorisePaiementEnLigne( cCourant.isAutorisePaiementEnLigne() );
        compteResDTO.accountType( cCourant.getAccountType() );

        return compteResDTO.build();
    }
}
