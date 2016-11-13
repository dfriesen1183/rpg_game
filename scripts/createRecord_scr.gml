{
    //quest record items
    global.record[? "complete"] = true;
    global.record[? "duration"] = 0;
    global.record[? "endTime"] = 0;
    global.record[? "success"] = false;
    
    ds_map_add_list(global.record, "party", ds_list_create());
    ds_map_add_list(global.record, "heroes", ds_list_create());
    ds_map_add_list(global.record, "pastEnc", ds_list_create());
    ds_map_add_list(global.record, "futureEnc", ds_list_create());
    ds_map_add_list(global.record, "log", ds_list_create());
    
    global.record[? "gold"] = 0;
    global.record[? "battles"] = 0;
    global.record[? "damageDealt"] = 0;
    global.record[? "damageTaken"] = 0;
}

