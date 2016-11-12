{
    //setGroundState_scr();
    //sterilizes working data:
    //  realigns indentifiers, potentially the only unique data inherent to the hero
    //  clears members from party
    //  empties quest record


    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.heroes, i);
        if (ds_exists(hero, ds_type_map)) {
            if (is_undefined(ds_map_find_value(hero, "index"))) {
                ds_map_add(hero, "index", i);
            } else {
                ds_map_replace(hero, "index", i);
            }
            //in the meantime, healing heroes automatically
            ds_map_replace(hero, "hp", ds_map_find_value(hero, "maxHp"));
        } else {
            ds_list_delete(global.heroes, i);
            i--; size--;
        }
    }
}

