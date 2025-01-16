using { sap.capire.emportal as my } from '../db/schema';

service AdminService @(requires: 'any') {
  @odata.draft.enabled //> important for draft enablement, do it for all entities;

  entity Employees as projection on my.Employees;
  entity Roles as projection on my.Roles;
  entity Projects as projection on my.Projects;
  entity Addresses as projection on my.Addresses;
  
}
