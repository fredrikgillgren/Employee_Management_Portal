sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project2/test/integration/FirstJourney',
		'project2/test/integration/pages/EmployeesList',
		'project2/test/integration/pages/EmployeesObjectPage',
		'project2/test/integration/pages/RolesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesList, EmployeesObjectPage, RolesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project2') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeesList: EmployeesList,
					onTheEmployeesObjectPage: EmployeesObjectPage,
					onTheRolesObjectPage: RolesObjectPage
                }
            },
            opaJourney.run
        );
    }
);