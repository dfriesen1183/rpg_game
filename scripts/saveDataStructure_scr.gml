{
    //saveDataStructure_scr(key, ds, type);
    //since a generalised function cannot truly exist, due to the inability to reference variables dynamically (i.e. using a string of its name),
    //  all data structure -specific save scripts redirect here to simulate it as painlessly as possible
    
    var key = argument0;
    var ds = argument1;
    var type = argument2;
    
    
    var ds = asset_get_index(key);
    if (!ds_exists(ds, type)) {
        show_debug_message(key+" data does not exist!");
        var scriptToCall = asset_get_index("create_"+key+"_scr");
        script_execute(scriptToCall);
    }
    
    var fileName = global.savePrefix+global.saveLoc[? key];
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

