using {LogicticService} from '../../srv/service';

annotate LogicticService.Driver with @odata.draft.enabled;

annotate LogicticService.Driver with @Capabilities : {
    Deletable  : true,
    Insertable : true
};
