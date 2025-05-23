package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.CCourantDTO;
import com.ebank.ebanking2.model.dto.CEpargneDTO;
import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.CEpargne;
import com.ebank.ebanking2.model.entity.Compte;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CompteMapper {
    public CCourantDTO compteToCompteDTO(CCourant compte);
    public CCourant compteDTOToCompte(CCourantDTO compteDTO);
    public CEpargneDTO compteToCompteDTO(CEpargne compte);
    public CEpargne compteDTOToCompte(CEpargneDTO compteDTO);
}
