package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.InvoiceService;
import com.ebank.ebanking2.model.dto.InvoiceDTO;
import com.ebank.ebanking2.model.dto.InvoicePayDTO;
import com.ebank.ebanking2.model.dto.InvoiceResDTO;
import com.ebank.ebanking2.model.entity.Invoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api/invoices")
public class InvoiceController {


    @Autowired
    InvoiceService invoiceService;


    @GetMapping("invoice/{clientId}/{provider}/{reference}")
    public ResponseEntity<InvoiceResDTO> getInvoice(@PathVariable("clientId") Long clientId, @PathVariable("provider") String provider, @PathVariable("reference") String reference) {
        InvoiceResDTO invoice = invoiceService.getInvoice(clientId, provider, reference);
        System.out.println("invoice : "+invoice);
        if (invoice != null) {
            return ResponseEntity.ok(invoice);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @PutMapping("invoice/pay")
    public ResponseEntity<InvoiceResDTO> payInvoice(@RequestBody InvoicePayDTO invoicePayDTO){
        return new ResponseEntity<>(invoiceService.payInvoice(invoicePayDTO), HttpStatus.CREATED);
    }


    //bach tb9a tcree les invoices bach t3mr lbase de donnee wiwlli 3ndk b7al chi api
    @PostMapping("invoice")
    public ResponseEntity<InvoiceResDTO> addInvoice(@RequestBody InvoiceDTO invoiceDTO){
        return new ResponseEntity<>(invoiceService.addInvoice(invoiceDTO), HttpStatus.CREATED);
    }
}
