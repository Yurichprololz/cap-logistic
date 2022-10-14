namespace rating;

entity RatingList {
  key value : String;
      code  : String;
}

type RatingType : String @mandatory;

annotate RatingType with @(Common.ValueList : {
  CollectionPath  : 'RatingList',
  Label           : 'Rate us',
  Parameters      : [
    {
      $Type             : 'Common.ValueListParameterInOut',
      LocalDataProperty : rate,
      ValueListProperty : 'value'
    },
    {
      $Type             : 'Common.ValueListParameterDisplayOnly',
      ValueListProperty : 'code'
    },
  ],
  SearchSupported : true

});
