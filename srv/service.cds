using { sap.capire.emportal as my } from '../db/schema';

service AdminService @(requires: 'any') {
  entity Employees as projection on my.Employees;
  entity Addresses as projection on my.Addresses;
  entity Projects as projection on my.Projects;
  entity Roles as projection on my.Roles;
}
