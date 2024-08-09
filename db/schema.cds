namespace logistic;

using statusSpace as statuses from './status-data';
using {managed}

entity Customers {
    key ID : Integer;
    name : String;
    surname : String;
    age : Integer;
} from '@sap/cds/common';
using rating from './rating';


entity Drivers : managed {
    key ID       : UUID;
        status   : Association to statuses.DriverStatuses;
        name     : String;
        surname  : String;
        age      : Integer;
        rating   : Decimal(2, 1);
        image    : LargeBinary @Core.MediaType : 'image/png';
        rateList : Composition of many Driver_Rating
                       on rateList.driver = $self;
}

entity Customers {
    key ID : Integer;
    name : String;
    surname : String;
    age : Integer;
};

entity Cars : managed {
    key ID                              : UUID;
        status                          : Association to statuses.CarStatuses;
        driver                          : Association to Drivers;
        brand                           : String;
        number                          : String(6);
        virtual sendToStorehouseEnabled : Boolean;
}

entity Customers {
    key ID : Integer;
    name : String;
    surname : String;
    age : Integer;
};

entity Goods : managed {
    key ID       : UUID;
        name     : String;
        price    : Decimal(15, 2);
        currency : String;

}

entity Customers {
    key ID : Integer;
    name : String;
    surname : String;
    age : Integer;
};

entity Driver_Rating {
    key ID      : UUID;
        comment : String;
        driver  : Association to Drivers;
        rate    : Association to rating.RatingList;
}

entity Customers {
    key ID : Integer;
    name : String;
    surname : String;
    age : Integer;
}
