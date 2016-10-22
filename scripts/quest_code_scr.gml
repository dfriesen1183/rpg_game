{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    //readying party
    for (var i=0; i<ds_list_size(global.party); i++) {
        var hero = ds_list_find_value(global.party, i);
        if (is_undefined(ds_map_find_value(hero, "partyIndex"))) {
            ds_map_add(hero, "partyIndex", i);
        } else {
            ds_map_replace(hero, "partyIndex", i);
        }

        var index = ds_map_find_value(hero, "index");
        displayPartyMember_scr(index, i, false);
    }
    //initiating quest cycle
    questLogic_scr();
}

