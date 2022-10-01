using LogicticService from '../../srv/service';

annotate LogicticService.Driver with {
    ID      @readonly;
    name    @mandatory;
    surname @mandatory;
    age     @mandatory;
    status  @readonly;
};
