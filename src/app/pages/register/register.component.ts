import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../../Service/Auth.service';

@Component({
  selector: 'app-register',
  standalone: false,
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {
  dto = {firstName: '', lastName: '', username: '', email: '', phone: '', job: '', password: ''};
  step = 1;
  emailTokenSent = false;
  phoneTokenSent = false;
  emailToken = '';
  phoneToken = '';
  error = '';
  private redirectUrl: string = '/dashboard';  // default redirect

  constructor(private http: HttpClient, private router: Router, private route: ActivatedRoute, private authService: AuthService) {
    this.route.queryParams.subscribe(params => {
      this.redirectUrl = params['redirect'] || '/dashboard';
    });
  }

  sendEmailToken() {
    // Validate required fields first
    if (!this.dto.firstName || !this.dto.lastName || !this.dto.email) {
      this.error = "Veuillez remplir tous les champs requis";
      return;
    }

    this.error = '';
    // TODO: Call backend to send email token
    this.emailTokenSent = true;
    this.step = 2; // Move to email verification step
  }

  verifyEmailToken() {
    // TODO: Verify email token with backend
    // For now, just check if token is provided
    if (!this.emailToken || this.emailToken.length !== 6) {
      this.error = "Code de vérification invalide";
      return;
    }

    this.error = '';
    this.step = 3; // Move to contact information step
  }

  sendPhoneToken() {
    // Validate required fields first
    if (!this.dto.username || !this.dto.phone) {
      this.error = "Veuillez remplir tous les champs requis";
      return;
    }

    this.error = '';
    // TODO: Call backend to send SMS token
    this.phoneTokenSent = true;
    this.step = 4; // Move to phone verification step
  }

  verifyPhoneToken() {
    // TODO: Verify phone token with backend
    // For now, just check if token is provided
    if (!this.phoneToken || this.phoneToken.length !== 6) {
      this.error = "Code de vérification invalide";
      return;
    }

    this.error = '';
    this.step = 5; // Move to security step
  }

  handleRegister(event: Event) {
    event.preventDefault();
    this.error = '';

    if (!this.dto.password) {
      this.error = "Veuillez saisir un mot de passe";
      return;
    }

    this.authService.register(this.dto).subscribe({
      next: (authData) => {
        localStorage.setItem('userid', authData.userId);
        this.authService.setAuthenticated(true);
        this.router.navigateByUrl(this.redirectUrl);
      },
      error: () => this.error = "Erreur lors de la création du compte"
    });
  }
}
