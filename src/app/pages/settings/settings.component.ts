import { Component } from '@angular/core';
import { ClientService } from '../../Service/client.service';
import { ClientResDTO } from '../../model/dto/ClientResDTO';

@Component({
  selector: 'app-settings',
  standalone: false,
  templateUrl: './settings.component.html',
  styleUrl: './settings.component.css'
})
export class SettingsComponent {

  constructor(
      private clientService : ClientService
    ){}
  activeTab: 'profile' | 'security' = 'profile';
  showEcodeModal: boolean = false;
  clientId:number=1;
  client: ClientResDTO | null = null;

  editBankinoPassword() {
    console.log('Edit Bankino password');
  }

  editECode() {
    this.showEcodeModal = true;
  }

  closeEcodeModal() {
    this.showEcodeModal = false;
  }

  ngOnInit(): void {
    this.clientService.getClient(this.clientId).subscribe({
      next: (result: ClientResDTO) => {
         this.client=result
      },
      error: (err) => {
        console.error("Erreur lors de la récupération du client :", err);
      }
    });
  }


}