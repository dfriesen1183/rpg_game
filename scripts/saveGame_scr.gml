{
    //saveGame_scr();
    //saves game data via global.saveIndex map

    /*var saveData = json_encode(global.data);
    var file = file_text_open_write(global.saveIndex);
    file_text_write_string(file, saveData);
    file_text_close(file);
    show_debug_message(saveData);*/
    
    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        saveStructure_scr(key);
        key = ds_map_find_next(global.saveIndex, key);
    }
}

