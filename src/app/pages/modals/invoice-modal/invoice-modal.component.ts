import { Component, Input, Output, EventEmitter } from '@angular/core';
import { InvoicesService } from '../../../Service/invoices.service';
import { InvoiceResDTO } from '../../../model/dto/InvoiceResDTO';
import { ComptesService } from '../../../Service/comptes.service';
import { StatusCompte } from '../../../model/dto/StatusCompte';
import { CompteResDTO } from '../../../model/dto/CompteResDTO';

@Component({
  selector: 'invoice-modal',
  standalone: false,
  templateUrl: './invoice-modal.component.html',
  styleUrl: './invoice-modal.component.css'
})
export class InvoiceModalComponent {
  constructor(private invoiceService: InvoicesService, private comptesService: ComptesService) { }

  @Input() showModal: boolean = false;
  @Input() provider: string = "";
  @Output() close = new EventEmitter<void>();

  clientId = 1; // TODO : retrieve from token
  reference: string = "";
  referenceNumber: string = "";
  showInvoiceToPay: boolean = false;
  invoiceResDto!: InvoiceResDTO;
  selectedCompte: CompteResDTO | null = null;
  isPayButtonEnabled = false;
  invoiceNotFound = false;
  showEcodeModal = false;
  showSuccessModal = false;
  showFailureModal = false;

  CCourantActifComptes: CompteResDTO[] = [];

  closeModal() {
    this.showInvoiceToPay = false;
    this.showEcodeModal = false;
    this.selectedCompte = null;
    this.reference = '';
    this.close.emit();
  }

  openEcodeModal() {
    this.showEcodeModal = true;
    this.referenceNumber = this.reference;
  }

  handleEcodeSubmit(ecode: string) {
    console.log("Received eCode:", ecode);
  }

  handlePaymentSuccess() {
    this.showEcodeModal = false;
    this.showSuccessModal = true;
  }

  handlePaymentFailure() {
    this.showEcodeModal = false;
    this.showFailureModal = true;
  }

  onSelectCompte(compte: CompteResDTO) {
    this.selectedCompte = compte;
    this.isPayButtonEnabled =
      this.invoiceResDto &&
      compte.autorisePaiementEnLigne &&
      compte.solde > this.invoiceResDto.amount;
  }

  getCompteCouranActiftByClientId() {
    this.comptesService.getCompte(this.clientId, 'ccourant', StatusCompte.ACTIF)
      .subscribe({
        next: (response) => {
          this.CCourantActifComptes = response;
        },
        error: (err) => {
          console.error("Erreur chargement des comptes :", err);
        }
      });
  }

  searchReference() {
    this.invoiceService.getInvoice(this.clientId, this.provider, this.reference)
      .subscribe({
        next: (response) => {
          this.invoiceResDto = response;
          this.showInvoiceToPay = true;
          this.invoiceNotFound = false;
          this.getCompteCouranActiftByClientId();
          this.isPayButtonEnabled = false;
        },
        error: (err) => {
          if (err.status === 404) {
            this.invoiceNotFound = true;
            this.showInvoiceToPay = false;
          } else {
            console.error("Erreur serveur :", err);
          }
        }
      });
  }
}
