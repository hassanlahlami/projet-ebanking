import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { LayoutComponent } from './layout/layout.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { AccountsComponent } from './pages/accounts/accounts.component';
import { TransfersComponent } from './pages/transfers/transfers.component';
import {TradingComponent} from './pages/trading/trading.component';
import {InvoiceModalComponent} from './pages/modals/invoice-modal/invoice-modal.component';
import {InvoicesComponent} from './pages/payment/invoices/invoices.component';
import {RechargeComponent} from './pages/payment/recharge/recharge.component';
import {PaymentsComponent} from './pages/payment/payments.component';

const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      { path: 'dashboard', component: DashboardComponent },
      { path: 'accounts', component: AccountsComponent },
      { path: 'transfers', component: TransfersComponent },
      { path: 'crypto', component: TradingComponent },
      { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
      { path: 'payments', component: PaymentsComponent,
        children:[
          {path:'recharges', component:RechargeComponent},
          {path:'invoices', component:InvoicesComponent}
        ]
      },
    ]
  },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
