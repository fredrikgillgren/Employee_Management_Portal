namespace EmployeeManagement;

entity Employees {
    key ID : UUID;
    name : String;
    email : String;
    startDate : Date;
    address : Association to Addresses;
}

entity Addresses {
    key ID : UUID;
    street : String;
    city : String;
    country : String;
}

entity Projects {
    key ID : UUID;
    name : String;
    startDate : Date;
    endDate : Date;
    roles : Composition of many Roles on roles.project = $self;
}

entity Roles {
    key ID : UUID;
    roleName : String;
    employee : Association to Employees;
    project : Association to Projects;
}