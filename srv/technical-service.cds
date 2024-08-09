using { logistic } from '../db/schema';

service TechnicalService {
    entity Customers as projection on logistic.Customers;
}