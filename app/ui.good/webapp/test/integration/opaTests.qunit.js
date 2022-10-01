sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ui/good/test/integration/FirstJourney',
		'ui/good/test/integration/pages/GoodList',
		'ui/good/test/integration/pages/GoodObjectPage'
    ],
    function(JourneyRunner, opaJourney, GoodList, GoodObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ui/good') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGoodList: GoodList,
					onTheGoodObjectPage: GoodObjectPage
                }
            },
            opaJourney.run
        );
    }
);