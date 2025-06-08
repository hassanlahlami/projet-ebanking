import { Component } from '@angular/core';

@Component({
  selector: 'app-settings',
  standalone: false,
  templateUrl: './settings.component.html',
  styleUrl: './settings.component.css'
})
export class SettingsComponent {
  activeTab: 'profile' | 'security' = 'profile';
  showEcodeModal: boolean = false;

  editBankinoPassword() {
    console.log('Edit Bankino password');
  }

  editECode() {
    this.showEcodeModal = true;
  }

  closeEcodeModal() {
    this.showEcodeModal = false;
  }
}