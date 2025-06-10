package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.MaybeClientDTO;
import com.ebank.ebanking2.model.dto.MaybeClientResDTO;
import com.ebank.ebanking2.model.dto.MaybeClientWithEmailTokenDTO;
import com.ebank.ebanking2.model.dto.SubMaybeClientDTO;
import com.ebank.ebanking2.model.entity.MaybeClient;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:27+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class MaybeClientMapperImpl implements MaybeClientMapper {

    @Override
    public MaybeClient toEntity(MaybeClientDTO maybeClientDTO) {
        if ( maybeClientDTO == null ) {
            return null;
        }

        MaybeClient maybeClient = new MaybeClient();

        maybeClient.setFirstName( maybeClientDTO.getFirstName() );
        maybeClient.setLastName( maybeClientDTO.getLastName() );
        maybeClient.setEmail( maybeClientDTO.getEmail() );

        return maybeClient;
    }

    @Override
    public MaybeClientDTO toDto(MaybeClient maybeClient) {
        if ( maybeClient == null ) {
            return null;
        }

        MaybeClientDTO maybeClientDTO = new MaybeClientDTO();

        maybeClientDTO.setFirstName( maybeClient.getFirstName() );
        maybeClientDTO.setLastName( maybeClient.getLastName() );
        maybeClientDTO.setEmail( maybeClient.getEmail() );

        return maybeClientDTO;
    }

    @Override
    public MaybeClient toEntity(MaybeClientResDTO maybeClientResDTO) {
        if ( maybeClientResDTO == null ) {
            return null;
        }

        MaybeClient maybeClient = new MaybeClient();

        maybeClient.setEmailToken( maybeClientResDTO.getEmailToken() );
        maybeClient.setPhoneToken( maybeClientResDTO.getPhoneToken() );

        return maybeClient;
    }

    @Override
    public MaybeClientResDTO toResDto(MaybeClient maybeClient) {
        if ( maybeClient == null ) {
            return null;
        }

        MaybeClientResDTO maybeClientResDTO = new MaybeClientResDTO();

        maybeClientResDTO.setEmailToken( maybeClient.getEmailToken() );
        maybeClientResDTO.setPhoneToken( maybeClient.getPhoneToken() );

        return maybeClientResDTO;
    }

    @Override
    public MaybeClient toEntity(MaybeClientWithEmailTokenDTO maybeClientWithEmailTokenDTO) {
        if ( maybeClientWithEmailTokenDTO == null ) {
            return null;
        }

        MaybeClient maybeClient = new MaybeClient();

        maybeClient.setFirstName( maybeClientWithEmailTokenDTO.getFirstName() );
        maybeClient.setLastName( maybeClientWithEmailTokenDTO.getLastName() );
        maybeClient.setEmail( maybeClientWithEmailTokenDTO.getEmail() );
        maybeClient.setEmailToken( maybeClientWithEmailTokenDTO.getEmailToken() );

        return maybeClient;
    }

    @Override
    public SubMaybeClientDTO toDto(ClientDTO clientDTO) {
        if ( clientDTO == null ) {
            return null;
        }

        SubMaybeClientDTO subMaybeClientDTO = new SubMaybeClientDTO();

        subMaybeClientDTO.setFirstName( clientDTO.getFirstName() );
        subMaybeClientDTO.setLastName( clientDTO.getLastName() );
        subMaybeClientDTO.setUsername( clientDTO.getUsername() );
        subMaybeClientDTO.setEmail( clientDTO.getEmail() );
        subMaybeClientDTO.setPhone( clientDTO.getPhone() );

        return subMaybeClientDTO;
    }
}
