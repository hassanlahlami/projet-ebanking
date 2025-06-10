package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.InvoiceDTO;
import com.ebank.ebanking2.model.dto.InvoiceResDTO;
import com.ebank.ebanking2.model.entity.Invoice;
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
public class InvoiceMapperImpl implements InvoiceMapper {

    @Override
    public Invoice toEntity(InvoiceDTO invoiceDto) {
        if ( invoiceDto == null ) {
            return null;
        }

        Invoice.InvoiceBuilder<?, ?> invoice = Invoice.builder();

        invoice.provider( invoiceDto.getProvider() );
        invoice.amount( invoiceDto.getAmount() );
        invoice.dueDate( invoiceDto.getDueDate() );
        invoice.referenceNumber( invoiceDto.getReferenceNumber() );
        invoice.paid( invoiceDto.isPaid() );
        invoice.paidDate( invoiceDto.getPaidDate() );

        return invoice.build();
    }

    @Override
    public InvoiceResDTO toResDto(Invoice invoice) {
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

    @Override
    public List<Invoice> toEntity(List<InvoiceDTO> invoiceDTOs) {
        if ( invoiceDTOs == null ) {
            return null;
        }

        List<Invoice> list = new ArrayList<Invoice>( invoiceDTOs.size() );
        for ( InvoiceDTO invoiceDTO : invoiceDTOs ) {
            list.add( toEntity( invoiceDTO ) );
        }

        return list;
    }

    @Override
    public List<InvoiceResDTO> toResDTO(List<Invoice> invoices) {
        if ( invoices == null ) {
            return null;
        }

        List<InvoiceResDTO> list = new ArrayList<InvoiceResDTO>( invoices.size() );
        for ( Invoice invoice : invoices ) {
            list.add( toResDto( invoice ) );
        }

        return list;
    }
}
