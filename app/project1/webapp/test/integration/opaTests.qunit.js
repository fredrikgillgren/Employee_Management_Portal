sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/ProjectsList',
		'project1/test/integration/pages/ProjectsObjectPage',
		'project1/test/integration/pages/RolesObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage, RolesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage,
					onTheRolesObjectPage: RolesObjectPage
                }
            },
            opaJourney.run
        );
    }
);