import {Component, OnInit} from '@angular/core';
import {CompteResDTO} from '../../model/dto/CompteResDTO';
import {CompteService} from '../../Service/CompteService';
import {VirementResDTO} from '../../model/dto/VirementResDTO';
import {VirementService} from '../../Service/VirementService';

@Component({
  selector: 'app-dashboard',
  standalone: false,
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements OnInit {

  courantAccount: CompteResDTO | null = null;
  epargneAccount: CompteResDTO | null = null;
  recentVirements: VirementResDTO[] = [];

  constructor(
    private compteService: CompteService,
    private virementService: VirementService
  ) {}

  ngOnInit(): void {
    this.compteService.getByClientId("1", "compte", "tout").subscribe((comptes: CompteResDTO[]) => {
      this.courantAccount = comptes.find(acc => acc.accountType === "CCourant") || null;
      this.epargneAccount = comptes.find(acc => acc.accountType === "CEpargne") || null;

      if (this.courantAccount) {
        this.virementService.getVirementsByCompteId(this.courantAccount.id, 1, 5).subscribe(response => {
          this.recentVirements = response.content;
          console.log(this.recentVirements);
        });
      }
    });
  }

}
