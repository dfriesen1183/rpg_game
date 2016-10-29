{
    //viewActiveData_scr()
    //iterates through data structures indexed in global.saveIndex,
    //and outputs data to complier

    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        var type = ds_map_find_value(global.saveIndex[? key], "type");
        var ds = ds_map_find_value(global.saveIndex[? key], "ds");
        if (type == ds_type_list) {
            var store = ds_map_create();
            ds_map_add_list(store, key, ds);
            show_debug_message(key+" list");
            var output = json_encode(store);
            show_debug_message(output);
            ds_map_delete(store, key);
            ds_map_destroy(store);
        } else {
            show_debug_message(key+" map");
            var output = json_encode(ds);
            show_debug_message(output);
        }
        key = ds_map_find_next(global.saveIndex, key);
    }
}

