sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'emportal/test/integration/FirstJourney',
		'emportal/test/integration/pages/EmployeesList',
		'emportal/test/integration/pages/EmployeesObjectPage',
		'emportal/test/integration/pages/RolesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesList, EmployeesObjectPage, RolesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('emportal') + '/index.html'
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