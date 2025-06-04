import { Component } from '@angular/core';
import { Location } from '@angular/common';

@Component({
  selector: 'app-payments',
  standalone: false,
  templateUrl: './payments.component.html',
  styleUrl: './payments.component.css'
})
export class PaymentsComponent {

  showRecharge=false;

  constructor(private location: Location) {} // 👈 pas Router, mais Location

  toggleRecharge() {
    this.showRecharge = true;
    this.location.go('/recharges'); // 👈 change juste l'URL SANS rediriger
  }

}
