{
    //loadGame_scr()
    //loads game data, or calls for new data to be created
    createSaveIndex_scr();
    
    
    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        //doesn't check for corruption, etc.
        var fileName = ds_map_find_value(global.saveIndex[? key], "file");
        show_debug_message("file: "+fileName);
        show_debug_message(key);
        if (file_exists(fileName)) {
            var ds = ds_map_find_value(global.saveIndex[? key], "ds");
            var type = ds_map_find_value(global.saveIndex[? key], "type");
            if (type == ds_type_list) {
                var store = ds_map_create();
                store = ds_map_secure_load(fileName);
                ds_list_copy(ds, store[? key]);
                ds_map_delete(store, key);
                ds_map_destroy(store);
            } else {
                var store = ds_map_secure_load(fileName);
                ds_map_copy(ds, store);
            }
        } else {
            var scriptToCall = asset_get_index("create_"+key+"_scr");
            script_execute(scriptToCall);
        }
        key = ds_map_find_next(global.saveIndex, key);
    }
    
    global.logText = ds_map_find_value(global.record, "log");
    global.logObj = ds_list_create();
    
    global.target = -1;//variable used for verifying button presses
}

