{
    //setGroundState_scr();
    //sterilizes data:
    //  restores recently returned heroes to prequest state
    //  realigns indentifying information after hero deaths
    
    
    var quest = argument0;
    var rec = global.activeQuests[| quest];
    var questId = rec[? "id"];
    var party = rec[? "party"];
    
    
    var size = ds_list_size(party);
    for (var i=size - 1; i>=0; i--) {
        var member = party[| i];
        var died = member[? "died"];
        if (died == questId) {
            ds_list_delete(party, i);
        }
    }

    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        if (ds_exists(hero, ds_type_map)) {
            hero[? "index"] = i;
            var questIndex = hero[? "questIndex"];
            if (questIndex == questId) {
                /*if (questIndex == global.quest) {
                    with (hero_obj) {
                        //not sure why this fails...
                        *show_debug_message("hero");
                        if (id.partyIndex == hero[? "partyIndex"]) {
                            id.index = i;
                        }*
                    }
                }*/
                var died = hero[? "died"];
                if (died == questId) {
                    ds_map_destroy(hero);
                    ds_list_delete(global.heroes, i);
                    i--; size--;
                } else {
                    hero[? "hp"] = hero[? "maxHp"];
                    var found = hero[? "found"];
                    if (found == questId) {
                        ds_map_delete(hero, "found");
                    }
                }
            }
        } else {
            ds_list_delete(global.heroes, i);
            i--; size--;
        }
    }
}

