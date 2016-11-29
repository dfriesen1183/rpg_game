{
    //quest record items
    ds_map_add(global.record, "complete", true);
    ds_map_add(global.record, "duration", 0);
    ds_map_add(global.record, "time", 0);
    
    ds_map_add_list(global.record, "encounters", ds_list_create());
    ds_map_add_list(global.record, "log", ds_list_create());
    
    ds_map_add(global.record, "gold", 0);
    ds_map_add(global.record, "battles", 0);
    ds_map_add(global.record, "damageDealt", 0);
    ds_map_add(global.record, "damageTaken", 0);
}

