using LogisticService from '../../srv/service';

annotate LogisticService.Driver with {
    ID      @readonly;
    name    @mandatory;
    surname @mandatory;
    age     @mandatory
            @assert.range : [18,60];
    status  @readonly;
};
