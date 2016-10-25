{
    //recursive_ds_destroy(map/list)
    //destroys data structure along with all nested structures
    
    var _ds = argument0;
    if (ds_exists(_ds, ds_type_map)) {
        show_debug_message("map");
        var key = ds_map_find_first(_ds);
        var size = ds_map_size(_ds);
        for (var i=0; i<size; i++) {
            show_debug_message(key);
            recursive_ds_destroy(_ds[? key]);
            key = ds_map_find_next(_ds, key);
        }
        ds_map_destroy(_ds);
    } else if (ds_exists(_ds, ds_type_list)) {
        show_debug_message("list");
        var size = ds_list_size(_ds);
        for (var i=0; i<size; i++) {
            show_debug_message(string(i));
            recursive_ds_destroy(_ds[| i]);
        }
        ds_list_destroy(_ds);
    }
}

