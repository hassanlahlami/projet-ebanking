export class InvoiceResDTO {
    provider!: string;
    amount!: number;
    dueDate!: Date;
    referenceNumber!: string;
  
    paid!: boolean;
    paidDate!: Date | null;
  
    userId!: number;
}
  