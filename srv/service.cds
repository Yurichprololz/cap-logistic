using {logistic} from '../db/schema';
using {statusSpace} from '../db/status-data';

service LogisticService {
    entity Driver       as projection on logistic.Drivers;

    entity Car          as projection on logistic.Cars actions {
        @Core.OperationAvailable : {$value : in.sendToStorehouseEnabled}
        action sendToStorehouse()
    };

    entity Good         as projection on logistic.Goods;
    entity CarStatus    as projection on statusSpace.CarStatuses;
    entity DriverStatus as projection on statusSpace.DriverStatuses;
}

service TechnicalService @(required : 'tech-user') {
    entity Car  as projection on logistic.Cars;
    entity Good as projection on logistic.Goods;
}
