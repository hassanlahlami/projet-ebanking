import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ClientService } from '../../../Service/client.service';
import { EcodeDTO } from '../../../model/dto/EcodeDTO';


@Component({
  selector: 'ecode-modal',
  standalone: false,
  templateUrl: './ecode-modal.component.html',
  styleUrl: './ecode-modal.component.css'
})
export class EcodeModalComponent {


  constructor(
    private clientService : ClientService
  ){}

  @Output() onCancel = new EventEmitter<boolean>();


  ecode = '';
  confirmEcode='';
  isLoading : boolean =false;
  display=true;
  generateVerificationCodeModal : boolean = false;
  ecodeNotSecure: string = '';
  verificationCode = '';
  clientId :number =1;
  ecodeDTO: EcodeDTO ={
    clientId:this.clientId,
    code:''
  }
  invalidTokenError=''
  showSuccessModal : boolean=false;
  showFailureModal : boolean=false;
  


  allowOnlyNumbers(event: KeyboardEvent): void {
    const charCode = event.key.charCodeAt(0);
    if (charCode < 48 || charCode > 57) {
      event.preventDefault(); // block non-digit input
    }
  }


  cancel() {
    this.onCancel.emit(false);
  }

  onEcodeChange() {
    if (this.ecodeNotSecure) {
      this.ecodeNotSecure = '';
    }
  }

  onVerificationCodeChange(){
    if(this.invalidTokenError){
      this.invalidTokenError='';
    }
  }

  closeSuccessModal() {
    this.showSuccessModal = false;
    this.display=true;
  }

  closeFailureModal() {
    this.showFailureModal = false;
  }





  validate() {
    this.isLoading = true;
  
    this.clientService.checkEcodeSecurity(this.ecode).subscribe({
      next: (result: boolean) => {
        setTimeout(() => {
          this.isLoading = false;
          
          if (result) {
            this.generateVerificationCodeModal=true;
            this.display=false;
            
             // Appel de la méthode sendEcodeTokenForVerification si result est true
            this.clientService.sendEcodeTokenForVerification(this.clientId).subscribe({
              next: (sendResult: boolean) => {
                if (sendResult) {
                  console.log("Token envoyé avec succès !");
                } else {
                  console.error("Erreur lors de l'envoi du token.");
                }
              },
              error: (err) => {
                console.error("Erreur lors de l'appel à sendEcodeTokenForVerification :", err);
              }
            });

          } else {
            this.ecodeNotSecure = "Le code entré est invalide ou non sécurisé.";
          }
        }, 4000);
      },
      error: (err) => {
        setTimeout(() => {
          this.isLoading = false;
          console.error("Erreur lors de la vérification du code :", err);
        }, 4000);
      }
    });
  }

  verifyEmailCode() {
    console.log("function is called")
    this.clientService.verififyTokenEcodeSubmittedByClient(this.verificationCode, this.clientId).subscribe({
      next: (sendResult: boolean) => {
        if (sendResult) {
          this.ecodeDTO = {
            clientId: this.clientId,
            code: this.ecode
          };
  
          this.clientService.saveEcode(this.ecodeDTO).subscribe({
            next: (result: boolean) => {
              if (result) {
                this.showSuccessModal = true;
                this.generateVerificationCodeModal = false;
              } else {
                this.showFailureModal = true;
              }
            },
            error: (err) => {
              this.showFailureModal = true;
              console.error("erreur lors de sauvegarde du ecode :", err);
            }
          });
        } else {
          this.invalidTokenError = "token saisi par client est invalide !";
        }
      },
      error: (err) => {
        console.error("Erreur lors de l'appel à verififyTokenEcodeSubmittedByClient :", err);
      }
    });
  }















  
  

  
  
  
  

  
}