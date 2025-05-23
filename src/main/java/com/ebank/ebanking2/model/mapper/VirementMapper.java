package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.VirementDTO;
import com.ebank.ebanking2.model.entity.Virement;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")

public interface VirementMapper {
    public Virement toEntity(VirementDTO virementDTO);
    public VirementDTO toDto(Virement virement);
}
