import { Component, EventEmitter, Input, Output } from '@angular/core';
import { InvoicesService } from '../../../Service/invoices.service';
import { UserService } from '../../../Service/user.service';
import { ClientResDTO } from '../../../model/dto/ClientResDTO';
import { InvoicePayDTO } from '../../../model/dto/InvoicePayDTO';

@Component({
  selector: 'ecode-modal',
  standalone: false,
  templateUrl: './ecode-modal.component.html',
  styleUrl: './ecode-modal.component.css'
})
export class EcodeModalComponent {
  constructor(private invoiceService: InvoicesService, private clientService: UserService) {}

  @Input() showEcodeModal = false;
  @Input() clientId!: number;
  @Input() provider!: string;
  @Input() referenceNumber!: string;
  @Input() compteId!: number;

  @Output() onCancel = new EventEmitter<boolean>();
  @Output() paymentSuccess = new EventEmitter<void>();
  @Output() paymentFailure = new EventEmitter<void>();

  ecode = '';

  cancel() {
    this.onCancel.emit(false);
  }
  allowOnlyNumbers(event: KeyboardEvent): void {
    const charCode = event.key.charCodeAt(0);
    if (charCode < 48 || charCode > 57) {
      event.preventDefault(); // block non-digit input
    }
  }
  

  verifyEcode() {
    this.clientService.getClient(this.clientId).subscribe({
      next: (client: ClientResDTO) => {
        if (this.ecode === client.ecode) {
          console.log("ecode entered by the user : ",this.ecode);
          console.log("ecode in the database : ",client.ecode);

          const dto: InvoicePayDTO = {
            clientId: this.clientId,
            provider: this.provider,
            referenceNumber: this.referenceNumber,
            compteId: this.compteId
          };
          this.invoiceService.payInvoice(dto).subscribe({
            next: () => this.paymentSuccess.emit(),
            error: () => this.paymentFailure.emit()
          });
        } else {
          console.log("Invalid eCode");
          this.paymentFailure.emit();
        }
      },
      error: (error) => {
        console.error("Error verifying client:", error);
        this.paymentFailure.emit();
      }
    });
  }
}
