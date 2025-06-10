package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.CCourantDTO;
import com.ebank.ebanking2.model.dto.CCourantResDTO;
import com.ebank.ebanking2.model.dto.CEpargneDTO;
import com.ebank.ebanking2.model.dto.CEpargneResDTO;
import com.ebank.ebanking2.model.dto.CompteResDTO;
import com.ebank.ebanking2.model.dto.CompteResDTOChat;
import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.CEpargne;
import com.ebank.ebanking2.model.entity.Compte;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:27+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class CompteMapperImpl implements CompteMapper {

    @Autowired
    private VirementMapper virementMapper;
    @Autowired
    private RechargeMapper rechargeMapper;

    @Override
    public CCourant toEntity(CCourantDTO cCourantDTO) {
        if ( cCourantDTO == null ) {
            return null;
        }

        CCourant.CCourantBuilder<?, ?> cCourant = CCourant.builder();

        cCourant.solde( cCourantDTO.getSolde() );
        cCourant.status( cCourantDTO.getStatus() );
        cCourant.autorisePaiementEnLigne( cCourantDTO.isAutorisePaiementEnLigne() );

        return cCourant.build();
    }

    @Override
    public CCourantResDTO toResDTO(CCourant cCourant) {
        if ( cCourant == null ) {
            return null;
        }

        CCourantResDTO.CCourantResDTOBuilder<?, ?> cCourantResDTO = CCourantResDTO.builder();

        cCourantResDTO.id( cCourant.getId() );
        cCourantResDTO.rib( cCourant.getRib() );
        cCourantResDTO.solde( cCourant.getSolde() );
        cCourantResDTO.status( cCourant.getStatus() );
        cCourantResDTO.createdAt( cCourant.getCreatedAt() );
        cCourantResDTO.updatedAt( cCourant.getUpdatedAt() );
        cCourantResDTO.autorisePaiementEnLigne( cCourant.isAutorisePaiementEnLigne() );
        cCourantResDTO.virementsEmis( virementMapper.toResDTOList( cCourant.getVirementsEmis() ) );
        cCourantResDTO.virementsRecu( virementMapper.toResDTOList( cCourant.getVirementsRecu() ) );
        cCourantResDTO.recharges( rechargeMapper.ToResDTOList( cCourant.getRecharges() ) );

        return cCourantResDTO.build();
    }

    @Override
    public CEpargne toEntity(CEpargneDTO cEpargneDTO) {
        if ( cEpargneDTO == null ) {
            return null;
        }

        CEpargne.CEpargneBuilder<?, ?> cEpargne = CEpargne.builder();

        cEpargne.solde( cEpargneDTO.getSolde() );
        cEpargne.status( cEpargneDTO.getStatus() );
        if ( cEpargneDTO.getTauxInterets() != null ) {
            cEpargne.tauxInterets( cEpargneDTO.getTauxInterets() );
        }
        cEpargne.dateInterets( cEpargneDTO.getDateInterets() );

        return cEpargne.build();
    }

    @Override
    public CEpargneResDTO toResDTO(CEpargne cEpargne) {
        if ( cEpargne == null ) {
            return null;
        }

        CEpargneResDTO.CEpargneResDTOBuilder<?, ?> cEpargneResDTO = CEpargneResDTO.builder();

        cEpargneResDTO.id( cEpargne.getId() );
        cEpargneResDTO.client( cEpargne.getClient() );
        cEpargneResDTO.rib( cEpargne.getRib() );
        cEpargneResDTO.solde( cEpargne.getSolde() );
        cEpargneResDTO.status( cEpargne.getStatus() );
        cEpargneResDTO.createdAt( cEpargne.getCreatedAt() );
        cEpargneResDTO.updatedAt( cEpargne.getUpdatedAt() );
        cEpargneResDTO.tauxInterets( cEpargne.getTauxInterets() );
        cEpargneResDTO.dateInterets( cEpargne.getDateInterets() );

        return cEpargneResDTO.build();
    }

    @Override
    public CompteResDTO toCompteResDTO(Compte compte) {
        if ( compte == null ) {
            return null;
        }

        CompteResDTO.CompteResDTOBuilder<?, ?> compteResDTO = CompteResDTO.builder();

        compteResDTO.id( compte.getId() );
        compteResDTO.rib( compte.getRib() );
        compteResDTO.solde( compte.getSolde() );
        compteResDTO.status( compte.getStatus() );
        compteResDTO.createdAt( compte.getCreatedAt() );
        compteResDTO.updatedAt( compte.getUpdatedAt() );

        compteResDTO.accountType( compte.getAccountType() );

        return compteResDTO.build();
    }

    @Override
    public CCourantDTO toDtoCoutant(CCourant courant) {
        if ( courant == null ) {
            return null;
        }

        CCourantDTO.CCourantDTOBuilder<?, ?> cCourantDTO = CCourantDTO.builder();

        cCourantDTO.solde( courant.getSolde() );
        cCourantDTO.status( courant.getStatus() );
        cCourantDTO.autorisePaiementEnLigne( courant.isAutorisePaiementEnLigne() );

        return cCourantDTO.build();
    }

    @Override
    public CompteResDTOChat toCompteResDTOChat(Compte compte) {
        if ( compte == null ) {
            return null;
        }

        CompteResDTOChat.CompteResDTOChatBuilder<?, ?> compteResDTOChat = CompteResDTOChat.builder();

        compteResDTOChat.id( compte.getId() );
        compteResDTOChat.rib( compte.getRib() );
        compteResDTOChat.accountType( compte.getAccountType() );

        return compteResDTOChat.build();
    }
}
