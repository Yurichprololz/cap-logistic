service TechnicalService @(required : 'tech-user') {
    entity Car as projection on logistic.Cars;
    entity Good as projection on logistic.Goods;
    entity Customer as projection on logistic.Customers;
}