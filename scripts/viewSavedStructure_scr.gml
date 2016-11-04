{
    var key = argument0;
    
    var fileName = ds_map_find_value(global.saveIndex[? key], "file");
    if (file_exists(fileName)) {
        var ds = ds_map_create();
        ds = ds_map_secure_load(fileName);
        show_debug_message(key+" save");
        var output = json_encode(ds);
        show_debug_message(output);
        ds_map_destroy(ds);
    } else {
        show_debug_message("file unfound: "+fileName);
    }
}

