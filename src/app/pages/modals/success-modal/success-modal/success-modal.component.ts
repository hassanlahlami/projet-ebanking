import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'success-modal',
  standalone: false,
  templateUrl: './success-modal.component.html',
  styleUrl: './success-modal.component.css'
})
export class SuccessModalComponent {
  @Output() close = new EventEmitter<void>();

closeSModal() {
  this.close.emit();
}




}
