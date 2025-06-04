package com.ebank.ebanking2.model.dto;

import com.ebank.ebanking2.model.entity.Client;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;



@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InvoiceResDTO {

    private String provider;
    private double amount;
    private LocalDateTime dueDate;
    private String referenceNumber;
    private boolean paid;
    private LocalDateTime paidDate;
    //private ClientResDTO client; ila biti linvoice, ma3ndk madir bclient, machi b7ala biti client khask les invoices
}
