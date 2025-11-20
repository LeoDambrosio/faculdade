import { TestBed } from '@angular/core/testing';

import { ObraServices } from './obra-services';

describe('ObraServices', () => {
  let service: ObraServices;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ObraServices);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
