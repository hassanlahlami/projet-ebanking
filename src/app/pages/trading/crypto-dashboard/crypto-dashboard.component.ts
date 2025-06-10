import { Component, OnInit, OnDestroy, ChangeDetectionStrategy, ChangeDetectorRef, Inject, PLATFORM_ID, Input, OnChanges, SimpleChanges } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { BinanceWebSocketService } from '../../../Service/binance-api.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CryptoModel } from '../../../model/dto/CryptoModel';
import {CryptoserviceService} from '../../../Service/cryptoservice.service';
import { AuthService } from '../../../Service/Auth.service';
import { CompteResDTO } from '../../../model/dto/CompteResDTO';
import { StatusCompte } from '../../../model/dto/StatusCompte';
import { ComptesService } from '../../../Service/comptes.service';

@Component({
  selector: 'app-crypto-dashboard',
  standalone: false,
  templateUrl: './crypto-dashboard.component.html',
  styleUrls: ['./crypto-dashboard.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class CryptoDashboardComponent implements OnInit, OnDestroy ,OnChanges{
  @Input() valueboolean!:boolean;
  value:boolean=true;

selectedRib: string = '';
  cryptoData: CryptoModel[] = [];
  hasBought: { [symbol: string]: boolean } = {};
  quantities: { [symbol: string]: number } = {};
  ribs: { [symbol: string]: string } = {}; // Propriété pour les RIB
  private activeInputSymbol: string | null = null;
 selectedCompte: CompteResDTO | null = null;
 comptesCourants: CompteResDTO[] = [];

  clientId: number = Number(localStorage.getItem('userid'));

  constructor(
     private comptesService: ComptesService,
    private wsService: BinanceWebSocketService,
    private cdr: ChangeDetectorRef,
    private http:CryptoserviceService,
    private authService: AuthService,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {
// test
  }

  onCompteChange(event: any) {
    this.selectedRib = event.target.value;
    this.selectedCompte = this.comptesCourants.find(c => c.rib === this.selectedRib) || null;
  }
  ngOnChanges(changes: SimpleChanges) {
    if (changes['valueboolean']) {
     this.value=this.valueboolean;
     console.log(this.value);
      // Handle the input change here
    }
  }

  ngOnInit() {
    this.wsService.connect();
    this.wsService.cryptoData$.subscribe({
      next: data => {
      this.updateCryptoData(data);
      if (isPlatformBrowser(this.platformId) && this.activeInputSymbol) {
        setTimeout(() => {
          const input = document.querySelector(`input[data-symbol="${this.activeInputSymbol}"]`) as HTMLInputElement;
          if (input) {
            input.focus();
          }
        }, 0);
      }
      this.cdr.markForCheck();
    }, error: (err)=>{
      if (err.status === 401 || err.status === 403) {
        this.authService.logout();
      } else {
        console.error('Error loading contents', err);
      }
    }});

    if (isPlatformBrowser(this.platformId)) {
      document.addEventListener('focusin', this.handleFocusIn.bind(this));
    }
     this.comptesService.getCompte(this.clientId, "ccourant", StatusCompte.ACTIF)
            .subscribe({
              next: (response: CompteResDTO[]) => { // store the data returned from the service in a variable called response
                this.comptesCourants=response;
              },
              error: (err: any) => {
                if (err.status === 401 || err.status === 403) {
                  this.authService.logout();
                }
                else{
                  console.error("Error fetching le compte courant de l'utilisateur :", this.clientId, err);
                }
              }
            });
  }

  ngOnDestroy() {
    this.wsService.disconnect();
    if (isPlatformBrowser(this.platformId)) {
      document.removeEventListener('focusin', this.handleFocusIn.bind(this));
    }
  }

  private handleFocusIn(event: Event) {
    const target = event.target as HTMLInputElement;
    if (target.classList.contains('quantity-input')) {
      this.activeInputSymbol = target.getAttribute('data-symbol');
    }
  }

  private updateCryptoData(newData: CryptoModel[]) {
    newData.forEach(newCrypto => {
      const existingCrypto = this.cryptoData.find(c => c.symbol === newCrypto.symbol);
      if (existingCrypto) {
        Object.assign(existingCrypto, newCrypto);
      } else {
        this.cryptoData.push({ ...newCrypto });
      }
    });

    this.cryptoData = this.cryptoData.filter(c => newData.some(n => n.symbol === c.symbol));
  }

  formatPrice(price: string | undefined): string {
    return price ? parseFloat(price).toFixed(2) : 'N/A';
  }

  isPositive(value: string | undefined): boolean {
    if (!value) return false;
    const num = parseFloat(value);
    return !isNaN(num) && num >= 0;
  }

  buy(symbol: string,curent:string) {
      const quantity = this.quantities[symbol] || 0;
  const rib =  this.selectedRib || '';


  let Object:any=`{"name":"${symbol}","montant":${quantity},"actuealprisecurrency":${curent}}`;
    this.http.post(Object,rib).subscribe({
      next:
    (ref:any)=>console.log(ref),
    error: (err) => {
      if (err.status === 401 || err.status === 403) {
        this.authService.logout();
      } else {
        console.error('Error loading contents', err);
    }}});
    console.log(`${Object}+${rib}`);
    this.hasBought[symbol] = true;
    this.quantities[symbol] = 0; // Réinitialiser après achat
    this.ribs[symbol] = ''; // Réinitialiser le RIB après achat
    this.cdr.markForCheck();
  }

  sell(symbol: string,curent:string) {
      const quantity = this.quantities[symbol] || 0;
  const rib = this.ribs[symbol] || '';
  let Object:any=`{"name":"${symbol}","montant":${quantity},"actuealprisecurrency":${curent}}`;
    console.log(`Vente de ${this.quantities[symbol] || 0} unités de ${symbol}`);
    this.http.postvendre(Object,rib).subscribe({
    next: (ref:any)=> console.log(ref),
    error: (err) => {
      if (err.status === 401 || err.status === 403) {
            this.authService.logout();
          } else {
            console.error('Error loading contents', err);
          }
    }
  });
    this.hasBought[symbol] = false;
    this.quantities[symbol] = 0; // Réinitialiser après vente
    this.ribs[symbol] = ''; // Réinitialiser le RIB après vente
    this.cdr.markForCheck();
  }

  trackBySymbol(index: number, crypto: CryptoModel): string {
    return crypto.symbol;
  }
}
