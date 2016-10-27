{
    //saveGame_scr();
    //saves game data as stored in global.data

    //might only need references to party members, not duplicate objects, depending on data needing collection
    /*var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.party, i);
        var index = ds_map_find_value(hero,"index");
        ds_map_copy(ds_list_find_value(global.heroes,index), hero);
    }*/
    
    /*var saveData = json_encode(global.data);
    var file = file_text_open_write(global.saveLoc);
    file_text_write_string(file, saveData);
    file_text_close(file);
    show_debug_message(saveData);*/
    ds_map_secure_save(global.guild, global.saveLoc+"guild");
    ds_map_secure_save(global.record, global.saveLoc+"record");
    ds_map_secure_save(global.heroes, global.saveLoc+"heroes");
    ds_map_secure_save(global.party, global.saveLoc+"party");
}

