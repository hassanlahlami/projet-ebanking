import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../Service/Auth.service';

@Component({
  selector: 'app-forgot-password',
  standalone: false,
  templateUrl: './forgot-password.component.html',
  styleUrl: './forgot-password.component.css'
})
export class ForgotPasswordComponent {
  currentStep = 1;
  isLoading = false;
  error = '';
  success = '';

  // Form data
  email = '';
  verificationToken = '';
  newPassword = '';
  confirmPassword = '';

  constructor(
    private router: Router,
    private authService: AuthService
  ) {}

  // Step 1: Send email
  sendResetEmail(): void {
    if (!this.email) {
      this.error = 'Please enter your email address';
      return;
    }

    this.isLoading = true;
    this.error = '';

    // this.authService.forgotPassword({ email: this.email }).subscribe({
    //   next: (response) => {
    //     if (response.success) {
    //       this.success = response.message;
    //       this.currentStep = 2;
    //     }
    //     this.isLoading = false;
    //   },
    //   error: () => {
    //     this.error = 'Failed to send reset email. Please try again.';
    //     this.isLoading = false;
    //   }
    // });
  }

  // Step 2: Verify token
  verifyToken(): void {
    if (!this.verificationToken) {
      this.error = 'Please enter the verification code';
      return;
    }

    this.isLoading = true;
    this.error = '';

    // this.authService.verifyResetToken({
    //   email: this.email,
    //   token: this.verificationToken
    // }).subscribe({
    //   next: (response) => {
    //     if (response.valid) {
    //       this.success = response.message;
    //       this.currentStep = 3;
    //     } else {
    //       this.error = response.message;
    //     }
    //     this.isLoading = false;
    //   },
    //   error: () => {
    //     this.error = 'Failed to verify token. Please try again.';
    //     this.isLoading = false;
    //   }
    // });
  }

  // Step 3: Reset password
  resetPassword(): void {
    if (!this.newPassword || !this.confirmPassword) {
      this.error = 'Please fill in both password fields';
      return;
    }

    if (this.newPassword !== this.confirmPassword) {
      this.error = 'Passwords do not match';
      return;
    }

    if (this.newPassword.length < 6) {
      this.error = 'Password must be at least 6 characters long';
      return;
    }

    this.isLoading = true;
    this.error = '';

    // this.authService.resetPassword({
    //   email: this.email,
    //   token: this.verificationToken,
    //   newPassword: this.newPassword,
    //   confirmPassword: this.confirmPassword
    // }).subscribe({
    //   next: (response) => {
    //     if (response.success) {
    //       this.success = response.message;
    //       setTimeout(() => {
    //         this.router.navigate(['/login']);
    //       }, 2000);
    //     }
    //     this.isLoading = false;
    //   },
    //   error: () => {
    //     this.error = 'Failed to reset password. Please try again.';
    //     this.isLoading = false;
    //   }
    // });
  }

  // Navigation helpers
  goBackToLogin(): void {
    this.router.navigate(['/login']);
  }

  goToPreviousStep(): void {
    if (this.currentStep > 1) {
      this.currentStep--;
      this.error = '';
      this.success = '';
    }
  }

  resendEmail(): void {
    this.currentStep = 1;
    this.error = '';
    this.success = '';
  }
}
