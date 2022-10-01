sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ui/driver/test/integration/FirstJourney',
		'ui/driver/test/integration/pages/DriverList',
		'ui/driver/test/integration/pages/DriverObjectPage'
    ],
    function(JourneyRunner, opaJourney, DriverList, DriverObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ui/driver') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDriverList: DriverList,
					onTheDriverObjectPage: DriverObjectPage
                }
            },
            opaJourney.run
        );
    }
);