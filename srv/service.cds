using EmployeeManagement as em from '../db/schema';

service EmployeeService {
    entity Employees as projection on em.Employees;
    entity Roles as projection on em.Roles;
    entity Projects as projection on em.Projects;
    entity Addresses as projection on em.Addresses;
}
