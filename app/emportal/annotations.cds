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

//service.cds
//using { sap.capire.emportal as my } from '../db/schema';

//service AdminService @(requires: 'any') {
//  entity Employees as projection on my.Employees;
//  entity Roles as projection on my.Roles;
//  entity Projects as projection on my.Projects;
//  entity Addresses as projection on my.Addresses;
//}


using { sap.capire.emportal as my } from '../../db/schema';
using AdminService from '../../srv/service';

////////////////////////////////////////////////////////////////////////////
//
// Employees List
//
annotate my.Employees with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [
      ID,
      name,
      startDate
    ],
    LineItem        : [
      { Value: ID, Label: '{i18n>ID}' },
      { Value: name, Label: '{i18n>Name}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: address.street, Label: '{i18n>Street}' }, // Address field
      { Value: address.city, Label: '{i18n>City}' },
      { Value: roles.roleName, Label: '{i18n>RoleName}' }, // Roles field
      { Value: projects.name, Label: '{i18n>ProjectName}' } // Projects field
    ],
    Expand: ['address', 'roles', 'projects'] // Ensure associations are expanded
  }
) {
  ID @Common: {
    SemanticObject  : 'Employees',
    Text            : name,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
// Employees Details
//
annotate my.Employees with @(UI: {
  HeaderInfo: {
    TypeName       : '{i18n>Employee}',
    TypeNamePlural : '{i18n>Employees}',
    Title          : { Value: name },
    Description    : { Value: startDate }
  }
});

////////////////////////////////////////////////////////////////////////////
//
// Employee Elements
//
annotate my.Employees with {
  ID        @title: '{i18n>ID}';
  name      @title: '{i18n>Name}';
  startDate @title: '{i18n>StartDate}';
  address   @title: '{i18n>Address}' @Common: { Text: address.street, TextArrangement: #TextOnly };
  roles     @title: '{i18n>Roles}' @Common: { Text: roles.roleName, TextArrangement: #TextOnly };
  projects  @title: '{i18n>Projects}' @Common: { Text: projects.name, TextArrangement: #TextOnly };
};

////////////////////////////////////////////////////////////////////////////
//
// Roles List
//
annotate my.Roles with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: roleName }],
    SelectionFields : [roleName],
    LineItem        : [
      { Value: ID, Label: '{i18n>ID}' },
      { Value: roleName, Label: '{i18n>RoleName}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject  : 'Roles',
    Text            : roleName,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
// Projects List
//
annotate my.Projects with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [name],
    LineItem        : [
      { Value: ID, Label: '{i18n>ID}' },
      { Value: name, Label: '{i18n>Name}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: endDate, Label: '{i18n>EndDate}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject  : 'Projects',
    Text            : name,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
// Addresses List
//
annotate my.Addresses with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: street }],
    SelectionFields : [street, city, country],
    LineItem        : [
      { Value: ID, Label: '{i18n>ID}' },
      { Value: street, Label: '{i18n>Street}' },
      { Value: city, Label: '{i18n>City}' },
      { Value: country, Label: '{i18n>Country}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
// Employees Object Page
//
annotate AdminService.Employees with @(
  UI: {
    Facets: [
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Roles}', Target: 'roles/@UI.LineItem' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Projects}', Target: 'projects/@UI.LineItem' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: 'address/@UI.LineItem' }
    ],
    FieldGroup#General: {
      Data: [
        { Value: name },
        { Value: startDate }
      ]
    }
  }
);
