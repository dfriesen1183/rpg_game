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
    for (var i=size-1; i>=0; i--) {
        var member = party[| i];
        if (0 >= member[? "hp"]) {
            ds_list_delete(global.heroes, member[? "index"]);
            ds_map_destroy(member);
            ds_list_delete(party, i);
        } else {
            //member[? "questIndex"] = -1;
            member[? "hp"] = member[? "maxHp"];
            ds_map_delete(member, "found");
        }
    }

    size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        if (ds_exists(hero, ds_type_map)) {
            hero[? "index"] = i;
            var questIndex = hero[? "questIndex"];
            if (0 <= questIndex) {
                /*if (questIndex == global.quest) {
                    with (hero_obj) {
                        //not sure why this fails...
                        *show_debug_message("hero");
                        if (id.partyIndex == hero[? "partyIndex"]) {
                            id.index = i;
                        }*
                    }
                }*/
                if (hero[? "died"] == questId) {
                    ds_map_destroy(hero);
                    ds_list_delete(global.heroes, i);
                    i--; size--;
                } else if (hero[? "found"] == questId) {
                    ds_map_delete(hero, "found");
                }
            }
        } else {
            ds_list_delete(global.heroes, i);
            i--; size--;
        }
    }
}

