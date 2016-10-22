{
    //questReview_code_scr()
    //(called from questReview_room creation code)
    //displays quest result

    saveGame_scr();
    
    //deleting heroes displayed
    with(hero_obj) {
        instance_destroy();
    }

    show_debug_message("Result:");
    show_debug_message("Party:");

    //generating log items for each party member
    var size = ds_list_size(global.party);
    var partyDefeated = true;
    for (var i=0; i<size; i++) {
        hero = ds_list_find_value(global.party, i);
        var name = ds_map_find_value(hero,"name");
        var level = ds_map_find_value(hero,"level");
        var hp = ds_map_find_value(hero,"hp");
        var maxHp = ds_map_find_value(hero,"maxHp");
        var index = ds_map_find_value(hero,"index");

        var store = 0;
        var storeIndex = 0;
        var heroCount = ds_list_size(global.heroes);
        for (var j=0; j<heroCount; j++) {
            store = ds_list_find_value(global.heroes, j);
            if (ds_map_find_value(store, "index") == index) {
                storeIndex = j;
                break;
            }
        }

        if (ds_map_find_value(hero, "found")) {
            ds_map_delete(store, "found");
            show_debug_message("Found "+name+", level "+string(level)+" Hero at "+string(maxHp)+"hp");
        }
        if (hp < maxHp) {
            if (hp > 0) {
                partyDefeated = false;
                show_debug_message(name+" was wounded to "+string(hp)+"/"+string(maxHp));
            } else {
                show_debug_message(name+" fell in battle");
                ds_map_destroy(store);
                ds_list_delete(global.heroes, storeIndex);
            }
        }
    }
    if (!partyDefeated) {
        show_debug_message("Party successfully completed the quest!");
    }
    
    //updating guild data
    var newGold = ds_map_find_value(global.guild,"gold") + ds_map_find_value(global.record, "gold");
    ds_map_replace(global.guild, "gold", newGold);
    show_debug_message("total gold found: "+string(ds_map_find_value(global.record, "gold")));
    show_debug_message("total battles fought: "+string(ds_map_find_value(global.record, "battles")));
    
    //reseting active variables (record, party, heroes...)
    setGroundState_scr();
    instance_create(0,0,mainMenuMain_obj);
}

