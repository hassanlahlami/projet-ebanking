import { Component } from '@angular/core';

@Component({
  selector: 'app-invoice',
  templateUrl: './invoice.component.html',
  styleUrls: ['./invoice.component.css']
})
export class InvoiceComponent {
  eauElectricite = [
    '../assets/invoice/lydec.png',
    '../assets/invoice/redal.png'
  ];

  taxes = [
    '../assets/invoice/taxe.png',
    '../assets/invoice/impot.png'
  ];

  internet = [
    '../assets/invoice/maroc-telecom.png',
    '../assets/invoice/orange.png',
    '../assets/invoice/inwi.png'
  ];
} 