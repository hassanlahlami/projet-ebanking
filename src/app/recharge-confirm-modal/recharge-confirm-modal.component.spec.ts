import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RechargeConfirmModalComponent } from './recharge-confirm-modal.component';

describe('RechargeConfirmModalComponent', () => {
  let component: RechargeConfirmModalComponent;
  let fixture: ComponentFixture<RechargeConfirmModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [RechargeConfirmModalComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RechargeConfirmModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
