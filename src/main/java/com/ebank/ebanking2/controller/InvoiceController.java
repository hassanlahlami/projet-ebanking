package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.InvoiceService;
import com.ebank.ebanking2.model.dto.InvoiceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api/invoices/")
public class InvoiceController {


    @Autowired
    InvoiceService invoiceService;

//    // I use this method just to add invoices to the database
//    @PostMapping("invoice")
//    public ResponseEntity<InvoiceDTO> addInvoice(@RequestBody InvoiceDTO invoiceDto){
//        return new ResponseEntity<>(invoiceService.addInvoice(invoiceDto), HttpStatus.CREATED);
//    }
//
//
//    @GetMapping("{userId}/{provider}/{reference}")
//    public ResponseEntity<InvoiceDTO> getInvoice(@PathVariable("userId") Long clientId, @PathVariable("provider") String provider, @PathVariable("reference") String reference){
//        return new ResponseEntity<>(invoiceService.getInvoice(clientId, provider, reference), HttpStatus.OK);
//    }

}
