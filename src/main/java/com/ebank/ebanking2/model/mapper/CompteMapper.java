package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.CompteDTO;
import com.ebank.ebanking2.model.entity.Compte;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CompteMapper {
    public CompteDTO compteToCompteDTO(Compte compte);
    public Compte compteDTOToCompte(CompteDTO compteDTO);
}
