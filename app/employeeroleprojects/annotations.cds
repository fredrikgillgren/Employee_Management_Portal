using EmployeeService as service from '../../srv/service';

annotate service.EmployeeRoleProjects with @(
    UI.FieldGroup #EmployeeDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Employee ID',
                Value : employeeID
            },
            {
                $Type : 'UI.DataField',
                Label : 'Employee Name',
                Value : employeeName
            },
            {
                $Type : 'UI.DataField',
                Label : 'Employee Email',
                Value : employeeEmail
            },
            {
                $Type : 'UI.DataField',
                Label : 'Street',
                Value : employeeStreet
            },
            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : employeeCity
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country',
                Value : employeeCountry
            }
        ]
    },
    UI.FieldGroup #ProjectDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Project ID',
                Value : projectID
            },
            {
                $Type : 'UI.DataField',
                Label : 'Project Name',
                Value : projectName
            },
            {
                $Type : 'UI.DataField',
                Label : 'Start Date',
                Value : projectStartDate
            },
            {
                $Type : 'UI.DataField',
                Label : 'End Date',
                Value : projectEndDate
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role Name',
                Value : roleName
            }
        ]
    },
    UI.Facets : [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Employee Details',
            Target: '@UI.FieldGroup#EmployeeDetails'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Project Details',
            Target: '@UI.FieldGroup#ProjectDetails'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Employee ID',
            Value : employeeID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Employee Name',
            Value : employeeName
        },
        {
            $Type : 'UI.DataField',
            Label : 'Project Name',
            Value : projectName
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role Name',
            Value : roleName
        }
    ]
);