package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.CompteDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-05-21T15:42:47+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 21.0.7 (Microsoft)"
)
@Component
public class ClientMapperImpl implements ClientMapper {

    @Override
    public ClientDTO clientToClientDTO(Client client) {
        if ( client == null ) {
            return null;
        }

        ClientDTO.ClientDTOBuilder<?, ?> clientDTO = ClientDTO.builder();

        clientDTO.id( client.getId() );
        clientDTO.username( client.getUsername() );
        clientDTO.email( client.getEmail() );
        clientDTO.comptes( compteListToCompteDTOList( client.getComptes() ) );

        return clientDTO.build();
    }

    @Override
    public Client clientDTOToClient(ClientDTO clientdto) {
        if ( clientdto == null ) {
            return null;
        }

        Client.ClientBuilder<?, ?> client = Client.builder();

        client.id( clientdto.getId() );
        client.username( clientdto.getUsername() );
        client.email( clientdto.getEmail() );
        client.comptes( compteDTOListToCompteList( clientdto.getComptes() ) );

        return client.build();
    }

    protected CompteDTO compteToCompteDTO(Compte compte) {
        if ( compte == null ) {
            return null;
        }

        CompteDTO.CompteDTOBuilder compteDTO = CompteDTO.builder();

        compteDTO.id( compte.getId() );
        compteDTO.solde( compte.getSolde() );
        compteDTO.status( compte.getStatus() );

        return compteDTO.build();
    }

    protected List<CompteDTO> compteListToCompteDTOList(List<Compte> list) {
        if ( list == null ) {
            return null;
        }

        List<CompteDTO> list1 = new ArrayList<CompteDTO>( list.size() );
        for ( Compte compte : list ) {
            list1.add( compteToCompteDTO( compte ) );
        }

        return list1;
    }

    protected Compte compteDTOToCompte(CompteDTO compteDTO) {
        if ( compteDTO == null ) {
            return null;
        }

        Compte.CompteBuilder<?, ?> compte = Compte.builder();

        compte.id( compteDTO.getId() );
        compte.solde( compteDTO.getSolde() );
        compte.status( compteDTO.getStatus() );

        return compte.build();
    }

    protected List<Compte> compteDTOListToCompteList(List<CompteDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<Compte> list1 = new ArrayList<Compte>( list.size() );
        for ( CompteDTO compteDTO : list ) {
            list1.add( compteDTOToCompte( compteDTO ) );
        }

        return list1;
    }
}
