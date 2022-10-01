using {LogisticService} from '../../srv/service';

annotate LogisticService.Car with @odata.draft.enabled;

annotate LogisticService.Car with @Capabilities : {
    Deletable  : true,
    Insertable : true
};