sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ui/car/test/integration/FirstJourney',
		'ui/car/test/integration/pages/CarList',
		'ui/car/test/integration/pages/CarObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarList, CarObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ui/car') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarList: CarList,
					onTheCarObjectPage: CarObjectPage
                }
            },
            opaJourney.run
        );
    }
);