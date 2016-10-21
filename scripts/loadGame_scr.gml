{
    global.saveLoc = "save.dat";
    
    //far from foolproof: we need to check against corruption, tampering, etc.
    if (file_exists(global.saveLoc)) {
        //loading previous save data here
        /*var file = file_text_open_read(global.saveLoc);
        var saveJson = file_text_read_string(file);
        file_text_close(file);
        global.data = json_decode(saveJson);*/
        global.data = ds_map_secure_load(global.saveLoc);
        global.guild = ds_map_find_value(global.data, "guild");
        global.record = ds_map_find_value(global.data, "questRecord");
        global.heroes = ds_map_find_value(global.data, "heroes");
        global.party = ds_map_find_value(global.data, "party");
        //show_debug_message(saveJson);
        show_debug_message(ds_map_find_value(ds_list_find_value(ds_map_find_value(global.data, "heroes"), 0), "name"));
    } else {
        createNewData_scr();
    }
    
    global.target = -1;
}

