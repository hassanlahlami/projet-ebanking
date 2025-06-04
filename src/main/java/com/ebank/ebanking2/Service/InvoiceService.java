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

}
