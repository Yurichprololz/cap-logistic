using {logistic} from '../../db/schema';

annotate logistic.Goods with @title : '{i18n>goodTitle}' {
    ID    @UI.Hidden;
    name  @title                    : '{i18n>goodName}';
    price @title                    : '{i18n>price}'
          @Measures.ISOCurrency     : currency

}
