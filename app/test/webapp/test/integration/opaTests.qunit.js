sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'test/test/integration/FirstJourney',
		'test/test/integration/pages/EmployeeRoleProjectsList',
		'test/test/integration/pages/EmployeeRoleProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeeRoleProjectsList, EmployeeRoleProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('test') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeeRoleProjectsList: EmployeeRoleProjectsList,
					onTheEmployeeRoleProjectsObjectPage: EmployeeRoleProjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);