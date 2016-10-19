{
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        ds_list_delete(global.party, i);
    }
    
    size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        ds_list_mark_as_map(global.heroes, i);
        var hero = ds_list_find_value(global.heroes, i);
        show_debug_message(string(i));
        show_debug_message(string(hero));
        if (is_undefined(ds_map_find_value(hero, "index"))) {
            ds_map_add(hero, "index", i);
        } else {
            ds_map_replace(hero, "index", i);
        }
    }

    ds_map_replace(global.record,"duration",0);
    ds_map_replace(global.record,"time",0);
    ds_list_clear(ds_map_find_value(global.record, "log"));
}

