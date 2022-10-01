using {LogicticService} from '../../srv/service';

annotate LogicticService.Car with @odata.draft.enabled;

annotate LogicticService.Car with @Capabilities : {
    Deletable  : true,
    Insertable : true
};