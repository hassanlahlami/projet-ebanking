import { Component } from '@angular/core';
import {NgClass, NgForOf, NgIf} from '@angular/common';
import {TranslatePipe} from '@ngx-translate/core';

@Component({
  selector: 'app-accounts',
  templateUrl: './accounts.component.html',
  imports: [
    NgIf,
    NgForOf,
    NgClass,
    TranslatePipe
  ],
  styleUrls: ['./accounts.component.css']
})
export class AccountsComponent{
  // accounts: Account[] = [];
  // virements: Virement[] = []; // all virements
  // selectedAccount: Account | null = null;
  // selectedVirements: Virement[] = [];

  // ngOnInit() {
  //   // Dummy accounts
  //   this.accounts = [
  //     new Account('1', 'RIB001', 'active', 1000),
  //     new Account('2', 'RIB002', 'inactive', 2500),
  //     new Account('3', 'RIB003', 'suspended', 500)
  //   ];

  //   this.virements = [
  //     new Virement('V1', 'RIB001', 'RIB002', 100),
  //     new Virement('V2', 'RIB003', 'RIB001', 250),
  //     new Virement('V3', 'RIB001', 'RIB004', 75)
  //   ];

  //   // Select first account by default
  //   if (this.accounts.length > 0) {
  //     this.selectAccount(this.accounts[0]);
  //   }
  // }

  // getAccountsByStatus(status: string): Account[] {
  //   return this.accounts.filter(a => a.status === status);
  // }

  // selectAccount(account: Account) {
  //   this.selectedAccount = account;
  //   const rib = account.rib;

  //   // Filter virements where account is emitter or receiver
  //   this.selectedVirements = this.virements.filter(
  //     v => v.emetteur === rib || v.recepteur === rib
  //   );
  // }
  // getVisibleStatuses(): string[] {
  //   return ['active', 'inactive', 'suspended'].filter(
  //     status => this.getAccountsByStatus(status).length > 0
  //   );
  // }
}
