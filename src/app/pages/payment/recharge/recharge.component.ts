import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { RechargeService } from '../../../Service/recharge.service'; // adapte le chemin si besoin
import { RechargeDTO } from '../../../model/dto/RechargeDTO';
import { RechargeResDTO } from '../../../model/dto/RechargeResDTO';
import { ComptesService } from '../../../Service/comptes.service';
import { StatusCompte } from '../../../model/dto/StatusCompte';
import { CompteResDTO } from '../../../model/dto/CompteResDTO';
import { EcodeDTO } from '../../../model/dto/EcodeDTO';

@Component({
  selector: 'recharge',
  standalone: false,
  templateUrl: './recharge.component.html',
  styleUrl: './recharge.component.css'
})
export class RechargeComponent {
  rechargeForm: FormGroup;
  operators = [
    {
      name: 'Inwi',
      logo: '../assets/recharge/inwi.png',
      rechargeDescription: 'operator.inwi.description'
    },
    {
      name: 'Orange',
      logo: '../assets/recharge/orange.png',
      rechargeDescription: 'operator.orange.description'
    },
    {
      name: 'IAM',
      logo: '../assets/recharge/iam.png',
      rechargeDescription: 'operator.iam.description'
    }
  ];

  showRechargeForm = false;
  selectedOperator: string = '';
  clientId: number = 1;
  selectedRib: string = '';
  selectedCompte: CompteResDTO | null = null;
  selectedMontant: string = '';
  comptesCourants: CompteResDTO[] = [];
  showSuccessMessage = false;
  successMessage = '';
  isProcessing = false;
  ecodeDTO : EcodeDTO= {
    clientId: this.clientId,
    code: ''
  };
  showEcodeModal : boolean=false



  constructor(
    private rechargeService: RechargeService,
    private fb: FormBuilder,
    private comptesService: ComptesService
  ) {
    this.rechargeForm = this.fb.group({
      phoneNumber: ['', [Validators.required, Validators.pattern('^(06|07)[0-9]{8}$')]],
      montant: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.comptesService.getCompte(this.clientId, "ccourant", StatusCompte.ACTIF)
          .subscribe({
            next: (response) => { // store the data returned from the service in a variable called response
              this.comptesCourants=response;
            },
            error: (err) => {
              console.error("Error fetching le compte courant de l'utilisateur :", this.clientId, err);
            }
          });
  }

  onCompteChange(event: any) {
    this.selectedRib = event.target.value;
    this.selectedCompte = this.comptesCourants.find(c => c.rib === this.selectedRib) || null;
  }

  onMontantChange(event: any) {
    this.selectedMontant = event.target.value;
  }

  isFormValid(): boolean {
    return this.selectedCompte !== null &&
           this.rechargeForm.valid &&
           this.selectedMontant !== '' &&
           this.selectedCompte.autorisePaiementEnLigne &&
           this.handleVerifiedSolde(this.selectedCompte.solde, parseFloat(this.selectedMontant));
  }

  handleRecharge(operatorName: string){
    this.selectedOperator = operatorName;
    this.showRechargeForm = true;
    this.selectedCompte = null;
    this.rechargeForm.reset();
    this.selectedMontant = '';
  }

  public handleVerifiedSolde(solde:number, montant:number){
    return solde > montant;
  }

  public parseFloatValue(value: string): number {
    return parseFloat(value);
  }


  // afficher form pour saisir ecode et valider l'operation 
  DisplayEcodeModal(){
    if (this.isFormValid()) {
      this.isProcessing = true;
      this.showEcodeModal=true
    }
  }
  // confirmRecharge() {
  //   if (this.isFormValid()) {
  //     this.isProcessing = true;
  //     const rechargeDTO: RechargeDTO = {
  //       operateur: this.selectedOperator,
  //       rib: this.selectedRib,
  //       phoneNumber: this.rechargeForm.get('phoneNumber')?.value,
  //       montant: this.parseFloatValue(this.selectedMontant)
  //     };

  //     this.rechargeService.effectuerRecharge(rechargeDTO).subscribe({
  //       next: (response: RechargeResDTO) => {
  //         console.log('Recharge effectuée avec succès', response);
  //         this.showSuccessMessage = true;
  //         this.successMessage = `Recharge de ${this.selectedMontant} DH effectuée avec succès pour le numéro ${this.rechargeForm.get('phoneNumber')?.value}`;

  //         this.showRechargeForm = false;
  //         this.selectedOperator = '';
  //         this.selectedCompte = null;
  //         this.rechargeForm.reset();
  //         this.selectedMontant = '';

  //         setTimeout(() => {
  //           this.showSuccessMessage = false;
  //           this.successMessage = '';
  //         }, 8000);
  //       },
  //       error: (error) => {
  //         console.error('Erreur lors de la recharge', error);
  //         this.showSuccessMessage = true;
  //         this.successMessage = 'Une erreur est survenue lors de la recharge. Veuillez réessayer.';
  //         setTimeout(() => {
  //           this.showSuccessMessage = false;
  //           this.successMessage = '';
  //         }, 8000);
  //       },
  //       complete: () => {
  //         this.isProcessing = false;
  //       }
  //     });
  //   }
  // }
}
