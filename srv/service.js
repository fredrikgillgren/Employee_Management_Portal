const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { EmployeeRoleProjects } = this.entities;
    this.on('READ', EmployeeRoleProjects, async (req) => {
        const { employeeID, roleName, projectID } = req.data;
        console.log('Received READ request with parameters:', { employeeID, roleName, projectID });

        if (employeeID && roleName && projectID) {
            try {
                const result = await SELECT.one.from(EmployeeRoleProjects)
                    .where({ employeeID: String(employeeID), roleName: String(roleName), projectID: String(projectID) });
                console.log('EmployeeRoleProjects READ result:', result);
                if (result) {
                    return result;
                } else {
                    req.reject(404, 'Not Found');
                }
            } catch (error) {
                console.error('Error executing query:', error);
                req.reject(500, 'Internal Server Error');
            }
        } else {
            try {
                const results = await SELECT.from(EmployeeRoleProjects);
                console.log('EmployeeRoleProjects READ results:', results);
                return results;
            } catch (error) {
                console.error('Error executing query:', error);
                req.reject(500, 'Internal Server Error');
            }
        }
    });
});