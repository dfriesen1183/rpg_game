{
    var hero = argument0;
    var toHeroes = argument1;
    if (toHeroes == 0) {
        var list = global.heroes;
        var limit = 30;
        var indexKey = "index";
    } else {
        list = global.party;
        limit = 4;
        indexKey = "partyIndex";
    }
    
    if (ds_list_size(list) < limit) {
        var index = ds_list_size(list);
        ds_list_add_map(list, hero);
        if (is_undefined(ds_map_find_value(hero, indexKey))) {
            ds_map_add(hero, indexKey, index);
        } else {
            ds_map_replace(hero, indexKey, index);
        }
        return 0;
    } else {
        if (toHeroes != 0) {
            show_debug_message("no room in party");
        } else {
            show_debug_message("no room in guild");
        }
    }
    return 1;
}

