
using from './ui.car/annotations';
using from './ui.driver/annotations';
using from './ui.good/annotations';

entity TechnicalService {
    key ID : Integer;
    Name : String;
    Customer : Association to Customer;
}
