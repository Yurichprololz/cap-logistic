using LogisticService from '../../srv/service';

annotate LogisticService.Driver with {
    ID      @readonly;
    name    @mandatory;
    rating  @readonly
            @assert.range : [
        0.0,
        5.0
    ];

    surname @mandatory;
    age     @mandatory
            @assert.range : [
        18,
        60
    ];
    status  @readonly;
};
