import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router'; 

import { LayoutComponent } from './layout/layout.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { AccountsComponent } from './pages/accounts/accounts.component';
import { TransfersComponent } from './pages/transfers/transfers.component';
import {HttpClient, HttpClientModule, provideHttpClient} from '@angular/common/http';
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {CryptoDashboardComponent} from './pages/trading/crypto-dashboard/crypto-dashboard.component';
import {TradingViewWidgetComponent} from './pages/trading/tradingbtc/tradingview-widget.component';
import {TradingComponent} from './pages/trading/trading.component';
import {TradingethComponent} from './pages/trading/tradingeth/tradingeth.component';
import {InvoicesComponent} from './pages/payment/invoices/invoices.component';
import {ChatbotComponent} from './pages/payment/chatbot/chatbot.component';
import {RechargeComponent} from './pages/payment/recharge/recharge.component';
import {PaymentsComponent} from './pages/payment/payments.component';
import {InvoiceModalComponent} from './pages/modals/invoice-modal/invoice-modal.component';
import { SettingsComponent } from './pages/settings/settings.component';
import { EcodeModalComponent } from './pages/modals/ecode-modal/ecode-modal.component';
export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}
@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    DashboardComponent,
    TransfersComponent,
    CryptoDashboardComponent,
    TradingViewWidgetComponent,
    TradingComponent,
    InvoicesComponent,
    ChatbotComponent,
    RechargeComponent,
    PaymentsComponent,
    InvoiceModalComponent,
    SettingsComponent,
    EcodeModalComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    RouterModule,
    HttpClientModule,

    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient],
      }
    }),
    AccountsComponent,
    ReactiveFormsModule,
    TradingethComponent,
    FormsModule


  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
