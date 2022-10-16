using {logistic} from '../../db/schema';

annotate logistic.Drivers with @title   : '{i18n>driverTitle}' {
        ID      @UI.Hidden;
        status  @title                  : '{i18n>driverstatus}'
                @Common.Text            : status.name
                @Common.TextArrangement : #TextOnly;
        name    @title                  : '{i18n>driverName}';
        surname @title                  : '{i18n>driverSurame}';
        age     @title                  : '{i18n>driverAge}';
        rating  @title                  : '{i18n>rating}'
                @Measures.ISOCurrency   : '/ 5';
}
