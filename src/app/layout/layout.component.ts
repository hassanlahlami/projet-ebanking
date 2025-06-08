import { Component } from '@angular/core';
import { Location } from '@angular/common';
import { TranslateService } from '@ngx-translate/core';
import { AuthService } from '../Service/Auth.service';

@Component({
  selector: 'app-layout',
  standalone: false,
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent {



  constructor(private location: Location, private translateService: TranslateService, private authService: AuthService) {}

  switchLang(event: Event) {
    const select = event.target as HTMLSelectElement;
    const lang = select.value;
    console.log('Switching language to:', lang);
    localStorage.setItem('lang', lang);
    this.translateService.setDefaultLang(lang);
    this.translateService.use(lang);
  }

  logout() {
    this.authService.logout();
  }

  protected readonly localStorage = localStorage;
}
