{
    //setGroundState_scr();
    //sterilizes working data:
    //  realigns indentifiers, potentially the only unique data inherent to the hero
    //  clears members from party
    //  empties quest record


    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.heroes, i);
        if (is_undefined(ds_map_find_value(hero, "index"))) {
            ds_map_add(hero, "index", i);
        } else {
            ds_map_replace(hero, "index", i);
        }
        //in the meantime, healing heroes automatically
        ds_map_replace(hero, "hp", ds_map_find_value(hero, "maxHp"));
    }
    clearParty_scr();
    
    ds_map_replace(global.record,"duration",0);
    ds_map_replace(global.record,"time",0);
    ds_map_replace(global.record,"next",0);
    ds_map_replace(global.record,"complete",true);
    ds_list_clear(global.logText);
    ds_list_clear(global.logObj);
    //recursive_ds_destroy(global.logFormat);
}

