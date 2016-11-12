{
    //createSaveIndex_scr()
    //the reason this must exist is because
    //  1) it's not possible to reference variables via strings, e.g. "guild" =/=> global.guild
    //  2) it's not possible to get the type of a data structure given only the structure itself (I think, though the first reason is sufficient unto itself)
    //so instead this map exists to explicitly associate all this data together

    global.savePrefix = "data/";
    global.saveExt = ".dat";
    global.saveIndex = ds_map_create();
    
        var key;
        key = "guild";
        createSaveIndexItem_scr(key, 0);
        global.guild = ds_map_find_value(global.saveIndex[? key], "ds");
        
        key = "heroes";
        createSaveIndexItem_scr(key, 1);
        global.heroes = ds_map_find_value(global.saveIndex[? key], "ds");
        
        key = "activeQuests";
        createSaveIndexItem_scr(key, 1);
        global.activeQuests = ds_map_find_value(global.saveIndex[? key], "ds");
}

