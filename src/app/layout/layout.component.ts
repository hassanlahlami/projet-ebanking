import { Component } from '@angular/core';
import { Location } from '@angular/common';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-layout',
  standalone: false,
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent {
  username : string= "youssef";



  constructor(private location: Location, private translateService: TranslateService) {}

  switchLang(event: Event) {
    const select = event.target as HTMLSelectElement;
    const lang = select.value;
    console.log('Switching language to:', lang);
    localStorage.setItem('lang', lang);
    this.translateService.setDefaultLang(lang);
    this.translateService.use(lang);
  }

  logout() {
    console.log('Logout clicked');
  }

  protected readonly localStorage = localStorage;
}
