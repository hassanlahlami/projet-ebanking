package com.ebank.ebanking2.Service;


import com.ebank.ebanking2.model.dto.InvoiceDTO;

import com.ebank.ebanking2.model.dto.InvoicePayDTO;
import com.ebank.ebanking2.model.dto.InvoiceResDTO;
import com.ebank.ebanking2.model.entity.CCourant;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Invoice;
import com.ebank.ebanking2.model.entity.User;
import com.ebank.ebanking2.model.mapper.InvoiceMapper;
import com.ebank.ebanking2.repository.*;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service

public class InvoiceService {

    @Autowired
    InvoiceRepo invoiceRepo;
    @Autowired
    CCourantRepo cCourantRepo;

    @Autowired
    InvoiceMapper invoiceMapper;
    @Autowired
    private ClientRepo clientRepo;

    public InvoiceResDTO addInvoice(InvoiceDTO invoiceDTO) {
        Client client = clientRepo.findById(invoiceDTO.getClientId())
                .orElseThrow(() -> new EntityNotFoundException("Client not found with id: " + invoiceDTO.getClientId()));
        Invoice invoice = invoiceMapper.toEntity(invoiceDTO);
        invoice.setClient(client);
        Invoice savedInvoice = invoiceRepo.save(invoice);
        return invoiceMapper.toResDto(savedInvoice);
    }

    public InvoiceResDTO getInvoice(Long clientId, String provider, String reference) {
        Optional<Invoice> invoice = invoiceRepo.findByClientIdAndProviderAndReferenceNumberAndDueDateAfter(clientId, provider, reference, LocalDateTime.now());
        return invoice.map(invoiceMapper::toResDto).orElse(null);
    }

    public InvoiceResDTO payInvoice(InvoicePayDTO invoicePayDTO) {
        Invoice invoiceToPay = invoiceRepo.findByClientIdAndProviderAndReferenceNumberAndDueDateAfter(invoicePayDTO.getClientId(), invoicePayDTO.getProvider(), invoicePayDTO.getReferenceNumber(), LocalDateTime.now()).get();
        CCourant cCourantToDebit = cCourantRepo.findById(invoicePayDTO.getCompteId()).get();

        cCourantToDebit.setSolde(cCourantToDebit.getSolde()-invoiceToPay.getAmount());
        invoiceToPay.setPaid(true);
        invoiceToPay.setPaidDate(LocalDateTime.now());

        cCourantRepo.save(cCourantToDebit);
        Invoice invoiceUpdated = invoiceRepo.save(invoiceToPay);

        return invoiceMapper.toResDto(invoiceUpdated);
    }

    public List<InvoiceResDTO> addInvoices(List<InvoiceDTO> invoiceDTOs) {
        List<Invoice> invoices = invoiceMapper.toEntity(invoiceDTOs);
        List<Invoice> invoicesSaved = invoiceRepo.saveAll(invoices);

        return invoiceMapper.toResDTO(invoicesSaved);
    }
}
