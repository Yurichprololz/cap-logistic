using {logistic} from '../../db/schema';

annotate logistic.Cars {
    driver @Common.ValueList : { 
        CollectionPath  : 'Driver',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : driver_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'surname'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'status_ID'
            },
        ],
        SearchSupported : true
    };
}
