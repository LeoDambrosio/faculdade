import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Cep } from './cep';

describe('Cep', () => {
  let component: Cep;
  let fixture: ComponentFixture<Cep>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Cep]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Cep);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
