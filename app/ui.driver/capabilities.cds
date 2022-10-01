using {LogisticService} from '../../srv/service';

annotate LogisticService.Driver with @odata.draft.enabled;

annotate LogisticService.Driver with @Capabilities : {
    Deletable  : true,
    Insertable : true
};
