{
    //addHero_scr(ds_map, boolean);
    //returns boolean 'result'
    //adds given hero to either heroes or party
    //marks capacities for both lists
    
    var hero = argument0;
    var toHeroes = argument1;
    if (toHeroes) {
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
    /*show_debug_message("");
    var data = ds_map_create();
    ds_map_add_list(data, "party", global.party);
    var output = json_encode(data);
    show_debug_message(output);
    ds_map_delete(data, "party");
    ds_map_destroy(data);*/
        return true;
    }
    return false;
}

