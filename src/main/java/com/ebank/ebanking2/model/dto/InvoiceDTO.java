package com.ebank.ebanking2.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InvoiceDTO {

    private String provider;
    private double amount;
    private Date dueDate;
    private String referenceNumber;

    private boolean paid;
    private Date paidDate;

    private Long clientId;
}
