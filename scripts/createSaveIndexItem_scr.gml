{
    //createIndexItem_scr(key, type)
    
    var key = argument0;
    var type = argument1;
    
    global.saveIndex[? key] = ds_map_create();
    ds_map_add(global.saveIndex[? key], "file", global.savePrefix+key+global.saveExt);
    if (type == "map") {
        ds_map_add_map(global.saveIndex[? key], "ds", ds_map_create());
        ds_map_add(global.saveIndex[? key], "type", ds_type_map);
    } else {
        ds_map_add_list(global.saveIndex[? key], "ds", ds_list_create());
        ds_map_add(global.saveIndex[? key], "type", ds_type_list);
    }
}

