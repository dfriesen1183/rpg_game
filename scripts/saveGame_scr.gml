{
    //might only need references to party members, not duplicate objects, depending on data needing collection
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.party, i);
        var index = ds_map_find_value(hero,"index");
        ds_map_copy(ds_list_find_value(global.heroes,index), hero);
    }
    
    return ds_map_secure_save(global.data, global.saveLoc);
}

