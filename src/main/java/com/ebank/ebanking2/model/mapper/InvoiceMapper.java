package com.ebank.ebanking2.model.mapper;


import com.ebank.ebanking2.model.dto.InvoiceDTO;
import com.ebank.ebanking2.model.dto.InvoiceResDTO;
import com.ebank.ebanking2.model.entity.Invoice;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")

public interface InvoiceMapper {

    Invoice toEntity(InvoiceDTO invoiceDto);
    InvoiceResDTO toResDto(Invoice invoice);
}
