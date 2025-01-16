using { managed, sap } from '@sap/cds/common';

namespace sap.capire.emportal;

entity Employees : managed {
  key ID : Integer;
  name   : String(111);
  startDate : Date;
  email  : String(111);
  address : Composition of many Addresses on address.employee = $self;
  roles  : Composition of many Roles on roles.employee = $self;
  projects : Composition of many Projects on projects.employee = $self;
}

entity Addresses : managed {
  key ID : Integer;
  street : String(255);
  city   : String(111);
  country : String(111);
  employee : Association to Employees;
}

entity Projects : managed {
  key ID : Integer;
  name   : String(111);
  descr  : String(1111);
  startDate : Date;
  endDate   : Date;
  employee : Association to Employees;
}

entity Roles : managed {
  key ID : Integer;
  roleName : String(111);
  employee : Association to Employees;
}
