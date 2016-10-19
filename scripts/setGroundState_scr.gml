{
    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.heroes, i);
        if (is_undefined(ds_map_find_value(hero, "index"))) {
            ds_map_add(hero, "index", i);
        } else {
            ds_map_replace(hero, "index", i);
        }
    }
    clearParty_scr();
    
    ds_map_replace(global.record,"duration",0);
    ds_map_replace(global.record,"time",0);
    ds_map_replace(global.record,"next",0);
    ds_map_replace(global.record,"complete",true);
    ds_list_clear(ds_map_find_value(global.record, "log"));
}

