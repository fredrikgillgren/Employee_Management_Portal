sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'employeeroleprojects/test/integration/FirstJourney',
		'employeeroleprojects/test/integration/pages/EmployeeRoleProjectsList',
		'employeeroleprojects/test/integration/pages/EmployeeRoleProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeeRoleProjectsList, EmployeeRoleProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('employeeroleprojects') + '/index.html'
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