using { logictic } from '../db/schema';
using { statusSpace } from '../db/status-data';

service LogicticService {
    entity Driver as projection on logictic.Drivers;
    entity Car as projection on logictic.Cars;
    entity Good as projection on logictic.Goods;
    entity CarStatus as projection on statusSpace.CarStatuses;
    entity DriverStatus as projection on statusSpace.DriverStatuses;
}

service TechnicalService @(required: 'tech-user') {
    entity Car as projection on logictic.Cars;
    entity Good as projection on logictic.Goods;
}
