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
      { Value: startDate, Label: '{i18n>Start Date}' },
      { Value: roles.roleName, Label: '{i18n>Role Name}' },
      { Value: projects.name, Label: '{i18n>Project Name}' }
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
    Title          : { Value: name , Label: '{i18n>Name}' }, 
    Description    : { Value: startDate , Label: '{i18n>Start Date}' }
  },
  Facets: [
    { $Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General' },
    { $Type: 'UI.ReferenceFacet', Label: '{i18n>Roles}', Target: 'roles/@UI.LineItem' },
    { $Type: 'UI.ReferenceFacet', Label: '{i18n>Projects}', Target: 'projects/@UI.LineItem' },
    { $Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: 'address/@UI.LineItem' }
  ],
  FieldGroup#General: {
    Data: [
      { Value: name, Label: '{i18n>Name}' },
      { Value: email, Label: '{i18n>Email}' },
      { Value: startDate, Label: '{i18n>Start Date}' }
    ]
  }
});

////////////////////////////////////////////////////////////////////////////
//
// Draft and Core Settings
//
annotate AdminService.Employees with { 
  ID @Core.Computed; 
};
annotate AdminService.Roles with { 
  ID @Core.Computed; 
};
annotate AdminService.Projects with { 
  ID @Core.Computed; 
};
annotate AdminService.Addresses with { 
  ID @Core.Computed; 
};


//////////////////////////////////////////////////////////////////////////////
//
// Roles List
//
annotate my.Roles with @(
  UI                 : {
    LineItem:[
        {
        $Type: 'UI.DataField',
        Value: roleName,
        Label: '{i18n>Role Name}'
        }
    ]
  }
);


////////////////////////////////////////////////////////////////////////////
//
// Projects List
//
annotate my.Projects with @(
  UI                 : {
    LineItem:[
        {
        $Type: 'UI.DataField',
        Value: name,
        Label: '{i18n>Project Name}'
        },
        {
        $Type: 'UI.DataField',
        Value: startDate,
        Label: '{i18n>Start Date}'
        },
        {
        $Type: 'UI.DataField',
        Value: endDate,
        Label: '{i18n>End Date}'
        },
        {
        $Type: 'UI.DataField',
        Value: descr,
        Label: '{i18n>Description}',
        },
    ]
  }
);


////////////////////////////////////////////////////////////////////////////
//
// Addresses List
//
annotate my.Addresses with @(
    UI                 : {
        LineItem:[
            {
            $Type: 'UI.DataField',
            Value: street,
            Label: '{i18n>Street}'
            },
            {
            $Type: 'UI.DataField',
            Value: city,
            Label: '{i18n>City}'
            },
            {
            $Type: 'UI.DataField',
            Value: country,
            Label: '{i18n>Country}'
            },
        ]
    }
);

