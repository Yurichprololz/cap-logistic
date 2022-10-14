using {logistic} from '../db/schema';
using {statusSpace} from '../db/status-data';
using rating from '../db/rating';


service LogisticService {
    entity Driver       as projection on logistic.Drivers actions {
        action rateDriver(rate : rating.RatingType, comment: String(100))
    };

    entity Car          as projection on logistic.Cars actions {
        @Core.OperationAvailable : {$value : in.sendToStorehouseEnabled}
        action sendToStorehouse()
    };

    entity Good         as projection on logistic.Goods;
    entity CarStatus    as projection on statusSpace.CarStatuses;
    entity DriverStatus as projection on statusSpace.DriverStatuses;

    entity RatingList as projection on rating.RatingList;
}

service TechnicalService @(required : 'tech-user') {
    entity Car  as projection on logistic.Cars;
    entity Good as projection on logistic.Goods;
}
