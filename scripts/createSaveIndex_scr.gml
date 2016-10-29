{
    global.savePrefix = "data/";
    global.saveExt = ".dat";
    global.saveIndex = ds_map_create();
    
        var key;
        key = "guild";
        createSaveIndexItem_scr(key, "map");
        global.guild = ds_map_find_value(global.saveIndex[? key], "ds");
        
        key = "heroes";
        createSaveIndexItem_scr(key, "list");
        global.heroes = ds_map_find_value(global.saveIndex[? key], "ds");
        
        key = "record";
        createSaveIndexItem_scr(key, "map");
        global.record = ds_map_find_value(global.saveIndex[? key], "ds");
        
        key = "party";
        createSaveIndexItem_scr(key, "list");
        global.party = ds_map_find_value(global.saveIndex[? key], "ds");
}

