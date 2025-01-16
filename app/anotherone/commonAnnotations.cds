using { sap.capire.emportal as my } from '../../db/schema';
using { AdminService } from '../../srv/service';

////////////////////////////////////////////////////////////////////////////
//
// Employees List
//
annotate my.Employees with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [
      name,
      startDate,
      roles.roleName,
      projects.name
    ],
    LineItem        : [
      { Value: name, Label: '{i18n>Name}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: roles.roleName, Label: '{i18n>RoleName}' },
      { Value: projects.name, Label: '{i18n>ProjectName}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'Employees',
    Text: name,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
// Employee Details
//
annotate my.Employees with @(UI: {
  HeaderInfo: {
    TypeName       : '{i18n>Employee}',
    TypeNamePlural : '{i18n>Employees}',
    Title          : { Value: name },
    Description    : { Value: startDate }
  },
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
});

////////////////////////////////////////////////////////////////////////////
//
// Draft and Core Settings
//
annotate my.Employees with { 
  ID @Core.Computed; 
};


////////////////////////////////////////////////////////////////////////////
//
// Roles List
//
annotate my.Roles with @(
  UI                 : {
    Identification  : [{ Value: roleName }],
    SelectionFields : [roleName],
    LineItem        : [
      { Value: roleName, Label: '{i18n>Role Name}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
// Projects List
//
annotate my.Projects with @(
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [name],
    LineItem        : [
      { Value: name, Label: '{i18n>Name}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: endDate, Label: '{i18n>EndDate}' },
      { Value: descr, Label: '{i18n>Description}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
// Addresses List
//
annotate my.Addresses with @(
  UI                 : {
    Identification  : [{ Value: street }],
    SelectionFields : [street, city, country],
    LineItem        : [
      { Value: street, Label: '{i18n>Street}' },
      { Value: city, Label: '{i18n>City}' },
      { Value: country, Label: '{i18n>Country}' }
    ]
  }
);
