namespace logistic;

using statusSpace as statuses from './status-data';
using {managed} from '@sap/cds/common';

entity Drivers : managed {
    key ID      : UUID;
        status  : Association to statuses.DriverStatuses;
        name    : String;
        surname : String;
        age     : Integer;
};

entity Cars : managed { 
    key ID     : UUID;
        status : Association to statuses.CarStatuses;
        driver : Association to Drivers;
        brand  : String;
        number : String(6);
};

entity Goods : managed {
    key ID       : UUID;
        name     : String;
        price    : Decimal(15, 2);
        currency : String;

};
