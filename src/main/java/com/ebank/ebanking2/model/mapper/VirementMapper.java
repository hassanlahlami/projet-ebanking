package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.dto.VirementResDTO;
import com.ebank.ebanking2.model.entity.Virement;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")

public interface VirementMapper {
    @Mapping(target = "compteEmetteur", ignore = true)
    @Mapping(target = "compteRecepteur", ignore = true)
    public Virement toEntity(VirementDTO virementDTO);
    public VirementResDTO toResDTO(Virement virement);
}
