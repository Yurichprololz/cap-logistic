using LogisticService from '../../srv/service';

annotate LogictisService.Car with {
    ID     @readonly;
    driver @mandatory;
    brand  @mandatory;
    number @mandatory;
    status @readonly;
};