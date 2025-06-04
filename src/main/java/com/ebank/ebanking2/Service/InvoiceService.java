package com.ebank.ebanking2.Service;


import com.ebank.ebanking2.model.dto.InvoiceDTO;

import com.ebank.ebanking2.model.entity.Invoice;
import com.ebank.ebanking2.model.entity.User;
import com.ebank.ebanking2.model.mapper.InvoiceMapper;
import com.ebank.ebanking2.repository.InvoiceRepo;
import com.ebank.ebanking2.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class InvoiceService {

    @Autowired
    InvoiceRepo invoiceRepo;

    @Autowired
    InvoiceMapper invoiceMapper;
    @Autowired
    private UserRepo userRepo;


//    public InvoiceDTO addInvoice(InvoiceDTO invoiceDto) {
//        Invoice invoice = invoiceMapper.toEntity(invoiceDto);
//        User client = userRepo.findById(invoiceDto.getClientId()).orElseThrow(null);
//        invoice.setClient(client);
//        invoiceRepo.save(invoice);
//        return invoiceMapper.toInvoiceDto(invoice);
//    }
//
//
//    public InvoiceDTO getInvoice(Long clientId, String provider, String reference) {
//        Invoice invoice = invoiceRepo.findByClientIdAndProviderAndReferenceNumber(clientId, provider, reference);
//        System.out.println("invoice : "+invoice);
//        return invoiceMapper.toInvoiceDto(invoice);
//    }
}
