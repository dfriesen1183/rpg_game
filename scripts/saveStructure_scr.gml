{
    /*
    //how do you get a ds with a string?!
    var ds = asset_get_index(key);
    //how to know which type to check?
    if (!ds_exists(ds, ds_type_map) && !ds_exists(ds, ds_type_list)) {
        show_debug_message(key+" data does not exist!");
        var scriptToCall = asset_get_index("create_"+key+"_scr");
        script_execute(scriptToCall);
    }
    var fileName = global.savePrefix+global.saveIndex[? key];
    ds_map_secure_save(ds, fileName);
    key = ds_map_find_next(global.saveIndex, key);
    */
    
    var key = argument0;

    var ds = ds_map_find_value(global.saveIndex[? key], "ds");
    var type = ds_map_find_value(global.saveIndex[? key], "type");
    
    if (!ds_exists(ds, type)) {
        show_debug_message(key+" data does not exist!");
        var scriptToCall = asset_get_index("create_"+key+"_scr");
        script_execute(scriptToCall);
    }
    
    var fileName = ds_map_find_value(global.saveIndex[? key], "file");
    if (type == ds_type_list) {
        var store = ds_map_create();
        ds_map_add_list(store, key, ds);
        ds_map_secure_save(store, fileName);
        ds_map_delete(store, key);
        ds_map_destroy(store);
    } else {
        ds_map_secure_save(ds, fileName);
    }
}

