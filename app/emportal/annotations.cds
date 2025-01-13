// service.cds 

//using { sap.capire.emportal as my } from '../db/schema';

//service AdminService @(requires: 'any') {
//  entity Employees as projection on my.Employees;
//  entity Addresses as projection on my.Addresses;
//  entity Projects as projection on my.Projects;
//  entity Roles as projection on my.Roles;
//}

//schema.cds

//using { managed, sap } from '@sap/cds/common';

//namespace sap.capire.emportal;

//entity Employees : managed {
//  key ID : UUID;  // Unique identifier for employees
//  name   : String(111);
//  startDate : Date;
//  address : Association to Addresses;  // Linking to the address entity
//  roles  : Association to many Roles on roles.employee = $self;  // Employees can have multiple roles
//  projects : Association to many Projects on projects.employee = $self;  // Employees can be associated with multiple projects
//}

//entity Addresses : managed {
//  key ID : UUID;  // Unique identifier for addresses
//  street : String(255);
//  city   : String(111);
//  country : String(111);
//  employee : Association to Employees;  // Backlink to the associated employee
//}

//entity Projects : managed {
//  key ID : UUID;  // Unique identifier for projects
//  name   : String(111);
//  descr  : String(1111);
//  startDate : Date;
//  endDate   : Date;
//  employee : Association to Employees;  // Linking each project to an employee
//}

//entity Roles : managed {
//  key ID : UUID;  // Unique identifier for roles
//  roleName : String(111);
//  employee : Association to Employees;  // Linking each role to an employee
//}

//create the annotations.cds based of this schema and service files. I want it to first show a list report page with all the base details such as name of the ID, name and whe n we click on a record it should show the details of the record in a detail page. such as all the other information of the employee such as address, roles and projects.

// annotations.cds

using AdminService as my from '../../srv/service';

// Annotations for the List Report Page
annotate my.Employees with @(
  UI: {
    LineItem: [
      { Value: ID, Label: 'Employee ID' },
      { Value: name, Label: 'Name' },
      { Value: startDate, Label: 'Start Date' }
    ],
    SelectionFields: [ ID, name ],
    HeaderInfo: {
      TypeName: 'Employee',
      TypeNamePlural: 'Employees',
      Title: { Value: name },
      Description: { Value: 'Employee Overview' }
    }
  }
);

// Annotations for the Object Page (Detail Page)
annotate my.Employees with @(
  UI: {
    Identification: [
      { Value: ID, Label: 'Employee ID' },
      { Value: name, Label: 'Name' },
      { Value: startDate, Label: 'Start Date' }
    ],
    HeaderInfo: {
      TypeName: 'Employee',
      TypeNamePlural: 'Employees',
      Title: { Value: name },
      Description: { Value: 'Detailed Employee Information' }
    },
    Facets: [
      {
        ID: 'EmployeeAddress',
        Label: 'Address',
        Target: address, // Direct reference to address association
        Position: 1
      },
      {
        ID: 'EmployeeRoles',
        Label: 'Roles',
        Target: roles, // Direct reference to roles association
        Position: 2
      },
      {
        ID: 'EmployeeProjects',
        Label: 'Projects',
        Target: projects, // Direct reference to projects association
        Position: 3
      }
    ]
  }
);

// Additional Annotations for Sub-Entities
annotate my.Addresses with @(
  UI: {
    LineItem: [
      { Value: street, Label: 'Street' },
      { Value: city, Label: 'City' },
      { Value: country, Label: 'Country' }
    ]
  }
);

annotate my.Roles with @(
  UI: {
    LineItem: [
      { Value: roleName, Label: 'Role Name' }
    ]
  }
);

annotate my.Projects with @(
  UI: {
    LineItem: [
      { Value: name, Label: 'Project Name' },
      { Value: descr, Label: 'Description' },
      { Value: startDate, Label: 'Start Date' },
      { Value: endDate, Label: 'End Date' }
    ]
  }
);


