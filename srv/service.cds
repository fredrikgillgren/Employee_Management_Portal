using { sap.capire.emportal as my } from '../db/schema';

service AdminService @(requires: 'any') {
  //add auto refresh
  @odata.draft.enabled
  entity Employees as projection on my.Employees;
  entity Roles as projection on my.Roles;
  entity Projects as projection on my.Projects;
  entity Addresses as projection on my.Addresses;
}
