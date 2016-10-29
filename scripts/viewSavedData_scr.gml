{
    //viewSavedData_scr()
    //iterates through save files indexed in global.saveIndex,
    //and outputs data to complier

    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        var fileName = ds_map_find_value(global.saveIndex[? key], "file");
        if (file_exists(fileName)) {
            var ds = ds_map_create();
            ds = ds_map_secure_load(fileName);
            show_debug_message(key+" save");
            var output = json_encode(ds);
            show_debug_message(output);
            ds_map_destroy(ds);
            key = ds_map_find_next(global.saveIndex, key);
        } else {
            show_debug_message("file unfound: "+fileName);
        }
    }
}

