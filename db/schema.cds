using { managed, sap } from '@sap/cds/common';

namespace sap.capire.emportal;

entity Employees : managed {
  key ID : UUID;  // Unique identifier for employees
  name   : String(111);
  startDate : Date;
  address : Association to Addresses;  // Linking to the address entity
  roles  : Association to many Roles on roles.employee = $self;  // Employees can have multiple roles
  projects : Association to many Projects on projects.employee = $self;  // Employees can be associated with multiple projects
}

entity Addresses : managed {
  key ID : UUID;  // Unique identifier for addresses
  street : String(255);
  city   : String(111);
  country : String(111);
  employee : Association to Employees;  // Backlink to the associated employee
}

entity Projects : managed {
  key ID : UUID;  // Unique identifier for projects
  name   : String(111);
  descr  : String(1111);
  startDate : Date;
  endDate   : Date;
  employee : Association to Employees;  // Linking each project to an employee
}

entity Roles : managed {
  key ID : UUID;  // Unique identifier for roles
  roleName : String(111);
  employee : Association to Employees;  // Linking each role to an employee
}