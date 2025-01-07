using EmployeeManagement from '../db/schema';

service EmployeeService {
    entity EmployeeRoleProjects as select from EmployeeManagement.Roles {
        key employee.ID as employeeID,
        employee.name as employeeName,
        employee.email as employeeEmail,
        employee.address.street as employeeStreet,
        employee.address.city as employeeCity,
        employee.address.country as employeeCountry,
        key roleName,
        key project.ID as projectID,
        project.name as projectName,
        project.startDate as projectStartDate,
        project.endDate as projectEndDate
    };
}