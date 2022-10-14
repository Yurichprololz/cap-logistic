namespace logistic;

using statusSpace as statuses from './status-data';
using {managed} from '@sap/cds/common';
using rating from './rating';


entity Drivers : managed {
    key ID       : UUID;
        status   : Association to statuses.DriverStatuses;
        name     : String;
        surname  : String;
        age      : Integer;
        rating   : Decimal(2, 1);
        rateList : Composition of many Driver_Rating
                       on rateList.driver = $self;
};

entity Cars : managed {
    key ID                              : UUID;
        status                          : Association to statuses.CarStatuses;
        driver                          : Association to Drivers;
        brand                           : String;
        number                          : String(6);
        virtual sendToStorehouseEnabled : Boolean;
};

entity Goods : managed {
    key ID       : UUID;
        name     : String;
        price    : Decimal(15, 2);
        currency : String;

};

entity Driver_Rating {
    key ID      : UUID;
        comment : String;
        driver  : Association to Drivers;
        rate    : Association to rating.RatingList;
}
