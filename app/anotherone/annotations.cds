using { sap.capire.emportal as my } from '../../db/schema';
using AdminService from '../../srv/service';

annotate my.Employees with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [
      name,
      startDate
    ],
    LineItem        : [
      { Value: name, Label: '{i18n>Name}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: address.street, Label: '{i18n>Street}' },
      { Value: address.city, Label: '{i18n>City}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject  : 'Employee',
    Text            : name,
    TextArrangement : #TextOnly
  };
};

annotate AdminService.Employees with @(
  UI: {
    Facets: [
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: '@UI.FieldGroup#Address' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Projects}', Target: '@UI.FieldGroup#Projects' },
      { $Type: 'UI.ReferenceFacet', Label: '{i18n>Roles}', Target: '@UI.FieldGroup#Roles' }
    ],
    
    FieldGroup#General: {
      Label: '{i18n>GeneralInformation}',
      Data: [
        { Value: name, Label: '{i18n>Name}' },
        { Value: startDate, Label: '{i18n>StartDate}' }
      ]
    },
    FieldGroup#Address: {
      Label: '{i18n>AddressInformation}',
      Data: [
        { Value: address.street, Label: '{i18n>Street}' },
        { Value: address.city, Label: '{i18n>City}' },
        { Value: address.country, Label: '{i18n>Country}' }
      ]
    },
    FieldGroup#Projects: {
      Label: '{i18n>Projects}',
      Data: [
        { Value: projects.name, Label: '{i18n>ProjectName}' },
        { Value: projects.startDate, Label: '{i18n>StartDate}', format: 'date' },
        { Value: projects.endDate, Label: '{i18n>EndDate}', format: 'date' }
      ]
    },
    FieldGroup#Roles: {
      Label: '{i18n>Roles}',
      Data: [
        { Value: roles.roleName, Label: '{i18n>RoleName}' }
      ]
    },
  }
);


