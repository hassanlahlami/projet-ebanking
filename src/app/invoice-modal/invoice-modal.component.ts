import { Component, Input, Output, EventEmitter, } from '@angular/core';
 
import { InvoicesService } from '../../service/invoices.service'; // adjust path
import { InvoiceResDTO } from '../../model/dto/InvoiceResDTO'; // adjust path
import { ComptesService } from '../../service/comptes.service'; // adjust path

@Component({
  selector: 'invoice-modal',
  standalone: false,
  templateUrl: './invoice-modal.component.html',
  styleUrl: './invoice-modal.component.css'
})
export class InvoiceModalComponent {

  constructor(private invoiceService: InvoicesService, private comptesService: ComptesService) {}

  @Input() showModal: boolean = false;
  @Input() provider: string = "";
  @Output() close = new EventEmitter<void>();

  userId="client003" //TODO : bring it from the token
  reference:string ="";
  showInvoiceToPay:boolean=false;
  invoiceResDto?:InvoiceResDTO
  comptesCourants?: any;


  closeModal() {
    this.close.emit();
  }



  searchReference(){
    this.invoiceService.getInvoice(this.userId, this.provider, this.reference)
    .subscribe({
      next: (response) => { // store the data returned from the service in a variable called response
        this.invoiceResDto=response;
        console.log("Invoice found:", this.invoiceResDto);
        this.showInvoiceToPay=true;
      },
      error: (err) => {
        console.error("Error fetching invoice:", err);
      }
    });
  }



  ngOnInit(): void {
    this.comptesService.getComptesCourantActif(this.userId).subscribe({
      next: (data) => {
        this.comptesCourants = data;
        console.log("comptes courants", this.comptesCourants);
        console.log("rib", this.comptesCourants[0]?.rib);
      },
      error: (err) => console.error('Erreur lors du chargement des comptes', err)
    });
  }


  payInvoice(){
    console.log("pay invoice button clicked");
  }
}
