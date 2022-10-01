using LogicticService from '../../srv/service';

annotate LogicticService.Car with {
    ID     @readonly;
    driver @mandatory;
    brand  @mandatory;
    number @mandatory;
    status @readonly;
};