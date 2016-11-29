{
    var key = argument0;

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
}

