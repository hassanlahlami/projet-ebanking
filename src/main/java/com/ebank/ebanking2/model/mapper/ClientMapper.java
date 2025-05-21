package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.entity.Client;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ClientMapper {
    ClientDTO clientToClientDTO(Client client);
    Client clientDTOToClient(ClientDTO clientdto);
}
