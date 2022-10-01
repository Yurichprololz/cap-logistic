using {logistic} from '../../db/schema';

annotate logistic.Cars with @title : '{i18n>carTitle}' {
    ID     @UI.Hidden;
    status @title                  : '{i18n>carstatus}'
           @Common.Text            : status.name
           @Common.TextArrangement : #TextOnly;
    brand  @title                  : '{i18n>carBrand}';
    number @title                  : '{i18n>carNumber}';
    driver @title                  : '{i18n>carDriver}'
           @Common.Text            : driver.surname
           @Common.TextArrangement : #TextOnly

}
