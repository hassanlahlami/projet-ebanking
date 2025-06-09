import { Component, EventEmitter, Input, input, Output } from '@angular/core';

@Component({
  selector: 'failure-modal',
  standalone: false,
  templateUrl: './failure-modal.component.html',
  styleUrl: './failure-modal.component.css'
})
export class FailureModalComponent {
  @Output() close = new EventEmitter<void>();

closeFModal() {
  this.close.emit();
}


}
