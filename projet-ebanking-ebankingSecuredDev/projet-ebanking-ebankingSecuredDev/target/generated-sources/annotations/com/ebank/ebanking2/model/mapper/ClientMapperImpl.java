package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.ClientResDTO;
import com.ebank.ebanking2.model.dto.CompteResDTO;
import com.ebank.ebanking2.model.dto.InvoiceResDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.entity.Invoice;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:28+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class ClientMapperImpl implements ClientMapper {

    @Override
    public Client toEntity(ClientDTO clientdto) {
        if ( clientdto == null ) {
            return null;
        }

        Client.ClientBuilder<?, ?> client = Client.builder();

        client.firstName( clientdto.getFirstName() );
        client.lastName( clientdto.getLastName() );
        client.username( clientdto.getUsername() );
        client.password( clientdto.getPassword() );
        client.email( clientdto.getEmail() );
        client.phone( clientdto.getPhone() );
        client.job( clientdto.getJob() );
        client.valid( clientdto.isValid() );

        return client.build();
    }

    @Override
    public ClientResDTO toResDTO(Client client) {
        if ( client == null ) {
            return null;
        }

        ClientResDTO.ClientResDTOBuilder<?, ?> clientResDTO = ClientResDTO.builder();

        clientResDTO.id( client.getId() );
        clientResDTO.firstName( client.getFirstName() );
        clientResDTO.lastName( client.getLastName() );
        clientResDTO.username( client.getUsername() );
        clientResDTO.email( client.getEmail() );
        clientResDTO.phone( client.getPhone() );
        clientResDTO.job( client.getJob() );
        clientResDTO.valid( client.isValid() );
        clientResDTO.comptes( compteListToCompteResDTOList( client.getComptes() ) );
        clientResDTO.invoices( invoiceListToInvoiceResDTOList( client.getInvoices() ) );

        return clientResDTO.build();
    }

    protected CompteResDTO compteToCompteResDTO(Compte compte) {
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

    protected List<CompteResDTO> compteListToCompteResDTOList(List<Compte> list) {
        if ( list == null ) {
            return null;
        }

        List<CompteResDTO> list1 = new ArrayList<CompteResDTO>( list.size() );
        for ( Compte compte : list ) {
            list1.add( compteToCompteResDTO( compte ) );
        }

        return list1;
    }

    protected InvoiceResDTO invoiceToInvoiceResDTO(Invoice invoice) {
        if ( invoice == null ) {
            return null;
        }

        InvoiceResDTO.InvoiceResDTOBuilder invoiceResDTO = InvoiceResDTO.builder();

        invoiceResDTO.id( invoice.getId() );
        invoiceResDTO.provider( invoice.getProvider() );
        invoiceResDTO.amount( invoice.getAmount() );
        invoiceResDTO.dueDate( invoice.getDueDate() );
        invoiceResDTO.referenceNumber( invoice.getReferenceNumber() );
        invoiceResDTO.paid( invoice.isPaid() );
        invoiceResDTO.paidDate( invoice.getPaidDate() );

        return invoiceResDTO.build();
    }

    protected List<InvoiceResDTO> invoiceListToInvoiceResDTOList(List<Invoice> list) {
        if ( list == null ) {
            return null;
        }

        List<InvoiceResDTO> list1 = new ArrayList<InvoiceResDTO>( list.size() );
        for ( Invoice invoice : list ) {
            list1.add( invoiceToInvoiceResDTO( invoice ) );
        }

        return list1;
    }
}
